<#include "component://ax-XDocCenter/webapp/ax-XDocCenter/pages/widgets.ftl" />
<div style="padding:10px 25px;">
    <ul class="list-inline">
        <#list recentDocs as recentDoc>
        <li style="margin-bottom: 10px;">
            <a href="#" style="text-decoration: none;">
                <div class="site-node" style="border-radius:2px;box-shadow:0 0 4px 0px #dbdbdb;background-color:#eff6fc;">
                    <div class="site-icon" style="padding:10px;float:left;"><i class="material-icons md-middle">description</i></div>
                    <div class="site-info" style="border-left:1px solid #f0f0f0;padding:5px 10px;background-color: #fff;">
                        ${recentDoc.contentName!}
                        <div style="font-size:11px;color:#666;padding:5px 0;">
                            ${recentDoc.description!("No Description")}
                        </div>
                        <div class="site-sub-title" style="text-align:right;padding-top:5px;font-size:9px;">
                            <i class="material-icons md-18 md-middle">access_time</i>&nbsp;&nbsp;Last modified <@formatPrettyDate recentDoc.lastModifiedDate />.</div>
                    </div>
                </div>
            </a>
        </li>
        </#list>
    </ul>
</div>
