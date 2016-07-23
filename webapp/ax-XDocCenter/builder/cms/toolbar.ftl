<div dojoType="dojoc.Buttonbar" id="browse-menu">
	<div dojoType="dojoc.ButtonGrouping">
		<div dojoType="dojoc.Button" iconClass="menu-icon-link" 
			label="New Website" optionsTitle="Create a new website" showLabel="true">
			<script type="dojo/method" event="onClick" args="item">
				Scadmin.openModal({
					method : 'POST',
					url: "/scadmin/rest/views/get",
					content : {viewToRender : '/content/cms/website/website'},
					altId: 'modalAddOrderItem',
					title : "Add New Website",
					showButtons : true,
					onCancel: Default.closeModalWithId('modalAddOrderItem'),
					showRequiredIndicator : true
				});
			</script>
		</div>
		<div dojoType="dojoc.Button" iconClass="menu-icon-asterisk" 
			label="File manager" optionsTitle="Manage Content Files" showLabel="true">
			<script type="dojo/method" event="onClick" args="item">
				Prodaid.openModal({
					method : 'POST',
					url: "<@ofbizUrl>contentFileManager</@ofbizUrl>",
					content : {},
					title : "Manage Files",
					showButtons : false,
					showRequiredIndicator : false
				});
			</script>
		</div>
	</div>
</div>
