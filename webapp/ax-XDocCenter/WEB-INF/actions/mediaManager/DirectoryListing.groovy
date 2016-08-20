import com.fasterxml.jackson.databind.ObjectMapper

import groovy.io.FileType;

println "############# inside directory listing";
delimeterToUse = "~";

dirPath = parameters.path;

if(dirPath == "root"){
	targetDir = "/";
}else{
	targetDir = dirPath.replaceAll(delimeterToUse, "/");
}

if(targetDir == "/root"){
	targetDir = "/"
}

rootDir = "runtime/uploads/media";
if(parameters.rootDir){
	rootDir = parameters.rootDir;
}
subDirectories = []

targetPath = rootDir + targetDir;


subDirectoryList = new File(targetPath);
subDirectoryList.eachFile (FileType.DIRECTORIES) { subDirectory ->
	//make sure file name is not .svn
	if(subDirectory.name != ".svn"){
		if(targetDir == "/"){
			subDirectoryId = delimeterToUse + subDirectory.name;
		}else{
			//build the complete path
			subDirectoryId = targetDir.replaceAll("/", delimeterToUse) + delimeterToUse + subDirectory.name;
		}
	
		directoryItem = [
			id:subDirectoryId,
			name : subDirectory.name,
			children : true
		];
		
	  	subDirectories.add(directoryItem);
  	}
}

directoryListing = [
	id: targetDir,
	name: targetDir,
	children: subDirectories
]

response.setContentType("application/json");

ObjectMapper mapper = new ObjectMapper();

mapper.writeValue(response.getWriter(), directoryListing);

//response.getWriter().print("{id:'~en', name:'en', children : true}");