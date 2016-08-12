<div data-dojo-type="dojo/data/ItemFileWriteStore"
    id="filesInDirectoryStore"
    jsid="filesInDirectoryStore"
    data="{identifier:'id',label:'name',items:[]}"
    clearOnClose="true">
</div>
<div data-dojo-type="dojox/grid/EnhancedGrid" id="filesInDirectoryGrid"
    store="filesInDirectoryStore" query="{ id: '*' }" cellOverClass=""
    jsId="filesInDirectoryGrid"
    structure="[
         { name: '&nbsp;', field: 'id', width: '25px'},
         { name: 'File Name', field: 'name', width: 'auto'},
         { name: 'Last Modified', field: 'lastModified', width: '150px'}
    ]" 
    rowIdentifierAttr="id"
    defaultRowHeight="24" noDataMessage="No files found">
	<script type="dojo/connect" event="onRowClick" args="e">
		var item = this.getItem(e.rowIndex);
		var directoryPath = dijit.byId("serverDirectory").get("value");
		dijit.byId("vtbCurrentUnixDirectory").set("value", directoryPath + "/" + item.name);
		dijit.byId("btnDownloadFile").set("disabled", false);
    </script>
</div>
