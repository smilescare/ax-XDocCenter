<!DOCTYPE html>
<html>
<head>
    <script>
        var isProduction = window.location.hostname === 'code.visualstudio.com';
        var isHomePage = window.location.pathname === '/';
        var isDocsIndex = window.location.pathname.toLowerCase() === '/docs';
        var isPythonDocsPage = window.location.pathname.toLowerCase() === '/docs/languages/python';

    </script>
    <script>
        // this second script tag matters! Do not remove.
        if (isProduction) {
            if (isHomePage) {
                utmx('url','A/B');
            }
            if (isDocsIndex) {
                utmx('url','A/B');
            }
            if (isPythonDocsPage) {
                utmx('url','A/B');
            }
        }

    </script>    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-site-verification" content="cn5-gurGUvjtlzniBhOIPjfKHzuAplh_R9Ju9tuL0DM">
    <!-- Twitter and Facebook OpenGraph Metadata-->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@code">
    <meta name="description" content="Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.  Visual Studio Code is free and available on your favorite platform - Linux, Mac OSX, and Windows.">
    <meta name="msvalidate.01" content="D7003A550372D1205E5408F00BF1923B">
    <!-- Twitter and Facebook OpenGraph Metadata-->
    <meta property="og:title" content="Visual Studio Code - Code Editing. Redefined">
    <meta property="og:description" content="Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.  Visual Studio Code is free and available on your favorite platform - Linux, Mac OSX, and Windows.">
    <meta property="og:image" content="http://code.visualstudio.com/Facebook-Graph-Image.png">
    <meta property="og:url" content="http://code.visualstudio.com/">

    <link rel="shortcut icon" href="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/images/favicon.ico</@ofbizContentUrl>">
    <title>Document Center</title>

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/css/vendor.css</@ofbizContentUrl>">
    <link rel="stylesheet" href="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/css/main.css</@ofbizContentUrl>">
    <script>
        var appInsights=window.appInsights||function(config){
                    function r(config){t[config]=function(){var i=arguments;t.queue.push(function(){t[config].apply(t,i)})}}var t={config:config},u=document,e=window,o="script",s=u.createElement(o),i,f;for(s.src=config.url||"//az416426.vo.msecnd.net/scripts/a/ai.0.js",u.getElementsByTagName(o)[0].parentNode.appendChild(s),t.cookie=u.cookie,t.queue=[],i=["Event","Exception","Metric","PageView","Trace"];i.length;)r("track"+i.pop());return r("setAuthenticatedUserContext"),r("clearAuthenticatedUserContext"),config.disableExceptionTracking||(i="onerror",r("_"+i),f=e[i],e[i]=function(config,r,u,e,o){var s=f&&f(config,r,u,e,o);return s!==!0&&t["_"+i](config,r,u,e,o),s}),t
                }({
                    instrumentationKey:"f18193ef-b93a-4f73-b640-e2ddd40507ae"
                });

        window.appInsights=appInsights;
        appInsights.trackPageView();
    </script>

    <!-- Google Tag Manager -->
    <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-NK783Z" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-NK783Z');</script>
    <!-- End Google Tag Manager -->


    <link rel="alternate" type="application/atom+xml" title="RSS Feed for code.visualstudio.com" href="/feed.xml">
</head>
<body class="home">
<!-- WEDCS -->
<script type="text/javascript">
    // Defaults for varAutoFirePV and varCustomerTracking seem to work. varClickTracking doesn't, so called explicitly.
    var varClickTracking = 1;
    var Route = "20052";
    document.write("<script type='text/javascript' src='" + (window.location.protocol) + "//c.microsoft.com/ms.js'" + "'><\/script>");
