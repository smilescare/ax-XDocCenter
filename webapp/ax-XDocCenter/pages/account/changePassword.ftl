<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Change your password | AppEx XTrack | Expense Tracking Simplified</title>
    <link rel="shortcut icon" href="<@ofbizContentUrl>/xtrack/assets/img/favicon.ico</@ofbizContentUrl>" type="image/x-icon" >

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
    <!-- jQuery, required for the sample Component plugins -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <!-- Fabric core and Components CSS -->
    <link href="<@ofbizContentUrl>/lib/office-ui-fabric/css/fabric.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <link href="<@ofbizContentUrl>/lib/office-ui-fabric/css/fabric.components.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />

    <!-- Application-specific CSS -->
    <link href="<@ofbizContentUrl>/app/common/css/app.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <link href="<@ofbizContentUrl>/app/common/css/Form.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />
    <link href="<@ofbizContentUrl>/app/common/css/login.css</@ofbizContentUrl>" type="text/css" rel="stylesheet" />

</head>
<body>
<main class="container ax-loginContainer">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-right">
                <#include "widgets/branding/brandWidget.ftl" >
            </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  ms-u-slideLeftIn20">
            <div class="Content">
                <div>
                    <#-- render messages -->
                    <#include	"component://ax-XTrack/webapp/ax-XTrack/pages/common/messages.ftl" parse="true" />
                    <div class="Intro">
                        <h2 class="Intro-title ms-fontSize-xl">Please change your password to proceed</h2>
                        <hr/>
                    </div>
                    <#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
                    <form class="Form"  action="<@ofbizUrl>login</@ofbizUrl>" method="post">
                        <input type="hidden" name="requirePasswordChange" value="Y"/>
                        <input type="hidden" name="USERNAME" value="${username}"/>
                        <div class="ms-TextField is-required">
                            <label class="ms-Label">User ID</label>
                            <label class="ms-Label ms-fontWeight-semibold">${username}</label>
                        </div>
                        <div class="ms-TextField is-required">
                            <label class="ms-Label">Current Password</label>
                            <input class="ms-TextField-field" type="password" name="PASSWORD">
                            <span class="ms-TextField-description">Existing password.</span>
                        </div>
                        <div class="ms-TextField is-required">
                            <label class="ms-Label">New Password</label>
                            <input class="ms-TextField-field" type="password" name="newPassword">
                            <span class="ms-TextField-description">At least 8 characters. A mix of letters and numbers is best.</span>
                        </div>
                        <div class="ms-TextField is-required">
                            <label class="ms-Label">Confirm Password</label>
                            <input class="ms-TextField-field" type="password" name="newPasswordVerify">
                            <span class="ms-TextField-description">At least 8 characters. A mix of letters and numbers is best.</span>
                        </div>
                        <div class="SubmitButton">
                            <button class="ms-Button ms-Button--primary"><span class="ms-Button-label">Continue</span></button>
                        </div>
                    </form>
                    <#include "component://ax-XTrack/webapp/ax-XTrack/pages/widgets/branding/copyright.ftl" >
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Fabric jQuery plugin for DatePicker component -->
<script src="<@ofbizContentUrl>/xtrack/assets/lib/office-ui-fabric/js/fabric.js</@ofbizContentUrl>"></script>
<script src="<@ofbizContentUrl>/xtrack/assets/lib/office-ui-fabric/lib/PickaDate.js</@ofbizContentUrl>"></script>
<script>
    // Check to make sure the DatePicker plugin is available. Then, find
    // the element you wish to run DatePicker on, and run the plugin on it.
    var DatePickerElements = document.querySelectorAll(".ms-DatePicker");
    for(var i = 0; i < DatePickerElements.length; i++) {
        new fabric['DatePicker'](DatePickerElements[i]);
    }

    var DropdownHTMLElements = document.querySelectorAll('.ms-Dropdown');
    for (var i = 0; i < DropdownHTMLElements.length; ++i) {
        var Dropdown = new fabric['Dropdown'](DropdownHTMLElements[i]);
    }
</script>
</body>
</html>