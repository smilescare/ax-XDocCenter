import org.codehaus.jackson.map.ObjectMapper;

import groovy.io.FileType;
import java.text.SimpleDateFormat;
import java.util.Date;


delimeterToUse = "~";

dirPath = parameters.path;

if(dirPath == "root"){
	targetDir = "/";
}else{
	targetDir = dirPath.replaceAll(delimeterToUse, "/");
}

rootDir = "ax-media";

if(parameters.rootDir){
	rootDir = parameters.rootDir;
}

filesInDirectory = []

targetPath = rootDir + targetDir;


files = new File(targetPath);
counter = 1;
files.eachFile (FileType.FILES) { file ->
	SimpleDateFormat dfd = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss");
	Date dDate = new Date(file.lastModified());
	lastModifiedDate = dfd.format(dDate);
	fileItem = [
		id:counter,
		name : file.name,
		lastModified : lastModifiedDate
	];
  filesInDirectory.add(fileItem);
  counter++;
}

fileListing = [
	id: 'id',
	label: 'name',
	items: filesInDirectory
]

response.setContentType("application/json");

ObjectMapper mapper = new ObjectMapper();

mapper.writeValue(response.getWriter(), fileListing);

//response.getWriter().print("{id:'~en', name:'en', children : true}");