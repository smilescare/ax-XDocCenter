<#if !(webSiteId?exists)>
	<#-- if not available in context, try looking up in paramers -->
	<#assign webSiteId = parameters.webSiteId?if_exists >
</#if>
<#if (webSiteId?exists && webSiteId?has_content)>
	<#-- make sure we've at least one children to get started -->
	<#if ( (subsites?exists) && (subsites?size > 0) )>
		<#-- context menu for the tree -->
		<div data-dojo-type="dijit.Menu" id="tree_menu" style="display: none;">
			<#-- New Article -->
		    <div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>language</i></div><div class='site-info'>New Article<div class='site-sub-title'>Create a new article under the selected node.</div></div></div>" showLabel="true">
				<script type="dojo/connect" data-dojo-event="onClick" >
					var tn = dijit.byNode(this.getParent().currentTarget);
                    var item = tn.focusedChild.item;
					var contentDetailPane = dijit.byId("cpManageContentDetails");
					var contentRootId = "${contentRoot?if_exists}";
					
					contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=SUB_CONTENT" 
												+ "&dataResourceTypeId=ELECTRONIC_TEXT" 
												+ "&contentIdFrom=" + item.contentId 
												+ "&contentRoot=" + contentRootId  
												+ "&webSiteId=${webSiteId?if_exists}";
					contentDetailPane.refresh();
				</script>
			</div>
			<#-- Copy Link -->
		    <div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>link</i></div><div class='site-info'>Copy Link<div class='site-sub-title'>Copy the article link into clipboard.</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					var tn = dijit.byNode(this.getParent().currentTarget);
                    var item = tn.focusedChild.item;
                    
                    var itemLink = item.altUrl;
                    App.showCopyLink(itemLink);
				</script>
			</div>
			<#-- Duplicate article -->
			<div data-dojo-type="dijit/MenuItem" 
				label="<div class='site-node'><div class='site-icon'><i class='material-icons color-themePrimary'>content_copy</i></div><div class='site-info'>Duplicate<div class='site-sub-title'>Creates a copy of the artifact at the same node.</div></div></div>" showLabel="true">
				<script type="dojo/method" event="onClick" args="item">
					duplicateContentDialog.show();
				</script>
			</div>
		</div>
	
		<div data-dojo-type="dojo/store/JsonRest" useCookies="true" autoExpand="false"
			jsId="categoryModel" id="categoryModel"
			target="<@ofbizUrl>browseCmsTree</@ofbizUrl>?siteId=${parameters.webSiteId}&contentId=" >
			<script type="dojo/method" event="mayHaveChildren" args="object">
				// see if it has a children property
				return "children" in object;
		    </script>
			<script type="dojo/method" event="getChildren" args="object,onComplete,onError">
				this.get(object.id).then(function(fullObject){
					// copy to the original object so it has the children array as well.
					object.children = fullObject.children;
					// now that full object, we should have an array of children
					onComplete(fullObject.children);
				}, function(error){
					// an error occurred, log it, and indicate no children
					console.error(error);
					onComplete([]);
				});
		    </script>
			<script type="dojo/method" event="getRoot" args="onItem,onError">
				this.get("root").then(onItem, onError);
		    </script>
			<script type="dojo/method" event="getLabel" args="object">
				return object.name;
		    </script>
			<script type="dojo/method" event="put" args="object,options">
				this.onChildrenChange(object, object.children);
				this.onChange(object);
				return dojo.store.JsonRest.prototype.put.apply(this, arguments);
		    </script>
		</div>
		<div data-dojo-type="dijit/Tree" id="webSiteContentTree" model="categoryModel" useCookies="true" persist="true" showRoot="false">
			<script type="dojo/method" event="onClick" args="item">
				var contentDetailPane = dijit.byId("cpManageContentDetails");
				if(item.fromDate != undefined){
					contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=" + item.contentAssocTypeId
												+ "&contentId=" + item.id
												+ "&contentIdFrom=" + item.contentId
												+ "&contentRoot=${contentRoot?if_exists}"
												+ "&fromDate=" + item.fromDate
												+ "&webSiteId=${webSiteId?if_exists}";
				}else{
					contentDetailPane.href = "<@ofbizUrl>editCmsContent</@ofbizUrl>?contentAssocTypeId=" + item.contentAssocTypeId
												+ "&contentId=" + item.id
												+ "&contentIdFrom=" + item.contentId
												+ "&contentRoot=${contentRoot?if_exists}"
												+ "&webSiteId=${webSiteId?if_exists}";
				}
				contentDetailPane.refresh();
			</script>
			<script type="dojo/connect">
		        var menu = dijit.byId("tree_menu");
		        // when we right-click anywhere on the tree, make sure we open the menu
		        menu.bindDomNode(this.domNode);
		
		        dojo.connect(menu, "_openMyself", this, function(e){
		            // get a hold of, and log out, the tree node that was the source of this open event
		            var tn = dijit.getEnclosingWidget(e.target);
		            //console.debug(tn);
		
		            // now inspect the data store item that backs the tree node:
		            //console.debug(tn.item);
		
		            // contrived condition: if this tree node doesn't have any children, disable all of the menu items
		            //menu.getChildren().forEach(function(i){ i.set('disabled', !tn.item.children); });
		
		            // IMPLEMENT CUSTOM MENU BEHAVIOR HERE
		        });
		    </script>
		</div>

	<#else>
		<div style="text-align:center;">
			No article(s) created yet.
		</div>
	</#if>
<#else>
	<div class="text-center">
		<img src="<@ofbizContentUrl>/app/xdoc/page-builder/img/LadySittingAtDesk.png</@ofbizContentUrl>" width="250px;" />
		<p>Select a Web Site to proceed</p>
		<p>Or</p>
        <div data-dojo-type="dijit/form/Button" iconClass="menu-icon-asterisk"
             label="Create Web Site" optionsTitle="Manage Content Files" showLabel="true">
            <script type="dojo/method" event="onClick" args="item">
				Prodaid.openModal({
					method : 'POST',
					url: "<@ofbizUrl>contentFileManager</@ofbizUrl>",
					content : {},
					title : "Manage Files",
					showButtons : false,
					showRequiredIndicator : false
				});
			</script>
        </div>
	</div>
</#if>
