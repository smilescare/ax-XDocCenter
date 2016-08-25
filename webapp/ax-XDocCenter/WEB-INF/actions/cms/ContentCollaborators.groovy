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
import org.ofbiz.base.util.UtilDateTime
import org.ofbiz.party.party.PartyHelper

module="ContentCollaborators.groovy";

mapper = new ObjectMapper();

String contentId = parameters.contentId;
List masterList = delegator.findByAnd("ContentRole", [contentId : contentId], null, false);

records = [];
masterList.each{ masterRecord ->
	record = [:];
	record.putAll(masterRecord);
	
	//generate unique id
	String uniqueId = masterRecord.contentId + masterRecord.partyId + masterRecord.roleTypeId + masterRecord.fromDate.getTime();
	record.put("id", uniqueId);
	
	roleParty = masterRecord.getRelatedOne("Party", false);
	String collaboratorName = PartyHelper.getPartyName(roleParty);
	String formattedDate = UtilDateTime.toDateString(new Date(masterRecord.fromDate.getTime()), "dd MMM, yyyy");
	record.put("formattedFromDate", formattedDate);
	record.put("partyName", collaboratorName);
	//record.put("richNameLabel", "<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>language</i></div><div class='site-info'>" + collaboratorName + "</div></div></div>");
	records.add(record);
}

Map dojoPagingStoreResponse = [
		identifier : "id",
		label : "partyName",
		items : records
];

mapper.writeValue(response.getWriter(), dojoPagingStoreResponse);