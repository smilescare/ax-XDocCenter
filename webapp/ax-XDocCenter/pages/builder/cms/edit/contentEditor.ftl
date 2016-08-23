<div data-dojo-type="dijit/layout/BorderContainer" style="padding:0;" class="ax-lineTabs">
	<div data-dojo-type="dijit/layout/ContentPane" region="left" style="width:350px;border-right:1px solid #8DB2E3;border-top:1px solid #8DB2E3;border-bottom: 0 none;border-left: 0 none;background-color:#EFF6FC;" splitter="true">
		<#include "contentEditForm.ftl"/>
	</div>
	<div data-dojo-type="dijit/layout/TabContainer"  region="center"  tabPosition="bottom"
		style="width: 100%; height: 100%;overflow:hidden;padding:0;">
        <div data-dojo-type="dijit/layout/ContentPane" title="<i class='material-icons color-themePrimary'>description</i>&nbsp;Content" data-dojo-props="selected:true" 
        	style="overflow:hidden;padding:0;border:0 none;"
			id="cpCkEditorContainer" data-dojo-id="cpCkEditorContainer">
			<script type="dojo/on" data-dojo-event="show">
				setTimeout(function(){
					var cpCkEditorContainer = dojo.byId("cpCkEditorContainer");
				    var width = cpCkEditorContainer.style.width.replace("px", "");
				    var height = cpCkEditorContainer.style.height.replace("px", "");
				    CKEDITOR.config.width=width;
				    CKEDITOR.config.height=height-135;//so the editor view doesn't go off the viewport
				    CKEDITOR.editorConfig = function( config ) {
						config.toolbar = [
							{ name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
							{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
							{ name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
							{ name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
							'/',
							{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
							{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
							{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
							{ name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
							'/',
							{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
							{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
							{ name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
							{ name: 'about', items: [ 'About' ] }
						];
					};

				    var editor = CKEDITOR.replace('ckContentEditorPane', {
							allowedContent : true,
							extraAllowedContent: 'p b ; i[*]; a[!href]',
						});
				    },
			    100);
			</script>
			<textarea name="editor1" id="ckContentEditorPane" rows="10" cols="80" style="">
				<#if (dataText?has_content)>
					${StringUtil.wrapString(dataText.textData!)}
				</#if>
			</textarea>
        </div>
        <div data-dojo-type="dojox/layout/ContentPane" title="<i class='material-icons color-themePrimary'>supervisor_account</i>&nbsp;Collaborators"
        	href="<@ofbizUrl>contentCollaborators?contentId=${contentId}</@ofbizUrl>">
            Collaborators goes here.
        </div>
        <div data-dojo-type="dojox/layout/ContentPane" title="<i class='material-icons color-themePrimary'>restore</i>&nbsp;History"
        	href="<@ofbizUrl>contentHistory?contentId=${contentId}</@ofbizUrl>">
           History
        </div>
        <div data-dojo-type="dojox/layout/ContentPane" title="<i class='material-icons color-themePrimary'>question_answer</i>&nbsp;Notes"
        	href="<@ofbizUrl>contentNotes?contentId=${contentId}</@ofbizUrl>">
            Notes
        </div>
        <div data-dojo-type="dojox/layout/ContentPane" title="<i class='material-icons color-themePrimary'>code</i>&nbsp;Source"
        	href="<@ofbizUrl>contentSource?contentId=${contentId}</@ofbizUrl>">
            Source
        </div>
    </div>
</div>
