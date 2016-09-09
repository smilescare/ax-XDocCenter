<#include "component://ax-XDocCenter/webapp/ax-XDocCenter/pages/widgets.ftl" />
<#assign authorUserLogin = delegator.findOne("UserLogin", Static["org.ofbiz.base.util.UtilMisc"].toMap("userLoginId", decoratedContent.fields.createdByUserLogin), false) >
<#assign authorName = Static["org.ofbiz.party.party.PartyHelper"].getPartyName(delegator, authorUserLogin.partyId, true) >
<#assign lastModifiedUserLogin = delegator.findOne("UserLogin", Static["org.ofbiz.base.util.UtilMisc"].toMap("userLoginId", decoratedContent.fields.lastModifiedByUserLogin), false) >
<#assign lastModifierName = Static["org.ofbiz.party.party.PartyHelper"].getPartyName(delegator, lastModifiedUserLogin.partyId, true) >

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta charset="utf-8">
    <title>${decoratedContent.fields.contentName?default('Page')} | XTrack | Expense Tracking Simplified</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="<@ofbizContentUrl>/app/xtrack/assets/img/favicon.ico</@ofbizContentUrl>" type="image/x-icon" >
    <link rel="apple-touch-icon" href="pages/ico/60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="pages/ico/76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="pages/ico/120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="pages/ico/152.png">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="" name="description">
    <meta content="" name="author">

    <link href="<@ofbizContentUrl>/app/xtrack/static/site/assets/plugins/pace/pace-theme-flash.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">
    <link href="<@ofbizContentUrl>/app/xtrack/static/site/assets/plugins/bootstrap/css/bootstrap.min.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">
    <link class="main-stylesheet" href="<@ofbizContentUrl>/app/xtrack/static/site/pages/css/pages.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">
    <link href="<@ofbizContentUrl>/lib/editors/ckeditor/4.5.10/full/plugins/codesnippet/lib/highlight/styles/default.css</@ofbizContentUrl>"" rel="stylesheet">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">

    <style>
        html,body, a, p, span{
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
            font-size: 11px;
        }
        h1, h2, h3{
            font-weight: 300;
        }
        .header{
            position: relative;
        }
        .jumbotron {
            position: relative;
            background: #000;
            overflow: hidden;
        }
        .jumbotron:before{
            content: ' ';
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            opacity: 0.2;
            background-image: url('<@ofbizContentUrl>/app/xtrack/static/site/assets/images/hero-2.jpg</@ofbizContentUrl>');
            background-repeat: no-repeat;
            background-position: 50% 0;
            -ms-background-size: cover;
            -o-background-size: cover;
            -moz-background-size: cover;
            -webkit-background-size: cover;
            background-size: cover;
        }
        .jumbotron .page-content {
            z-index: 2;
            position: relative;
        }
        .jumbotron .page-content a.btn-link{
            color:#fff;
            border:1px solid #fff;
            border-radius:2px;
        }
        .title-container{
            background: url(<@ofbizContentUrl>/app/xtrack/assets/img/triangles.png</@ofbizContentUrl>)repeat-x scroll center #37006E;
        }
        .article-info{
            position: relative;
        }
        .article-name{
            position: relative;
        }
        .article-name:before{
            position: absolute;
            top: 0px;
            border-top: 2px solid #fff;
            border-radius: 2px;
        }
        .author-details{
            color:#fff;
            opacity:0.6;
        }
        .sub-text{
            color:#fff;
            opacity:0.6;
        }
        .material-icons{
            vertical-align: middle;
        }
        .anchorific {
            overflow-x: hidden;
            overflow-y: auto;
            width: 160px;
            z-index: 10000;
        }
        .anchorific ul {
            list-style-type: none;
            padding: 0;
            margin-left:12px;
            margin-top:0;
        }
        .anchorific ul li{
            line-height: 16px;
            margin: 8px 0 0;
            position: relative;
        }
        .anchorific ul li a {
            -moz-user-select: none;
            color: #212121;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .anchorific li ul {}
        /* active class is generated by the scrollspy */
        .anchorific li.active > a {
            color: #039be5;
            font-weight: 500;
        }
        .anchorific li.active > ul {}
        .anchor{
        }
        .document-toc{
            border-left: 4px solid #4a148c;
            margin-left:12px;
        }
        .document-toc > .title-content{
            font-weight:500;
            padding-left: 12px;
        }
        .document-toc.affix{
            position:fixed;
            top:150px;
        }
        .nav-subtopics{
            margin-top:10px;
        }
        .nav-subtopics .a, .nav-subtopics a{
            padding:5px 5px 5px 10px;
        }
        hr.dashed-separator{
            border-top:1px dashed #c0c0c0;
        }
        .md-18{
            font-size:18px;
        }

        .docs .hash-link {
            margin: 1%
        }

        #docs-navbar.affix,#docs-subnavbar.affix {
            position: static;
            top: 0
        }

        #docs-navbar.affix-bottom,#docs-subnavbar.affix-bottom {
            position: relative
        }

        #docs-navbar {
            padding: 15px 0;
            display: none
        }

        #docs-subnavbar {
            padding-top: 15px;
            padding-bottom: 15px
        }

        #docs-subnavbar h4,.docs-nav h4 {
            margin-top: 0
        }

        #docs-navbar h4 {
            padding-left: 15px
        }

        #docs-navbar>.nav a,#docs-subnavbar h4 {
            padding-left: 10px
        }

        #docs-navbar ul {
            list-style: none;
            padding: 0
        }

        #docs-navbar ul li{
            padding-left: 0;
        }

        #docs-navbar .nav li a {
            border-left: 1px solid #ccc;
            display: block;
            font-size: 11px;
        }

        #docs-navbar .nav li a:hover {
            background: none;
            color: #444;
            text-decoration: none!important;
            border-color: #a39fd6
        }

        #docs-navbar .nav li a:focus {
            background: none
        }

        #docs-navbar .nav>li>a {
            padding: 8px 15px;
            font-size: 14px;
            font-weight:300;
        }

        #docs-navbar .nav>li li>a {
            padding: 5px 25px;
            position: relative
        }

        #docs-navbar .nav .docs-home {
            padding-bottom: 16px
        }

        #docs-navbar .nav>li>.area {
            font-size: 1.2rem;
            font-weight: 700;
            text-transform: uppercase
        }

        #docs-navbar .nav .panel {
            margin-bottom: inherit;
            background-color: inherit;
            border: inherit;
            border-radius: inherit;
            box-shadow: inherit
        }

        #docs-navbar .nav .panel>a {
            margin-right: 40px
        }

        #docs-navbar .nav .panel.expanded a {
            border-color: #373277;
            font-size: 14px;
        }

        #docs-navbar .nav .panel.expanded>a:hover {
            background: url(/expand-up.svg) 110px 5px no-repeat;
            background-size: 24px
        }

        #docs-navbar .nav .panel.collapsed>a:hover {
            background: url(/expand-down.svg) 110px 5px no-repeat;
            background-size: 24px
        }

        #docs-navbar .nav .collapsing {
            -webkit-transition-duration: .25s;
            transition-duration: .25s
        }

        #docs-navbar .nav li a,#docs-subnavbar .nav li a {
            color: #707070
        }

        #docs-navbar .nav li a:focus,#docs-subnavbar .nav li a:focus {
            background-color: transparent
        }

        #docs-subnavbar .nav li a {
            padding: 5px 10px
        }

        #docs-subnavbar .nav li a:before {
            content: "{";
            color: #bbb;
            position: absolute;
            font-size: 16px;
            top: 1px;
            left: 0;
            display: none
        }

        #docs-subnavbar .nav li a:hover {
            background: none;
            color: #444
        }

        #docs-subnavbar .nav li a:hover:before {
            font-weight: 700;
            display: block
        }

        #docs-navbar>.nav>.active .active>a,#docs-navbar>.nav>.active>a {
            color: #373277!important
        }

        #docs-navbar>.nav>.active .active>a,#docs-navbar>.nav>.active>a:not(.area) {
            font-weight: 600;
            font-size:13px;
            border-left:1px solid #373277
        }

        #docs-navbar>.nav .active .active a:before {
            content: "";
            position: absolute;
            height: 7px;
            width: 7px;
            background-color: #373277;
            top: 10px;
            left: -4px;
            border-radius: 100%
        }

        #docs-subnavbar .nav>.active>a {
            color: #0072be;
            font-weight: 700
        }

        #docs-subnavbar .nav>.active>a:before {
            color: #0072be;
            display: block
        }

        #docs-subnavbar .nav>.active>.nav>.active>a {
            color: #b4a0ff
        }

        #small-nav {
            padding: 5px 0
        }

        #small-nav>* {
            display: inline-block
        }

        #small-nav>select {
            margin-left: 12px
        }

        #small-nav #small-nav-dropdown {
            margin-right: 15px
        }

        #small-nav .social-buttons {
            vertical-align: text-top;
            display: inline-block
        }

        #small-nav .social-buttons .fb-like {
            margin-left: 10px;
            display: inline-block;
            vertical-align: top
        }

        #docs-subnavbar .fb-like,#docs-subnavbar .twitter-share-button {
            margin-top: 15px;
            margin-left: 10px;
            width: 50%
        }

        #docs-subnavbar .fb-like {
            display: block
        }
        .title-styler{
            border-bottom:4px solid #ffa000;
            width:50px;
            margin-bottom: 0;
            padding-bottom: 0;
        }
    </style>
    <#-- Google Analytics Script -->
