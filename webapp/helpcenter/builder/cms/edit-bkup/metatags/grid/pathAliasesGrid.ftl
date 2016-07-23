<#macro preparePathAlias aliasList>
    <#list aliasList as alias>
    {
	    id: 	'${alias_index}',
	    webSiteId: 	'${alias.webSiteId}',
	    pathAlias : '${alias.pathAlias}',
	    aliasTo : 	'${alias.aliasTo?default("N/A")}',
	    contentId : '${alias.contentId?default("N/A")}',
	    mapKey : '${alias.mapKey?default("N/A")}'
        <#if alias_has_next>
        },
        <#else>
        }
        </#if>
    </#list>
</#macro>
<div dojoType="dojo.data.ItemFileWriteStore"
    id="addFeatureTypeStore"
    jsid="addFeatureTypeStore"
    data="{  identifier: 'id', label: 'pathAlias', items : [<#if (aliases?has_content)><@preparePathAlias aliasList = aliases/></#if>] }"
    clearOnClose="true">
</div>
<div dojoType="dojox.grid.EnhancedGrid" id="addFeatureTypeGrids"
    store="addFeatureTypeStore" query="{ pathAlias : '*' }"
    jsId="addFeatureTypeGrids" 
    structure="GridUtils.structures.content.pathAliases"
    rowIdentifierAttr="websiteId" editable="false"
    defaultRowHeight="24" noDataMessage="No records found">
    <script type="dojo/connect" event="onRowClick" args="e">
		if(e.cellIndex == 0){//on delete click
        	var rowIndex = e.rowIndex;
	    	var item = this.getItem(rowIndex), store = this.store;
			var externalLoginKey = dijit.byId("hidExternalLoginKey").get("value");
			//prepare restful url
			var targetUrl = "/content/control/removeWebSitePathAliasJson?externalLoginKey=" + externalLoginKey;
			
			Scadmin.doBind(
				{	
					pathAlias: item.pathAlias,
					webSiteId: item.webSiteId,
				}, 
				targetUrl, 
				function(response) {
					//refresh the pane to reflect new changes
					dijit.byId("cp-content-pathalias").refresh();
				}, 
				null, 
				function() {
					Scadmin.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error"});
				},
				true
			);
	        return false;
		}
    </script>
</div>