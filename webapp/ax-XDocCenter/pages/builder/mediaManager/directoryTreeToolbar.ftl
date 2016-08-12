<div style="height:50px;">
	<div >
		<div data-dojo-type="dijit/form/Button" iconClass="menu-icon-folder-add" 
			label="New Folder" optionsTitle="Create a new folder" showLabel="true">
			<script type="dojo/method" event="onClick" args="item">
				Default.openMessageModal({
			        type: "prompt",
			        message: "Enter Folder Name",
			        callback: function(inputValue){
			            if(inputValue) {
			            	var serverFilePath = dijit.byId("vtbCurrentUnixDirectory").get("value");
							<#-- make server call -->
			                Scadmin.doBind(
								{
									serverFilePath : serverFilePath,
									folderName : inputValue
								}, 
								"/scadmin/rest/content/create/folder", 
								function(response) {
									//refresh the tree
									dijit.byId("directoryTree").reload();
								}, 
								null, 
								function() {
									Scadmin.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
								},
								true
							);
			            }
			        },
			        context: this
				});
			</script>
		</div>
		<div data-dojo-type="dijit/form/Button" 
			label="<i class='material-icons'>cached</i>" optionsTitle="Refresh Folder List" showLabel="true">
			<script type="dojo/method" event="onClick" args="item">
				//refresh the tree
				dijit.byId("directoryTree").reload();
			</script>
		</div>
		<div data-dojo-type="dijit/form/Button"  
			optionsTitle="Delete Folder" label="<i class='material-icons'>delete_forever</i>">
			<script type="dojo/method" event="onClick" args="item">
				Default.openMessageModal({
			        type: "confirm",
			        message: "Are you sure you want to delete the folder?",
			        callback: function(confirm){
			            if(confirm) {
			            	var serverFilePath = dijit.byId("vtbCurrentUnixDirectory").get("value");
							<#-- make server call -->
							var selectedDir = dijit.byId("selectedDirectoryName").get("value");
			                Scadmin.doBind(
								{
									serverFilePath : serverFilePath,
									folderName : selectedDir
								}, 
								"/scadmin/rest/content/remove/folder", 
								function(response) {
									//refresh the tree
									dijit.byId("directoryTree").reload();
								}, 
								null, 
								function() {
									Scadmin.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
								},
								true
							);
			            }
			        },
			        context: this
				});
			</script>
		</div>
	</div>
</div>