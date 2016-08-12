<div data-dojo-type="dijit/layout/BorderContainer" style="padding:0;">
	<div data-dojo-type="dijit/layout/ContentPane" region="left" style="width:350px;border-right:1px solid #8DB2E3;background-color:#EFF6FC;" splitter="true">
		<#include "contentEditForm.ftl"/>
	</div>
	<div data-dojo-type="dijit/layout/ContentPane" region="center" style="overflow:hidden;" 
		id="cpCkEditorContainer" data-dojo-id="cpCkEditorContainer">
		<script type="dojo/on" data-dojo-event="show">
			setTimeout(function(){
				var cpCkEditorContainer = dojo.byId("cpCkEditorContainer");
			    var width = cpCkEditorContainer.style.width.replace("px", "");
			    var height = cpCkEditorContainer.style.height.replace("px", "");
			    CKEDITOR.config.width=width;
			    CKEDITOR.config.height=height-135;//so the editor view doesn't go off the viewport
			    var editor = CKEDITOR.replace('ckContentEditorPane');
			    }, 
		    100);
		</script>
		<textarea name="editor1" id="ckContentEditorPane" rows="10" cols="80" style="">
			<#if (dataText?has_content)>
				${StringUtil.wrapString(dataText.textData!)}
			</#if>
		</textarea>
		<#--
		<script type="text/javascript">
			require(["dojo/dom-geometry", "dijit/registry", "dojo/ready"], function(domGeom, registry, ready){
				ready(function(){
			   		//timeout ensures the 
				    setTimeout(function(){
						var cpCkEditorContainer = dojo.byId("cpCkEditorContainer");
					    var width = cpCkEditorContainer.style.width.replace("px", "");
					    var height = cpCkEditorContainer.style.height.replace("px", "");
					    CKEDITOR.config.width=width;
					    CKEDITOR.config.height=height-135;//so the editor view doesn't go off the viewport
					    var editor = CKEDITOR.replace('ckContentEditorPane');
				    }, 100);
					
				});
			});
		</script>
		-->
	</div>
</div>