</head>
<body class="pace-white" style="position:relative;">
    <nav class="header md-header light-solid" data-pages="header">
        <div class="container relative">
            <div class="pull-left">
                <div class="header-inner">
                    <img src="<@ofbizContentUrl>/app/xtrack/assets/img/logo-350.png</@ofbizContentUrl>" width="152"  class="logo" alt="logo">
                </div>
            </div>

            <div class="pull-right">
                <div class="header-inner">
                    <a href="#" class="search-toggle visible-sm-inline visible-xs-inline p-r-10"><i
                            class="fs-14 pg-search"></i></a>
                    <div class="visible-sm-inline visible-xs-inline menu-toggler pull-right p-l-10"
                         data-pages="header-toggle" data-pages-element="#header">
                        <div class="one"></div>
                        <div class="two"></div>
                        <div class="three"></div>
                    </div>
                </div>
            </div>
            <div class="pull-right menu-content clearfix" data-pages-direction="slideRight" id="header">

                <div class="pull-right">
                    <a href="#"
                       class="text-black link padding-10 visible-xs-inline visible-sm-inline pull-right m-t-10 m-b-10 m-r-10"
                       data-pages="header-toggle" data-pages-element="#header">
                        <i class=" pg-close_line"></i>
                    </a>
                </div>
                <div class="p-t-10 p-b-10 clearfix m-b-5 hidden-xs hidden-sm">
                    <div class="pull-right fs-12">
                        <a href="#" class="m-r-15 hint-text link text-black">Blog</a>
                    </div>
                </div>
                <ul class="menu">
                    <li class="">
                        <a href="#" class="active">Home </a>
                    </li>
                    <li class="">
                        <a href="/pricing">Pricing</a>
                    </li>
                    <li class="">
                        <a href="/docs">Docs</a>
                    </li>
                    <li>
                        <a href="/contact">Contact Us</a>
                    </li>
                </ul>
                <a class="btn btn-sm btn-bordered btn-black block-title fs-12 hidden-sm hidden-xs" href="#"
                   data-text="Sign Up">Sign Up</a>
            </div>
        </div>
    </nav>
    <section class="p-b-5 p-t-5 bg-master-darkest m-t-0 sm-no-margin title-container">
        <div class="container p-b-10 p-t-10">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-left article-info">
                        <div class="title-styler">&nbsp;</div>
                        <h1 class="text-white col-sm-12 p-b-10 article-name" style="padding-left: 0;">${decoratedContent.fields.contentName?default('Title')}</h1>
                        <#if decoratedContent.fields.description??>
                        <p class="fs-12 font-arial text-white m-t-20">
                            ${decoratedContent.fields.description?default('Description')}
                        </p>
                        </#if>
                        <#-- author details -->
                        <div class="author-details">
                            <i class="material-icons margin-right">account_circle</i>&nbsp;Created by ${authorName?default('Not Available')}, last modified by ${lastModifierName?default('* Name Not Available *')}
                            <i class="material-icons margin-right md-18">restore</i>&nbsp;<@formatPrettyDate decoratedContent.fields.lastModifiedDate />
                        </div>
                        <br/>
                    </div>
                    <#-- breadcrumb -->
                    <div class="pull-left">
                        <span class="header-text margin-left-no"><a href="/xdoc" style="color:#FFFFFF;"><i class="material-icons">home</i></a></span>
                        <#-- prepare breadcrumb path -->
                        <@buildBreadcrumb contentId = decoratedContent.fields.contentId />
                        <span class="header-text margin-left-no">
                            <i class="material-icons margin-right">chevron_right</i>
                            <span class="sub-text">${decoratedContent.fields.contentName?default("Title")}</span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="bg-overlay" style="opacity: 0.3; background-color: black;"></div>
    </section>
    <div class="container m-t-30">
        <div class="row">
        <#if (neighborContents?exists) && (neighborContents?size>0) >
            <div class="col-lg-2">
                <#-- neighbor topics list -->
                <#if (subContents?exists) && (subContents?size>0) >
                    <@buildNeighbortopics neighborContents = neighborContents subContents = subContents positionClass= "" activeContentId=activeContentId />
                <#else>
                    <@buildNeighbortopics neighborContents=neighborContents positionClass= "" activeContentId=activeContentId/>
                </#if>
            </div>
            <div class="col-lg-7" id="main-content-container">
            <#else>
            <div class="col-lg-9" id="main-content-container">
                </#if>
                ${decoratedContent?default('Nothing to show.')}
                <div>
                    <hr class="dashed-separator">
                    <p style="color:#999;font-size: 15px;">
                        <i class="material-icons">help</i>&nbsp;&nbsp;Was this information helpful?
                        <div class="btn-group">
                            <button class="btn btn-tag  btn-tag-light btn-tag-rounded"><i class="material-icons md-18">thumb_up</i>&nbsp;&nbsp;Yes</button>
                            <button class="btn btn-tag  btn-tag-light btn-tag-rounded">No&nbsp;&nbsp;<i class="material-icons md-18">thumb_down</i></button>
                        </div>
                    </p>
                    <br>
                    <p style="color:#999;font-size: small;">
                        Didn't find what you were looking for?
                        <a href="mailto:xtracksupport@simbaquartz.com?subject=Need additional help">Contact Us</a>
                    </p>
                    <br/><br/><br/>
                </div>
            </div>
            <div class="col-lg-2 hidden-sm">
                <div class="document-toc affix-top"  data-spy="affix" data-offset-top="250">
                    <span class="title-content">In This Article</span>
                    <nav class='anchorific'></nav>
                </div>
            </div>
        </div>
    </div>

    <section class="p-b-30 p-t-40">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img alt="" class="logo inline m-r-50" src="<@ofbizContentUrl>/app/xtrack/assets/img/logo-350.png</@ofbizContentUrl>" style="width: 150px;">
                    <div class="m-t-10 ">
                        <ul class="no-style fs-11 no-padding font-arial">
                            <li class="inline no-padding"><a class=" text-master p-r-10 b-r b-grey" href="#">Home</a></li>
                            <li class="inline no-padding"><a class="hint-text text-master p-l-10 p-r-10 b-r b-grey" href="#">Support</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 text-right font-arial sm-text-left">
                    <p class="fs-11 no-margin"><span class="hint-text">Help Center built using </span> XDoc - Document Authoring Tool by SimbaQuartz</p>
                    <p class="fs-11 muted">Copyright © 2016 SimbaQuartz. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </section>

    <script src="<@ofbizContentUrl>/app/xtrack/static/site/assets/plugins/pace/pace.min.js</@ofbizContentUrl>" type="text/javascript"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/app/xtrack/static/site/pages/js/pages.image.loader.js</@ofbizContentUrl>"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/app/xtrack/static/site/assets/plugins/jquery/jquery-1.11.1.min.js</@ofbizContentUrl>"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/app/xtrack/static/site/assets/plugins/jquery-unveil/jquery.unveil.min.js</@ofbizContentUrl>"></script>
    <script type="text/javascript" src="<@ofbizContentUrl>/app/xtrack/static/site/pages/js/pages.frontend.js</@ofbizContentUrl>"></script>

    <#--Generates automatic table of contents for the page using h1,h2,h3 tags-->
    <script src="<@ofbizContentUrl>/lib/anchorific.js</@ofbizContentUrl>"></script>
    <script>
        $('#main-content-container').anchorific({
            anchorText : "<i class='material-icons' title='Permanent Link (Click to navigate)'>link</i>"
            }
        );
    </script>
</body>
</html>