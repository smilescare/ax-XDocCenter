<#if !(webSiteId?exists)>
	<#-- if not available in context, try looking up in paramers -->
	<#assign webSiteId = parameters.webSiteId?if_exists >
</#if>
<#macro fillTreeSubsites assocList>
      <#if (assocList?has_content)>
      	<#if (assocList?size == 0)>
            {
	            id: 'NO-CHILDREN-AVAILABLE',
	            label : 'No Articles added',
	            contentId : 'NO-ARTICLE',
	            contentAssocTypeId : 'NO-ARTICLE'
            }
      	<#else>
      		<#list assocList as assoc>
      			<#assign content = assoc.getRelatedOne("ToContent")/>
	      		{
	            id: '${assoc.contentIdTo}',
	            iddummy: '${assoc.contentId}${assoc.contentIdTo}${assoc.contentAssocTypeId}',
	            label : '${content.contentName!assoc.contentIdTo}',
	            contentId : '${assoc.contentId}',
	            fromDate : '${assoc.fromDate}',
	            contentAssocTypeId : '${assoc.contentAssocTypeId}'
	            <#assign assocChilds  = content.getRelated("FromContentAssoc", null, ["sequenceNum"], false)?if_exists/>
	            <#if assocChilds?has_content>
	                ,children: [
	                    <@fillTreeSubsites assocList = assocChilds/>
	                ]
	            </#if>
	            <#if assoc_has_next>
	            },
	            <#else>
	            }
	            </#if>
            </#list>
      	</#if>
      </#if>
</#macro>

<#if (webSiteId?exists && webSiteId?has_content)>
	<#-- make sure we've at least one children to get started -->
	<#if ( (subsites?exists) && (subsites?size > 0) )>
		<div data-dojo-type="dojo/data/ItemFileReadStore"
			jsId="siteChildrenStore" 
			data="{  identifier: 'iddummy', label: 'label', items : [<#if (subsites?has_content)><@fillTreeSubsites assocList = subsites/></#if>] }">
		</div>
		<div data-dojo-type="dijit/tree/ForestStoreModel" rootLabel="<#if webSite.siteName?exists>${webSite.siteName}<#else>Site Content [ ${webSiteId} ]</#if>"
			jsId="forrestStoreSiteChildrenModel" preventCache="true" 
			store="siteChildrenStore">
		</div>
		<div data-dojo-type="dijit/Tree" id="webSiteContentTree" model="forrestStoreSiteChildrenModel"  style="height:100%;width:100%"  showRoot="false">
			<script type="dojo/method" event="onClick" args="item">
				var contentDetailPane = dijit.byId("cpManageContentDetails");
				if(item.fromDate != undefined){
					contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=" + item.contentAssocTypeId
												+ "&contentId=" + item.id
												+ "&contentIdFrom=" + item.contentId
												+ "&contentRoot=${contentRoot?if_exists}"
												+ "&fromDate=" + item.fromDate
												+ "&webSiteId=${webSiteId?if_exists}";
				}else{
					contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=" + item.contentAssocTypeId
												+ "&contentId=" + item.id
												+ "&contentIdFrom=" + item.contentId
												+ "&contentRoot=${contentRoot?if_exists}"
												+ "&webSiteId=${webSiteId?if_exists}";
				}
				contentDetailPane.refresh();
			</script>
		</div>
	<#else>
		<div style="text-align:center;">
			No article(s) created yet.
		</div>
	</#if>
<#else>
	<div class="text-center">
		<img src="<@ofbizContentUrl>/app/xdoc/page-builder/img/LadySittingAtDesk.png</@ofbizContentUrl>" width="250px;" />
		<p>Select a Web Site to proceed</p>
		<p>Or</p>
        <div data-dojo-type="dijit/form/Button" iconClass="menu-icon-asterisk"
             label="Create Web Site" optionsTitle="Manage Content Files" showLabel="true">
            <script type="dojo/method" event="onClick" args="item">
				Prodaid.openModal({
					method : 'POST',
					url: "<@ofbizUrl>contentFileManager</@ofbizUrl>",
					content : {},
					title : "Manage Files",
					showButtons : false,
					showRequiredIndicator : false
				});
			</script>
        </div>
	</div>
</#if>
