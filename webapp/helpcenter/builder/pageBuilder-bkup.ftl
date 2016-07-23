<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<title>AppEx - Page Builder</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="images/favicon.png">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,300">
	<link rel="stylesheet" href="/hc/assets/page-builder/dist/textAngular.css">
	<link rel="stylesheet" href="/hc/assets/page-builder/css/style.css" type="text/css">
</head>
<body>
	<div ng-app="TextAngularDemo" ng-controller="DemoController">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<span class="logo-area">
						<a href="<@ofbizUrl>builder</@ofbizUrl>">
							<img src="/flatgrey/images/logo-70x70.png" alt="AppEx : Content Manager"></a>
							Page Builder
						</span>
					<h2>A Lightweight, yet powerful page editor for quick editing of static pages.</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<h3>Editor demo</h3>
					<div text-angular ng-model="htmlContent" name="demo-editor" ta-text-editor-class="border-around" ta-html-editor-class="border-around"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<h3>HTML output</h3>
					<pre ng-bind="htmlContent" class="white-box"></pre>
				</div>
			</div>
			<h3>Preview URL</h3>
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group input-group-lg">
				      <input type="text" class="form-control" placeholder="/getting-started-guide">
				      <span class="input-group-btn">
				        <button class="btn btn-info" type="button">Preview</button>
				      </span>
				    </div><!-- /input-group -->
				</div>
			</div>
			<footer class="row">
				<div class="col-sm-12 text-center">
					<p>Created by <a href="https://www.linkedin.com/in/austinanderson1" target="_blank">fraywing</a></p>
					<p>2013 Licensed under <a href="http://opensource.org/licenses/MIT" target="_blank">MIT</a></p>
				</div>
			</footer>
		</div>

		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js" type="text/javascript"></script>
		<script src="/hc/assets/page-builder/dist/textAngular-rangy.min.js" type="text/javascript"></script>
		<script src="/hc/assets/page-builder/dist/textAngular-sanitize.min.js" type="text/javascript"></script>
		<script src="/hc/assets/page-builder/dist/textAngular.min.js" type="text/javascript"></script>
		<script src="/hc/assets/page-builder/js/demo.js" type="text/javascript"></script>
</body>
</html>