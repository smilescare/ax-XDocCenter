import org.ofbiz.entity.condition.*
import org.ofbiz.entity.util.*
import org.ofbiz.base.util.UtilValidate;

pplookupMap = [webSiteId : webSiteId, webSiteContentTypeId : 'PUBLISH_POINT'];
webSiteContents = delegator.findList("WebSiteContent", EntityCondition.makeCondition(pplookupMap), null, ['-fromDate'], null, false);
webSiteContents = EntityUtil.filterByDate(webSiteContents);
webSiteContent = EntityUtil.getFirst(webSiteContents);

if (webSiteContent) {
    content = webSiteContent.getRelatedOne("Content");
    contentRoot = content.contentId;
    context.contentRoot = contentRoot;

    // get all sub content for the publish point
    subsites = delegator.findList("ContentAssoc", EntityCondition.makeCondition([contentId : contentId]), null, null, null, false);
    context.subsites = subsites;
    
    //find seo url
    subsites.each{ subsite ->
    	if(subsite.contentAssocTypeId == "ALTERNATIVE_URL"){
    		toContent = subsite.getRelatedOne("ToContent", false);
    		
    		if(UtilValidate.isNotEmpty(toContent)){
    			 alternateUrl = toContent.getRelatedOne("DataResource", false).objectInfo;
    			 context.alternateUrl = alternateUrl;
    		}
    	}
   	}
}