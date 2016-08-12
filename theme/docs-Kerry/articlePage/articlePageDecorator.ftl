<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta charset="utf-8">
    <title>${decoratedContent.fields.contentName?default('Page')} | XTrack | Expense Tracking Simplified</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="<@ofbizContentUrl>/xtrack/assets/img/favicon.ico</@ofbizContentUrl>" type="image/x-icon" >
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

    <link href="/xtrack/static/site/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css">
    <link href="/xtrack/static/site/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/xtrack/static/site/assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link class="main-stylesheet" href="/xtrack/static/site/pages/css/pages.css" rel="stylesheet" type="text/css">

    <style>
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
            background-image: url('/xtrack/static/site/assets/images/hero-2.jpg');
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
            background: url(http://d1llq0fq6x7noc.cloudfront.net/static/content/en/in/common/images/triangles.png)repeat-x scroll center #37006E;
        }
    </style>
    <#-- Google Analytics Script -->
</head>
<body class="pace-white" style="position:relative;">
    <nav class="header md-header light-solid" data-pages="header">
        <div class="container relative">
            <div class="pull-left">
                <div class="header-inner">
                    <img src="<@ofbizContentUrl>/xtrack/assets/img/logo-350.png</@ofbizContentUrl>" width="152"  class="logo" alt="logo">
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
                        <a href="#" class="m-r-15 hint-text link text-black">English</a>
                        <a href="#" class="m-r-15 hint-text link text-black">Blog</a>
                        <a href="#" class="m-r-15 hint-text link text-black">Privacy Policy</a>
                        <span class="m-r-15 text-black font-montserrat">+65 345 345 5555</span>
                    </div>
                </div>
                <ul class="menu">
                    <li class="">
                        <a href="#" class="active">Home </a>
                    </li>
                    <li class="horizontal">
                        <a href="javascript:;">Elements <i class="pg-arrow_minimize m-l-5"></i></a>
                        <span class="arrow"></span>
                        <nav class="horizontal">
                            <div class="container">
                                <ul>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#color" target="_blank">Colors</a>
                                    </li>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#icons" target="_blank">Icons</a>
                                    </li>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#buttons"
                                           target="_blank">Buttons</a>
                                    </li>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#modals" target="_blank">Modals</a>
                                    </li>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#progress_bars" target="_blank">Progress
                                            &amp; Activity</a>
                                    </li>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#accordians" target="_blank">Accordians</a>
                                    </li>
                                    <li>
                                        <a href="http://pages.revox.io/frontend/1.0/doc/#tabs" target="_blank">Tabs</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </li>
                    <li class="">
                        <a href="pricing.html">Pricing </a>
                    </li>
                    <li>
                        <a href="portfolio.html">Portfolio </a>
                    </li>
                    <li>
                        <a href="contact.html">Contact Us</a>
                    </li>
                </ul>
                <a class="btn btn-sm btn-bordered btn-black block-title fs-12 hidden-sm hidden-xs" href="#"
                   data-text="Sign Up">Sign Up</a>
            </div>
        </div>
    </nav>
    <section class="p-b-30 p-t-30 bg-master-darkest m-t-35 sm-no-margin title-container">
        <div class="container p-b-50 p-t-50">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1 class="text-white col-sm-12 p-b-10">${decoratedContent.fields.contentName?default('Title')}</h1>
                        <p class="fs-12 font-arial text-white m-t-30">
                            ${decoratedContent.fields.description?default('Description')}
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="bg-overlay" style="opacity: 0.3; background-color: black;"></div>
    </section>
    ${decoratedContent?default('Nothing to show.')}

    <section class="p-b-30 p-t-40">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img alt="" class="logo inline m-r-50" src="assets/images/logo_black.png">
                    <div class="m-t-10 ">
                        <ul class="no-style fs-11 no-padding font-arial">
                            <li class="inline no-padding"><a class=" text-master p-r-10 b-r b-grey" href="#">Home</a></li>
                            <li class="inline no-padding"><a class="hint-text text-master p-l-10 p-r-10 b-r b-grey" href="#">Themeforest</a></li>
                            <li class="inline no-padding"><a class="hint-text text-master p-l-10 p-r-10 b-r b-grey" href="#">Support</a></li>
                            <li class="inline no-padding"><a class="hint-text text-master p-l-10 p-r-10 xs-no-padding xs-m-t-10" href="#">Made with Pages</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 text-right font-arial sm-text-left">
                    <p class="fs-11 no-margin"><span class="hint-text">Exclusive only at</span> Envato Marketplace,Themeforest <span class="hint-text">See</span> Standard licenses &amp; Extended licenses
                    </p>
                    <p class="fs-11 muted">Copyright © 2014 REVOX. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </section>
    <script src="/xtrack/static/site/assets/plugins/pace/pace.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/xtrack/static/site/pages/js/pages.image.loader.js"></script>
    <script type="text/javascript" src="/xtrack/static/site/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/xtrack/static/site/assets/plugins/jquery-unveil/jquery.unveil.min.js"></script>
    <script type="text/javascript" src="/xtrack/static/site/pages/js/pages.frontend.js"></script>
</body>
</html>