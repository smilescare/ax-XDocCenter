<#if !(webSiteId?exists)>
	<#-- if not available in context, try looking up in paramers -->
	<#assign webSiteId = parameters.webSiteId?if_exists >
</#if>
<#macro fillTreeSubsites assocList>
      <#if (assocList?has_content)>
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
</#macro>

<div data-dojo-type="dijit/layout/BorderContainer" style="height:100%;width:100%" data-dojo-props="gutters:false">
	<div data-dojo-type="dijit/layout/ContentPane" region="top" class="toolbar-pane">
		<div class="form-group">
			<div data-dojo-type="dojox/data/QueryReadStore" id="websitesStore" jsId="websitesStore"
				url="<@ofbizUrl>findWebsites</@ofbizUrl>">
			</div>
			<div data-dojo-type="dijit/form/FilteringSelect" value="${webSiteId?if_exists}" store="websitesStore" ignoreCase="true" 
				queryExp="&#36;{0}" style="width:100%;" ignoreCase="true" id="fsSelectedWebsite" labelAttr="richNameLabel" labelType="html"
				searchAttr="siteName" pageSize="10" autoComplete="false" name="websiteId" placeHolder="Select Website"
				highlightMatch="all" required="true">
				<script type="dojo/connect" event="onChange" args="item">
					var selectedWebSiteId = dijit.byId("fsSelectedWebsite").get("value");
					var webSiteContentTreeUrl = "<@ofbizUrl>cmsTree</@ofbizUrl>?webSiteId=" + selectedWebSiteId;
					var contentTreeWidget = dijit.byId("cpContentTree");
					contentTreeWidget.set("href", webSiteContentTreeUrl);
					contentTreeWidget.refresh();
				</script>
			</div>
		</div>
	</div>
	<div data-dojo-type="dijit/layout/ContentPane" region="center" style="height:100%;width:100%">
		<#if (webSiteId?exists && webSiteId?has_content)>
			<div data-dojo-type="dojo/data/ItemFileReadStore"
				jsId="siteIndexStore" id="siteIndexStore"
				data="{  identifier: 'iddummy', label: 'label', items : [<#if (subsites?has_content)><@fillTreeSubsites assocList = subsites/></#if>] }">
			</div>
			<div data-dojo-type="dijit/tree/ForestStoreModel" rootLabel="Site Content [ ${webSiteId} ]"
				jsId="siteIndexModel" id="siteIndexModel" preventCache="true"
				store="siteIndexStore">
			</div>
			<div data-dojo-type="dijit/Tree" id="webSiteContentTree" model="siteIndexModel"  style="height:100%;width:100%"  >
				<script type="dojo/method" event="onClick" args="item">
					var contentDetailPane = dijit.byId("cpManageContentDetails");
					contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=" + item.contentAssocTypeId
																+ "&contentId=" + item.id
																+ "&contentIdFrom=" + item.contentId
																+ "&contentRoot=${contentRoot?if_exists}"
																+ "&fromDate=" + item.fromDate
																+ "&webSiteId=${webSiteId?if_exists}";
					contentDetailPane.refresh();
					/*
					var contentPathAliasPane = dijit.byId("cp-content-pathalias");
					var contentMetaDataPane = dijit.byId("cp-content-metadata");

					contentPathAliasPane.href = "/prodaid/control/renderview?viewToRender=cms/edit/pathalias/pathAliases&contentAssocTypeId=" + item.contentAssocTypeId
																+ "&contentId=" + item.contentId
																+ "&webSiteId=${webSiteId?if_exists}";
					contentMetaDataPane.href = "/prodaid/control/renderview?viewToRender=cms/edit/metatags/metaTags&contentAssocTypeId=" + item.contentAssocTypeId
																+ "&contentId=" + item.contentId
																+ "&webSiteId=${webSiteId?if_exists}";
					contentPathAliasPane.refresh();
					contentMetaDataPane.refresh();
					*/
				</script>
				<#--
				<script type="dojo/method" event="getIconClass" args="item, opened">
					if(item == this.model.root) {
						return (opened ? "dijitFolderOpened" : "dijitTreeExpandoClosed");
					} else {
						var itemType = siteIndexStore.getValue(item, "type");
						return itemType + "-Icon";
					}
				</script>
				-->
			</div>
		<#else>
			<div class="text-center">
				<img src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/LadySittingAtDesk.png</@ofbizContentUrl>" width="250px;" />
				<p>Select a Web Site to proceed</p>
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
	</div>
</div>