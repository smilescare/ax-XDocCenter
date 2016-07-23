/* START PAGECONTROLLER OBJECT DEFINITION */
function PageController() {}

PageController.submitModalForm = function(formJSON){
	var callbackMethod = formJSON.callbackMethod;
	
	var url = formJSON.url;
	//delete behavior related variables so they are not posted to the server
	delete formJSON.callbackMethod;
	delete formJSON.url;
	PageController.refreshElements({url:url, httpMethod:formJSON.httpMethod, formId:formJSON.formId, content:formJSON, callback:callbackMethod, onError:Scadmin.closeModalWithError});
	return false;
}

PageController.contextMenuOpened = function(html) {
	if(html.indexOf("{") == 0)  //we have JSON, no extra action needed
		return;
	else //we have a payload
		PageController.handlePayload(html);
}

/* 
 * post content to url and then parse and insert the response into nodes
*/
PageController.refreshElements = function(obj) {
/* 
 * url is the only required parameter 
 * 
 * NOTE: obj = {url:[string] url to call on bind
 			    content:[js obj] content to POST on bind
 				callback:[func] callback function called after bind returns
 				formId:[string] id of form in HTML DOM node for POST
 				callbackNodeId:[string] id of node to pass to callback
 				onError:[func] callback to perform if errors occur
 				loadingPane:[node] apply load-pane class to this pane
 */
 	if(!obj || !obj.url)
 		console.error("PageController.refreshElements: missing required param 'url'");

	//For unknown reasons, tabs containing grids on multiple aspects "disappear" in 
	//Firefox and IE when this class is applied and removed in this context. Applying
	//and the class by executing javascript directly in the browser does NOT recreate
	//the problem in either browser, so we are skipping if the loadingPane contains a grid
	var allowLoadingClass = !dojo.query(".dojoxGrid", obj.loadingPane).length;
	
	if(obj.loadingPane && allowLoadingClass)
		dojo.addClass(obj.loadingPane, "pane-load");
	
	if(obj.httpMethod){
		//if http method is specified use dobindwithmethod
		Scadmin.doBindWithMethod(obj.content, obj.url, function(html) {
			if(obj.loadingPane)
				dojo.removeClass(obj.loadingPane, "pane-load");
			
			PageController.handlePayload(html, obj);
			
		}, dojo.byId(obj.formId), obj.onError, obj.httpMethod.toString(), obj.formId);
	}else{
		Scadmin.doBind(obj.content, obj.url, function(html) {
			if(obj.loadingPane)
				dojo.removeClass(obj.loadingPane, "pane-load");
			
			PageController.handlePayload(html, obj);
			
		}, dojo.byId(obj.formId), obj.onError, obj.formId);
	}
}

/*
* Set the initial state of the menu on page load.
* This could be done with markup, but we don't want
* to duplicate the programmatic logic that already exists.
*/
PageController.initMenu = function() {
	var menus = ["suite-menu-json-wrapper","certification-menu-json-wrapper","sm-menu-json-wrapper"];
	
	for(var i=0; i<menus.length; i++) {
		var stateWrapper = dojo.byId(menus[i]);
		if(stateWrapper) {
			PageController.handleMenu(stateWrapper);
			stateWrapper.parentNode.removeChild(stateWrapper);
		}
	}
}

//dojo.subscribe("load-page", null, PageController.initMenu);
//dojo.addOnLoad(PageController.initMenu);

PageController.handleMenu = function(container) {
	var html = container.innerHTML;
	//container = node with json content: {'widgetId':[boolean|{active:boolean, label:string, iconClass:string}]}
	//common method to visulaize the stateful json object (html) with menus and buttons in the menubar. 
	var obj = eval("(" + html + ")");
		
	for(var id in obj){
		var widgetStatus = obj[id];		
		if(typeof widgetStatus != "object")		//TODO remove support for simple boolean in update json
			widgetStatus = {active:widgetStatus};
			
		var widget = dijit.byId(id);
		if(!widget)
			continue;
		
		Default.updateWidget(widget, widgetStatus);
	}
}

