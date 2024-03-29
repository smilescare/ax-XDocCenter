<#assign isPublic = false />
<#if ((dataResource?has_content) && (dataResource.isPublic?has_content))>
	<#if (dataResource.isPublic == "Y")>
		<#assign isPublic = true />
	</#if>
</#if>
<#-- dataResourceTypeId -->
<#if (!dataResourceTypeId?has_content)>
    <#if (dataResource?has_content)>
        <#assign dataResourceTypeId = dataResource.dataResourceTypeId/>
    <#elseif (content?has_content)>
        <#assign dataResourceTypeId = "NONE"/>
    <#else>
        <form name="cmsdatatype">
            <table>
                <tr>
                    <td class="label">${uiLabelMap.ContentDataType}</td>
                    <td>
                        <select name="dataResourceTypeId">
                            <option value="NONE">${uiLabelMap.ContentResourceNone}</option>
                            <option value="SHORT_TEXT">${uiLabelMap.ContentResourceShortText}</option>
                            <option value="ELECTRONIC_TEXT">${uiLabelMap.ContentResourceLongText}</option>
                            <option value="URL_RESOURCE">${uiLabelMap.ContentResourceUrlResource}</option>
                            <option value="IMAGE_OBJECT">${uiLabelMap.ContentImage}</option>
                            <option value="VIDEO_OBJECT">${uiLabelMap.ContentResourceVideo}</option>
                            <option value="AUDIO_OBJECT">${uiLabelMap.ContentResourceAudio}</option>
                            <option value="OTHER_OBJECT">${uiLabelMap.ContentResourceOther}</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <a href="javascript:void(0);" onclick="javascript:selectDataType('${contentIdFrom?default(contentRoot)}');" class="buttontext">${uiLabelMap.CommonContinue}</a>
                    </td>
                </tr>
                <#list 0..15 as x>
                    <tr><td colspan="2">&nbsp;</td></tr>
                </#list>
            </table>
        </form>
    </#if>
</#if>

<#-- form action -->
<#if (dataResourceTypeId?has_content)>
    <#assign actionSuffix = "ContentCms"/>
    <#if (dataResourceTypeId == "NONE" || (content?has_content && !content.dataResourceId?has_content))>
        <#assign actionMiddle = ""/>
    <#else>
        <#if (dataResourceTypeId?ends_with("_OBJECT"))>
            <#assign actionMiddle = "Object"/>
        <#else>
            <#assign actionMiddle = "Text"/>
        </#if>
    </#if>

    <#if (!contentRoot?has_content)>
        <#assign contentRoot = parameters.contentRoot/>
    </#if>
    <#if (currentPurposes?has_content)>
        <#assign currentPurpose = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(currentPurposes) />
    </#if>
    <#if (content?has_content)>
        <#assign actionPrefix = "/update"/>
    <#else>
        <#assign actionPrefix = "/create"/>
    </#if>
    <#assign formAction = actionPrefix + actionMiddle + actionSuffix/>
<#else>
    <#assign formAction = "javascript:void(0);"/>
</#if>

<#include "component://ax-XDocCenter/webapp/ax-XDocCenter/pages/widgets.ftl" />
<#if content??>
	<#if content.createdByUserLogin??>
		<#assign authorUserLogin = delegator.findOne("UserLogin", Static["org.ofbiz.base.util.UtilMisc"].toMap("userLoginId", content.createdByUserLogin), false) >
		<#assign authorName = Static["org.ofbiz.party.party.PartyHelper"].getPartyName(delegator, authorUserLogin.partyId, true) >
		<#assign lastModifiedUserLogin = delegator.findOne("UserLogin", Static["org.ofbiz.base.util.UtilMisc"].toMap("userLoginId", content.lastModifiedByUserLogin), false) >
		<#if lastModifiedUserLogin?? && lastModifiedUserLogin.partyId??>
			<#assign lastModifierName = Static["org.ofbiz.party.party.PartyHelper"].getPartyName(delegator, lastModifiedUserLogin.partyId, true) >
		</#if>
	</#if>
</#if>

