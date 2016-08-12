
<div data-dojo-type="dijit/layout/BorderContainer" region="center" data-dojo-props="gutters:false">
	<#if (contentId?exists) || (dataResourceTypeId?has_content)>
		<div data-dojo-type="dijit/layout/ContentPane" splitters="false" region="top" style="padding:0;">
			<#include "toolbar.ftl"	/>
		</div>					
		<div data-dojo-type="dijit/layout/ContentPane" region="center" style="padding-top:0;">
			<#include "contentEditor.ftl" />
		</div>
	<#elseif (!webSiteId?exists)>
		<h3>0${dataResourceTypeId?if_exists}1Please select a valid Web Site to proceed</h3>
	<#else>
		<div data-dojo-type="dojox/layout/ContentPane" region="center" class="fullWidthHeight" style="background:color:#f8f8f8;">
			<#include "newArticlePlaceHolder.ftl" />
		</div>
	</#if>
</div>