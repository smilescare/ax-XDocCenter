<style>
	.form-group-sm{
		margin-bottom:5px;
	}
</style>
<#-- content info -->
<#if (!content?has_content)>
    <div style="margin-bottom: 8px;">
        ${uiLabelMap.CommonNew} <span class="label">${contentAssocTypeId?default("SUBSITE")}</span> ${uiLabelMap.ContentWebSiteAttachedToContent} ${contentIdFrom?default(contentRoot)}
    </div>
</#if>
<#-- dataResourceTypeId -->
<#if (!dataResourceTypeId?has_content)>
    <#if (dataResource?has_content)>
        <#assign dataResourceTypeId = dataResource.dataResourceTypeId/>
    <#elseif (content?has_content)>
        <#assign dataResourceTypeId = "NONE"/>
    <#else>
        <form name="cmsdatatype">
        	<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">Email address</label>
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
		  	</div>
            <table>
                <tr>
                    <td class="label">${uiLabelMap.ContentDataType}</td>
                    <td>
                        
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

<#-- main content form -->
<#if (dataResourceTypeId?has_content)>
    <form id="cmsform" name="cmsform" enctype="multipart/form-data" method="post" action="<@ofbizUrl>${formAction}</@ofbizUrl>" 
    	style="margin: 0;" class="ax-form-sm">
        <#if (content?has_content)>
            <input type="hidden" name="dataResourceId" value="${(dataResource.dataResourceId)?if_exists}"/>
            <input type="hidden" name="contentId" value="${content.contentId}"/>

            <#list requestParameters.keySet() as paramName>
                <#if (paramName == 'contentIdFrom' || paramName == 'contentAssocTypeId' || paramName == 'fromDate')>
                    <input type="hidden" name="${paramName}" value="${requestParameters.get(paramName)}"/>
                </#if>
            </#list>
        <#else>
            <input type="hidden" name="contentAssocTypeId" value="${contentAssocTypeId?default('SUBSITE')}"/>
            <input type="hidden" name="ownerContentId" value="${contentIdFrom?default(contentRoot)}"/>
            <input type="hidden" name="contentIdFrom" value="${contentIdFrom?default(contentRoot)}"/>
        </#if>
        <#if (dataResourceTypeId != 'IMAGE_OBJECT' && dataResourceTypeId != 'OTHER_OBJECT' && dataResourceTypeId != 'LOCAL_FILE' &&
            dataResourceTypeId != 'OFBIZ_FILE' && dataResourceTypeId != 'VIDEO_OBJECT' && dataResourceTypeId != 'AUDIO_OBJECT')>
            <input type="hidden" name="mimeTypeId" value="${mimeTypeId}"/>
        </#if>
        <#if (dataResourceTypeId != 'NONE')>
        <#if (dataResourceTypeId == 'IMAGE_OBJECT' || dataResourceTypeId == 'OTHER_OBJECT' || dataResourceTypeId == 'LOCAL_FILE' ||
                dataResourceTypeId == 'OFBIZ_FILE' || dataResourceTypeId == 'VIDEO_OBJECT' || dataResourceTypeId == 'AUDIO_OBJECT')>
            <input type="hidden" name="dataResourceTypeId" value="IMAGE_OBJECT"/>
        <#else>
            <input type="hidden" name="dataResourceTypeId" value="${dataResourceTypeId}"/>
        </#if>
        </#if>
        <input type="hidden" name="webSiteId" value="${webSiteId}"/>
        <input type="hidden" name="dataResourceName" value="${(dataResource.dataResourceName)?if_exists}"/>
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">${uiLabelMap.CommonName}</label>
		    	<input style="width:100%;" data-dojo-type="dijit/form/TextBox" type="text" name="contentName" value="${(content.contentName)?if_exists}" />
			</div>
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">${uiLabelMap.CommonDescription}</label>
		    	<textarea style="width:100%;" name="description" data-dojo-type="dijit/form/SimpleTextarea" >${(content.description)?if_exists}</textarea>
			</div>
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">${uiLabelMap.ContentDecorator}</label>
		    	<div>
	                <select data-dojo-type="dijit/form/FilteringSelect" name="decoratorContentId" style="width:100%;" >
	                    <#if (content?has_content)>
	                        <#if (content.decoratorContentId?has_content)>
	                            <#assign thisDec = content.getRelatedOne("DecoratorContent")/>
	                            <option value="${thisDec.contentId}">${thisDec.contentName}</option>
	                            <option value="${thisDec.contentId}">----</option>
	                        </#if>
	                    </#if>
	                    <option value="">${uiLabelMap.ContentResourceNone}</option>
	                    <#list decorators as decorator>
	                        <option value="${decorator.contentId}">${decorator.contentName}</option>
	                    </#list>
	                </select>
		    	</div>
			</div>
			<#-- advanced settings -->
			<div data-dojo-type="dijit/TitlePane" data-dojo-props="title: 'Advanced',open:false">
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.CommonSequenceNum}</label>
			    	<div>
		                <input data-dojo-type="dijit/form/TextBox" style="width:100%;" type="text" name="sequenceNum" value="${(currentPurpose.sequenceNum)?if_exists}" size="5" />
			    	</div>
				</div>
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.ContentTemplate}</label>
			    	<div>
		                <select data-dojo-type="dijit/form/FilteringSelect" name="templateDataResourceId" style="width:100%;" >
		                    <#if (content?has_content)>
		                        <#if (content.templateDataResourceId?has_content && content.templateDataResourceId != "NONE")>
		                            <#assign template = content.getRelatedOne("TemplateDataResource")/>
		                            <option value="${template.dataResourceId}">${template.dataResourceName?if_exists}</option>
		                            <option value="${template.dataResourceId}">----</option>
		                        </#if>
		                    </#if>
		                    <option value="">${uiLabelMap.ContentResourceNone}</option>
		                    <#list templates as template>
		                        <option value="${template.dataResourceId}">${template.dataResourceName}</option>
		                    </#list>
		                </select>
			    	</div>
				</div>
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.ContentDataType}</label>
			    	<div>
		                <select data-dojo-type="dijit/form/FilteringSelect" name="dataTemplateTypeId" style="width:100%;" >
		                    <#if (dataResource?has_content)>
		                        <#if (dataResource.dataTemplateTypeId?has_content)>
		                            <#assign thisType = dataResource.getRelatedOne("DataTemplateType")?if_exists/>
		                            <option value="${thisType.dataTemplateTypeId}">${thisType.description}</option>
		                            <option value="${thisType.dataTemplateTypeId}">----</option>
		                        </#if>
		                    </#if>
		                    <#list templateTypes as type>
		                        <option value="${type.dataTemplateTypeId}">${type.description}</option>
		                    </#list>
		                </select>
			    	</div>
				</div>
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.ContentMapKey}</label>
			    	<div>
				    	<input data-dojo-type="dijit/form/TextBox" style="width:100%;" type="text" name="mapKey" value="${(assoc.mapKey)?if_exists}" size="40"/>
			    	</div>
				</div>
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.CommonPurpose}</label>
			    	<div>
		                <select data-dojo-type="dijit/form/FilteringSelect" name="contentPurposeTypeId" style="width:100%;" >
		                    <#if (currentPurpose?has_content)>
		                        <#assign purpose = currentPurpose.getRelatedOne("ContentPurposeType")/>
		                        <option value="${purpose.contentPurposeTypeId}">${purpose.description?default(purpose.contentPurposeTypeId)}</option>
		                        <option value="${purpose.contentPurposeTypeId}">----</option>
		                    <#else>
		                        <option value="SECTION">Section</option>
		                        <option value="SECTION">----</option>
		                    </#if>
		                    <#list purposeTypes as type>
		                        <option value="${type.contentPurposeTypeId}">${type.description}</option>
		                    </#list>
		                </select>
			    	</div>
				</div>
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.CommonStatus}</label>
			    	<div>
		                <select data-dojo-type="dijit/form/FilteringSelect" name="statusId" style="width:100%;" >
		                    <#if (content?has_content)>
		                        <#if (content.statusId?has_content)>
		                            <#assign statusItem = content.getRelatedOne("StatusItem")/>
		                            <option value="${statusItem.statusId}">${statusItem.description}</option>
		                            <option value="${statusItem.statusId}">----</option>
		                        </#if>
		                    </#if>
		                    <#list statuses as status>
		                        <option value="${status.statusId}">${status.description}</option>
		                    </#list>
		                </select>
			    	</div>
				</div>
				<div class="form-group form-group-sm">
			    	<label for="exampleInputEmail1">${uiLabelMap.FormFieldTitle_isPublic}</label>
			    	<div>
		                <select data-dojo-type="dijit/form/FilteringSelect" name="isPublic" style="width:100%;">
		                    <#if (dataResource?has_content)>
		                        <#if (dataResource.isPublic?has_content)>
		                            <option value="${dataResource.isPublic}">${dataResource.isPublic}</option>
		                            <option value="${dataResource.isPublic}">----</option>
		                        <#else>
		                            <option></option>
		                        </#if>
		                    </#if>
		                    <option>Y</option>
		                    <option>N</option>
		                </select>
			    	</div>
				</div>
			</div>
			
			<#if ( (dataResourceTypeId == 'URL_RESOURCE') || (dataResourceTypeId == 'SHORT_TEXT') )>
			<div class="form-group form-group-sm">
		    	<label for="exampleInputEmail1">URL</label>
		    	<a target="_blank" href="/hc${(dataResource.objectInfo)?if_exists}">view link</a>
			</div>
			</#if>

        <table style="width:100%;">
          <tr>
            <td colspan="2">
              <textarea id="cmsdata" name="textData" cols="40" rows="6" style="display: none;">
                <#if (dataText?has_content)>
                    ${StringUtil.wrapString(dataText.textData!)}
                </#if>
              </textarea>
            </td>
          </tr>
        </table>
    </form>
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
    <div data-dojo-type="dijit/form/Button" showLabel="true" class="ax-btnPrimary"	
		label="Save">
		<script type="dojo/method" event="onClick" args="item">
			//get the value from code mirror and set it
			document.getElementById("cmsdata").value = CKEDITOR.instances.ckContentEditorPane.getData();
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