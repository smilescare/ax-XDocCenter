<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><#if title?has_content>${title} - Page Builder<#else>Page Builder - Content Management Simplified</#if></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
    <!-- jQuery, required for the sample Component plugins -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link rel="stylesheet" href="<@ofbizContentUrl>/xtrack/assets/lib/office-ui-fabric/css/fabric.css</@ofbizContentUrl>" />
    <link rel="stylesheet" href="<@ofbizContentUrl>/xtrack/assets/lib/office-ui-fabric/css/fabric.components.css</@ofbizContentUrl>" />
    <link href="<@ofbizContentUrl>/xdoc/assets/page-builder/css/app.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />

    <#--set Dojo configuration, load Dojo-->
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/dojo/1.10.4/dijit/themes/claro/claro.css">
    <link href="<@ofbizContentUrl>/xdoc/assets/page-builder/css/dojo-components/dojo-overrides.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <script>
        dojoConfig = {
            async: true,
            parseOnLoad: true,
            dojoBlankHtmlUrl: '<@ofbizContentUrl>/xtrack/assets/lib/dojo/blank.html</@ofbizContentUrl>',
            packages: [
                {
                	<#--
                    name: 'dojoc',
                    location: '<@ofbizContentUrl>/xtrack/assets/lib/dojo/dojoc</@ofbizContentUrl>'
                    -->
                }
            ]
        }
    </script>
    <script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.4/dojo/dojo.js"></script>
    <script type="text/javascript">
        require([
            "dojo/parser",
            "dijit/form/FilteringSelect",
            "dojo/store/Memory",
            "dojo/ready",
            "dojo/on",
            "dijit/registry",
            "dojo/data/ItemFileWriteStore",
            "dojo/parser",
            "dojo/io/iframe",
            "dojox/validate/web"
            <#--
            ,
            "dojoc/Toaster",
            "dojoc/Modal",
            "dojoc/XFilteringSelect",
            "dojoc/XDateTextBox"
            -->
        ]);
    </script>
    <#--<script>
        // Require the registry, parser, Dialog, and wait for domReady
        require(["dijit/registry", "dojo/parser", "dojo/json", "dojo/_base/config", "dijit/Dialog", "dojo/domReady!"]
            , function(registry, parser, JSON, config) {
                // Explicitly parse the page
                //parser.parse();
                // Find the dialog
                var dialog = registry.byId("dialog");
                // Set the content equal to what dojo.config is
//                dialog.set("content", "<pre>" + JSON.stringify(config, null, "\t") + "```");
                // Show the dialog
                dialog.show();
            });
    </script>-->
    <script type="text/javascript" src="<@ofbizContentUrl>/xdoc/assets/page-builder/js/app.js</@ofbizContentUrl>"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/xdoc/assets/page-builder/js/PageController.js</@ofbizContentUrl>"></script>
    <script src="//cdn.ckeditor.com/4.5.4/full/ckeditor.js"></script>
    
	<style type="text/css">
		html, body {
			height: 100%;
			width: 100%;
			padding: 0;
			border: 0;
			font-family: 'Open Sans', sans-serif;
		}
		hr.dashed-separator{
			border-top:1px dashed #d7e9ff;
			margin:15px 0;
		}
	</style>
</head>
<body class="claro djOfcUiFbr">
<div id="axAppLoadingOverlay" class="ax-loadingOverlay ax-pageOverlay">
    <div class="ax-loadCenter">
        <img class="ax-loaderLogo" src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/logo.png</@ofbizContentUrl>" />
        <p class="ms-font-s-plus">Managing Content Simplified</p>
        <br>
        <img src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/loader.gif</@ofbizContentUrl>" />
    </div>
</div>
<#-- global loader, displayed during app.dobind, open modal etc. -->
<div class="dijitHidden">
    <div data-dojo-type="dijit/Dialog"  id="globalLoadingOverlay" data-dojo-id="globalLoadingOverlay" class="globalLoadingOverlay">
        <div class="dijitDialogPaneContentArea">
            <img class="ax-loaderLogo" src="<@ofbizContentUrl>/xdoc/assets/img/loader.gif</@ofbizContentUrl>" style="width:100px;"/>
            <p class="ms-font-m-plus">Working...</p>
            <img src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/loader.gif</@ofbizContentUrl>" />
        </div>
    </div>
</div>