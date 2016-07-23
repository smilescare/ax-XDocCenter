<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta content="IE=edge" http-equiv="X-UA-Compatible">
		<meta content="initial-scale=1.0, width=device-width" name="viewport">
		<title>404 Page Not Found | Help Center</title>
	
		<!-- css -->
		<link href="/hc/assets/material/css/base.min.css" rel="stylesheet">
	
		<!-- css for this project -->
		<link href="/hc/assets/material/css/project.min.css" rel="stylesheet">
		<!-- material icons -->
		<link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!-- favicon -->
		
		<!-- syntax highlighter -->
		<script type="text/javascript" src="/hc/assets/syntaxhighlighter/scripts/shCore.js"></script>
		<script type="text/javascript" src="/hc/assets/syntaxhighlighter/scripts/shBrushJScript.js"></script>
	  	<script src="/hc/assets/syntaxhighlighter/scripts/shBrushXml.js" type="text/javascript"></script>
	  	<link type="text/css" rel="stylesheet" href="/hc/assets/syntaxhighlighter/styles/shCoreDefault.css"/>
		<script type="text/javascript">SyntaxHighlighter.all();</script>
		
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:100,300,300italic,400,400italic,500,500italic" media="all">
		
		<!-- ie -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style>
			.material-icons{
				vertical-align:middle;
			}
		</style>
	</head>
	<body class="avoid-fout page-purple">
	<div class="content text-center">
		<div class="content-heading">
			<div class="container">
				<h1 class="heading" style="font-size:500%;font-weight:100;"><i style="font-size:100%;" class="material-icons">error</i>&nbsp;Page Not Found</h1>
				<br>
			</div>
		</div>
		<div class="container">
			<h3 style="color:#999999;">The page you are looking for could not be found.</h3>
			<p>
				If you think you've reached a broken link, please let us know by dropping a note <a href="mailto:mandeep.s.sidhu@aexp.com?subject=Help Center Broken Link">here</a>.
			</p>
			<a href="<%=request.getContextPath()%>/"><i class="material-icons">home</i></a>
		</div>
	</div>
</body>
</html>