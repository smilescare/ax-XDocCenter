<div dojoType="dijit.layout.BorderContainer" class="fullWidthHeight" >
	<div dojoType="dijit.layout.ContentPane" region="left" style="width:250px;border-right:1px solid #8DB2E3;background-color:#F8F8F8;" splitter="true">
		<#include "contentEditForm.ftl"	parse="true" />
	</div>
	<div dojoType="dijit.layout.ContentPane" region="center" style="overflow:hidden;">
		<textarea name="editor1" id="ckContentEditorPane" rows="10" cols="80" style="">
			<#if (dataText?has_content)>
				${StringUtil.wrapString(dataText.textData!)}
			</#if>
		</textarea>
		<script type="text/javascript">
			CKEDITOR.config.height=450;//set height of editor to 450px
		    CKEDITOR.replace('ckContentEditorPane');
		</script>
	</div>
</div>