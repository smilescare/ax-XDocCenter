<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Page not found</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >

    <!-- Fabric core and Components CSS -->
    <link href="/xtrack/assets/lib/office-ui-fabric/css/fabric.css" type="text/css" rel="stylesheet" />
    <link href="/xtrack/assets/lib/office-ui-fabric/css/fabric.components.css" type="text/css" rel="stylesheet" />

</head>
<body>
<main class="container ax-loginContainer">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ms-u-slideLeftIn20">
            <h1 class="ms-font-su">Something went wrong...</h1>
            <hr/>
            <div class="ms-MessageBar ms-MessageBar--error">
                <div class="ms-MessageBar-content">
                    <div class="ms-MessageBar-icon">
                        <i class="ms-Icon ms-Icon--xCircle"></i>
                    </div>
                    <div class="ms-MessageBar-text">
                        <h1>An Error Occurred</h1>
                        <h3>Status Code : ${statusCode?if_exists} Not Found</h3>
                        <br>
                        <a href="mailto:support@simbaquartz.com" class="ms-Link">Contact Support</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>