<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><#if title?has_content>${title} - Page Builder<#else>Page Builder - Content Management Simplified</#if></title>

    <!-- jQuery, required for the sample Component plugins -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <link href="<@ofbizContentUrl>/app/xdoc/page-builder/css/app.min.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />

    <#--set Dojo configuration, load Dojo-->
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/dojo/1.10.4/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/dojo/1.10.4/dojox/grid/enhanced/resources/claro/EnhancedGrid.css">
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/dojo/1.10.4/dojox/grid/enhanced/resources/EnhancedGrid_rtl.css">
    <link href="<@ofbizContentUrl>/lib/dojo/themes/office-ui/theme.min.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <script>
        dojoConfig = {
            async: true,
            parseOnLoad: true,
            dojoBlankHtmlUrl: '<@ofbizContentUrl>/lib/dojo/blank.html</@ofbizContentUrl>',
            packages: [
                {
                    name: 'dojoc',
                    location: '<@ofbizContentUrl>/lib/dojo/dojoc</@ofbizContentUrl>'
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
    <script type="text/javascript" src="<@ofbizContentUrl>/app/common/js/app.min.js</@ofbizContentUrl>"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/app/xdoc/page-builder/js/PageController.js</@ofbizContentUrl>"></script>
    
    <#-- ckeditor script 
    <script src="//cdn.ckeditor.com/4.5.4/full/ckeditor.js"></script>
    -->
    <link href="<@ofbizContentUrl>/lib/editors/ckeditor/4.5.10/full/plugins/codesnippet/lib/highlight/styles/default.css</@ofbizContentUrl>"" rel="stylesheet">
    <script src="<@ofbizContentUrl>/lib/editors/ckeditor/4.5.10/full/ckeditor.js</@ofbizContentUrl>"></script>

    <#-- office ui fabric -->
    <#--<link href="//dev.office.com/Modules/DevOffice.Fabric/Fabric/css/fabric.min.css" type="text/css" rel="stylesheet" />-->

    <#-- ace editor 
    <link rel="stylesheet" href="normalize.css">
	<link rel="stylesheet" href="monokai.css">
	<link rel='stylesheet' href='style.css'>
    -->
    <script src="<@ofbizContentUrl>/lib/editors/ace-editor/src-min-noconflict/ace.js</@ofbizContentUrl>"></script>
    <#--
    <script src="<@ofbizContentUrl>/lib/editors/ace-editor/src-min-noconflict/ext-beautify.js</@ofbizContentUrl>"></script>
    -->
    
</head>
<body class="claro djOfcUiFbr">
<div id="axAppLoadingOverlay" class="ax-loadingOverlay ax-pageOverlay">
    <div class="ax-loadCenter">
        <img class="ax-loaderLogo" src="<@ofbizContentUrl>/app/xdoc/page-builder/img/logo.png</@ofbizContentUrl>" />
        <p class="ms-font-s-plus">Managing Content Simplified</p>
        <br>
        <img src="<@ofbizContentUrl>/app/xdoc/page-builder/img/loader.gif</@ofbizContentUrl>" />
    </div>
</div>
<#-- global loader, displayed during app.dobind, open modal etc. -->
<div class="dijitHidden">
    <div data-dojo-type="dijit/Dialog"  id="globalLoadingOverlay" data-dojo-id="globalLoadingOverlay" class="globalLoadingOverlay">
        <div class="dijitDialogPaneContentArea">
            <img class="ax-loaderLogo" src="<@ofbizContentUrl>/app/xdoc/page-builder/img/logo.png</@ofbizContentUrl>" style="width:100px;"/>
            <p class="ms-font-m-plus">Working...</p>
            <img src="<@ofbizContentUrl>/app/xdoc/page-builder/img/loader.gif</@ofbizContentUrl>" />
        </div>
    </div>
</div>