</script>
<!-- End WEDCS -->
<div itemscope="" itemtype="http://schema.org/SoftwareApplication">
    <a id="skip-to-content" class="link-button" href="#main-content">Skip to content<i>&nbsp;</i><span class="glyphicon glyphicon-menu-down"></span></a>
    <div class="navbar navbar-inverse ">
        <nav role="navigation">
            <div class="container">
                <div class="nav navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href=""><span itemprop="name">Visual Studio Code</span></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a id="nav-docs" href="Docs/">Docs</a></li>
                        <li><a id="nav-updates" href="Updates/">Updates</a></li>
                        <li><a id="nav-blogs" href="blogs/">Blog</a></li>
                        <li><a href="https://marketplace.visualstudio.com/VSCode" target="_blank" id="nav-extensions">Extensions</a></li>
                        <li><a id="nav-faqs" href="Docs/supporting/faq/">FAQ</a></li>
                        <li class="visible-xs"><a href="https://www.github.com/Microsoft/vscode" target="_blank">GitHub Project</a></li>
                        <li class="search visible-xs"><a href="Search/">Search</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="Search/" title="Search" class="btn search-btn" id="nav-search">
                                <img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/search.svg</@ofbizContentUrl>" width="16px" height="16px" alt="Search">
                            </a>
                        </li>
                        <li class="search">
                            <form class="nav-search search-form">
                                <div class="input-group">
                                    <input type="text" name="q" class="search-box form-control" placeholder="Search Docs">
                                        <span class="input-group-btn">
                                            <button tabindex="-1" class="btn" type="submit">
                                                <img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/search.svg</@ofbizContentUrl>" width="16px" height="16px" alt="Search">
                                            </button>
                                        </span>
                                </div>
                            </form>                    </li>
                        <!-- this was hiden in the home and download page, keeping it for now -->
                        <li><a itemprop="downloadUrl" class="link-button" href="Download/" id="nav-download"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="16px" height="16px" alt="Download VS Code"><span class="hidden-sm">Download</span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>        <div class="updates-banner home ">
    <div class="container">
        <p class="message"><a href="Updates/" id="banner-link-updates">Version <span itemprop="softwareVersion">1.3</span></a> is now available! Read about the new features and fixes in June.</p>
    </div>
    <div role="button" title="Dismiss this update" class="dismiss-btn" id="banner-dismiss-btn"><span class="sr-only">Dismiss this update</span><span aria-hidden="true" class="glyph-icon"></span></div>
