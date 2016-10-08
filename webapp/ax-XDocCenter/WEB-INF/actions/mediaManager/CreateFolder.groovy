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


import com.simbaquartz.doccenter.utils.ByteBufferBackedInputStream
import org.apache.commons.io.IOUtils
import org.ofbiz.base.util.UtilValidate

String serverFilePath = parameters.serverFilePath;

String rootDir = "/hot-deploy/ax-XStatic/webapp/ax-XStatic/media";

if(UtilValidate.isNotEmpty(serverFilePath)){
    //remove any spaces from the file name
    serverFilePath = serverFilePath.trim().replaceAll(" ", "");
    try {
        String ofbizHome = System.getProperty("ofbiz.home");
        String targetDirPath = ofbizHome + rootDir + serverFilePath;
        println("######### directory paths: " + targetDirPath);
        new File(targetDirPath).mkdirs();
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("_ERROR_MESSAGE_", "Unable to create directory, something went wrong, please check logs");
        return "error";
    }
}

return "success";