<div dojoType="dijit.layout.BorderContainer" region="center" style="width:100%;height:100%;" >
	<div dojoType="dijit.layout.ContentPane" splitters="false" region="top">
		<#include "toolbar.ftl"	parse="true" />
	</div>					
	<div dojoType="dijit.layout.ContentPane" region="center" class="fullWidthHeight">
		<#if webSiteId?exists>
			<#include "/scadmin/webapp/scadmin/pages/content/cms/edit/pathalias/grid/pathAliasesGrid.ftl"	parse="true" />
		<#else>
			Populates when content and website ids are available.
		</#if>
	</div>
</div>