<#-- Help tooltip, renders an icon and associates a tooltip -->
<#macro helpTooltip widgetId="" position="below" tooltipText="Help text" iconClass="">
    <span id="${widgetId}" style="cursor:pointer;" class="pull-right"><i class="material-icons md-middle ${iconClass}">help</i></span>
    <div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'${widgetId}',position:['${position}']">
        <div style="max-width:400px;text-align:justify;">
        ${tooltipText}
        </div>
    </div>
</#macro>
