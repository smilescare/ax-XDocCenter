<#if requestAttributes.errorMessageList?has_content><#assign errorMessageList=requestAttributes.errorMessageList></#if>
<#if requestAttributes.eventMessageList?has_content><#assign eventMessageList=requestAttributes.eventMessageList></#if>
<#if requestAttributes.serviceValidationException?exists><#assign serviceValidationException = requestAttributes.serviceValidationException></#if>
<#if requestAttributes.uiLabelMap?has_content><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
<#if !errorMessage?has_content>
  <#assign errorMessage = requestAttributes._ERROR_MESSAGE_?if_exists>
</#if>
<#if !errorMessageList?has_content>
  <#assign errorMessageList = requestAttributes._ERROR_MESSAGE_LIST_?if_exists>
</#if>
<#if !eventMessage?has_content>
  <#assign eventMessage = requestAttributes._EVENT_MESSAGE_?if_exists>
</#if>
<#if !eventMessageList?has_content>
  <#assign eventMessageList = requestAttributes._EVENT_MESSAGE_LIST_?if_exists>
</#if>
<#-- display the error messages -->
<#if (errorMessage?has_content || errorMessageList?has_content)>
{
	message: '<div><ul><#if errorMessage?has_content><li>${errorMessage}</li></#if><#if errorMessageList?has_content><#list errorMessageList as errorMsg><li>${errorMsg}</li></#list></#if><ul></div>',
  	type: 'error',
  	duration: "6000"
}
<#elseif (eventMessage?has_content || eventMessageList?has_content)>
{
	message: '<div><ul><#if eventMessage?has_content><li>${eventMessage}</li></#if><#if eventMessageList?has_content><#list eventMessageList as eventMsg><li>${eventMsg}</li></#list></#if><ul></div>',
  	type: 'success',
  	duration: "4000"
}
<#else>
{
	message: 'Transaction completed successfully.',
  	type: 'success',
  	duration: '1000'
}
</#if>