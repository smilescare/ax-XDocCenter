<div data-dojo-type="dojo/data/ItemFileReadStore" id="qrsContentCollaboratorsStore"
    jsid="qrsContentCollaboratorsStore" urlPreventCache="true"
    url="<@ofbizUrl>findContentCollaborators?contentId=${contentId}</@ofbizUrl>"
    clearOnClose="true">
</div>
<div data-dojo-type="dojox/grid/EnhancedGrid" id="qrsContentCollaboratorsGrid" rowsPerPage="20" count="20"
    store="qrsContentCollaboratorsStore" query="{ partyName: '*' }"
    jsId="qrsContentCollaboratorsGrid"
    structure="[
		{ name: 'Name', field: 'partyName', width: 'auto'},
		{ name: 'From Date', field: 'formattedFromDate', width: '100px'},
		{ name: 'Thru Date', field: 'thruDate', width: '100px'}
     ]"
    rowIdentifierAttr="id" defaultRowHeight="24" 
    noDataMessage="No records found">
    <script type="dojo/connect" event="onRowClick" args="e">
			var columnIndex = e.cellIndex;
			var rowIndex = e.rowIndex;

			var item = this.getItem(rowIndex), s = this.store;
			var changeId = s.getValue(item, "changeId");

			if(columnIndex == 0){
				//open edit popup
				Prodaid.openModal({
					url: "<@ofbizUrl>editChange</@ofbizUrl>",
					method: 'POST',
				    content: {
				    	changeId : changeId
				    },
				    title: "Edit Change Details",
				    showButtons: false,
				    showRequiredIndicator: true
				});
			}else{
				//show Change details
				var baseUrl = "<@ofbizUrl>renderview?viewToRender=soCab/changeDetails</@ofbizUrl>";
				var cpViewChangeDetails = dijit.byId("cpViewChangeDetails");
				
				cpViewChangeDetails.href= baseUrl + "&changeId=" + changeId;
				cpViewChangeDetails.refresh();
			}
			
			return false;
	</script>
</div>