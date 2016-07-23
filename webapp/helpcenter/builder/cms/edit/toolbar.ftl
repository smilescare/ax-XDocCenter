<style>
	.btn-preview {
	    background-color: #0D47A1;
	    color: #fff;
	    font-size: 9px;
	    line-height: 21px;
	    padding: 7px;
	    text-transform: uppercase;
	}
	.btn-preview:hover {
	    font-weight:bold;
	    color:#fff;
	}
	.btn-preview i.material-icons{
		font-size:18px;
	}
</style>
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

<div dojoType="dojoc.Buttonbar">
	<#-- preview button -->
	//open the link in new window
	<#if alternateUrl?exists>
		<a class="btn-preview" href="/hc/${alternateUrl?default('#')}" target="_blank">
			<i class="material-icons md-18">remove_red_eye</i>&nbsp;Preview
		</a>
	</#if>
	<div dojoType="dojoc.ButtonGrouping" style="position:absolute;right:10px;">
		<#if contentId?exists>
			<div dojoType="dojoc.DropDownButton" iconClass="menu-icon-create" label="New" 
				optionsTitle="delete" showLabel="true" > 
				<span></span>
				<div dojoType="dijit.Menu">
					<div dojoType="dijit.MenuItem" iconClass="menu-icon-create" label="New Long Text" showLabel="true">
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
		<div dojoType="dojoc.Button" iconClass="menu-icon-save" showLabel="true" 
			id="btnSaveCmsContentTlbr" label="Save">
			<script type="dojo/method" event="onClick" args="item">
				//get the value from code mirror and set it
				document.getElementById("cmsdata").value = CKEDITOR.instances.ckContentEditorPane.getData();
				//var externalLoginKey = dijit.byId("hidExternalLoginKey").get("value")
				//prepare restful url
				var targetUrl = "/prodaid/control/${formAction}";
				
				Prodaid.doBind(
					{}, 
					targetUrl, 
					function(response) {
						//refresh the pane to reflect new changes
						dijit.byId("cp-content-details").refresh();
					}, 
					dojo.byId("cmsform"), 
					function() {
						Scadmin.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
					},
					true
				);
			</script>
		</div>
	</div> <!-- end first button grouping div -->
</div>