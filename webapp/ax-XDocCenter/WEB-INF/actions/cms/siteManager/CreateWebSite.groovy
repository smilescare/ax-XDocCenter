import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.service.ServiceUtil;
import org.ofbiz.entity.GenericValue;

//create Web Site
String siteName = parameters.siteName;
String siteDescription = parameters.siteDescription;
String httpHost = parameters.httpHost;
String httpPort = parameters.httpPort;
String httpsHost = parameters.httpsHost;
String httpsPort = parameters.httpsPort;
String standardContentPrefix = parameters.standardContentPrefix;
String secureContentPrefix = parameters.secureContentPrefix;

GenericValue sysUserLogin = delegator.findOne("UserLogin", [userLoginId : "system"], true);

Map createXWebSiteCtx = [
	siteName : siteName,
	siteDescription : siteDescription,
	httpHost : httpHost,
	httpPort : httpPort,
	httpsHost : httpsHost,
	httpsPort : httpsPort,
	standardContentPrefix : standardContentPrefix,
	secureContentPrefix : secureContentPrefix,
	userLogin : sysUserLogin
];

Map createXWebSiteResponse = dispatcher.runSync("createXWebSite", createXWebSiteCtx);

if(!ServiceUtil.isSuccess(createXWebSiteResponse)){
	request.setAttribute("_ERROR_MESSAGE_", ServiceUtil.getErrorMessage(createXWebSiteResponse));
	return "error";
}

String webSiteId = createXWebSiteResponse.webSiteId;

String includeBlog = parameters.includeBlog;
String includeForum = parameters.includeForum;

//generate publish points
List webSiteContentTypeId = ["PUBLISH_POINT"];
if ( UtilValidate.isNotEmpty(includeBlog) && (includeBlog == "Y") ){
	webSiteContentTypeId.add("BLOG_ROOT");
}
if ( UtilValidate.isNotEmpty(includeForum) && (includeForum == "Y") ){
	webSiteContentTypeId.add("FORUM_ROOT");
}

Map autoCreateWebSiteContentCtx = [
	webSiteId : webSiteId,
	webSiteContentTypeId : webSiteContentTypeId,
	userLogin : sysUserLogin
];

dispatcher.runSync("autoCreateWebSiteContent", autoCreateWebSiteContentCtx);

//add the logged in user in the role of site owner

//Ensure user has Owner role
String loggedInPartyId = userLogin.partyId;
Map ensurePartyRoleCtx = [
	partyId : loggedInPartyId,
	roleTypeId : "OWNER"
];

dispatcher.runSync("ensurePartyRole", ensurePartyRoleCtx);

//create the site owner role
Map createWebSiteRoleCtx = [
	webSiteId : webSiteId,
	partyId : loggedInPartyId,
	roleTypeId : "OWNER",
	userLogin : sysUserLogin
];

dispatcher.runSync("createWebSiteRole", createWebSiteRoleCtx);

request.setAttribute("_EVENT_MESSAGE_", "Web Site created successfully");
return "success";