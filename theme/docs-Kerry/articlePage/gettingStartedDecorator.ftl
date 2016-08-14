<!DOCTYPE html>
<html>
<head>
    <script>
        var isProduction = window.location.hostname === 'code.visualstudio.com';
        var isHomePage = window.location.pathname === '/';
        var isDocsIndex = window.location.pathname.toLowerCase() === '/docs';
        var isPythonDocsPage = window.location.pathname.toLowerCase() === '/docs/languages/python';

        function downloadExperiment(experimentId) {

            // Copied code from Google analytics
            // except for experimentId variable
            function utmx_section(){}function utmx(){}(function(){var
                    k=experimentId,d=document,l=d.location,c=d.cookie;
                if(l.search.indexOf('utm_expid='+k)>0)return;
                function f(n){if(c){var i=c.indexOf(n+'=');if(i>-1){var j=c.
                indexOf(';',i);return escape(c.substring(i+n.length+1,j<0?c.
                        length:j))}}}var x=f('__utmx'),xx=f('__utmxx'),h=l.hash;d.write(
                        '<sc'+'ript src="'+'http'+(l.protocol=='https:'?'s://ssl':
                                '://www')+'.google-analytics.com/ga_exp.js?'+'utmxkey='+k+
                        '&utmx='+(x?x:'')+'&utmxx='+(xx?xx:'')+'&utmxtime='+new Date().
                        valueOf()+(h?'&utmxhash='+escape(h.substr(1)):'')+
                        '" type="text/javascript" charset="utf-8"><\/sc'+'ript>')})();

        }

        // Remember to create if statements in lower script as well.
        if (isProduction) {
            if (isHomePage) {
                downloadExperiment('101350005-24');
            }
            if (isDocsIndex) {
                downloadExperiment('101350005-20');
            }
            if (isPythonDocsPage) {
                downloadExperiment('101350005-19');
            }
        }
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

    <meta name="description" content="Find out how to set-up and get the most from Visual Studio Code.  Optimized for building and debugging modern web and cloud applications.  Visual Studio Code is free and available on your favorite platform - Linux, Mac OSX, and Windows.">
    <!-- Twitter and Facebook OpenGraph Metadata-->
    <meta property="og:title" content="Documentation for Visual Studio Code">
    <meta property="og:description" content="Find out how to set-up and get the most from Visual Studio Code.  Optimized for building and debugging modern web and cloud applications.  Visual Studio Code is free and available on your favorite platform - Linux, Mac OSX, and Windows.">
    <meta property="og:image" content="http://code.visualstudio.com/Facebook-Graph-Image.png">
    <meta property="og:url" content="http://code.visualstudio.com/Docs">

    <link rel="shortcut icon" href="../images/favicon.ico">
    <title>Documentation for Visual Studio Code</title>

    <!-- TOFIX Not sure why bower isn't pulling this in-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<@ofbizContentUrl>/theme/docs-Kerry/css/vendor.css</@ofbizContentUrl>">
    <link rel="stylesheet" href="<@ofbizContentUrl>/theme/docs-Kerry/css/main.css</@ofbizContentUrl>">
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
<body>
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
                    <a class="navbar-brand" href="../"><span itemprop="name">Visual Studio Code</span></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active"><a id="nav-docs" href="">Docs</a></li>
                        <li><a id="nav-updates" href="../Updates/">Updates</a></li>
                        <li><a id="nav-blogs" href="../blogs/">Blog</a></li>
                        <li><a href="https://marketplace.visualstudio.com/VSCode" target="_blank" id="nav-extensions">Extensions</a></li>
                        <li><a id="nav-faqs" href="supporting/faq/">FAQ</a></li>
                        <li class="visible-xs"><a href="https://www.github.com/Microsoft/vscode" target="_blank">GitHub Project</a></li>
                        <li class="search visible-xs"><a href="../Search/">Search</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="../Search/" title="Search" class="btn search-btn" id="nav-search">
                                <img src="../icons/search.svg" width="16px" height="16px" alt="Search">
                            </a>
                        </li>
                        <li class="search">
                            <form class="nav-search search-form">
                                <div class="input-group">
                                    <input type="text" name="q" class="search-box form-control" placeholder="Search Docs">
                                        <span class="input-group-btn">
                                            <button tabindex="-1" class="btn" type="submit">
                                                <img src="../icons/search.svg" width="16px" height="16px" alt="Search">
                                            </button>
                                        </span>
                                </div>
                            </form>                    </li>
                        <!-- this was hiden in the home and download page, keeping it for now -->
                        <li><a itemprop="downloadUrl" class="link-button" href="../Download/" id="nav-download"><img src="../icons/download.svg" width="16px" height="16px" alt="Download VS Code"><span class="hidden-sm">Download</span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>        <div class="updates-banner  ">
    <div class="container">
        <p class="message"><a href="../Updates/" id="banner-link-updates">Version <span itemprop="softwareVersion">1.3</span></a> is now available! Read about the new features and fixes in June.</p>
    </div>
    <div role="button" title="Dismiss this update" class="dismiss-btn" id="banner-dismiss-btn"><span class="sr-only">Dismiss this update</span><span aria-hidden="true" class="glyph-icon"></span></div>
