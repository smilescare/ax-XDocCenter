/*
 *
 *  * *****************************************************************************************
 *  *  Copyright (c) SimbaQuartz  2016. - All Rights Reserved                                 *
 *  *  Unauthorized copying of this file, via any medium is strictly prohibited               *
 *  *  Proprietary and confidential                                                           *
 *  *  Written by Mandeep Sidhu <mandeep.sidhu@simbacart.com>,  August, 2016                    *
 *  * ****************************************************************************************
 *
 */

import com.fasterxml.jackson.databind.ObjectMapper
import org.ofbiz.base.util.Debug
import org.ofbiz.base.util.UtilMisc
import org.ofbiz.base.util.UtilValidate
import org.ofbiz.entity.GenericEntityException
import org.ofbiz.entity.condition.EntityCondition
import org.ofbiz.entity.condition.EntityFunction
import org.ofbiz.entity.condition.EntityOperator
import org.ofbiz.entity.transaction.GenericTransactionException
import org.ofbiz.entity.transaction.TransactionUtil
import org.ofbiz.entity.util.EntityFindOptions
import org.ofbiz.entity.util.EntityListIterator

module="CommonLookups.groovy";

mapper = new ObjectMapper();

FIELDS_REQ_ONLY = "REQ_ONLY";
FIELDS_ALL = "ALL";
	
masterList = [];
useCache = true;
int totalRecordsCount = 0;

useCacheParam = request.getParameter("useCache");
if(useCacheParam == "false"){
	useCache = false;
}

entityName = "WebSite";
primaryKey = "webSiteId";
label = "siteName";
fieldsToSelect = request.getParameter("fieldsToSelect");

description = request.getParameter(label);
id = request.getParameter("id");

count = 10;
if( UtilValidate.isNotEmpty(parameters.count) ){
	count = new Integer(parameters.count);
}

start = 0;
if( UtilValidate.isNotEmpty(parameters.start) ){
	start = new Integer(parameters.start);
}

//dojo searchpaging store appends * at the end of the query so we need to replace that with sql supported wildcharacter
if(UtilValidate.isEmpty(description)){
	description = "%";
}else{
	description = "%" + description.replace("*", "%");//make a wild card search
}
	
//select the fields to choose
fieldsToSelectSet = UtilMisc.toSet("webSiteId", "siteName", "siteDescription");

try {
	orderBy = [];
	orderBy.add(label);
	//find options
	EntityFindOptions findOptions = new EntityFindOptions(true, EntityFindOptions.TYPE_SCROLL_INSENSITIVE, EntityFindOptions.CONCUR_READ_ONLY, true);
	findOptions.setDistinct(true);
	int pageNumber = (int)(start/count);
	int offset = pageNumber*count;

    lowIndex = (pageNumber * count) + 1;
    highIndex = (pageNumber + 1) * count;

	findOptions.setMaxRows(highIndex);
	
	if(UtilValidate.isNotEmpty(id)){
		productStore = delegator.findOne(entityName, UtilMisc.toMap(primaryKey, id), true);
		masterList.add(productStore);
	}else{
		condtn = EntityCondition.makeCondition(
			EntityCondition.makeCondition( EntityFunction.UPPER_FIELD(label),EntityOperator.LIKE,EntityFunction.UPPER(description.toUpperCase()) )
		);
		
		//masterList = delegator.findList(entityName, condtn,fieldsToSelectSet, orderBy, findOptions, useCache);
				
		EntityListIterator pli = null;
		boolean beganTransaction = false;
        try {
            beganTransaction = TransactionUtil.begin();

			pli = delegator.find(entityName, condtn, null, fieldsToSelectSet, orderBy, findOptions);
			
			masterList = pli.getPartialList(lowIndex, count);
			
			totalRecordsCount = pli.getResultsSizeAfterPartialList();
	        if (highIndex > totalRecordsCount) {
	            highIndex = totalRecordsCount;
	        }
        } catch (Exception e) {
            String errMsg = "Error finding changes.";
            Debug.logError(e, errMsg, module);
            try {
                TransactionUtil.rollback(beganTransaction, errMsg, e);
            	pli.close();
            } catch (GenericTransactionException gte2) {
                Debug.logError(gte2, "Unable to rollback transaction", module);
            }
        } finally {
	        try {
		        pli.close();
                TransactionUtil.commit(beganTransaction);
            } catch (GenericTransactionException gte) {
                Debug.logError(gte, "Unable to commit transaction", module);
            }
        }
				
				
	}
} catch (GenericEntityException e) {
	Debug.logError(e, "CommonLookup.groovy");
	return null;
}

records = [];
masterList.each{ masterRecord ->
	record = [:];
	record.putAll(masterRecord);
	String infoText = (UtilValidate.isEmpty(masterRecord.siteDescription)) ? "No description available." : masterRecord.siteDescription;
	record.put("richNameLabel", "<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>language</i></div><div class='site-info'>" + masterRecord.siteName + "<div class='site-sub-title'>" + infoText + "</div></div></div>");
	records.add(record);
}


Map dojoPagingStoreResponse = [
		identifier : primaryKey,
		label : label,
		numRows : totalRecordsCount,
		items : records
];
mapper.writeValue(response.getWriter(), dojoPagingStoreResponse);
