<div dojoType="dijit.layout.BorderContainer" class="fullWidthHeight" >
	<div dojoType="dijit.layout.ContentPane" region="left" style="width:315px;border-right:1px solid #8DB2E3;background-color:#F8F8F8;" splitter="true">
		<#include "contentEditForm.ftl"	parse="true" />
	</div>
	<div dojoType="dijit.layout.ContentPane" region="center" style="overflow:hidden;">
	<#--
		<div data-dojo-type="dijit.Editor" style="width:100%;min-height:100%;" data-dojo-props="extraPlugins:['fullscreen','viewsource','prettyprint','pagebreak','showblocknodes','preview','save','toolbarlinebreak','normalizeindentoutdent','breadcrumb','findreplace','pastefromword','insertanchor','collapsibletoolbar','foreColor', 'hiliteColor','blockquote','smiley','uploadImage']">
		    ${StringUtil.wrapString(dataText.textData!)} 
		</div>
	-->
		<div dojoType="dijit.layout.BorderContainer" style="width:100%;height:100%;">
			<div dojoType="dojoc.TabContainer" region="center" tabPosition="bottom" >
				<div dojoType="dijit.layout.ContentPane" title="Preview" selected="true" >
					<div class="dijit dijitButtonbar" style="text-align:right;">
						<div style="float:left;">Preview Pane</div>
						<a href="#" 
							target="_blank" title="Pop out complete preview to a new window.">Pop Out Preview
						<span class="dijitBtn dijitBtnIcon menu-icon-link-go">&nbsp;</span></a>
					</div>
					<#setting url_escaping_charset="UTF-8">
					<#if (dataText?has_content)>
					<iframe width="100%" height="100%" frameborder="0" src="data:text/html;charset=utf-8,${StringUtil.wrapString(dataText.textData!)?url}" >
					</iframe> 
                    <#else>
					<iframe width="100%" height="100%" frameborder="0" src="data:text/html;charset=utf-8," >
					</iframe> 
                    </#if>
				</div>
				<div dojoType="dijit.layout.ContentPane" title="Source Code" >
					<div class="dijit dijitButtonbar" style="text-align:right;">
						<div dojoType="dojoc.Button" iconClass="menu-icon-filter" showLabel="true" 
							onclick="SC_CONTENT.formatSourceCode();">
							Format Selection
						</div>
					</div>
					<div dojoType="dojoc.CodeMirror" style="width:100%;height:100%;"
						id="cmsContentSource">
						<#if (dataText?has_content)>
						${StringUtil.wrapString(dataText.textData!)}
	                    </#if>
					</div>
				</div>
			</div>
		</div>
	
	</div>
</div>