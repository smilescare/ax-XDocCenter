<#--Prettifies the date, returns output much like 'few moments ago', few mins ago, 3 days ago etc.-->
<#macro formatPrettyDate dateToFormat>
    <#assign dateFormat = "EEE, d MMM yyyy 'at' HH:mm aaa" >
    <#assign formattedDate = Static["org.ofbiz.base.util.UtilDateTime"].toDateString(dateToFormat, dateFormat) >
    <#assign prettyDate = Static["com.simbaquartz.doccenter.utils.UtilPrettyTime"].prettyTime.format(dateToFormat) >
<span title="${formattedDate}">${prettyDate}</span>
</#macro>
<#-- to build breadcrumb for current content id -->
<#macro buildBreadcrumb contentId>
    <#assign contentParentAssoc = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentIdTo" : contentId, "contentAssocTypeId" : "SUB_CONTENT"}, null, false)) />
    <#if contentParentAssoc?exists>
        <#assign contentParent = contentParentAssoc.getRelatedOne("FromContent") />
    <#-- make sure this is not a publish point top of the hierarchy -->
        <#if contentParent.contentTypeId != "WEB_SITE_PUB_PT">
            <#if (contentParent.contentName?exists)>
                <#assign contentURLInfoAssoc = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentId" : contentParent.contentId, "contentAssocTypeId" : "ALTERNATIVE_URL"}, null, false))?if_exists />
                <#if ( (contentURLInfoAssoc?exists) && (contentURLInfoAssoc?trim?has_content))>
                    <#assign contentUrlValue = contentURLInfoAssoc.getRelatedOne("ToContent") />
                    <#if contentUrlValue?exists>
                        <#assign contentUrlDatasource = contentUrlValue.getRelatedOne("DataResource") />

                        <#assign contentURLInfo = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentId" : contentParent.contentId, "contentAssocTypeId" : "ALTERNATIVE_URL"}, null, false))?if_exists />
                    <span class="header-text margin-left-no">
                        <i class="material-icons margin-right">chevron_right</i>
                        <#if contentUrlDatasource?exists>
                            <a href="/xdoc${contentUrlDatasource.objectInfo?if_exists}" style="color:#FFFFFF;">${contentParent.contentName?if_exists}</a>
                        <#else>
                            <a href="">${contentParent.contentName?if_exists}</a>
                        </#if>
						</span>
                    <#-- Call macro recursively to build the complete path -->
                        <@buildBreadcrumb contentId = contentParent.contentId />
                    </#if>
                </#if>
            </#if>
        </#if>
    </#if>
</#macro>
<#-- to build sub topics content links for current content-->
<#macro buildSubtopics subContents positionClass>
    <#if (subContents?exists) && (subContents?size>0) >
    <div style="border-bottom:1px dashed #dbdbdb;padding-bottom:5px;"><i class="material-icons">expand_more</i>&nbsp;SUB TOPICS</div>
    <ul class="nav nav-list nav-subtopics">
        <#list subContents as subContent>
            <#assign contentChild = subContent.getRelatedOne("ToContent") />
            <#if (contentChild.contentName?exists)>
            <#-- avoid displaying meta data as it's also associated as sub content, check if mapKey exists and is not one of title,titleProperty,metaDescription,metaKeywords -->
                <#if (subContent.mapKey?exists) && (subContent.mapKey?trim?has_content)>
                    <#if (subContent.mapKey != "title")
                    && (subContent.mapKey != "titleProperty")
                    && (subContent.mapKey != "metaDescription")
                    && (subContent.mapKey != "metaKeywords")
                    >
                        <#assign contentURLInfoAssoc = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentId" : contentChild.contentId, "contentAssocTypeId" : "ALTERNATIVE_URL"}, null, false)) />
                        <#if contentURLInfoAssoc?exists>
                            <#assign contentUrlValue = contentURLInfoAssoc.getRelatedOne("ToContent") />
                            <#if contentUrlValue?exists>
                                <#assign contentUrlDatasource = contentUrlValue.getRelatedOne("DataResource") />
                            </#if>
                        </#if>
                        <#assign contentURLInfo = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentId" : contentChild.contentId, "contentAssocTypeId" : "ALTERNATIVE_URL"}, null, false)) />
                        <li>
                            map key : ${contentChild.mapKey}
                            <#if contentUrlDatasource?exists>
                                <a href="/xdoc${contentUrlDatasource.objectInfo?if_exists}" class="waves-attach waves-effect"><span class="material-icons margin-right-sm">subdirectory_arrow_right</span>${contentChild.contentName?if_exists}</a>
                            <#else>
                                <a href="" class="waves-attach waves-effect"><span class="material-icons margin-right-sm">subdirectory_arrow_right</span>${contentParent.contentName?if_exists}</a>
                            </#if>
                        </li>
                    </#if>
                <#else>
                    <#assign contentURLInfoAssoc = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentId" : contentChild.contentId, "contentAssocTypeId" : "ALTERNATIVE_URL"}, null, false)) />
                    <#if contentURLInfoAssoc?exists>
                        <#assign contentUrlValue = contentURLInfoAssoc.getRelatedOne("ToContent") />
                        <#if contentUrlValue?exists>
                            <#assign contentUrlDatasource = contentUrlValue.getRelatedOne("DataResource") />
                        </#if>
                    </#if>
                    <#assign contentURLInfo = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(delegator.findByAnd("ContentAssoc", {"contentId" : contentChild.contentId, "contentAssocTypeId" : "ALTERNATIVE_URL"}, null, false)) />
                    <li>
                        <#if contentUrlDatasource?exists>
                            <a href="/xdoc${contentUrlDatasource.objectInfo?if_exists}" class="waves-attach waves-effect"><span class="material-icons margin-right-sm">subdirectory_arrow_right</span>${contentChild.contentName?if_exists}</a>
                        <#else>
                            <a href="" class="waves-attach waves-effect"><span class="material-icons margin-right-sm">chevron_right</span>${contentParent.contentName?if_exists}</a>
                        </#if>
                    </li>
                </#if>
            </#if>
        </#list>
    </ul>
    <#else>
    <#-- no subtopics to show -->
    </#if>
</#macro>