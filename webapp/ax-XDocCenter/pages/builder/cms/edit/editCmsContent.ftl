<#-- make sure it's not a publish point, special handling otherwise -->
<#if !isPublishPoint>
	<div data-dojo-type="dijit/layout/BorderContainer" region="center" data-dojo-props="gutters:false">
		<#if (contentId?exists) || (dataResourceTypeId?has_content)>
			<div data-dojo-type="dijit/layout/ContentPane" splitters="false" region="top" style="padding:0;">
				<#include "toolbar.ftl"	/>
			</div>					
			<div data-dojo-type="dijit/layout/ContentPane" region="center" style="padding-top:0;">
				<#include "contentEditor.ftl" />
			</div>
		<#elseif (!webSiteId?exists)>
			<#include "placeHolders/selectSitePlaceHolder.ftl" />
		<#else>
			<div data-dojo-type="dojox/layout/ContentPane" region="center" class="fullWidthHeight" style="background:color:#f8f8f8;">
				<#include "placeHolders/newArticlePlaceHolder.ftl" />
			</div>
		</#if>
	</div>
<#else>
	<#include "placeHolders/sitePublishPointPlaceHolder.ftl" />
</#if>