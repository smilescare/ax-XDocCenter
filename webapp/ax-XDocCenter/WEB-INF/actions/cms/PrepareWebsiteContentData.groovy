import org.ofbiz.entity.condition.*
import org.ofbiz.entity.util.*
import org.ofbiz.base.util.UtilValidate;

pplookupMap = [webSiteId : webSiteId, webSiteContentTypeId : 'PUBLISH_POINT'];
webSiteContents = delegator.findList("WebSiteContent", EntityCondition.makeCondition(pplookupMap), null, ['-fromDate'], null, false);
webSiteContents = EntityUtil.filterByDate(webSiteContents);
webSiteContent = EntityUtil.getFirst(webSiteContents);

if (webSiteContent) {
    webSiteContentContent = webSiteContent.getRelatedOne("Content");
    contentRoot = webSiteContentContent.contentId;
    context.contentRoot = contentRoot;

    // get all sub content for the publish point
    alternateUrlContent = EntityUtil.getFirst(
    				delegator.findList("ContentAssoc", EntityCondition.makeCondition([contentId : contentId, contentAssocTypeId : "ALTERNATIVE_URL"]), null, null, null, false)
				);
    
    //find seo url
    if( UtilValidate.isNotEmpty(alternateUrlContent) ){
		toContent = alternateUrlContent.getRelatedOne("ToContent", false);
		
		if(UtilValidate.isNotEmpty(toContent)){
			 alternateUrl = toContent.getRelatedOne("DataResource", false).objectInfo;
			 context.alternateUrl = alternateUrl;
		}
    }
}
Boolean isPublishPoint = false;
/*
if(content.contentTypeId == 'WEB_SITE_PUB_PT'){
	isPublishPoint = true;
}else{
}
*/

println "##############33 content : " + content ;


context.isPublishPoint = isPublishPoint;