<style>
	.upload-picture{
		padding-left:50px;
		width: 650px;
        display:inline-block;
	}
    .upload-picture:before {
        background-image: url(<@ofbizContentUrl>/xstatic/assets/app/xdoc/img/sprite.svg</@ofbizContentUrl>);
        background-repeat: no-repeat;
        -webkit-background-size: 134px 1921px;
        -moz-background-size: 134px 1921px;
    }

    .upload-picture:before {
        background-size: 45px 640px;
        background-position: 0 70%;
        position: absolute;
        content: '';
        text-indent: -9999px;
        display: block;
        top: 0;
        left: 5px;
        width: 128px;
        height: 100px;
        margin-left: 4px;
    }

</style>
<div data-dojo-type="dijit/layout/BorderContainer" style="width:1000px;height:650px;" data-dojo-props="gutters:false">
	<div data-dojo-type="dijit/layout/ContentPane" region="top" class=" dijitNoGutterPane">
		<div style="padding:5px 15px;border:1px dashed #71afe5;margin:5px;">
			<div class="upload-picture">
				<form method="post" id="fileUploadForm" name="fileUploadForm" enctype="multipart/form-data" >
				   <label for="fFile">Choose file</label>
					<input type="hidden" id="serverDirectory" name="serverDirectory" value=""
						data-dojo-type="dijit.form.TextBox"/>
					<input type="hidden" id="selectedDirectoryName" name="selectedDirectoryName" value=""
						data-dojo-type="dijit.form.TextBox"/>
					<input type="file" name="fileToUpload" id="fileToUpload" />
				</form>
			</div>
			<span class="ax-btnPrimaryOutline ax-btnSizeSmall">
				<div data-dojo-type="dijit/form/Button" title="Upload file to the selected directory.">
					<i class="material-icons md-18 md-middle">cloud_upload</i>&nbsp;&nbsp;Upload
					<script type="dojo/method" event="onClick" args="item">
						require(["dojo/request/iframe", "dijit/registry", "dojo/topic", "dojo/domReady!"] , function(iframe, registry, topic) {
							globalLoadingOverlay.show();
							iframe("<@ofbizUrl>uploadCmsBinaryFile</@ofbizUrl>", {
								form: "fileUploadForm",
								method: "POST",
								content: {},
								timeoutSeconds: 10,
								preventCache: true,
								handleAs: "html"
							}).then(function(response){
								globalLoadingOverlay.hide();
								registry.byId("cpDirectoryTreePane").refresh();
								setTimeout(function(){
									var grid = dijit.byId("filesInDirectoryGrid");
									var gridUrl = grid.store.url;
									if(grid.store.save) {
										grid.store.save();
									}
									grid.store.close();
									grid.store.url = gridUrl;
									grid._refresh();
								}, 1000);
							}, function(err){
								globalLoadingOverlay.hide();
								// Handle the error condition
								App.bindError;
							});
						});
					</script>
				</div>
			</span>
		</div>
		<div class="dijit dijitButtonbar">
			<i class="material-icons md-middle">language</i>&nbsp;&nbsp;URL:<input type="text" id="vtbCurrentUnixDirectory" name="currentDirectory" data-dojo-type="dijit.form.TextBox"
				value="/" style="width:900px;" data-dojo-props="selectOnClick : true"/>
		</div>
	</div>
	<div data-dojo-type="dijit/layout/ContentPane" region="center" class="dijitNoGutterPane" style="border-right:1px solid #DBDBDB;border-top:1px solid #DBDBDB;">
		<div data-dojo-type="dijit/layout/BorderContainer" style="width:100%;height:100%;"  data-dojo-props="gutters:false">
			<div data-dojo-type="dijit/layout/ContentPane" region="bottom" class="dijitButtonbar" style="border-top:1px solid #DBDBDB;">
				<#include "directoryTreeToolbar.ftl" />
			</div>
			<div data-dojo-type="dijit/layout/ContentPane" id="cpDirectoryTreePane" region="center" href="<@ofbizUrl>directoryTreePane</@ofbizUrl>">
				<#include "directoryTree.ftl" />
			</div>
		</div>
	</div>
	<div data-dojo-type="dijit/layout/ContentPane"  class="dijitNoGutterPane" splitter="true" region="right" style="width:600px;background-color:#FFFFFF;" >
		<#include "grid/filesInDirectoryGrid.ftl"	parse="true" />
	</div>
</div>