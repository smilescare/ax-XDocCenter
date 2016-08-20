/*
 *
 *  * *****************************************************************************************
 *  *  Copyright (c) SimbaQuartz  2016. - All Rights Reserved                                 *
 *  *  Unauthorized copying of this file, via any medium is strictly prohibited               *
 *  *  Proprietary and confidential                                                           *
 *  *  Written by Mandeep Sidhu <mandeep.sidhu@simbacart.com>,  August, 2016                    *
 *  * ****************************************************************************************
 *
 */

package com.simbaquartz.doccenter.filter;

import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilCodec;
import org.ofbiz.base.util.UtilHttp;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.common.UrlServletHelper;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.entity.util.EntityQuery;
import org.ofbiz.webapp.control.ContextFilter;
import org.ofbiz.webapp.website.WebSiteWorker;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

/**
 * Created by mande on 7/17/2016.
 */
public class XDocContentUrlFilter extends ContextFilter {
    public final static String module = XDocContentUrlFilter.class.getName();

    public static final String CONTROL_MOUNT_POINT = "control";
    protected static String defaultLocaleString = null;
    protected static String redirectUrl = null;
    public static String defaultViewRequest = "contentViewInfo";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)  throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        Delegator delegator = (Delegator) httpRequest.getSession().getServletContext().getAttribute("delegator");

        //Get ServletContext
        ServletContext servletContext = config.getServletContext();

        ContextFilter.setCharacterEncoding(request);

        //Set request attribute and session
        UrlServletHelper.setRequestAttributes(request, delegator, servletContext);
        String urlContentId = null;
        String pathInfo = UtilHttp.getFullRequestUrl(httpRequest);
        if (UtilValidate.isNotEmpty(pathInfo)) {
            String alternativeUrl = pathInfo.substring(pathInfo.lastIndexOf("/"));
            if (alternativeUrl.endsWith("-content")) {
                try {
                    GenericValue contentDataResourceView = EntityQuery.use(delegator).from("ContentDataResourceView")
                            .where("drObjectInfo", alternativeUrl)
                            .orderBy("createdDate DESC").queryFirst();
                    if (contentDataResourceView != null) {
                        GenericValue content = EntityQuery.use(delegator).from("ContentAssoc")
                                .where("contentAssocTypeId", "ALTERNATIVE_URL",
                                        "contentIdTo", contentDataResourceView.get("contentId"))
                                .filterByDate().queryFirst();
                        if (content != null) {
                            urlContentId = content.getString("contentId");
                        }
                    }
                } catch (Exception e) {
                    Debug.logWarning(e.getMessage(), module);
                }
            }
            if (UtilValidate.isNotEmpty(urlContentId)) {
                StringBuilder urlBuilder = new StringBuilder();
                urlBuilder.append("/" + CONTROL_MOUNT_POINT);
                urlBuilder.append("/" + config.getInitParameter("viewRequest") + "?contentId=" + urlContentId);

                ContextFilter.setAttributesFromRequestBody(request);
                //Set view query parameters
                UrlServletHelper.setViewQueryParameters(request, urlBuilder);
                Debug.logInfo("[Filtered request]: " + pathInfo + " (" + urlBuilder + ")", module);
                RequestDispatcher dispatch = request.getRequestDispatcher(urlBuilder.toString());
                dispatch.forward(request, response);
                return;
            }

            //Check path alias
//            UrlServletHelper.checkPathAlias(request, httpResponse, delegator, pathInfo);
            checkPathAliasWithWebSiteId(request, httpResponse, delegator, pathInfo);
        }
        // we're done checking; continue on
        chain.doFilter(request, response);
    }

    public static void checkPathAliasWithWebSiteId(ServletRequest request, ServletResponse response, Delegator delegator, String pathInfo) {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        String webSiteId = WebSiteWorker.getWebSiteId(request);
        String webSiteId = getWebSiteIdUsingHost(request);
        // check path alias
        GenericValue pathAlias = null;
        String alternativeUrl = pathInfo.substring(pathInfo.lastIndexOf("/") +1);

        try {
            pathAlias = EntityQuery.use(delegator)
                    .from("WebSitePathAlias")
                    .where("webSiteId", webSiteId, "pathAlias", alternativeUrl)
                    .cache()
                    .queryOne();
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
        }

        if (pathAlias != null) {
            String alias = pathAlias.getString("aliasTo");
            String contentId = pathAlias.getString("contentId");

            if (contentId == null && UtilValidate.isNotEmpty(alias)) {
                if (!alias.startsWith("/")) {
                    alias = "/" + alias;
                }

                RequestDispatcher rd = request.getRequestDispatcher(alias);
                try {
                    rd.forward(request, response);
                    return;
                } catch (ServletException e) {
                    Debug.logWarning(e, module);
                } catch (IOException e) {
                    Debug.logWarning(e, module);
                }
            }
        } else {
            // send 404 error if a URI is alias TO
            try {
                List<GenericValue> aliasTos = EntityQuery.use(delegator)
                        .from("WebSitePathAlias")
                        .where("webSiteId", webSiteId, "aliasTo", httpRequest.getRequestURI())
                        .queryList();
                if (UtilValidate.isNotEmpty(aliasTos)) {
                    httpResponse.sendError(HttpServletResponse.SC_NOT_FOUND, "Not Found");
                    return;
                }
            } catch (GenericEntityException e) {
                Debug.logError(e, module);
            } catch (IOException e) {
                Debug.logError(e, module);
            }
        }
    }

    public static String makeContentAltUrl(HttpServletRequest request, HttpServletResponse response, String contentId, String viewContent) {
        if (UtilValidate.isEmpty(contentId)) {
            return null;
        }
        Delegator delegator = (Delegator) request.getAttribute("delegator");
        String url = null;
        try {
            GenericValue contentAssocDataResource = EntityQuery.use(delegator)
                    .select("contentIdStart", "drObjectInfo", "dataResourceId", "caFromDate", "caThruDate", "caCreatedDate")
                    .from("ContentAssocDataResourceViewTo")
                    .where("caContentAssocTypeId", "ALTERNATIVE_URL",
                            "caThruDate", null,
                            "contentIdStart", contentId)
                    .orderBy("-caFromDate")
                    .queryFirst();
            if (contentAssocDataResource != null) {
                url = contentAssocDataResource.getString("drObjectInfo");
                url = UtilCodec.getDecoder("url").decode(url);
                String mountPoint = request.getContextPath();
                if (!(mountPoint.equals("/")) && !(mountPoint.equals(""))) {
                    url = mountPoint + url;
                }
            }
        } catch (Exception e) {
            Debug.logWarning("[Exception] : " + e.getMessage(), module);
        }

        if (UtilValidate.isEmpty(url)) {
            if (UtilValidate.isEmpty(viewContent)) {
                viewContent = defaultViewRequest;
            }
            url = makeContentUrl(request, response, contentId, viewContent);
        }
        return url;
    }

    public static String makeContentUrl(HttpServletRequest request, HttpServletResponse response, String contentId, String viewContent) {
        if (UtilValidate.isEmpty(contentId)) {
            return null;
        }
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(request.getSession().getServletContext().getContextPath());
        if (urlBuilder.length() == 0 || urlBuilder.charAt(urlBuilder.length() - 1) != '/') {
            urlBuilder.append("/");
        }
        urlBuilder.append(CONTROL_MOUNT_POINT);

        if (UtilValidate.isNotEmpty(viewContent)) {
            urlBuilder.append("/" + viewContent);
        } else {
            urlBuilder.append("/" + defaultViewRequest);
        }
        urlBuilder.append("?contentId=" + contentId);
        return urlBuilder.toString();
    }

    public static String getWebSiteIdUsingHost(ServletRequest request) {
        String webSiteId = "";
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        Delegator delegator = (Delegator) httpRequest.getSession().getServletContext().getAttribute("delegator");
        String requestedUrl = httpRequest.getRequestURL().toString();

        URL requestedURL = null;
        try {
            requestedURL = new URL(requestedUrl);
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return "";
        }

        String hostName = requestedURL.getHost();

        String requestScheme = httpRequest.getScheme();//returns "http", "https"

        EntityCondition condition = EntityCondition.makeCondition("httpHost", EntityOperator.LIKE, "%" + hostName + "%");//wildcard to allow sub-domains as well
        if ("https".equalsIgnoreCase(requestScheme)){
            //secure
            condition = EntityCondition.makeCondition("httpsHost", EntityOperator.LIKE, "%" + hostName + "%");//wildcard to allow sub-domains as well
        }

        GenericValue webSiteValue = null;
        try {
            webSiteValue = EntityQuery.use(delegator).from("WebSite").where(condition).cache().queryFirst();
        } catch (GenericEntityException e) {
            e.printStackTrace();
        }

        if(UtilValidate.isNotEmpty(webSiteValue)){
            webSiteId = webSiteValue.getString("webSiteId");
        }

        return webSiteId;
    }
}

