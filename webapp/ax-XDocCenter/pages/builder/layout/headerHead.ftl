<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><#if title?has_content>${title} - Page Builder<#else>Page Builder - Content Management Simplified</#if></title>

    <!-- jQuery, required for the sample Component plugins -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

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
                <#--
                {
                    name: "codemirror",
                    location: "<@ofbizContentUrl>/xdoc/assets/lib/codemirror-5.17.0</@ofbizContentUrl>"
                }
                {
                    name: 'dojoc',
                    location: '<@ofbizContentUrl>/xtrack/assets/lib/dojo/dojoc</@ofbizContentUrl>'
                }
                -->
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
            "dojox/validate/web",

            <#--
            "codemirror/lib/codemirror",
            "codemirror/mode/javascript/javascript"
            ,
            "dojoc/Toaster",
            "dojoc/Modal",
            "dojoc/XFilteringSelect",
            "dojoc/XDateTextBox"
            -->
        ]);
    </script>
    <script type="text/javascript" src="<@ofbizContentUrl>/xdoc/assets/page-builder/js/app.js</@ofbizContentUrl>"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/xdoc/assets/page-builder/js/PageController.js</@ofbizContentUrl>"></script>

    <#--Codemirror for editing source code-->
<#--
    <link href="<@ofbizContentUrl>/xdoc/assets/lib/codemirror/codemirror.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="<@ofbizContentUrl>/xdoc/assets/lib/codemirror/codemirror.js</@ofbizContentUrl>"></script>
-->

    <#--CK Editor for editing html text-->
    <script src="//cdn.ckeditor.com/4.5.4/full/ckeditor.js"></script>

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
            <img class="ax-loaderLogo" src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/logo.png</@ofbizContentUrl>" style="width:100px;"/>
            <p class="ms-font-m-plus">Working...</p>
            <img src="<@ofbizContentUrl>/xdoc/assets/page-builder/img/loader.gif</@ofbizContentUrl>" />
        </div>
    </div>
</div>