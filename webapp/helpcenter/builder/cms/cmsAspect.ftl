<script>
var contextPath = '${request.getContextPath()}';
</script>
<div dojoType="dijit.layout.BorderContainer"  style="width:100%;height:100%;">
	<div dojoType="dijit.layout.ContentPane" region="top">
		<#include "toolbar.ftl"	parse="true" />
	</div>
	<div id="resource-master" dojoType="dijit.layout.ContentPane" region="center">
		<div dojoType="dijit.layout.BorderContainer" style="height:100%;width:100%">
			<div dojoType="dijit.layout.ContentPane" id="cpContentTree" splitter="true" region="left" style="width:25%;border-right:1px solid #8DB2E3"
				href="<@ofbizUrl>cmsTree</@ofbizUrl>" >
			</div>
			<div dojoType="dojox.layout.ContentPane" region="center"
				id="cpManageContentDetails" 
				href="<@ofbizUrl>editCmsContent</@ofbizUrl>">
			</div>
		</div>
	</div>
</div>