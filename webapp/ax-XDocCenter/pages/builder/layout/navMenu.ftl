<div class="text-right ax-btnGroup ax-btnGroupLight">
	<#-- Manage Media Menu -->
	<div data-dojo-type="dijit/form/Button"
		label="<i class='material-icons'>collections</i>&nbsp;Manage Media" class="ax-btnLight">
		<script type="dojo/method" event="onClick" args="item">
			App.openModal({
				content : {},
				title: '<i class=\'material-icons\' style=\'font-size:36px;vertical-align:middle;\'>perm_media</i>&nbsp;&nbsp;Media Manager',
				url: '<@ofbizUrl>fileManager</@ofbizUrl>'
			});
		</script>
	</div>
	<#-- new Site menu -->
	<div data-dojo-type="dijit/form/DropDownButton" 
		label="<i class='material-icons'>language</i> Manage Sites" 
		optionsTitle="delete" showLabel="true" class="ax-btnLight"> 
		<span></span>
		<div data-dojo-type="dijit/Menu">
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>add_circle</i></div><div class='site-info'>New Site<div class='site-sub-title'>Create a new web site.</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					App.openModal({
						content : {},
						title: '<i class=\'material-icons ms-u-slideRightIn40\' style=\'font-size:36px;vertical-align:middle;\'>language</i>&nbsp;&nbsp;New Web Site',
						url: '<@ofbizUrl>newWebSite</@ofbizUrl>',
						modalType: 'XMegaDialog'
					});
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
					profileSettingsDialog.show();
				</script>
			</div>
			<div data-dojo-type="dijit/MenuSeparator"></div>
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>exit_to_app</i></div><div class='site-info'>Logout<div class='site-sub-title'>End your session and log out of the application</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					App.openAppLink("<@ofbizUrl>logout</@ofbizUrl>");
				</script>
			</div>
		</div>
	</div>
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
</div>

<div data-dojo-type="dojoc/XMegaDialog" data-dojo-id="profileSettingsDialog" title="<i class='material-icons color-themePrimary ms-u-slideRightIn40' style='font-size:36px;vertical-align:middle;'>settings</i>&nbsp;&nbsp;Settings" >
    <div style="width: 100%; height: 300px" class="ax-lineTabs">
	    <div data-dojo-type="dijit/layout/TabContainer" style="width: 100%; height: 100%;">
	        <div data-dojo-type="dijit/layout/ContentPane" title="Personal Information" data-dojo-props="selected:true">
	            <form name="cmsform" enctype="multipart/form-data" method="post" action="" style="margin: 0;" class="ax-form-sm ms-u-slideRightIn40">
					<div class="form-group form-group-sm">
				    	<label for="exampleInputEmail1">First Name</label>
				    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="contentName" value="" />
					</div>
					<div class="form-group form-group-sm">
				    	<label for="exampleInputEmail1">Last Name</label>
				    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="contentName" value="" />
					</div>
				</form>
	        </div>
	        <div data-dojo-type="dijit/layout/ContentPane" title="Preferences">
	            Lorem ipsum and all around - second...
	        </div>
	    </div>
	</div>
</div>

<div data-dojo-type="dijit/Dialog" class="xDialog" data-dojo-id="duplicateContentDialog" title="<i class='material-icons' style='font-size:36px;vertical-align:middle;'>content_copy</i>&nbsp;&nbsp;Duplicate Page" >
    <div style="width: 650px; height: 300px" class="ax-lineTabs padding-10">
	    <div data-dojo-type="dijit/layout/TabContainer" style="width: 100%; height: 100%;">
	        <div data-dojo-type="dijit/layout/ContentPane" title="Personal Information" data-dojo-props="selected:true">
	            <form name="cmsform" enctype="multipart/form-data" method="post" action="" style="margin: 0;" class="ax-form-sm ms-u-slideRightIn40">
					<div class="form-group form-group-sm">
				    	<label for="exampleInputEmail1">First Name</label>
				    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="contentName" value="" />
					</div>
					<div class="form-group form-group-sm">
				    	<label for="exampleInputEmail1">Last Name</label>
				    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="contentName" value="" />
					</div>
				</form>
	        </div>
	        <div data-dojo-type="dijit/layout/ContentPane" title="Preferences">
	            Lorem ipsum and all around - second...
	        </div>
	    </div>
	</div>
    <div class="dijitDialogPaneActionBar padding-10">
        <button data-dojo-type="dijit/form/Button" type="submit"  class="ax-btnLight">Cancel</button>
        <button data-dojo-type="dijit/form/Button" type="button" data-dojo-props="onClick:function(){myDialog.hide();}"
                >Create</button>
    </div>
</div>
