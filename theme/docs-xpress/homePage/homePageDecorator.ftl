<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta charset="utf-8">
    <title>XTrack | Expense Tracking Simplified</title>
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

    <link href="<@ofbizContentUrl>/sites/xtrack/assets/plugins/pace/pace-theme-flash.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">
    <link href="<@ofbizContentUrl>/sites/xtrack/assets/plugins/bootstrap/css/bootstrap.min.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">
    <link href="<@ofbizContentUrl>/sites/xtrack/assets/plugins/font-awesome/css/font-awesome.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">
    <link class="main-stylesheet" href="<@ofbizContentUrl>/sites/xtrack/pages/css/pages.css</@ofbizContentUrl>" rel="stylesheet" type="text/css">

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
            opacity: 1;
            background-image: url('<@ofbizContentUrl>/sites/xtrack/img/app-bg.png</@ofbizContentUrl>');
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
    </style>
<#-- Google Analytics Script -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body class="pace-white" style="position:relative;">
<section class="jumbotron demo-custom-height xs-full-height" >
    <div class="container-xs-height full-height">
        <div class="col-xs-height col-middle text-left" >
            <div class="container page-content">
                <div class="row">
                    <div class="col-lg-7 col-md-6 ">

                        <div class="panel panel-transparent">
                            <div class="panel-body">
                                <h1 class="text-white">Delight Your Customers</h1>
                                <h3 class="text-white">We're Glad You Are Here !!!. Let's Talk</h3>
                                <form id="form-personal" role="form" autocomplete="off" novalidate="novalidate" action="/xdoc/control/submitContactForm" method="post">
                                    <div class="row clearfix">
                                        <div class="col-sm-12">
                                            <div class="form-group form-group-default required" aria-required="true">
                                                <label>Your Full Name</label>
                                                <input type="text" class="form-control" name="fullName" placeholder="So we have a name to ask for when we contact you." required="" aria-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group form-group-default required" aria-required="true">
                                                <label>Email</label>
                                                <input type="email" class="form-control" name="email" placeholder="We will try to reach you over this email address. We never Spam, PROMISE!!!" required="" aria-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group form-group-default input-groupt required" aria-required="true">
                                                <label>Phone</label>
                                                <input type="text" class="form-control" name="phone" placeholder="We would love to chat with you over phone, please share a valid phone number." required="" aria-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group form-group-default">
                                                <label>Message</label>
                                                <input type="text" class="form-control" name="message" placeholder="A small note about your query would help us better assist you." required="" aria-required="true" >
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-white">Fun Fact: Did you know, about 90% of the emails sent on a daily basis are spam? Help us fight one by proving you are human please.</p>
                                    <div class="g-recaptcha" data-sitekey="6Ld7mScTAAAAAJatNQSVyDyBEZmaOm1Q-1tSNw9a"></div>
                                    <div class="clearfix"></div>
                                    <hr/>
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Submit Details</button>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-5 col-md-6">

                        <div class="panel panel-transparent">
                            <div class="panel-heading">
                                <div class="panel-title">Why Video?
                                </div>
                            </div>
                            <div class="panel-body">
                                <h3 class="text-white">Showcase and guide users with a <br>
                                    better User Interface &amp; Experience.</h3>
                                <p class="text-white" style="opacity:0.5;">In today's digital world, video has become a popular way to promote any enterprise. At SimbaQuartz, we know what you as a business team is looking for and what will make a video stand out.
                                </p>
                                <br>
                                <p class="small hint-text m-t-5">VIA senior product manager
                                    <br> for UI/UX at REVOX</p>
                                <button class="btn btn-primary btn-cons">More</button>
                            </div>
                        </div>

                    </div>
                </div>
            <#--
                <div class="col-sm-7">
                    <h1 class="light text-white">XTrack | Expense Tracking Simplified</h1>
                    <hr/>
                    <h3 class="light text-white">An Awesome Experience is on its way!</h3>
                    <h5 class="text-white">Sign up for our spam free newsletter</h5>
                    <form class="m-t-25 m-b-20">
                        <div class="form-group form-group-default input-group no-border input-group-attached col-md-12  col-sm-12 col-xs-12">
                            <label>Email Address</label>
                            <input type="email" class="form-control" placeholder="johnsmith@abc.com">
                            <span class="input-group-btn">
                                <button class="btn btn-primary  btn-cons" type="button">Subscribe!</button>
                            </span>
                        </div>
                    </form>
                    <p class="text-white fs-12">Be first to find out when we Launch our product.</p>
                    <a class="btn btn-primary btn-lg btn-cons" href="https://app-xtrack.simbacart.com/xtrack/control/signUp">Get Started</a>
                    <a class="btn btn-link btn-lg btn-cons" type="button" href="/Getting-Started-With-XTrack-10000-content">Learn More</a>
                </div>
            </div>
-->
            </div>
        </div>
</section>
<section class="p-b-30 p-t-40">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <img src="<@ofbizContentUrl>/app/xtrack/assets/img/logo-350.png</@ofbizContentUrl>" width="152"
                     data-src-retina="<@ofbizContentUrl>/app/xtrack/assets/img/logo-350.png</@ofbizContentUrl>" class="logo inline m-r-50" alt="">
                <div class="m-t-10 p-l-20">
                    <ul class="no-style fs-11 no-padding font-arial">
                        <li class="inline no-padding">
                            <a href="https://www.facebook.com/simbaquartz" class="hint-text text-master p-l-10 p-r-10 b-r b-grey"><i class="fa fa-facebook"></i></a></li>
                        <li class="inline no-padding">
                            <a href="#" class="hint-text text-master p-l-10 p-r-10 b-r b-grey"><i class="fa fa-twitter"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-6 text-right font-arial sm-text-left">
                <p class="fs-11 no-margin small-text">Simplified <span class="hint-text">Expense Management</span> so you may focus on things that matter.
                </p>
                <p class="fs-11 muted">Copyright &copy; 2014 SimbaQuartz <a href="http://www.simbaquartz.com" target="_blank">www.simbaquartz.com</a>. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</section>

<script src="<@ofbizContentUrl>/sites/xtrack/assets/plugins/pace/pace.min.js</@ofbizContentUrl>" type="text/javascript"></script>
<script type="text/javascript" src="<@ofbizContentUrl>/sites/xtrack/pages/js/pages.image.loader.js</@ofbizContentUrl>"></script>
<script type="text/javascript" src="<@ofbizContentUrl>/sites/xtrack/assets/plugins/jquery/jquery-1.11.1.min.js</@ofbizContentUrl>"></script>
<script type="text/javascript" src="<@ofbizContentUrl>/sites/xtrack/assets/plugins/jquery-unveil/jquery.unveil.min.js</@ofbizContentUrl>"></script>
<script type="text/javascript" src="<@ofbizContentUrl>/sites/xtrack/pages/js/pages.frontend.js</@ofbizContentUrl>"></script>
</body>
</html>