<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Recover Password | AppEx XTrack | Expense Tracking Simplified</title>
    <link rel="shortcut icon" href="<@ofbizContentUrl>/xtrack/assets/img/favicon.ico</@ofbizContentUrl>" type="image/x-icon" >

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >

    <!-- Fabric core and Components CSS -->
    <link href="<@ofbizContentUrl>/xstatic/assets/lib/office-ui-fabric/css/fabric.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <link href="<@ofbizContentUrl>/xstatic/assets/lib/office-ui-fabric/css/fabric.components.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />

    <!-- Application-specific CSS -->
    <link href="<@ofbizContentUrl>/xstatic/assets/app/common/css/app.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <link href="<@ofbizContentUrl>/xstatic/assets/app/common/css/Form.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <link href="<@ofbizContentUrl>/xstatic/assets/app/common/css/login.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />

</head>
<body style="background-color: #fff;">
<main class="container ax-loginContainer">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-right">
        <#include "widgets/branding/brandWidget.ftl" >
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  ms-u-slideLeftIn20">
            <div class="Content">
                <div>
                    <div class="Intro">
                        <h2 class="Intro-title ms-fontSize-xl">Recover your password</h2>
                        <hr/>
                    </div>
                    <#-- render messages -->
                    <#include	"component://ax-XTrack/webapp/ax-XTrack/pages/common/messages.ftl" parse="true" />
                    <form class="Form" method="post" action="<@ofbizUrl>forgotpassword${previousParams?if_exists}</@ofbizUrl>" name="forgotpassword">
                        <input type="hidden" name="EMAIL_PASSWORD" value="RECOVER"/>
                        <div class="ms-TextField is-required">
                            <label class="ms-Label">User ID</label>
                            <input class="ms-TextField-field" type="text" name="USERNAME">
                            <span class="ms-TextField-description">Username that requires a password reset.</span>
                        </div>
                        <div class="SubmitButton">
                            <button class="ms-Button ms-Button--primary"><span class="ms-Button-label">Generate New Password</span></button>
                            <a href="<@ofbizUrl>authview</@ofbizUrl>" class="ms-Link pull-right">&nbsp;Back</a>
                        </div>
                    </form>
                    <#include "component://ax-XTrack/webapp/ax-XTrack/pages/widgets/branding/copyright.ftl" >
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>