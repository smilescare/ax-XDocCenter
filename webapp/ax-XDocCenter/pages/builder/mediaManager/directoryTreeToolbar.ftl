<div >
    <div data-dojo-type="dijit/form/DropDownButton" class="ax-btnLink ax-btnPopUpLink"
         label="<i class='material-icons' style='color:#0078d7;'>create_new_folder</i>" >
        <span></span>
        <div data-dojo-type="dijit/TooltipDialog" id="ttShowProfileSettings">
            <form>
                <label>Enter name of the folder</label>
                <div>
                    <input id="tbCreateNewMediaFolderName" data-dojo-type="dijit/form/ValidationTextBox" style="width:350px;" />
                </div>
            </form>
            <hr class="dashed-separator" />
            <span class="ax-btnPrimary">
                <div data-dojo-type="dijit/form/Button"
                     label="Create Folder" optionsTitle="Create a new folder" showLabel="true">
                    <script type="dojo/method" event="onClick" args="item">
                        var createFolderWithName = dijit.byId("tbCreateNewMediaFolderName").get("value");
                        if(createFolderWithName == ""){
                            App.displayMessage({message:"Please enter a valid directory name to proceed.", type:"warning"});
                            return;
                        }

                        var serverFilePath = dijit.byId("vtbCurrentUnixDirectory").get("value") + "/" + createFolderWithName;
                        App.doBind(
                            {serverFilePath : serverFilePath},
                            '<@ofbizUrl>createMediaFolder</@ofbizUrl>',
                            function(response) {
                                //refresh the pane to reflect new changes
                                require(["dijit/registry", "dojo/domReady!"], function(registry){
                                   registry.byId("cpDirectoryTreePane").refresh();
                                });
                            },
                            null,
                            function() {
                                App.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
                            }
                        );
                    </script>
                </div>
            </span>
        </div>
    </div>
	<div data-dojo-type="dijit/form/Button"
		label="<i class='material-icons'>cached</i>" optionsTitle="Refresh Folder List" showLabel="true">
		<script type="dojo/method" event="onClick" args="item">
			require(["dijit/registry", "dojo/domReady!"] , function(registry) {
				registry.byId("cpDirectoryTreePane").refresh();
			});
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