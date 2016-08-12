<div dojoType="dijit.layout.BorderContainer" style="width:100%;height:100%;" >
	<div dojoType="dijit.layout.ContentPane" region="center" class="fullWidthHeight">
	<#if (title?has_content)>
	    <#assign titleAction = "/updateWebSiteMetaInfoJson"/>
	<#else>
	    <#assign titleAction = "/createWebSiteMetaInfoJson"/>
	</#if>
	<#if (titleProperty?has_content)>
	    <#assign titlePropertyAction = "/updateWebSiteMetaInfoJson"/>
	<#else>
	    <#assign titlePropertyAction = "/createWebSiteMetaInfoJson"/>
	</#if>
	<#if (metaDescription?has_content)>
	    <#assign metaDescriptionAction = "/updateWebSiteMetaInfoJson"/>
	<#else>
	    <#assign metaDescriptionAction = "/createWebSiteMetaInfoJson"/>
	</#if>
	<#if (metaKeywords?has_content)>
	    <#assign metaKeywordsAction = "/updateWebSiteMetaInfoJson"/>
	<#else>
	    <#assign metaKeywordsAction = "/createWebSiteMetaInfoJson"/>
	</#if>
	
	<form name="cmsmetaform" action="javascript:void(0);" style="margin: 0;">
	    <table>
	        <tr>
	            <td class="label">Page Title</td>
	            <td><input dojoType="dijit.form.TextBox" type="text" name="title" value="${(title.objectInfo)?if_exists}" size="40" /></td>
	        </tr>
	        <tr>
	            <td class="label">Title Property</td>
	            <td><input dojoType="dijit.form.TextBox" type="text" name="titleProperty" value="${(titleProperty.objectInfo)?if_exists}" size="40" /></td>
	        </tr>
	        <tr>
	            <td class="label">Meta-Description</td>
	            <td><input dojoType="dijit.form.TextBox" type="text" name="metaDescription" value="${(metaDescription.objectInfo)?if_exists}" size="40" /></td>
	        </tr>
	        <tr>
	            <td class="label">Meta-Keywords</td>
	            <td><input dojoType="dijit.form.TextBox" type="text" name="metaKeywords" value="${(metaKeywords.objectInfo)?if_exists}" size="40" /></td>
	        </tr>
	        <tr><td colspan="2">&nbsp;</td></tr>
	        <tr>
	            <td colspan="2" align="center">
	            	<div dojoType="dojoc.Button" iconClass="menu-icon-save" showLabel="true" 
						id="btnSaveMeta" 
						onclick="SC_CONTENT.updateContent();">
						Save
					</div>
	            	<input id="submit" type="button" onclick="javascript:saveMetaInfo(cmsmetaform);" class="smallSubmit" value="${uiLabelMap.CommonSave}"/></td>
	        </tr>
	    </table>
	</form>
	</div>
</div>