</div>        <div role="main" id="main-content">
    <div class="container body-content docs">
        <div class="row">
            <div class="col-md-2"> <nav id="docs-navbar" class="docs-nav visible-md visible-lg">
                <ul class="nav" id="main-nav">
                    <li><a class="docs-home" href="">Overview</a></li>


                    <li class="panel collapsed">
                        <a class="area" href="#setup-articles" data-parent="#main-nav" data-toggle="collapse">Setup</a>
                        <ul id="setup-articles" class="collapse ">

                            <li><a href="setup/setup-overview/">Overview</a></li>

                            <li><a href="setup/osx/">OS X</a></li>

                            <li><a href="setup/linux/">Linux</a></li>

                            <li><a href="setup/windows/">Windows</a></li>

                            <li><a href="setup/additional-components/">Additional Components</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#editor-articles" data-parent="#main-nav" data-toggle="collapse">Editor</a>
                        <ul id="editor-articles" class="collapse ">

                            <li><a href="editor/codebasics/">The Basics</a></li>

                            <li><a href="editor/extension-gallery/">Extension Marketplace</a></li>

                            <li><a href="editor/editingevolved/">Editing Evolved</a></li>

                            <li><a href="editor/versioncontrol/">Version Control</a></li>

                            <li><a href="editor/debugging/">Debugging</a></li>

                            <li><a href="editor/tasks/">Tasks</a></li>

                            <li><a href="editor/integrated-terminal/">Integrated Terminal</a></li>

                            <li><a href="editor/tabs/">Tabs</a></li>

                            <li><a href="editor/accessibility/">Accessibility</a></li>

                            <li><a href="editor/whyvscode/">Why VS Code</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#customization-articles" data-parent="#main-nav" data-toggle="collapse">Customization</a>
                        <ul id="customization-articles" class="collapse ">

                            <li><a href="customization/overview/">Overview</a></li>

                            <li><a href="customization/userandworkspace/">User and Workspace Settings</a></li>

                            <li><a href="customization/keybindings/">Key Bindings</a></li>

                            <li><a href="customization/userdefinedsnippets/">Snippets</a></li>

                            <li><a href="customization/colorizer/">Colorizer</a></li>

                            <li><a href="customization/themes/">Themes</a></li>

                            <li><a href="customization/locales/">Display Language</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#languages-articles" data-parent="#main-nav" data-toggle="collapse">Languages</a>
                        <ul id="languages-articles" class="collapse ">

                            <li><a href="languages/overview/">Overview</a></li>

                            <li><a href="languages/javascript/">JavaScript</a></li>

                            <li><a href="languages/csharp/">C#</a></li>

                            <li><a href="languages/cpp/">C++</a></li>

                            <li><a href="languages/json/">JSON</a></li>

                            <li><a href="languages/html/">HTML</a></li>

                            <li><a href="languages/php/">PHP</a></li>

                            <li><a href="languages/python/">Python</a></li>

                            <li><a href="languages/markdown/">Markdown</a></li>

                            <li><a href="languages/typescript/">TypeScript</a></li>

                            <li><a href="languages/css/">CSS, Sass and Less</a></li>

                            <li><a href="languages/dockerfile/">Dockerfile</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#runtimes-articles" data-parent="#main-nav" data-toggle="collapse">Runtimes</a>
                        <ul id="runtimes-articles" class="collapse ">

                            <li><a href="runtimes/nodejs/">Node.js</a></li>

                            <li><a href="runtimes/dotnet/">.NET Core</a></li>

                            <li><a href="runtimes/unity/">Unity</a></li>

                            <li><a href="runtimes/office/">Office</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#extensions-articles" data-parent="#main-nav" data-toggle="collapse">Extensions</a>
                        <ul id="extensions-articles" class="collapse ">

                            <li><a href="extensions/overview/">Overview</a></li>

                            <li><a href="extensions/example-hello-world/">Example-Hello World</a></li>

                            <li><a href="extensions/example-word-count/">Example-Word Count</a></li>

                            <li><a href="extensions/example-language-server/">Example-Language Server</a></li>

                            <li><a href="extensions/example-debuggers/">Example-Debuggers</a></li>

                            <li><a href="extensions/patterns-and-principles/">Principles and Patterns</a></li>

                            <li><a href="extensions/debugging-extensions/">Running and Debugging Extensions</a></li>

                            <li><a href="extensions/install-extension/">Installing Extensions</a></li>

                            <li><a href="extensions/testing-extensions/">Testing Extensions</a></li>

                            <li><a href="extensions/our-approach/">Our Approach</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#extensionapi-articles" data-parent="#main-nav" data-toggle="collapse">Extensibility Reference</a>
                        <ul id="extensionapi-articles" class="collapse ">

                            <li><a href="extensionAPI/overview/">Overview</a></li>

                            <li><a href="extensionAPI/extension-manifest/">Extension Manifest</a></li>

                            <li><a href="extensionAPI/extension-points/">Contribution Points</a></li>

                            <li><a href="extensionAPI/activation-events/">Activation Events</a></li>

                            <li><a href="extensionAPI/vscode-api/">API vscode namespace</a></li>

                            <li><a href="extensionAPI/vscode-api-commands/">API complex commands</a></li>

                            <li><a href="extensionAPI/api-debugging/">API debugging</a></li>

                        </ul>
                    </li>



                    <li class="panel collapsed">
                        <a class="area" href="#tools-articles" data-parent="#main-nav" data-toggle="collapse">Tools</a>
                        <ul id="tools-articles" class="collapse ">

                            <li><a href="tools/vscecli/">Publishing Tool</a></li>

                            <li><a href="tools/yocode/">Extension Generator</a></li>

                            <li><a href="tools/samples/">Samples</a></li>

                        </ul>
                    </li>




                </ul>
            </nav>
                <nav id="small-nav" class="docs-nav hidden-md hidden-lg">
                    <h4>Topics</h4>
                    <select id="small-nav-dropdown">
                        <option value="/docs">Overview</option>


                        <optgroup label="Setup">

                            <option value="/docs/setup/setup-overview">Overview</option>

                            <option value="/docs/setup/osx">OS X</option>

                            <option value="/docs/setup/linux">Linux</option>

                            <option value="/docs/setup/windows">Windows</option>

                            <option value="/docs/setup/additional-components">Additional Components</option>

                        </optgroup>



                        <optgroup label="Editor">

                            <option value="/docs/editor/codebasics">The Basics</option>

                            <option value="/docs/editor/extension-gallery">Extension Marketplace</option>

                            <option value="/docs/editor/editingevolved">Editing Evolved</option>

                            <option value="/docs/editor/versioncontrol">Version Control</option>

                            <option value="/docs/editor/debugging">Debugging</option>

                            <option value="/docs/editor/tasks">Tasks</option>

                            <option value="/docs/editor/integrated-terminal">Integrated Terminal</option>

                            <option value="/docs/editor/tabs">Tabs</option>

                            <option value="/docs/editor/accessibility">Accessibility</option>

                            <option value="/docs/editor/whyvscode">Why VS Code</option>

                        </optgroup>



                        <optgroup label="Customization">

                            <option value="/docs/customization/overview">Overview</option>

                            <option value="/docs/customization/userandworkspace">User and Workspace Settings</option>

                            <option value="/docs/customization/keybindings">Key Bindings</option>

                            <option value="/docs/customization/userdefinedsnippets">Snippets</option>

                            <option value="/docs/customization/colorizer">Colorizer</option>

                            <option value="/docs/customization/themes">Themes</option>

                            <option value="/docs/customization/locales">Display Language</option>

                        </optgroup>



                        <optgroup label="Languages">

                            <option value="/docs/languages/overview">Overview</option>

                            <option value="/docs/languages/javascript">JavaScript</option>

                            <option value="/docs/languages/csharp">C#</option>

                            <option value="/docs/languages/cpp">C++</option>

                            <option value="/docs/languages/json">JSON</option>

                            <option value="/docs/languages/html">HTML</option>

                            <option value="/docs/languages/php">PHP</option>

                            <option value="/docs/languages/python">Python</option>

                            <option value="/docs/languages/markdown">Markdown</option>

                            <option value="/docs/languages/typescript">TypeScript</option>

                            <option value="/docs/languages/css">CSS, Sass and Less</option>

                            <option value="/docs/languages/dockerfile">Dockerfile</option>

                        </optgroup>



                        <optgroup label="Runtimes">

                            <option value="/docs/runtimes/nodejs">Node.js</option>

                            <option value="/docs/runtimes/dotnet">.NET Core</option>

                            <option value="/docs/runtimes/unity">Unity</option>

                            <option value="/docs/runtimes/office">Office</option>

                        </optgroup>



                        <optgroup label="Extensions">

                            <option value="/docs/extensions/overview">Overview</option>

                            <option value="/docs/extensions/example-hello-world">Example-Hello World</option>

                            <option value="/docs/extensions/example-word-count">Example-Word Count</option>

                            <option value="/docs/extensions/example-language-server">Example-Language Server</option>

                            <option value="/docs/extensions/example-debuggers">Example-Debuggers</option>

                            <option value="/docs/extensions/patterns-and-principles">Principles and Patterns</option>

                            <option value="/docs/extensions/debugging-extensions">Running and Debugging Extensions</option>

                            <option value="/docs/extensions/install-extension">Installing Extensions</option>

                            <option value="/docs/extensions/testing-extensions">Testing Extensions</option>

                            <option value="/docs/extensions/our-approach">Our Approach</option>

                        </optgroup>



                        <optgroup label="Extensibility Reference">

                            <option value="/docs/extensionAPI/overview">Overview</option>

                            <option value="/docs/extensionAPI/extension-manifest">Extension Manifest</option>

                            <option value="/docs/extensionAPI/extension-points">Contribution Points</option>

                            <option value="/docs/extensionAPI/activation-events">Activation Events</option>

                            <option value="/docs/extensionAPI/vscode-api">API vscode namespace</option>

                            <option value="/docs/extensionAPI/vscode-api-commands">API complex commands</option>

                            <option value="/docs/extensionAPI/api-debugging">API debugging</option>

                        </optgroup>



                        <optgroup label="Tools">

                            <option value="/docs/tools/vscecli">Publishing Tool</option>

                            <option value="/docs/tools/yocode">Extension Generator</option>

                            <option value="/docs/tools/samples">Samples</option>

                        </optgroup>




                    </select>
                </nav> </div>
            <div class="col-sm-9 col-md-8 body">
                <div id="confirmation" class="alert alert-success">
                    <h1>Thanks for downloading VS Code<span id="os-name-text"></span>!</h1>
                    <p>Download not starting?  Try this <a href="#" id="direct-link">direct download link.</a></p>
                    <p>Please take a few seconds and help us improve ... <a href="https://go.microsoft.com/fwlink/?LinkId=808081" target="_blank">click to take survey.</a></p>
                </div>


                <div>
                    <h1>Getting Started</h1>
                    <p>Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, OS X and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js and has a rich ecosystem of extensions for other languages (C++, C#, Python, PHP) and runtimes.</p>
                </div>

                <div>
                    <h2 id="vscode-in-action">Visual Studio Code in Action</h2>
                    <div class="carousel">
                        <div id="wow-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <a id="carousel-edit" href="editor/editingevolved/" class="edit"></a>
                                    <div class="caption">
                                        <span class="title">Fast, Powerful Editing:</span>
                                    <span>Catch problems quickly with <a id="carousel-errors-warning" href="editor/editingevolved/#_errors-warnings">highlighted errors</a>. <a href="editor/editingevolved/#_selection-multicursor">Multi-cursor editing</a>, <a id="carousel-parameter-hints" href="editor/editingevolved/#_parameter-hints">parameter hints</a>, and other fast editing features make VS Code fly.
                                    </span>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="editor/editingevolved/#_intellisense" class="intellisense"></a>
                                    <div class="caption">
                                        <span class="title">IntelliSense:</span>
                                        <span>See <a id="carousel-intellisense" href="editor/editingevolved/#_intellisense">smart completions and in context documentation</a> for variable types, function definitions, and imported modules.</span>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="editor/editingevolved/" class="peek"></a>
                                    <div class="caption">
                                        <span class="title">Code Navigation and Refactoring:</span>
                                    <span>Browse your source code quickly using <a id="carousel-peek" href="editor/editingevolved/#_peek">peek</a> and <a id="carousel-goto-definition" href="editor/editingevolved/#_go-to-definition">navigate to definition</a>. Refactoring is now a breeze.
                                    </span>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="editor/versioncontrol/" class="git"></a>
                                    <div class="caption">
                                        <span class="title">Integrated Git Support:</span>
                                    <span>Speed up your release cycle with <a id="carousel-git" href="editor/versioncontrol/">Git support</a>. Visually review your changes and commit them without losing focus.
                                    </span>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="editor/debugging/" class="debug"></a>
                                    <div class="caption">
                                        <span class="title">Integrated Debugging:</span>
                                        <span><a id="carousel-breakpoints" href="editor/debugging/#_breakpoints">Stop on break points</a>, <a id="carousel-data-inspection" href="editor/debugging/#_data-inspection">inspect and watch variables</a>, leverage the <a id="carousel-debug-console" href="editor/debugging/#_debug-console">interactive REPL</a> and hover to inspect variables in context.</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#wow-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#wow-carousel" data-slide-to="1"></li>
                                <li data-target="#wow-carousel" data-slide-to="2"></li>
                                <li data-target="#wow-carousel" data-slide-to="3"></li>
                                <li data-target="#wow-carousel" data-slide-to="4"></li>
                            </ol>
                        </div>
                    </div>
                </div>

                <h2 id="top-extensions">Most Popular Extensions</h2>
                <p>Enable additional languages, themes, debuggers, commands, and more. VS Code's growing community shares their
                    secret sauce to improve your workflow.</p>
                <div class="marketplace-extensions-top"></div>
                <p class="text-right">
                    <a href="https://marketplace.visualstudio.com/vscode" target="_blank">See more in the Marketplace</a>
                </p>

                <div>
                    <h2 id="first-steps">First Steps</h2>
                    <p>To get the most out of Visual Studio Code, start by reviewing a few introductory topics:</p>
                    <div>
                        <p><a id="docs-index-setup-link" href="setup/setup-overview/">Setup</a> - Install VS Code for your platform and configure the tool set for your development needs.</p>
                        <p><a id="docs-index-codebasics-link" href="editor/codebasics/">The Basics</a> - Introduction to the basic UI, commands, and features of the VS Code editor.</p>
                        <p><a id="docs-index-workspaces-link" href="customization/userandworkspace/">Settings</a> - Customize VS Code for how you like to work.</p>
                        <p><a id="docs-index-languages-link" href="languages/overview/">Languages</a> - Learn about VS Code's support for your favorite programming languages.</p>
                        <p><a id="docs-index-nodejs-link" href="runtimes/nodejs/">Node.js</a> - This tutorial gets you quickly running and debugging a Node.js web app.</p>
                        <p><a id="docs-index-whyvscode-link" href="editor/whyvscode/">Why VS Code?</a> - Read about the design philosophy and architecture of VS Code.</p>
                    </div>
                </div>

                <div>
                    <h2 id="download">Downloads</h2>
                    <p><a id="docs-index-download-link" href="../download/">Download VS Code</a> - Quickly find the appropriate install for your platform (Windows, OS X and Linux).</p>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div>
                            <h2 id="privacy">Privacy</h2>
                            <p>By default, VS Code auto-updates to new versions, and collects usage data and crash report information. You
                                may opt out of these defaults by disabling them as instructed below:</p>
                            <div>
                                <p><a id="docs-index-autoupdates-link" href="supporting/faq/#_how-do-i-opt-out-of-vs-code-autoupdates">How do I disable auto update?</a></p>
                                <p><a id="docs-index-crash-reporting-link" href="supporting/faq/#_how-to-disable-crash-reporting">How do I disable crash reporting?</a></p>
                                <p><a id="docs-index-disable-telemetry-link" href="supporting/faq/#_how-to-disable-telemetry-reporting">How do I disable usage reporting?</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="feedback"></div>
            </div>
            <div class="hidden-xs col-sm-3 col-md-2">
                <nav id="docs-subnavbar">
                    <h4>Getting Started</h4>
                    <ul class="nav">
                        <li><a id="docs-index-nav-vscode-in-action-link" href="#vscode-in-action">VS Code in Action</a></li>
                        <li><a id="docs-index-nav-top-extensions-link" href="#top-extensions">Top Extensions</a></li>
                        <li><a id="docs-index-nav-firststeps-link" href="#first-steps">First Steps</a></li>
                        <li><a id="docs-index-nav-downloads-link" href="#download">Downloads</a></li>
                        <li><a id="docs-index-nav-privacy-link" href="#privacy">Privacy</a></li>
                    </ul>
                    <div class="connect-widget"></div>
                </nav>
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
                    <li><a id="footer-license-link" href="../License/">License</a></li>
                </ul>
                <div class="copyright">
                    <a id="footer-microsoft-link" class="logo" href="http://www.microsoft.com"><img src="../images/microsoft-logo.png" height="20" alt="Microsoft homepage"></a>
                        <span>&copy; 2016 <span itemprop="publisher" itemscope="" itemtype="http://schema.org/Organization">
    <span itemprop="name">Microsoft</span></span></span>
                </div>
            </div>
        </div>
    </div>
</footer>    <!-- inject:js -->
<script src="<@ofbizContentUrl>/theme/docs-Kerry/js/vendor.js</@ofbizContentUrl>"></script>
<script src="<@ofbizContentUrl>/theme/docs-Kerry/js/main.js</@ofbizContentUrl>"></script>
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
