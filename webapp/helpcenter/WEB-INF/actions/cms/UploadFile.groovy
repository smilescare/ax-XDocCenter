
import org.codehaus.jackson.map.ObjectMapper;

import groovy.io.FileType;

import org.springframework.web.multipart.MultipartFile;

println "Uploading file...";

uploadDirectory = parameters.serverDirectory;
MultipartFile fileToUpload = request.getFile("fileToUpload");