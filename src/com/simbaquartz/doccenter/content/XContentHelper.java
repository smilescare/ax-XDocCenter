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

package com.simbaquartz.doccenter.content;

import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.util.EntityQuery;

/**
 * Utility methods for managing content.
 */
public class XContentHelper {
    private static final String module = XContentHelper.class.getName();

    /**
     * Returns SEO friendly content URL associated with the content with contentAssocTypeId as ALTERNATIVE_URL
     * @param delegator
     * @param contentId
     * @return
     */
    public static String getContentAltUrl(Delegator delegator, String contentId){
        String contentAltUrl = "";

        GenericValue contentURLInfoAssoc = null;
        try {
            contentURLInfoAssoc = EntityQuery.use(delegator)
                                                .from("ContentAssoc")
                                                    .where( UtilMisc.toMap("contentId", contentId, "contentAssocTypeId", "ALTERNATIVE_URL") )
                                                    .queryFirst();

            if(UtilValidate.isNotEmpty(contentURLInfoAssoc)){
                GenericValue contentUrlValue = contentURLInfoAssoc.getRelatedOne("ToContent", false);
                if(UtilValidate.isNotEmpty(contentURLInfoAssoc)){
                    GenericValue contentUrlDatasource = contentUrlValue.getRelatedOne("DataResource", false);
                    contentAltUrl = contentUrlDatasource.getString("objectInfo");
                }
            }
        } catch (GenericEntityException e) {
            Debug.logError(e.getMessage(), module);
        }

        return contentAltUrl;
    }
}