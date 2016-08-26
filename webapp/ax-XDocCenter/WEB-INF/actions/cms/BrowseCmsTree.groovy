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
import org.ofbiz.entity.condition.*;
import org.ofbiz.entity.util.*;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.GenericValue;

mapper = new ObjectMapper();
String webSiteId = parameters.siteId;
String contentId = parameters.contentId;

if(UtilValidate.isNotEmpty(contentId)){
	//remove the forward slashes tree builder adds to the params
	contentId = contentId.replaceAll("/", "");
}

GenericValue webSite = delegator.findOne("WebSite", [webSiteId : webSiteId], false);

pplookupMap = [webSiteId : webSiteId, webSiteContentTypeId : 'PUBLISH_POINT'];
webSiteContents = EntityUtil.filterByDate( delegator.findList("WebSiteContent", EntityCondition.makeCondition(pplookupMap), null, ['-fromDate'], null, false) );

webSiteContent = EntityUtil.getFirst(webSiteContents);

List subSites = [];
if ( "root" == contentId ) {
	//since no content id is provided pull all websites' immediate children
	content = webSiteContent.getRelatedOne("Content");
	contentRoot = content.contentId;
	// get all sub content for the publish point
	subSites = delegator.findList("ContentAssoc", EntityCondition.makeCondition([contentId : contentRoot]), null, ["sequenceNum"], null, false);
}else{
	subSites = delegator.findList("ContentAssoc", EntityCondition.makeCondition([contentId : contentId]), null, ["sequenceNum"], null, false);
}

childNodes = [:];
subDirectories = [];

if( UtilValidate.isNotEmpty(webSiteId) ){

	subSites.each() { subsite ->
		GenericValue content = subsite.getRelatedOne("ToContent");

		if(subsite.contentAssocTypeId != "ALTERNATIVE_URL"){
			subDirectory = [:];
			subDirectoryId = "";

			subDirectory.put("id", subsite.contentIdTo);//+ is the delimiter to prepare complete path
			String label = (UtilValidate.isEmpty(content.contentName)) ? subsite.contentId : content.contentName;
			subDirectory.put("name", label);
			subDirectory.put("contentId", subsite.contentId);
			subDirectory.put("childrenContentId", content.contentId);
			String formattedFromDate = UtilDateTime.toDateString(new Date(subsite.fromDate.getTime()), "yyyy-MM-dd HH:mm:ss.SSS");
			subDirectory.put("fromDate", formattedFromDate);
			subDirectory.put("contentAssocTypeId", subsite.contentAssocTypeId);

			List assocChilds  = content.getRelated("FromContentAssoc", null, ["sequenceNum"], false);
			//make sure child nodes exists and is more than 1, usually contentAssocTypeId:ALTERNATIVE_URL is the default association
			if(UtilValidate.isNotEmpty(assocChilds)
					&& (assocChilds.size() > 1) ){
				subDirectory.put("children", "true");
			}

			assocChilds.each{ assocChild ->
				if(assocChild.contentAssocTypeId == "ALTERNATIVE_URL"){
					GenericValue toContent = assocChild.getRelatedOne("ToContent", false);

					if(UtilValidate.isNotEmpty(toContent)){
						alternateUrl = toContent.getRelatedOne("DataResource", false).objectInfo;
						subDirectory.put("altUrl", alternateUrl);
					}
				}
			}

			subDirectories.add(subDirectory);
		}
	}
}

childNodes.put("id", contentId);
childNodes.put("contentId", contentId);
childNodes.put("name", webSite.siteName);
childNodes.put("children", subDirectories);

//flush json to response stream.
mapper.writeValue(response.getWriter(), childNodes);