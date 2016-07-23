<div dojoType="dojoc.Buttonbar">
	<form id="frmAddPathAlias">
		<input dojoType="dijit.form.TextBox" type="hidden" tabindex="-1" name="webSiteId" value="${webSiteId}" />
		<input dojoType="dijit.form.TextBox" type="hidden" tabindex="-1" name="contentId" value="${contentId}" />

		<input name="pathAlias" id="pathAlias"	dojoType="dijit.form.TextBox" placeHolder="Path Alias" 
			value="" disabled="false" required="true"/>
		<input name="aliasTo" dojoType="dijit.form.TextBox" placeHolder="Alias To" id="aliasTo"
			value="" disabled="false" required="false" />
		<input name="mapKey" dojoType="dijit.form.TextBox" placeHolder="Map Key" id="mapKey"
			value="" disabled="false" required="false" />
		<button type="button" dojoType="dojoc.Button" id="btnAddFeatureTypeToCategory" iconClass="menu-icon-add" showLabel="true" 
			title="Associate Feature Type">Add
			 <script type="dojo/method" event="onClick" args="e">
				var externalLoginKey = dijit.byId("hidExternalLoginKey").get("value");
				//prepare restful url
				var targetUrl = "/content/control/createWebSitePathAliasJson?externalLoginKey=" + externalLoginKey;
				
				Scadmin.doBind(
					{}, 
					targetUrl, 
					function(response) {
						//refresh the pane to reflect new changes
						dijit.byId("cp-content-pathalias").refresh();
					}, 
					dojo.byId("frmAddPathAlias"), 
					function() {
						Scadmin.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
					},
					true
				);
		        return false;
		    </script>
		</button>
	</form>
</div>