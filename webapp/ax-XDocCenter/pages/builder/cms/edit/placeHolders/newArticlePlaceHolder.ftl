<div class="row" style="margin:0 auto;text-align:center;padding-top:2%;">
	<div style="width:45%;display:inline-block;">
		<h3>No Article Selected</h3>
		<div id=""sampleCodeMirrorPlaygroup"></div>
		<h5 style="font-weight:300;">Use the navigation tree on the left hand side to display and modify existing articles.</h5>
		<h5 style="font-weight:300;">Use the form on the right to create an article.</h5>
		<#--
		<i class="material-icons empty-doc">description</i>
		<img src="https://d13yacurqjgara.cloudfront.net/users/767861/screenshots/2563648/place_order.jpg" style="width:250px;" />
		<img src="https://d13yacurqjgara.cloudfront.net/users/767861/screenshots/2599644/developer_il.jpg" style="width:250px;" />
		-->
		<img src="<@ofbizContentUrl>/app/xdoc/page-builder/img/DocumentsAndConversations.jpg</@ofbizContentUrl>" style="width:450px;" />
	</div>
	<div class="text-left" style="width:45%;display:inline-block;">
		<div class="get-started-doc">
			<h2><i class="material-icons" style="color:#8bc34a;">check_circle</i>&nbsp;Get Started</h2>
			<h4>Quickly create an article to get started</h4>
			<#if (!content?has_content)>
			    <div style="margin-bottom: 8px;display:none;">
			        New <span class="label">${contentAssocTypeId?default("SUBSITE")}</span> ${uiLabelMap.ContentWebSiteAttachedToContent} ${contentIdFrom?default(contentRoot)}
			    </div>
			</#if>
			<div>
				<form id="newRootCmsForm" name="newRootCmsForm">
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="ownerContentId" value="${contentRoot?if_exists}"/>
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="contentIdFrom" value="${contentRoot?if_exists}"/>
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="contentAssocTypeId" value="SUB_CONTENT"/>
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="mimeTypeId" value="text/html"/>
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="dataResourceTypeId" value="ELECTRONIC_TEXT"/>
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="dataResourceName" value=""/>
					<input data-dojo-type="dijit.form.TextBox" type="hidden" name="websiteId" value="${webSiteId?if_exists}"/>
					<div style="margin-bottom:10px;">
						<input data-dojo-type="dijit.form.TextBox" type="text" name="contentName"  
							placeHolder="Title of article" id="tbNewRootContentName" />
						<input data-dojo-type="dijit.form.TextBox" type="text" name="description"
							placeHolder="Little description" />
					</div>
					<textarea id="cmsdata" name="textData" cols="40" rows="6" style="display: none;">
		              </textarea>
					<textarea id="ckNewRootContentEditorPane" rows="10" style="width:100%;">
						<h1>Getting Started [Edit Me]</h1>
						<hr/>
						<p>Edit this sample text to create a new article of your choice.</p>
					</textarea>
					<script type="text/javascript">
						CKEDITOR.config.height=150;//set height of editor to 450px
					    CKEDITOR.replace('ckNewRootContentEditorPane', {
							// Define the toolbar groups as it is a more accessible solution.
							toolbarGroups: [
								{'name':'basicstyles','groups':['basicstyles']},
								{'name':'links','groups':['links']},
								{'name':'paragraph','groups':['list','blocks']},
								{'name':'styles','groups':['styles']},
								{'name':'document','groups':['mode']}
							],
							// Remove the redundant buttons from toolbar groups defined above.
							removeButtons: 'CreateDiv,Preview,Print,NewPage,Save,Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar'
						} );
					</script>
					<hr class="dashed-separator" />
					<#-- Quick Create button -->
                    <span class="ax-btnPrimary ax-btnPromotional">
                        <div id="btnQuickCreateCmsContent" data-dojo-type="dijit/form/Button" >Create Document&nbsp;&nbsp;<i class="material-icons md-24">chevron_right</i>
							<script type="dojo/method" event="onClick" args="item">
								//make sure a title has been entered.
								var titleValue = dijit.byId("tbNewRootContentName").get("value");
								if(!titleValue){
									Prodaid.displayMessage({message:"Please enter a title to proceed.", type:"error"});
									return false;
								}

								<#-- set data resource name, this is required so a valid data resource is created. -->
								dijit.byId("tbNewRootContentName").set("value", titleValue);

								document.getElementById("cmsdata").value = CKEDITOR.instances.ckNewRootContentEditorPane.getData();
								//get the value from code mirror and set it
								var targetUrl = "<@ofbizUrl>createTextContentCms</@ofbizUrl>";

								App.doBind(
									{},
									targetUrl,
									function(response) {
										//refresh the pane to reflect new changes
										var cpContentTreePane = dijit.byId("cpContentTree");
										cpContentTreePane.refresh();
									},
									dojo.byId("newRootCmsForm"),
									function() {
										App.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
									}
								);
							</script>
						</div>
					</span>
				</form>
			</div>
		</div>
	</div>
</div>