PageController.handlePayload = function(html, obj) {
	//html:[string] the payload
	//obj - see PageController.refreshElements()
	if(!obj)
		obj = {}
	
	var callbackText = "";

	var tempDiv = document.createElement("div");
	tempDiv.innerHTML = html;

	var nodes = tempDiv.childNodes;
	for (var i=0; i<nodes.length; i++) {
		if(!nodes[i].id) continue;
		
		var node = nodes[i];		
			
		var handlerAttr = node.attributes['handler'];
		if(handlerAttr) {
			PageController.invokeHandler(handlerAttr.value, node);
			continue;
		}
		
		//get data from response for callback if needed
		if(obj.callbackNodeId && node.id == obj.callbackNodeId)
			callbackText += node.innerHTML;

		PageController.insertPayloadNodeIntoDOM(node);
	}
	

	if(obj.callback){
		if(obj.callback.indexOf(".") != -1){
			//for method names containing dot in it, we need to run them in appropriate context.
			var fnToInvoke = window;
			var methods = obj.callback.toString().split(".");
			for(var i in methods) {
				fnToInvoke = fnToInvoke[methods[i]];
			}
			fnToInvoke.apply(this, new Array());
		}else{
			var fnToInvoke = window[obj.callback];
			if(fnToInvoke){
				fnToInvoke.apply(this, new Array(callbackText));
			}
		}
	}
	
	Default.closeModal();//simply close the modal dialog

	Default.removeLoadingGraphics();
}

function executeFunctionByName(functionName, context /*, args */) {
	var args = Array.prototype.slice.call(arguments).splice(2);
	var namespaces = functionName.split(".");
	var func = namespaces.pop();
	for(var i = 0; i < namespaces.length; i++) {
		context = context[namespaces[i]];
	}
	
	return context[func].apply(this, args);
}

PageController.invokeHandler = function(handlerName, node){
	var dotIndex = handlerName.indexOf(".");
	if(dotIndex > -1) {
		var objectName = handlerName.substr(0, dotIndex);
		var funcName = handlerName.substr(dotIndex+1);
		var handlerFunc = window[objectName][funcName];
		if (typeof handlerFunc == "function")
			window[objectName][funcName](node);
		else
			console.warn("Unable to find function requested in payload: " + handlerName);
	} else {
		window[handlerName](node);
	}
}

PageController.insertPayloadNodeIntoDOM = function(node){
	//insert content into target
	var target = (node.attributes.useSetContent || node.attributes.widget) ? dijit.byId(node.id) : dojo.byId(node.id);
	if(!target) {
		return false;
	}
	if(node.attributes.useSetContent) {
		target.set("content", node.innerHTML);
	} else {
		if(node.attributes.widget)
			target.containerNode.innerHTML= node.innerHTML;
		else
			target.innerHTML = node.innerHTML;
	}
	return true;
}

// Utility function for DND to dis-allow dropage
PageController.neverAllowDrops = function(){
	return false;
}

PageController.clickMenuItem = function(button, url, content, callback) {
	//var obj = Default.animateIcon(elm);
	var iconNode = Default.getIconNodeFromWidget(button);
	if(iconNode)
		dojo.addClass(iconNode, 'working');
	
	PageController.refreshElements({url:url, content:content, callback:callback, onError:function(error) {
		Default.bindError(error);
		if(iconNode)
			dojo.removeClass(iconNode, 'working');
	}});
}

PageController.crumbSelect = function(crumb) {
	PageController.refreshElements({url:crumb.selectUrl, content:{uid:crumb.selectedUid}});
}

PageController.crumbSimLogSelect = function(crumb) {
	PageController.refreshElements({url:crumb.selectUrl, content:{uid:crumb.selectedUid, label:crumb.get("label")}});
}

PageController.crumbFilterSelect = function(filterItem) {
	var crumb = this;
	Default.doBind(filterItem.data, crumb.filterUrl, function(json){
		crumb.updateDropDown(dojo.fromJson(json));
	});
}

PageController.markColumnStale = function(domNode) {
	var navigatorId = domNode.attributes["navigatorId"].value;
	var navigator = dijit.byId(navigatorId);
	if(!navigator)
		return;
	var colIndex = domNode.attributes['colIndex'].value;
	navigator.markCrumbStale(colIndex);
}

PageController.addCrumbs = function(domNode) {
	var navigatorId = domNode.attributes["navigatorId"].value;
	var navigator = dijit.byId(navigatorId);
	if(!navigator)
		return;

	var doNotOpenBCNDropDown = domNode.attributes['doNotOpenBCNDropDown'].value;
	var crumbs = eval(domNode.innerHTML);
	for(var i=0; i<crumbs.length; i++) {
		var crumb = crumbs[i];
		crumb.openDropDown = ((i == crumbs.length - 1) && !doNotOpenBCNDropDown);
		navigator.populateCrumb(crumb);
	}
}