<div>
	<div class="text-right ax-btnGroup ax-btnGroupLight" style="position:relative;">
		<div class="site-node text-left" style="position:absolute;left:0;top:0;">
			<div class="site-icon" style="float: left;">
				<#-- visibility toggle button -->
				<#if isPublic>
					<div data-dojo-type="dijit/form/Button" showLabel="true" class="ax-btnLight" title="Public artifact (anybody with the link can access). Click to make private"
						 id="btnVisibilityCmsContentTlbr" label="<i class='material-icons color-green'>lock_open</i>">
						<script type="dojo/method" event="onClick" args="item">
							document.getElementById("hidIsPublic").value = "N";
							var targetUrl = "<@ofbizUrl>${formAction}</@ofbizUrl>";

							App.doBind(
								{},
								targetUrl,
								function(response) {
									//refresh the pane to reflect new changes
									require(["dijit/registry", "dojo/domReady!"], function(registry){
										registry.byId("cpContentTree").refresh();
									});
								},
								dojo.byId("cmsform"),
								function() {
									App.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
								}
							);
						</script>
					</div>
				<#else>
					<div data-dojo-type="dijit/form/Button" showLabel="true" class="ax-btnLight" title="Private artifact (requires a valid login to access). Click to make public."
						 id="btnVisibilityCmsContentTlbr" label="<i class='material-icons color-neutralTertiary'>lock</i>">
						<script type="dojo/method" event="onClick" args="item">
							document.getElementById("hidIsPublic").value = "Y";
							var targetUrl = "<@ofbizUrl>${formAction}</@ofbizUrl>";

							App.doBind(
								{},
								targetUrl,
								function(response) {
									//refresh the pane to reflect new changes
									require(["dijit/registry", "dojo/domReady!"], function(registry){
										registry.byId("cpContentTree").refresh();
									});
								},
								dojo.byId("cmsform"),
								function() {
									App.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
								}
							);
						</script>
					</div>
				</#if>
			</div>
			<div class="site-info" style="font-size:13px;padding-top: 10px;">
				<#--# ${contentId?if_exists}-->
				${alternateUrl?default('Alternate URL not configured')}
				<#if authorName??>
					<div class="site-sub-title">
						<i class="material-icons md-middle" style="font-size:16px;">account_circle</i>&nbsp;Created by <strong>${authorName?default('Not Available')}</strong>
						&nbsp;|&nbsp;
						<i class="material-icons md-middle" style="font-size:16px;">restore</i>&nbsp;last modified by <strong>${lastModifierName?default('* Name Not Available *')}</strong> <@formatPrettyDate content.lastModifiedDate />
					</div>
				</#if>
			</div>
		</div>
		<#-- preview link -->
		<#if alternateUrl?exists>
			<a class="dijit dijitReset dijitInline ax-btnLight dijitButton" href="/xdoc/${alternateUrl?default('#')}" target="_blank">
				<span class="dijitReset dijitInline dijitButtonNode">
					<span class="dijitReset dijitStretch dijitButtonContents">
						<span class="dijitReset dijitInline dijitButtonText" >
							<i class="material-icons">visibility</i>&nbsp;Preview
						</span>
					</span>
				</span>
			</a>
		</#if>
		<#if contentId?exists>
			<div data-dojo-type="dijit/form/DropDownButton"
				label="<i class='material-icons'>note_add</i>&nbsp;New" 
				optionsTitle="delete" showLabel="true" class="ax-btnLight"> 
				<span></span>
				<div data-dojo-type="dijit/Menu">
					<div data-dojo-type="dijit/MenuItem" 
						label="<div class='site-node'><div class='site-icon'><i class='material-icons '>language</i></div><div class='site-info'>New Article<div class='site-sub-title'>Create a new article under the selected node.</div></div></div>" showLabel="true">
						<script type="dojo/method" event="onClick" args="item">
							var treeNode = dijit.byId("webSiteContentTree").selectedNode;
							var item = treeNode.item;
							var contentDetailPane = dijit.byId("cpManageContentDetails");
	
							var contentIdFrom = "${contentId}";
							var contentRootId = "${contentIdFrom}";
							
							contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=SUB_CONTENT" 
														+ "&dataResourceTypeId=ELECTRONIC_TEXT" 
														+ "&contentIdFrom=" + contentIdFrom 
														+ "&contentRoot=" + contentRootId  
														+ "&webSiteId=${webSiteId?if_exists}";
							contentDetailPane.refresh();
						</script>
					</div>
					<div data-dojo-type="dijit/MenuItem" 
						label="<div class='site-node'><div class='site-icon'><i class='material-icons'>bookmark</i></div><div class='site-info'>New Topic<div class='site-sub-title'>Create a new topic. Use topics to categorize articles.</div></div></div>" showLabel="true">
						<script type="dojo/method" event="onClick" args="item">
							var treeNode = dijit.byId("webSiteContentTree").selectedNode;
							var item = treeNode.item;
							var contentDetailPane = dijit.byId("cpManageContentDetails");
	
							var contentIdFrom = "${contentId}";
							var contentRootId = "${contentIdFrom}";
							
							contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=SUB_CONTENT" 
														+ "&dataResourceTypeId=ELECTRONIC_TEXT" 
														+ "&contentIdFrom=" + contentIdFrom 
														+ "&contentRoot=" + contentRootId  
														+ "&webSiteId=${webSiteId?if_exists}";
							contentDetailPane.refresh();
						</script>
					</div>
				</div>
			</div>
		</#if>
		
		<#-- save button -->
		<div data-dojo-type="dijit/form/Button" showLabel="true" class="ax-btnLight"	
			id="btnSaveCmsContentTlbr" label="<i class='material-icons'>save</i>&nbsp;Save">
			<script type="dojo/method" event="onClick" args="item">
				//get the value from code mirror and set it
				document.getElementById("cmsdata").value = CKEDITOR.instances.ckContentEditorPane.getData();
				//var externalLoginKey = dijit.byId("hidExternalLoginKey").get("value")
				//prepare restful url
				var targetUrl = "<@ofbizUrl>${formAction}</@ofbizUrl>";
				
				App.doBind(
					{}, 
					targetUrl, 
					function(response) {
						//refresh the pane to reflect new changes
						require(["dijit/registry", "dojo/domReady!"], function(registry){
						    registry.byId("cpContentTree").refresh();
						});
					}, 
					dojo.byId("cmsform"), 
					function() {
						App.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
					}
				);
			</script>
		</div>
		
		<#-- additional options -->
		<div data-dojo-type="dijit/form/DropDownButton" 
			label="<i class='material-icons'>more_horiz</i>" 
			optionsTitle="delete" showLabel="true" class="ax-btnLight ax-dropDownBtnNoArrow"> 
			<span></span>
			<div data-dojo-type="dijit/Menu">
				<div data-dojo-type="dijit/MenuItem" 
					label="<div class='site-node'><div class='site-icon'><i class='material-icons'>content_copy</i></div><div class='site-info'>Duplicate<div class='site-sub-title'>Creates a copy of the artifact at the same node.</div></div></div>" showLabel="true">
					<script type="dojo/method" event="onClick" args="item">
						duplicateContentDialog.show();
					</script>
				</div>
				<div data-dojo-type="dijit/MenuItem" 
					label="<div class='site-node'><div class='site-icon'><i class='material-icons'>restore</i></div><div class='site-info'>History<div class='site-sub-title'>Displays modification history of the article.</div></div></div>" showLabel="true">
					<script type="dojo/method" event="onClick" args="item">
						//TODO
					</script>
				</div>
				<div data-dojo-type="dijit/MenuItem" 
					label="<div class='site-node'><div class='site-icon'><i class='material-icons'>question_answer</i></div><div class='site-info'>Notes<div class='site-sub-title'>Displays user notes for the article.</div></div></div>" showLabel="true">
					<script type="dojo/method" event="onClick" args="item">
						//TODO
					</script>
				</div>
				<div data-dojo-type="dijit/MenuItem" 
					label="<div class='site-node'><div class='site-icon'><i class='material-icons'>supervisor_account</i></div><div class='site-info'>Collaborators<div class='site-sub-title'>Displays list of users who can manage this article.</div></div></div>" showLabel="true">
					<script type="dojo/method" event="onClick" args="item">
						//TODO
					</script>
				</div>
				<div data-dojo-type="dijit/MenuItem" 
					label="<div class='site-node'><div class='site-icon'><i class='material-icons'>thumbs_up_down</i></div><div class='site-info'>Feedback<div class='site-sub-title'>Displays list of feedbacks received for this article.</div></div></div>" showLabel="true">
					<script type="dojo/method" event="onClick" args="item">
						//TODO
					</script>
				</div>
				<div data-dojo-type="dijit/MenuSeparator"></div>
				<div data-dojo-type="dijit/MenuItem" 
					label="<div class='site-node'><div class='site-icon'><i class='material-icons'>code</i></div><div class='site-info'>Source Code<div class='site-sub-title'>Displays list of users who can manage this article.</div></div></div>" showLabel="true">
					<script type="dojo/method" event="onClick" args="item">
						//TODO
					</script>
				</div>
			</div>
		</div>
	</div>
</div>
