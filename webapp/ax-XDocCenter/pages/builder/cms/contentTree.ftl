<style>
	.xdoc-c-type{
		background-color:#00B294;
	    color:#fff;
		position: relative;
	    display: inline-block;
	    overflow: hidden;
	    text-align: center;
        width: 18px;
    	height: 18px;
    	line-height:18px;
    	vertical-align:middle;
    	border-radius: 50%;
	    max-width: 18px;
	    font-size:9px;
	    font-weight:bold;
	    margin-right:5px;
	}
	.xdoc-c-type-section{
		background-color:#0078d7;
	}
	.xdoc-c-type-topic{
		background-color:#5C2D91;
	}
	.xdoc-c-type-article{
		background-color:#107C10;
	}
</style>
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
												+ "&contentIdFrom=" + item.childrenContentId 
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
			jsId="categoryModel" id="categoryModel"  labelAttr="label"
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
				dijit._TreeNode.prototype._setLabelAttr = {node: "labelNode", type: "innerHTML"};
		    </script>
			<script type="dojo/method" event="getLabel" args="object">
				return object.label;
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
		<span class="ax-btnPrimaryOutline">
			<div data-dojo-type="dijit/form/Button" optionsTitle="Manage Content Files" showLabel="true">Create Web Site&nbsp;&nbsp;<i class="material-icons md-24">chevron_right</i>
				<script type="dojo/method" event="onClick" args="item">
					App.openModal({
						content : {},
						title: '<i class=\'material-icons ms-u-slideRightIn40\' style=\'font-size:36px;vertical-align:middle;\'>language</i>&nbsp;&nbsp;New Web Site',
						url: '<@ofbizUrl>newWebSite</@ofbizUrl>',
						modalType: 'XMegaDialog'
					});
				</script>
			</div>
		</span>
	</div>
</#if>
