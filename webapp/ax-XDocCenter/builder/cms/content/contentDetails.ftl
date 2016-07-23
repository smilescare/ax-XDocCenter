<div id="featuresTC" dojoType="dojoc.TabContainer" region="center" style="height:100%;width:100%">
	<div id="cp-content-details" dojoType="dojox.layout.ContentPane" 
		title="Edit content" selected="true" executeScripts="true" preventCache="true"
		href="<@ofbizUrl>editCmsContent</@ofbizUrl>" 
		refreshOnShow="false">
	</div>

	<div id="cp-content-pathalias" dojoType="dijit.layout.ContentPane" title="Path Aliases"
		href="<@ofbizUrl>renderview?viewToRender=editPathAliases</@ofbizUrl>" 
		refreshOnShow="true">
	</div>

	<div id="cp-content-metadata" dojoType="dijit.layout.ContentPane" title="Meta Tags"
		href="<@ofbizUrl>renderview?viewToRender=editMetaData</@ofbizUrl>" 
		refreshOnShow="true">
	</div>
</div>