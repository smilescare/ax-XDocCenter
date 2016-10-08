import org.ofbiz.entity.GenericValue

/*
 *
 *  * *****************************************************************************************
 *  *  Copyright (c) SimbaQuartz  2016. - All Rights Reserved                                 *
 *  *  Unauthorized copying of this file, via any medium is strictly prohibited               *
 *  *  Proprietary and confidential                                                           *
 *  *  Written by Mandeep Sidhu <mandeep.sidhu@simbacart.com>,  October, 2016                    *
 *  * ****************************************************************************************
 *
 */

/**
 Displays list of top 5 recently edited documents by logged in user
**/
String loggedInPartyId = userLogin.partyId;
String loggedInPartyUserLoginId = userLogin.userLoginId;

List<GenericValue> recentContentDocs = from("Content").where(["lastModifiedByUserLogin" : loggedInPartyUserLoginId, "contentTypeId" : "DOCUMENT"]).orderBy("-lastModifiedDate").maxRows(5).queryList();

context.recentDocs = recentContentDocs;