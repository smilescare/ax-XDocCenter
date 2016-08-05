<div data-dojo-type="dijit/layout/BorderContainer"  id="pageBuilderAppContainer" data-dojo-props="gutters:false">
	<div data-dojo-type="dijit/layout/ContentPane" region="top" style="height:60px;padding:0;">
		<div style="padding:0;margin:0;position:relative;">
			<div style="position:absolute;left:0;top:0;display:inline-block;margin:5px 5px 0 15px;background:url(<@ofbizContentUrl>/hc/assets/page-builder/img/logo-50.png</@ofbizContentUrl>) no-repeat scroll left transparent;padding-left:60px;">
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
			<div data-dojo-type="dijit/layout/ContentPane" id="cpContentTree" data-dojo-props="splitter:true, region:'leading'" 
				style="width:350px;padding:0"
				href="<@ofbizUrl>cmsTree</@ofbizUrl>" >
			</div>
			<div data-dojo-type="dojox/layout/ContentPane" data-dojo-props="splitter:true, region:'center'"  style="padding:0;"
				id="cpManageContentDetails" 
				href="<@ofbizUrl>editCmsContent</@ofbizUrl>">
			</div>
		</div>
	</div>
</div>