</div>        <div role="main" id="main-content">
    <div class="jumbotron home">
        <div class="container">
            <div class="row">
                <div class="col-md-4 copy">
                    <h1>Manging Documents. <strong>Redefined.</strong></h1>
                    <div class="lead">
                        <p>
                        <span itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                            <span itemprop="description">Free</span>.
                            <meta itemprop="price" content="0">
                            <meta itemprop="priceCurrency" content="USD">
                        </span> Open source. Runs everywhere.</p>
                    </div>
                    <div id="download-buttons" class="download-hero alt-downloads">
                        <!-- Download for users current OS -->
                        <button class="link-button dlink" data-os="osx">Get Started</button>
                        <button class="link-button dlink" data-os="win">Get Started</button>
                        <div class="linux">
                            <div class="flex-box">
                                <button class="link-button dlink" data-os="linux64_deb"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="18px" height="18px" alt="Download VS Code">.deb<small><br>Debian, Ubuntu</small></button>
                                <button class="link-button dlink" data-os="linux64_rpm"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="18px" height="18px" alt="Download VS Code">.rpm<small><br>Red Hat, Fedora, CentOS</small></button>
                            </div>
                            <p>
                                <a id="home-zip-archive-link" class="dlink" data-os="linux64">Zip archive</a> |  <a href="#linux32-downloads-insiders" data-toggle="collapse">32 bit versions</a>
                            </p>
                            <div class="collapse" id="linux32-downloads-insiders">
                                <ul class="list-unstyled text-center">
                                    <li><a id="home-deb-download-link" class="dlink" data-os="linux32_deb"><strong>.deb</strong> (32 bit)</a></li>
                                    <li><a id="home-rpm-download-link" class="dlink" data-os="linux32_rpm"><strong>.rpm</strong> (32 bit)</a></li>
                                    <li><a id="home-zip-download-link" class="dlink" data-os="linux32"><strong>.zip</strong> (32 bit)</a></li>
                                </ul>
                            </div>
                        </div>
                        <a class="link-button other-os" href="Download/">Download</a>
                        <p class="subtext text-center">Available on <a href="#alt-downloads">other platforms</a> and <a href="insiders/">insiders build</a>
                        </p>
                        <p class="terms">By using VS Code, you agree to its <span class="wrap-together"><a id="home-terms-link" href="#home-terms">license and privacy statement</a>.</span></p>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="screenshot"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="value-props">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-xs-6"><a class="value-prop" id="home-value-prop-intellisense-link" href="#meet-intellisense"><div class="value-prop-icon intellisense"></div>IntelliSense</a></div>
                <div class="col-sm-3 col-xs-6"><a class="value-prop" id="home-value-prop-debugging-link" href="#powerful-debugging"><div class="value-prop-icon debugging"></div>Debugging</a></div>
                <div class="col-sm-3 col-xs-6"><a class="value-prop" id="home-value-prop-git-link" href="#built-in-git"><div class="value-prop-icon git"></div>Built-in Git</a></div>
                <div class="col-sm-3 col-xs-6"><a class="value-prop" id="home-value-prop-extensions-link" href="#hundreds-of-extensions"><div class="value-prop-icon extensions-icon"></div>Extensions</a></div>
            </div>
        </div>
    </div>
    <div class="themes">

        <!--
        <div class="row">
            <div class="col-sm-12 header">
                <h2>Streamlined <b>+</b> Powerful</h2>
                <p>VS Code combines the streamlined UI of a modern editor with rich code assistance and navigation, and an integrated debugging experience &ndash; without the need for a full IDE.</p>
            </div>
        </div>
        -->


        <div id="meet-intellisense" class="swimlane">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/images/home-intellisense.svg</@ofbizContentUrl>" alt="Intellisense" class="screenshot">
                    </div>
                    <div class="col-sm-7 col-sm-push-1">
                        <h2>Meet IntelliSense.</h2>
                        <p>Go beyond syntax highlighting and autocomplete with IntelliSense, which provides smart completions based on variable types, function definitions, and imported modules.</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="powerful-debugging" class="swimlane">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-push-8">
                        <img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/images/home-debug.svg</@ofbizContentUrl>" alt="Debugging" class="screenshot">
                    </div>
                    <div class="col-sm-7 col-sm-pull-4">
                        <h2>Print statement debugging is a thing of the past.</h2>
                        <p>Debug code right from the editor. Launch or attach to your running apps and debug with break points, call stacks, and an interactive console.</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="built-in-git" class="swimlane">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/images/home-git.svg</@ofbizContentUrl>" alt="Git" class="screenshot">
                    </div>
                    <div class="col-sm-7 col-sm-push-1">
                        <h2>Git commands built-in.</h2>
                        <p>Working with Git has never been easier. Review diffs, stage files, and make commits right from the editor. Push and pull from any hosted Git service.</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="hundreds-of-extensions" class="swimlane hundreds-extensions">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-push-8">
                        <a id="home-marketplace-link" href="https://marketplace.visualstudio.com/VSCode" target="_blank"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/images/Hundreds-of-Extensions.png</@ofbizContentUrl>" class="hundreds-extensions-img" alt="Easily use extensions in VS Code"></a>
                    </div>
                    <div class="col-sm-7 col-sm-pull-4">
                        <h2>Extensible and customizable.</h2>
                        <p>Want even more features? Install extensions to add new languages, themes, debuggers, and to connect to additional services. Extensions run in separate processes, ensuring they won't slow down your editor. <a id="home-extension-gallery-doc-link" href="docs/editor/extension-gallery/">Learn more about extensions.</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="swimlane getting-started">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 vscode-for">
                        <h2>VS Code for</h2>
                    </div>
                    <div class="col-sm-6 home-languages-list-parent">
                        <div class="mask"></div>
                        <div class="supported-languages-list"></div>
                    </div>

                </div>
                <div class="row caption">
                    <div class="col-sm-12">
                        <a id="home-get-started-now-link" class="link-button" href="Docs/">Get started now</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div id="alt-downloads" class="swimlane alt-downloads home">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="buttons">
                        <div class="download">
                            <div class="logo windows"></div>
                            <button class="link-button dlink" data-os="win"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="18px" height="18px" alt="Download VS Code"><span itemprop="operatingSystem">Windows</span><small><br>Windows 7, 8, 10</small></button>
                            <p><a id="home-winzip-archive-lower-link" class="dlink" data-os="winzip">Zip archive</a></p>
                        </div>
                        <div class="download">
                            <div class="logo linux"></div>
                            <div class="linux">
                                <button class="link-button dlink" data-os="linux64_deb"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="18px" height="18px" alt="Download VS Code">.deb<small><br><span itemprop="operatingSystem">Debian</span>, <span itemprop="operatingSystem">Ubuntu</span></small></button>
                                <button class="link-button dlink" data-os="linux64_rpm"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="18px" height="18px" alt="Download VS Code">.rpm<small><br><span itemprop="operatingSystem">Red Hat</span>, <span itemprop="operatingSystem">Fedora</span>, <span itemprop="operatingSystem">CentOS</span></small></button>
                                <p>
                                    <a id="home-zip-archive-lower-link" class="dlink" data-os="linux64">Zip archive</a> |  <a href="#linux32-downloads-insiders-2" data-toggle="collapse">32 bit versions</a>
                                </p>
                                <div class="collapse" id="linux32-downloads-insiders-2">
                                    <ul class="list-unstyled text-center">
                                        <li><a id="home-linux-deb-lower-link" class="dlink" data-os="linux32_deb"><strong>.deb</strong> (32 bit)</a></li>
                                        <li><a id="home-linux-rpm-lower-link" class="dlink" data-os="linux32_rpm"><strong>.rpm</strong> (32 bit)</a></li>
                                        <li><a id="home-linux-zip-lower-link" class="dlink" data-os="linux32"><strong>.zip</strong> (32 bit)</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="download">
                            <div class="logo mac"></div>
                            <button class="link-button dlink" data-os="osx"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/icons/download.svg</@ofbizContentUrl>" width="18px" height="18px" alt="Download VS Code"><span itemprop="operatingSystem">OS X</span><small><br>OS X Yosemite, El Capitan</small></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <p class="terms text-center">
                    Looking for the Insiders build? Find it <a href="insiders/">here</a>.
                </p>
            </div>
            <div id="home-terms" class="terms">
                <h4>License and Privacy Terms</h4>
                <p>
                    By downloading and using Visual Studio Code, you agree to the <a id="home-license-link" href="License/">license terms</a> and <a href="http://go.microsoft.com/fwlink/?LinkID=528096&clcid=0x409">privacy statement</a> for Visual Studio Code. When this tool crashes, we automatically collect crash dumps so we can figure out what went wrong. If you don’t want to send us crash dumps,
                    go <a id="home-disable-crash-reporting-link" href="Docs/supporting/FAQ/#_how-to-disable-crash-reporting">here</a> to learn how to disable them.
                </p>
            </div>
        </div>
    </div>



