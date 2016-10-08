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

import org.ofbiz.base.util.Debug

module = "DownloadFile.groovy";

int BUFFER_SIZE = 4096;

appPath = "/runtime/downloads";
serverId = parameters.serverId;
serverFilePath = parameters.serverFilePath;

//get active sessions
serviceCtx = [
	userLogin : userLogin
];
serviceResponse = dispatcher.runSync("getActiveSessions", serviceCtx);

activeSessions = serviceResponse.get("aciveSessions");
activeSession = activeSessions.get(serverId);

//flush json to response stream.
context = request.getServletContext();
downloadedFilePath = activeSession.downloadFileFromServer(serverFilePath, appPath);

Debug.logInfo("Downloaded file path : " + downloadedFilePath, module);

if (null == downloadedFilePath) {
	response.setContentType("text/html");
	response.getWriter().write(
			"An error occurred while trying to download the file from remote path:"
					+ serverFilePath);
	return;
}

File downloadFile = new File(downloadedFilePath);
FileInputStream inputStream = new FileInputStream(downloadFile);

// get MIME type of the file
String mimeType = context.getMimeType(appPath);
if (mimeType == null) {
	// set to binary type if MIME mapping not found
	mimeType = "application/octet-stream";
}
Debug.logInfo("MIME type: " + mimeType, module);

response.setContentType(mimeType);
response.setContentLength((int) downloadFile.length());

// set headers for the response
String headerKey = "Content-Disposition";
String headerValue = String.format("attachment; filename=\"%s\"",
		downloadFile.getName());
response.setHeader(headerKey, headerValue);

// get output stream of the response
OutputStream outStream = response.getOutputStream();

byte[] buffer = new byte[BUFFER_SIZE];
int bytesRead = -1;

// write bytes read from the input stream into the output stream
while ((bytesRead = inputStream.read(buffer)) != -1) {
	outStream.write(buffer, 0, bytesRead);
}

inputStream.close();
outStream.close();

// delete the original file
downloadFile.delete();