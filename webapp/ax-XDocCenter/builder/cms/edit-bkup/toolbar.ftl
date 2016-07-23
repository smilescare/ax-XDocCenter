<div dojoType="dojoc.Buttonbar">
	<div dojoType="dojoc.ButtonGrouping">
		<div dojoType="dojoc.Button" iconClass="menu-icon-create" showLabel="true" title="Create a new Feature Type"
			onclick="Scadmin.openView({viewId:'newFeatureCategory', method:'POST', title: 'Scadmin: New Feature Category', buttonLabel: 'Create', showButtons:true, showRequiredIndicator:true});">New</div>
		<div dojoType="dojoc.DropDownButton" iconClass="menu-icon-delete" label="Delete" 
			optionsTitle="delete" showLabel="false" onclick="alert('delete selected');"> 
			<span></span>
			<div dojoType="dijit.Menu">
				<div dojoType="dijit.MenuItem" iconClass="menu-icon-delete" onclick="deleteSelectedFeatureTypes();">Delete Selected</div>
				<div dojoType="dijit.MenuItem" iconClass="menu-icon-delete" onclick="deleteAllFeatureTypes();">Delete All</div>
			</div>
		</div>
	</div> <!-- end first button grouping div -->
</div>