</div>

    <meta itemprop="applicationCategory" content="Text Editor">
    <meta itemprop="screenshot" content="http://localhost:7000/home-screenshot-mac-lg.png">
    <meta itemprop="datePublished" content="2016-04-14">
    <meta itemprop="operatingSystem" content="Mac, Linux, Windows">
</div>
<footer role="contentinfo">
    <div class="container">
        <div class="row">
            <div class="left col-md-7">
                <span class="message">Hello from Seattle.</span>
                <a id="footer-twitter-follow-btn" class="twitter-follow-button" href="https://twitter.com/code" data-show-count="true" data-lang="en">
                    Follow @code
                </a>
                <div class="github-star-button">
                    <iframe title="GitHub star button" src="https://ghbtns.com/github-btn.html?user=Microsoft&repo=vscode&type=star&count=true" frameborder="0" scrolling="0" width="130px" height="20px"></iframe>
                </div>

                <script>window.twttr=(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],t=window.twttr||{};if(d.getElementById(id))return t;js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);t._e=[];t.ready=function(f){t._e.push(f);};return t;}(document,"script","twitter-wjs"));</script>
            </div>
            <div class="right col-md-5">
                <ul class="links">
                    <li><a id="footer-support-link" href="https://support.microsoft.com/en-us/assistedsupportproducts" target="_blank">Support</a></li>
                    <li><a id="footer-privacy-link" href="http://www.microsoft.com/privacystatement/en-us/core/default.aspx" target="_blank">Privacy</a></li>
                    <li><a id="footer-terms-link" href="http://www.microsoft.com/en-us/legal/intellectualproperty/copyright/default.aspx" target="_blank">Terms of Use</a></li>
                    <li><a id="footer-license-link" href="License/">License</a></li>
                </ul>
                <div class="copyright">
                    <a id="footer-microsoft-link" class="logo" href="http://www.microsoft.com"><img src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/images/microsoft-logo.png</@ofbizContentUrl>" height="20" alt="Microsoft homepage"></a>
                        <span>&copy; 2016 <span itemprop="publisher" itemscope="" itemtype="http://schema.org/Organization">
    <span itemprop="name">Microsoft</span></span></span>
                </div>
            </div>
        </div>
    </div>
</footer>    <!-- inject:js -->
<script src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/js/vendor.js</@ofbizContentUrl>"></script>
<script src="<@ofbizContentUrl>/xstatic/assets/theme/docs-Kerry/js/main.js</@ofbizContentUrl>"></script>
<!-- endinject -->

<script type="application/ld+json">
        {
            "@context" : "http://schema.org",
            "@type" : "Product",
            "name" : "Visual Studio Code",
            "logo": "https://code.visualstudio.com/Content/images/vscode.ico",
            "url" : "https://code.visualstudio.com",
            "potentialAction": {
              "@type": "SearchAction",
              "target": "https://code.visualstudio.com/Search?q={search_term_string}",
              "query-input": "required name=search_term_string"
            },
            "sameAs" : [
            "https://en.wikipedia.org/wiki/Visual_Studio_Code",
            "https://www.facebook.com/visualstudio",
            "https://twitter.com/code",
            "http://blogs.msdn.com/b/vscode"
            ]
        }
    </script>
</body>
</html>