PageController.setTabTitleFromPayload = function(node) {
	var tab = dijit.byId(node.id);
	tab.setTitle(node.innerHTML);
}
/* BEGIN methods to handle individual menu action buttons */
PageController.clickBrowserFilter = function(elm, url, bindContent){
	dojo.removeClass(dojo.query(".marker-valid", elm.domNode.parentNode)[0], 'marker-valid');
	dojo.addClass(elm.iconNode, 'marker-valid');
	dojo.byId('menuItmFilterLabel').innerHTML = elm.label;
	PageController.refreshElements({url:url, content:bindContent});
}

PageController.clickToggleSim = function(button) {
	var iconNode = Default.getIconNodeFromWidget(button);
	var url = dojo.hasClass(iconNode, "menu-icon-sim-start") ? "startSimulator.do" : dojo.hasClass(iconNode, "menu-icon-sim-stop") ? "stopSimulator.do" : false;
	if(url)
		PageController.clickMenuItem(button, url, {});
}

PageController.copyLink = function(elm, url) {
	Default.doBind({}, url, function(html, args) {
		if(!Default.copyToClipboard(html)) {
			var message = "<div class='error-msg-title'>Select and Copy Link Below</div>" +
						   "<input onclick='select(); dojo.stopEvent(event);' style='width:317px' readonly='readonly' type='text' value='"+html+"'/>"
			Default.displayMessage({message:message, type:'message', duration:"0"});
		}
	});
}
/* END methods to handle individual menu action buttons */

/* BEGIN Methods for User Favorites */

PageController.getFavoriteLink = function(rowIndex, item) {
	if(item == null)
		return "...";
	
	var link = dojo.string.substitute("<a href='#' onclick='Default.closeModal();Default.newAspect({aspect:\"${0}\", params:{favoriteParams:\"${1}\"}});return false;'>${2}</a>", [item.i.aspect, item.i.link, item.i.name]);
	return link;
}

PageController.setFavoriteButtonsStatus = function(grid) {
	var currentUserUid = dijit.byId("currentUserUid").getValue();
	
	var selected = grid.selection.getSelected();
	var totalNumSelected = selected.length;
	var numSelectedByOwner = 0;
	
	dojo.forEach(selected, function(fav){
		if(fav && fav.i.userUid == currentUserUid)
			numSelectedByOwner++;
	});

	deleteFavorites.setDisabled(numSelectedByOwner <= 0);
	addFavorites.setDisabled(totalNumSelected - numSelectedByOwner <= 0);
	editFavorite.setDisabled(totalNumSelected != 1 || numSelectedByOwner != 1);
}

PageController.refreshFavoritesStore = function() {
	if(favoriteSearchResultsGrid) {
		favoriteSearchResultsGrid.store.close();
		favoriteSearchResultsGrid.sort();
		favoriteSearchResultsGrid.selection.deselectAll();
	}
}

/* END methods for User Favorites */

PageController.displayIAP8Doc = function(url){
	window.open(url);	
}

PageController.filterUsers = function(query, elemId, url, isWidget){
	Default.doBind({query:query}, url, function(html, args) {
		if(isWidget){
			var area = dijit.byId(elemId);
			area.setContent(html);
		} else {
			var area = dojo.byId(elemId);
			area.innerHTML = html;
		}	
	});
}

function handleTabSelection(pane){
	if(PageController.blockTabLoad)
		return false;
	var isAccordion = dojo.hasClass(pane.domNode, "dijitAccordionPane");
	var container = isAccordion ? pane.domNode.parentNode : pane.domNode.parentNode.parentNode;

	var content = {tabPaneId:container.id, tabId:pane.domNode.id};
	var obj = {url:"selectTab.do", content:content, loadingPane:isAccordion ? pane.containerNode: pane.domNode, callback:dojo.partial(PageController.tabSelectionCallback, pane.domNode.id), callbackNodeId:pane.domNode.id};
	
	PageController.refreshElements(obj);
}

// The payload text is accepted thru callback method but is currently unused and unpublished
PageController.tabSelectionCallback = function(tabId, payload){
	dojo.publish("icdtTabSelection", [tabId]);
}

/* START SEARCH BAR DEFINITION */
function SearchBar() {}

