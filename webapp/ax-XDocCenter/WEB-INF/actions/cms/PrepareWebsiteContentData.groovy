import org.ofbiz.entity.GenericValue
import org.ofbiz.entity.condition.*
import org.ofbiz.entity.util.*
import org.ofbiz.base.util.UtilValidate;

pplookupMap = [webSiteId : webSiteId, webSiteContentTypeId : 'PUBLISH_POINT'];
webSiteContents = delegator.findList("WebSiteContent", EntityCondition.makeCondition(pplookupMap), null, ['-fromDate'], null, false);
webSiteContents = EntityUtil.filterByDate(webSiteContents);
webSiteContent = EntityUtil.getFirst(webSiteContents);

if (webSiteContent) {
    webSiteContentContent = webSiteContent.getRelatedOne("Content", false);
    contentRoot = webSiteContentContent.contentId;
    context.contentRoot = contentRoot;

    // get all sub content for the content
	EntityCondition altUrlForContentCondition = EntityCondition.makeCondition([contentId : contentId, contentAssocTypeId : "ALTERNATIVE_URL"]);
    GenericValue alternateUrlContent = EntityQuery.use(delegator).from("ContentAssoc").where(altUrlForContentCondition).queryFirst();

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

context.isPublishPoint = isPublishPoint;