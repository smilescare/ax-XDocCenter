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

<#-- main content form -->
<#if (dataResourceTypeId?has_content)>
    <form id="cmsform" name="cmsform" enctype="multipart/form-data" method="post" action="<@ofbizUrl>${formAction}</@ofbizUrl>" style="margin: 0;">
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

        <table>
          <#if (content?has_content)>
            <tr>
                <td class="label">${uiLabelMap.FormFieldTitle_contentId}</td>
                <td>${content.contentId}</td>
            </tr>
          </#if>
          <tr>
            <td class="label">${uiLabelMap.CommonName}</td>
            <td>
                <input dojoType="dijit.form.TextBox" type="text" name="contentName" value="${(content.contentName)?if_exists}" size="40"/>
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.CommonDescription}</td>
            <td>
                <textarea name="description" dojoType="dijit.form.SimpleTextarea" cols="40" rows="6">${(content.description)?if_exists}</textarea>
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.ContentMapKey}</td>
            <td>
                <input dojoType="dijit.form.TextBox" type="text" name="mapKey" value="${(assoc.mapKey)?if_exists}" size="40"/>
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.CommonPurpose}</td>
            <td>
                <select dojoType="dijit.form.FilteringSelect" name="contentPurposeTypeId">
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
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.CommonSequenceNum}</td>
            <td>
              <input dojoType="dijit.form.TextBox" type="text" name="sequenceNum" value="${(currentPurpose.sequenceNum)?if_exists}" size="5" />
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.ContentDataType}</td>
            <td>
                <select dojoType="dijit.form.FilteringSelect" name="dataTemplateTypeId">
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
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.ContentDecorator}</td>
            <td>
                <select dojoType="dijit.form.FilteringSelect" name="decoratorContentId">
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
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.ContentTemplate}</td>
            <td>
                <select dojoType="dijit.form.FilteringSelect" name="templateDataResourceId">
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
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.CommonStatus}</td>
            <td>
                <select dojoType="dijit.form.FilteringSelect" name="statusId">
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
            </td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.FormFieldTitle_isPublic}</td>
            <td>
                <select dojoType="dijit.form.FilteringSelect" name="isPublic" style="width:50px;">
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
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <textarea id="cmsdata" name="textData" cols="40" rows="6" style="display: none;">
                <#if (dataText?has_content)>
                    ${StringUtil.wrapString(dataText.textData!)}
                </#if>
              </textarea>
            </td>
          </tr>

          <tr>
            <td align="left" colspan="2">
                <div dojoType="dojoc.Button" iconClass="menu-icon-save" showLabel="true" 
					id="btnSaveCmsContent" label="Save">
					<script type="dojo/method" event="onClick" args="item">
						//get the value from code mirror and set it
						dojo.byId("cmsdata").value = dijit.byId("cmsContentSource").getValue();
						var externalLoginKey = dijit.byId("hidExternalLoginKey").get("value")
						//prepare restful url
						var targetUrl = "/content/control/${formAction}?externalLoginKey=" + externalLoginKey;
						
						Scadmin.doBind(
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
            </td>
          </tr>
        </table>
    </form>
</#if>