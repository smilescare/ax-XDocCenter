<div style="width:100%;">
	<div style="width:45%;display:inline-block;text-align:center;">
		<p class="ms-font-su ms-fontColor-themePrimary">Great Choice!!!</p>
		<img class="ms-u-slideRightIn40" src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/LadySittingAtDesk.png</@ofbizContentUrl>" style="width:450px;" />
		<p class="ms-font-l">Let's get started by building the awesome site you've always been looking for.</p>
	</div>
	<div style="width:45%;display:inline-block;">
		<form id="frmCreateNewWebSiteInModal" name="cmsform" method="post" style="margin: 0;" class="ax-form-sm ms-u-slideRightIn40">
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">Name</label>
		    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="siteName" placeHolder="Enter a name for your Web Site." />
			</div>
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">Description</label>
		    	<textarea style="width:100%;" data-dojo-type="dijit/form/SimpleTextarea" name="siteDescription" placeHolder="Enter a small description about your Web Site."></textarea>
			</div>
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">Include</label>
		    	<div>
			    	<input id="cbIncludeSiteBlog" data-dojo-type="dijit/form/CheckBox" name="includeBlog" value="Y" checked />
			    	<label for="cbIncludeSiteBlog">Blog</label>
			    	<input id="cbIncludeSiteForum" data-dojo-type="dijit/form/CheckBox" name="includeForum" value="Y" checked />
			    	<label for="cbIncludeSiteForum">Forum</label>
		    	</div>
			</div>
			<#-- advanced settings -->
			<div data-dojo-type="dijit/TitlePane" data-dojo-props="title: 'Advanced',open:false">
			<table style="width:100%;">
				<tr>
					<td>
						<div class="form-group form-group-sm">
					    	<label for="exampleInputEmail1">Http Host</label>
					    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="httpHost" value="" />
						</div>
					</td>
					<td>
						<div class="form-group form-group-sm">
					    	<label for="exampleInputEmail1">Http Port</label>
					    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="httpPort" value="" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group form-group-sm">
					    	<label for="exampleInputEmail1">Https Host</label>
					    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="httpsHost" value="" />
						</div>
					</td>
					<td>
						<div class="form-group form-group-sm">
					    	<label for="exampleInputEmail1">Https Port</label>
					    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="httpsPort" value="" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group form-group-sm">
					    	<label for="exampleInputEmail1">Standard Content Prefix</label>
					    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="standardContentPrefix" value="" />
						</div>
					</td>
					<td>
						<div class="form-group form-group-sm">
					    	<label for="exampleInputEmail1">Secure Content Prefix</label>
					    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="secureContentPrefix" value="" />
						</div>
					</td>
				</tr>
			</table>
			</div>
		</form>
		<hr class="dashed-separator"/>
	    <button data-dojo-type="dijit/form/Button" type="button" style="margin:0;">Create Site
	    	<script type="dojo/method" event="onClick" args="item">
				App.doBind(
					{},
					'<@ofbizUrl>createWebSite</@ofbizUrl>',
					function(response){
						//make sure there are no errors
						if(!App.isErrorReported(response)){
							App.closeModal();
							//publish new site added topic
						}
					},
					document.getElementById('frmCreateNewWebSiteInModal'),
					function(response){
						App.displayMessage({message:'An Error occurred, please contact support.', type:'error', duration:"5000"});
					}
				);
			</script>
	    </button>
		<button data-dojo-type="dijit/form/Button" type="submit"  class="ax-btnLink">Cancel</button>
	</div>
</div>
