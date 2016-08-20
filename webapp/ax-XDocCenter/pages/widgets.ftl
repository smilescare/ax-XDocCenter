<#--Prettifies the date, returns output much like 'few moments ago', few mins ago, 3 days ago etc.-->
<#macro formatPrettyDate dateToFormat>
    <#assign dateFormat = "EEE, d MMM yyyy 'at' HH:mm aaa" >
    <#assign formattedDate = Static["org.ofbiz.base.util.UtilDateTime"].toDateString(dateToFormat, dateFormat) >
    <#assign prettyDate = Static["com.simbaquartz.doccenter.utils.UtilPrettyTime"].prettyTime.format(dateToFormat) >
<span title="${formattedDate}">${prettyDate}</span>
</#macro>