<div data-dojo-type="dijit/layout/BorderContainer"  id="pageBuilderAppContainer" data-dojo-props="gutters:false">
	<div data-dojo-type="dijit/layout/ContentPane" region="top" style="height:60px;padding:0;">
		<div style="padding:0;margin:0;position:relative;">
			<div style="position:absolute;left:0;top:0;display:inline-block;margin:5px 5px 0 15px;background:url(<@ofbizContentUrl>/xstatic/assets/app/xdoc/page-builder/img/logo-50.png</@ofbizContentUrl>) no-repeat scroll left transparent;padding-left:60px;">
				<h1 style="font-size:15px;padding:0;margin:0;">Page Builder</h1>
				<p style="font-size:13px;padding:0;margin:0;">Managing Content Simplified</p>
			</div>
			<div style="position:absolute;right:0;top:0;display:inline-block;">
				<#include "layout/navMenu.ftl" />
			</div>
		</div>
	</div>
	<div data-dojo-type="dijit/layout/ContentPane" region="center" style="padding:0;">
		<div data-dojo-type="dijit/layout/BorderContainer" style="padding-top:0;">
			<div data-dojo-type="dijit/layout/ContentPane" splitter="true" region="left" style="width:25%;padding:0;" >
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
			<div data-dojo-type="dojox/layout/ContentPane" data-dojo-props="splitter:true, region:'center'"  style="padding:0;"
				id="cpManageContentDetails" 
				href="<@ofbizUrl>editCmsContent</@ofbizUrl>">
			</div>
		</div>
	</div>
</div>
