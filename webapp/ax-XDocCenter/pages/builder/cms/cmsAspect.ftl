<script>
var contextPath = '${request.getContextPath()}';
</script>
<div data-dojo-type="dijit/layout/BorderContainer"  style="width:100%;height:100%;" 
	data-dojo-props="gutters:false">
	<div data-dojo-type="dijit/layout/ContentPane" region="top" data-dojo-props="gutters:false" style="height:50px;">
		<#include "toolbar.ftl"	parse="true" />
	</div>
	<div id="resource-master" data-dojo-type="dijit/layout/ContentPane" region="center">
		<div data-dojo-type="dijit/layout/BorderContainer" data-dojo-props="gutters:false">
			<div data-dojo-type="dijit/layout/ContentPane" splitter="true" region="left" style="width:25%;">
				<div data-dojo-type="dijit/layout/BorderContainer" style="height:100%;width:100%" data-dojo-props="gutters:false">
					<div data-dojo-type="dijit/layout/ContentPane" region="top" class="toolbar-pane">
						<div class="form-group">
							<div data-dojo-type="dojox/data/QueryReadStore" id="websitesStore" jsId="websitesStore"
								url="<@ofbizUrl>findWebsites</@ofbizUrl>">
							</div>
							<div data-dojo-type="dijit/form/FilteringSelect" value="${webSiteId?if_exists}" store="websitesStore" ignoreCase="true" 
								queryExp="&#36;{0}" style="width:100%;" ignoreCase="true" id="fsSelectedWebsite" labelAttr="richNameLabel" labelType="html"
								searchAttr="siteName" pageSize="10" autoComplete="false" name="websiteId" placeHolder="Start typing or select a Web Site"
								highlightMatch="all" required="true">
								<script type="dojo/connect" event="onChange" args="item">
									var selectedWebSiteId = dijit.byId("fsSelectedWebsite").get("value");
									var webSiteContentTreeUrl = "<@ofbizUrl>cmsTree</@ofbizUrl>?webSiteId=" + selectedWebSiteId;
									var contentTreeWidget = dijit.byId("cpContentTree");
									contentTreeWidget.set("href", webSiteContentTreeUrl);
									contentTreeWidget.refresh();
									
									var cpManageContentDetails = dijit.byId("cpManageContentDetails");
									var webSiteContentDetailsUrl = "<@ofbizUrl>editCmsContent</@ofbizUrl>?webSiteId=" + selectedWebSiteId;
									cpManageContentDetails.set("href", webSiteContentDetailsUrl);
									cpManageContentDetails.refresh();
								</script>
							</div>
						</div>
					</div>
					<div data-dojo-type="dijit/layout/ContentPane" region="center" style="height:100%;width:100%"
						id="cpContentTree" href="<@ofbizUrl>cmsTree</@ofbizUrl>">
					</div>
				</div>
			</div>
			
			<div data-dojo-type="dojox.layout.ContentPane" region="center" data-dojo-props="gutters:false"
				id="cpManageContentDetails" 
				href="<@ofbizUrl>editCmsContent</@ofbizUrl>">
			</div>
		</div>
	</div>
</div>