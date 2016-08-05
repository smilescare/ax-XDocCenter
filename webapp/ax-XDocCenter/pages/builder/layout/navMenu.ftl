<div class="text-right ax-btnGroup ax-btnGroupLight">
	<#-- help and support -->
	<div data-dojo-type="dijit/form/DropDownButton" 
		label="<i class='material-icons'>help</i>" 
		optionsTitle="delete" showLabel="true" class="ax-btnLight"> 
		<span></span>
		<div data-dojo-type="dijit/Menu">
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>settings</i></div><div class='site-info'>Documentation<div class='site-sub-title'>Help documentation and related artifacts.</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					//TODO
				</script>
			</div>
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>content_copy</i></div><div class='site-info'>Request Support<div class='site-sub-title'>Creates a ticket to receive support.</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					//TODO
				</script>
			</div>
		</div>
	</div>
	<#-- user menu -->
	<div data-dojo-type="dijit/form/DropDownButton" 
		label="<i class='material-icons'>account_circle</i>Welcome User" 
		optionsTitle="delete" showLabel="true" class="ax-btnLight"> 
		<span></span>
		<div data-dojo-type="dijit/Menu">
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>settings</i></div><div class='site-info'>Settings<div class='site-sub-title'>Manage your profile settings</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					//TODO
				</script>
			</div>
			<div data-dojo-type="dijit/MenuSeparator"></div>
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>exit_to_app</i></div><div class='site-info'>Logout<div class='site-sub-title'>End your session and log out of the application</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					//TODO
				</script>
			</div>
		</div>
	</div>
</div>