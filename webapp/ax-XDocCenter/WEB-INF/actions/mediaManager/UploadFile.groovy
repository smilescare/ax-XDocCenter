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
import org.ofbiz.content.layout.LayoutWorker

import java.nio.ByteBuffer

fileFormMap = LayoutWorker.uploadImageAndParameters(request, "fileToUpload");

Map formInput = fileFormMap.formInput;

ByteBuffer fileBuffer = fileFormMap.imageData;
String uploadedFileName = fileFormMap.imageFileName;

//since layout worker call puts all form fields into request attributes.
String serverFilePath = formInput.serverDirectory;

String rootDir = "/hot-deploy/ax-XStatic/webapp/ax-XStatic/media";

if(UtilValidate.isNotEmpty(uploadedFileName)){
	//remove any spaces from the file name
	uploadedFileName = uploadedFileName.trim().replaceAll(" ", "");
	try {
		String ofbizHome = System.getProperty("ofbiz.home");
		String targetFileName = ofbizHome + rootDir + serverFilePath + "/" + uploadedFileName;
		IOUtils.copy(new ByteBufferBackedInputStream(fileBuffer), new FileOutputStream(targetFileName));
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("_ERROR_MESSAGE_", "Unable to upload file, something went wrong, please check logs");
		return "error";
	}

}

return "success";