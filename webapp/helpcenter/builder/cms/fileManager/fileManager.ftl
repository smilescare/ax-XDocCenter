<div dojoType="dijit.layout.BorderContainer" style="width:900px;height:450px;" style="padding:5px;">
	<div dojoType="dijit.layout.ContentPane" region="top">
		<div class="dijit dijitButtonbar"  style="height:50px;">
			Server Path:<input type="text" id="vtbCurrentUnixDirectory" name="currentDirectory" dojoType="dijit.form.TextBox" 
				value="/root" style="width:770px;" readOnly="true"/>
				<div style="display:inline-block;" dojoType="dojoc.Button" iconClass="menu-icon-link" showLabel="false" 
					title="Upload file to the selected directory."	onclick="SC_CONTENT.uploadFile(1, '/scadmin/rest/content/upload/file')">Prepare URL
					<script type="dojo/method" event="onClick" args="item">
						var includePath = "<\#include \"component://static/webapp/static/content/" + dijit.byId("vtbCurrentUnixDirectory").get("value") + "\" parse=\"false\" />";
						//console.log("Include path:" + includePath);
						alert(includePath);
						<#--
						Default.openMessageModal({
					        type: "prompt",
					        message: "Path to Include resource",
					        value : "Test value.",
					        callback: function(inputValue){
					        },
					        context: this
						});
						-->
					</script>
				</div>
			<table>
				<tr>
					<td>
						<form method="post" id="fileUploadForm" name="fileUploadForm" enctype="multipart/form-data" >
						   <label for="fFile">Choose file</label>
					   		<input type="hidden" id="serverDirectory" name="serverDirectory" value="" 
					   			dojoType="dijit.form.TextBox"/>
					   		<input type="hidden" id="selectedDirectoryName" name="selectedDirectoryName" value="" 
					   			dojoType="dijit.form.TextBox"/>
			            	<input type="file" name="fileToUpload" id="fileToUpload" />
						</form>
					</td>
					<td>
						<div dojoType="dojoc.ButtonGrouping">
							<div dojoType="dojoc.Button" iconClass="menu-icon-upload" showLabel="true" 
								title="Upload file to the selected directory."	onclick="SC_CONTENT.uploadFile(1, '/scadmin/rest/content/upload/file')">Upload</div>
							<div dojoType="dojoc.Button" iconClass="menu-icon-download"
								id="btnDownloadFile" showLabel="true" disabled="true"
								title="Download File from server" onclick="SC_CONTENT.downloadFile('/scadmin/rest/content/download/file')">Download</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div dojoType="dijit.layout.ContentPane" region="center" >
		<div dojoType="dijit.layout.BorderContainer" style="width:100%;height:100%;" >
			<div dojoType="dijit.layout.ContentPane" region="top">
				<#include "directoryTreeToolbar.ftl"	parse="true" />
			</div>
			<div dojoType="dijit.layout.ContentPane" region="center">
				<#include "directoryTree.ftl"	parse="true" />
			</div>
		</div>
	</div>
	<div dojoType="dijit.layout.ContentPane"  splitter="true" region="right" style="width:600px;background-color:#FFFFFF;" >
		<#include "grid/filesInDirectoryGrid.ftl"	parse="true" />
	</div>
</div>