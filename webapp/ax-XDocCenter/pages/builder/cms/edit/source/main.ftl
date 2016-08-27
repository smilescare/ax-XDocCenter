<div data-dojo-type="dijit/layout/BorderContainer" class="ax-lineTabs padding-0" data-dojo-props="gutters:false">
    <div data-dojo-type="dijit/layout/ContentPane" region="top" class="toolbar-pane" style="padding:0;background-color: #f8f8f8;border-bottom: 1px solid #c0c0c0;">
		<#include "toolbar.ftl"/>
    </div>
    <div data-dojo-type="dijit/layout/ContentPane" region="center" class="padding-0">
		<#-- raw code of the content, useful when functionality of web editor is limited -->
		<div id="contentSourceCodeEditor" style="width:100%;height:100%;">
			<#if (dataText?has_content)>
				${StringUtil.wrapString(dataText.textData!)}
			</#if>
		</div>
		<script>
			var contentSourceCodeEditorNode = document.getElementById("contentSourceCodeEditor");
			var contentSourceCodeEditorNodeText = contentSourceCodeEditorNode.innerHTML;
			var editor = ace.edit(contentSourceCodeEditorNode);
			//editor.setTheme("ace/theme/github");
			//editor.setTheme("ace/theme/twilight");
			editor.setTheme("ace/theme/tomorrow");
			editor.getSession().setValue(contentSourceCodeEditorNodeText);
			editor.getSession().setMode("ace/mode/html");
			editor.getSession().setUseWrapMode(true);
			editor.setHighlightActiveLine(true);

			//on change update the textarea that stores the value being posted to the server
			editor.getSession().on('change', function(e) {
				CKEDITOR.instances.ckContentEditorPane.setData( editor.getValue() );
			});
			//var beautify = ace.require("ace/ext/beautify");
			//beautify.beautify(editor.getSession());
		</script>
	</div>
</div>