SearchBar.rowsShowingDotpaths = [];  //array to track which rows are expanded/collapsed
SearchBar.FIELD_MATCHES_COLUMN = 6;  //column containing JSON markup for a field reference
SearchBar.UID_COLUMN = 5;			 //column containing a comma separated list of uid's needed for <a> tags
SearchBar.OP_COLUMN = 4;			//column containing operation labels
SearchBar.OPCLASS_COLUMN = 3;		//column containing classes applied to operation label
SearchBar.RESULTS_GRID_ID = "searchResultsGrid";
SearchBar.RESULTS_GRID;				 //reference to grid in memory, fetch with SearchBar.getResultsGrid()

//returns a reference to the results dojox.Grid, caching it in the process
SearchBar.getResultsGrid = function() {
	if(!SearchBar.RESULTS_GRID)
		SearchBar.RESULTS_GRID = dijit.byId(SearchBar.RESULTS_GRID_ID);
	return SearchBar.RESULTS_GRID;
}

// toggle View/Hide status of dotPath links
SearchBar.toggleShowingDotpaths = function(inIndex, inShow) {
	SearchBar.rowsShowingDotpaths[inIndex] = inShow;
	SearchBar.getResultsGrid().updateRow(inIndex);
}

//generate content for a row in the operation column
SearchBar.getOperationLink = function(rowIndex) {
	var result = "...";
	
	var grid = SearchBar.getResultsGrid();
	if(!grid) //short circuit
		return result;
	
	var item = grid.getItem(rowIndex);
	if(!item)  //short circuit
		return result; 
	var operationLabel = grid.store.getValue(item, "op");
	var operationClass = grid.store.getValue(item, "opClass");
	var uids = grid.store.getValue(item, "uids");
	
	if(uids && uids.indexOf(",") != -1) //IE breaks if uids aren't numbers
		result = "<a href='#' class='"+operationClass+"' onclick='SearchBar.goToLocation("+uids+", null, \"operation\", false);return false;'>"+operationLabel+"</a>"; 
	
	return result;
}

//generate content for dotPaths container - a list of links
SearchBar.getDotpaths = function(rowIndex) {
	var result = '';
		
	if(SearchBar.rowsShowingDotpaths[rowIndex]) {
		var grid = SearchBar.getResultsGrid();
		try {
			var item = grid.getItem(rowIndex);
			if(!item)  //short circuit
				return result; 
			var matchJSON = grid.store.getValue(item, "matchJSON");
			var matches = eval(matchJSON);
			var uids = grid.store.getValue(item, "uids");
			dojo.forEach(matches, function(aMatch){
				result += "<div><a href='#' onclick='SearchBar.goToLocation("+uids+", "+ aMatch.lfRefUid +", \"field\", this);return false;'>"+aMatch.dotPath+"</a></div>";
			}, this);
		} catch(e) {
			console.warn(e);
		}
	}

	return result;
}

//generate content for the "Matches" column - a link to view/hide the dotpaths
SearchBar.getMatchesLink = function(rowIndex) { 
	var result = "..."

	try {
		var grid = SearchBar.getResultsGrid();
		if(grid) {
			var item = grid.getItem(rowIndex);
			if(!item)  //short circuit
				return result; 
			var matchJSON = grid.store.getValue(item, "matchJSON");
			if(matchJSON != "?" && matchJSON != result) {
				var matches = dojo.fromJson(matchJSON);
				if(matches.length) {
					var label = (SearchBar.rowsShowingDotpaths[rowIndex] ? 'Hide' : 'View '+matches.length);
					var show = (SearchBar.rowsShowingDotpaths[rowIndex] ? 'false' : 'true')
					result = '<a href="#" onclick="SearchBar.toggleShowingDotpaths('+ rowIndex + ', ' + show + ');return false;">'+label+'</a>';
				}
			}
		}
	} catch (e) {
		console.warn(e);
	}
	
	return result;
}

SearchBar.onBeforeRow = function(inDataIndex, inRow) {
	inRow[1].hidden = (!SearchBar.rowsShowingDotpaths[inDataIndex]);
}

SearchBar.STRUCTURE = {
	onBeforeRow: SearchBar.onBeforeRow,
	cells: [
		[
			{name: 'Matches', get:SearchBar.getMatchesLink},
			{name: 'Consumer', field:'name'}, //grid requires a name field
			{name: 'Provider', field:'prov'},
			{name: 'Version', field:'vers'},
			{name: 'Operation', get:SearchBar.getOperationLink, styles:'padding-top:4px, padding-bottom:4px', width:'30%'},
			{name: '', field:'op', styles:'display:none;'},
			{name: '', field:'uids', styles:'display:none;'},
			{name: '', field:'dotPaths', styles:'display:none;'}
		],
		[
			{ name: 'Fields', colSpan:5, get: SearchBar.getDotpaths, styles:'background:#fff;border-color:#A6A6A6;border-width:1px 0px 1px 0px;'}
		]
	]
};

