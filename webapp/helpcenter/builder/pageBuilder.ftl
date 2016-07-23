<div data-dojo-type="dijit/layout/BorderContainer"  style="width:100%;height:100%;" data-dojo-props="gutters:false">
	<div data-dojo-type="dijit/layout/ContentPane" region="top">
		<h1>Page Builder</h1>
	</div>
	<div data-dojo-type="dijit/layout/ContentPane" region="center">
		<div data-dojo-type="dijit/layout/BorderContainer" style="height:100%;width:100%">
			<div data-dojo-type="dijit/layout/ContentPane" id="cpContentTree" splitter="true" region="left" style="width:25%;border-right:1px solid #8DB2E3"
				href="<@ofbizUrl>cmsTree</@ofbizUrl>" >
			</div>
			<div data-dojo-type="dojox/layout/ContentPane" region="center"
				id="cpManageContentDetails" 
				href="<@ofbizUrl>editCmsContent</@ofbizUrl>">
			</div>
		</div>
	</div>
</div>
