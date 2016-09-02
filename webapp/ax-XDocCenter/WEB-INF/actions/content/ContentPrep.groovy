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

import org.ofbiz.entity.GenericValue
import org.ofbiz.entity.util.EntityQuery

String contentId = parameters.cid ?: parameters.contentId;
context.contentId = contentId;
context.activeContentId = contentId;

GenericValue activeContent = EntityQuery.use(delegator).from("Content").where(["contentId" : contentId]).queryOne();
context.activeContent = activeContent;
List<GenericValue> activeContentAttributes = activeContent.getRelated("ContentAttribute", null, null, false);
context.activeContentAttributes = activeContentAttributes;

List<GenericValue> subContents = EntityQuery.use(delegator).
        from("ContentAssoc").
        where(["contentId" : contentId, "contentAssocTypeId" : "SUB_CONTENT"]).
        queryList();
context.subContents = subContents;

GenericValue parentContent = EntityQuery.use(delegator).
        from("ContentAssoc").
        where(["contentIdTo" : contentId, "contentAssocTypeId" : "SUB_CONTENT"]).
        queryFirst();
GenericValue parentContentDetails = parentContent.getRelatedOne("FromContent", false);
context.parentContent = parentContentDetails;

List<GenericValue> neighborContentAssociationss = EntityQuery.use(delegator).
        from("ContentAssoc").
        where(["contentId" : parentContentDetails.contentId, "contentAssocTypeId" : "SUB_CONTENT"]).
        queryList();

List<GenericValue> neighborContents = [];
neighborContentAssociationss.each {neighborContentAssociation ->
    GenericValue neighborContentDetails = neighborContentAssociation.getRelatedOne("ToContent", false);
    neighborContents.add(neighborContentAssociation);
}
context.neighborContents = neighborContents;