//hack to workaround pane not getting height inside expandoPane
SearchBar.setGridContainerHeight = function() {
	var wrapper = dijit.byId("searchResultsGridWrapper");
	var pane = dijit.byId("searchResultsPane");
	if(wrapper && pane) {
		wrapper.containerNode.style.height = (pane.domNode.offsetHeight - 35) + "px";
	}
}

SearchBar.search = function(form) {
	//clear old grid reference
	SearchBar.RESULTS_GRID = null;
	
	var query = form.entitySearchBox.value;
	var pane = dijit.byId("searchResultsPane");
	if(!pane._showing)
		pane.toggle();
	
	var header = dijit.byId("search-results-header");
	header.setContent("Searching...");
	
	//style wrapper
	SearchBar.setGridContainerHeight();
	var wrapper = dijit.byId("searchResultsGridWrapper");	 
	wrapper.setContent("");
	dojo.addClass(wrapper.containerNode, "large-wait");
			
	//getSearchOptions
	var caseSensitive = dijit.byId("caseSensitiveSearchOption").selected;
	
	//TODO move logic to dojoc.Menu, providing API to fetch selected radio option
	var menu = dijit.byId("searchOptionsMenu");
	var items = menu.getChildren();
	var condition;
	var searchSet;
	dojo.forEach(items, function(anItem){
		if(anItem.selected && anItem.groupName == "condition")
			condition = anItem.id;
		if(anItem.selected && anItem.groupName == "searchSet")
			searchSet = anItem.id;
	}, this);

	PageController.refreshElements({
		content: {query:query, caseSensitive:caseSensitive, searchSet:searchSet, condition:condition},
		url: "searchForEntity.do"
	});
}

SearchBar.displaySearchResults = function(node) {
	SearchBar.rowsShowingDotpaths = []; //reset which rows are open
	var wrapper = dijit.byId("searchResultsGridWrapper");
	var pane = dijit.byId("searchResultsPane");
	dojo.removeClass(wrapper.containerNode, "large-wait");
	dijit.byId("searchResultsGridWrapper").setContent(node.innerHTML);

	dojo.connect(pane, "resize", function(){
		var grid = SearchBar.getResultsGrid();
		if(grid)
			SearchBar.setGridContainerHeight();
			//grid.resize();
	});
}

/*
 *  Select the given agreement and operation in the BCN, select 
 *  the tab associated with the given layout and open the tree to the
 *  dotPath in elm.innerHTML (if elm is present).  
 *
 */
SearchBar.goToLocation = function(iaUid, opUid, layoutUid, lfRefUid, targetText, elm) {
	Default.showLoadingDialog("Navigating to " + targetText + "...", "goToLocationDialog");
	var pane = dijit.byId("searchResultsPane");
	
	var content = {iaUid:iaUid, opUid:opUid, layoutUid:layoutUid, lfRefUid:lfRefUid}
	if(elm) {
		content.dotPath = elm.innerHTML;
		content.loadTreeNodeChildren = true;
	} 
	
	//get uid of release selected during search and set in content
	var searchReleaseUid = dojo.byId("searchReleaseUid");
	content.releaseUid = searchReleaseUid ? searchReleaseUid.value : ""; 
		
	PageController.refreshElements({
		url : "goToField.do",
		content : content,
		callback : function(){
			var dialog = dijit.byId("goToLocationDialog");
			dialog.hide();
			dialog.destroy();
		}
	});
}
SearchBar.displaySearchBar = function(aspect) {
	dojo.style("entitySearchWrapper", "display", aspect == "agreements" ? "":"none");
}
//dojo.subscribe("load-page", null, SearchBar.displaySearchBar); 
/* END SEARCH BAR DEFINITION */

/* BEGIN CONTEXT MENU HANDLERS */
/* 
 *	For bread crumb columns that support multiple entity types, we needed
 *  common methods that could be called by both.
 */ 
function ContextMenuController(){}

ContextMenuController.createMessage = function(){

}

/* END CONTEXT MENU HANDLERS */