<div data-dojo-type="dojo/store/JsonRest" useCookies="false" autoExpand="false"
	jsId="categoryModel" id="categoryModel"
	target="<@ofbizUrl>listDirectories</@ofbizUrl>?path=" >
	<script type="dojo/method" event="mayHaveChildren" args="object">
		// see if it has a children property
		return "children" in object;
    </script>
	<script type="dojo/method" event="getChildren" args="object,onComplete,onError">
		this.get(object.id).then(function(fullObject){
			// copy to the original object so it has the children array as well.
			object.children = fullObject.children;
			// now that full object, we should have an array of children
			onComplete(fullObject.children);
		}, function(error){
			// an error occurred, log it, and indicate no children
			console.error(error);
			onComplete([]);
		});
    </script>
	<script type="dojo/method" event="getRoot" args="onItem,onError">
		this.get("root").then(onItem, onError);
    </script>
	<script type="dojo/method" event="getLabel" args="object">
		return object.name;
    </script>
	<script type="dojo/method" event="put" args="object,options">
		this.onChildrenChange(object, object.children);
		this.onChange(object);
		return dojo.store.JsonRest.prototype.put.apply(this, arguments);
    </script>
</div>
<div data-dojo-type="dijit/Tree" id="directoryTree" model="categoryModel" useCookies="false" autoExpand="false" showRoot="true" rootLabel="content">
	<script type="dojo/method" event="onClick" args="item">
		var serverDirectory = item.id.replace(/\~/g, "/");
		dijit.byId("serverDirectory").set("value", serverDirectory);//set the hidden server directory so can be use elsewhere
		dijit.byId("vtbCurrentUnixDirectory").set("value", serverDirectory);
		dijit.byId("selectedDirectoryName").set("value", item.name);

		//disable download button, so it gets enabled only when some files are selected
		dijit.byId("btnDownloadFile").set("disabled", true);

		var filesInDirUrl = "<@ofbizUrl>listFilesInDir</@ofbizUrl>?path=" + item.id;
		var grid = dijit.byId("filesInDirectoryGrid");
		if(grid.store.save) {
			grid.store.save();
		}
		grid.store.close();
		grid.store.url = filesInDirUrl;
		grid._refresh();
	</script>
</div>