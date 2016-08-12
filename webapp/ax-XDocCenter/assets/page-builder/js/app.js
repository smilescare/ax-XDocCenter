var globalAppOverlayLoader;
require(["dojo/dom-style", "dojo/_base/fx", "dojo/_base/declare", "dijit/registry", "dojo/dom"],
    function(domStyle, fx, declare, registry, dom){
        var globalLoader = declare(null,{
            overlayNode:null,

            // store a reference to the overlay node
            constructor:function(){
                this.overlayNode = dom.byId('axAppLoadingOverlay');
            },

            // called to hide the loading overlay
            endLoading: function()
            {
                // fade the overlay gracefully
                fx.fadeOut({
                    node: this.overlayNode,
                    onEnd: function(node){
                        domStyle.set(node, 'display', 'none');
                    }
                }).play();
            },

        });
        globalAppOverlayLoader = new globalLoader();
    }
);

require(["dijit/registry", "dojo/_base/lang", "dojo/parser","dojo/ready"], function (registry, lang, parser, ready) {
    // layout is ready, hide the loading overlay
    ready( function() {
        globalAppOverlayLoader.endLoading();
    });
});

/* Default.js code goes here */
/* EVERYTHING IN THE FILE SHOULD BE A STATIC OF DEFAULT */
function App(){}
App.TOASTER_ID = "applicationToaster";
//global flag, set to prevent any binds
//For example, used by the logoff action
App.blockBinds = false;

App.DEFAULT_MODAL_ID = "default-modal";

App.openModal = function(obj) {
    /*
     * NOTE: obj = {url:[string] url to call on bind
     *			    content:[js obj] content to POST on bind
     *				execute:[func] alternate callback to execute when form submit is pressed
     *				callback:[func] optional callback to execute after form is loaded
     *				title:[string] title to display on modal pane
     *				showButtons:[bool] show default buttons such as 'save'
     *				onCancel:[func] optional method to execute when cancel button is pressed
     *				showRequiredIndicator:[bool] shows text describing how required fields are notated
     *				markup:[string] html markup to use instead of performing bind (only if !obj.url)
     *				autofocus:[boolean] OPTIONAL :: defalut = true;
     *				//TODO submitError:[string] error to display if submit modal fails
     *				busyButton [dojoc.Button] widget on which to display a busy indicator while opening the modal
     *				altId: alternative id to apply to modal; allows multiple modals to be open at once but requires
     *					the caller to clean up after himself (i.e. call destroyRecursive() on the modal when done)
     *				noBorder: default false, meaning content area will be presented with a 1px border. Pass true to eliminate
     *					the border when a layout widget with predefined border styling such as the TabContainer.
     */
    if (obj.busyButton) {
        if (dojo.isString(obj.busyButton))
            obj.busyButton = dijit.byId(obj.busyButton);
        var iconNode = App.getIconNodeFromWidget(obj.busyButton);
        if(iconNode)
            dojo.addClass(iconNode,'working');
    }

    var insertModalContent = function(html, args) {
        if(html == "" || App.isErrorReported(html)){
            if(iconNode)
                dojo.removeClass(iconNode, 'working');
            return;
        }

        if(!obj.altId){
            var modal = dijit.byId(App.DEFAULT_MODAL_ID);
            if(modal){
                // hide the modal before destroy so that it gets removed from the stack of active dialogs
                modal.hide();
                modal.destroyRecursive();
            }
        }

        var title = obj.title ? obj.title : "App";

        var modalJSON = {	title: title,
            id: obj.altId || App.DEFAULT_MODAL_ID,
            autofocus: obj.autofocus == false ? false : true,
            showButtons:obj.showButtons == false ? false : true,
            showRequiredIndicator:obj.showRequiredIndicator == false?false:true,
            execute:obj.execute ? obj.execute : PageController.submitModalForm};

        if (obj.buttonLabel) {
            modalJSON.buttonLabel = obj.buttonLabel;
        }

        if (obj.buttonIconClass != undefined) {
            modalJSON.buttonIconClass = obj.buttonIconClass;
        }

        if(obj.modalType != undefined && obj.modalType == "XMegaDialog"){
            modal = new dojoc.XMegaDialog(modalJSON);
        }else{
            modal = new dojoc.Modal(modalJSON);
        }

        if(obj.onCancel)
            dojo.connect(modal, "onCancel", null, obj.onCancel);

        if(obj.noBorder)
            modal.attr("class","dijit-mc-no-border")

        modal.startup();
        modal.attr("content", html);

        //do some work once the content is loaded
        if(obj.callback)
            obj.callback.call(null, modal);

        if(iconNode)
            dojo.removeClass(iconNode, 'working');

        modal.show();

        // IE7 hack to get modals to position themselves properly;  two calls are needed to _position
        if(dojo.isIE == 7){
            modal._position();
            modal._position();
        }
    };

    if(obj.url){
        if(obj.method){
            if(obj.showLoader){
                App.doBindWithMethod(obj.content, obj.url, insertModalContent, null, function(){alert('An error occurred.')},
                    obj.method, null, obj.showLoader);
            }else{
                App.doBindWithMethod(obj.content, obj.url, insertModalContent, null, function(){alert('An error occurred.')}, obj.method);
            }
        }
        else{
            if(obj.showLoader){
                App.doBind(obj.content, obj.url, insertModalContent, null, null, obj.showLoader);
            }else{
                App.doBind(obj.content, obj.url, insertModalContent);
            }
        }
    }
    else if(obj.markup)
        insertModalContent(obj.markup);
}

/*
 * This is a common bind abstraction that should be used if possible
 */
App.doBind = function(content, url, onLoad, formNode, onError, showLoader, altId){
    if(App.blockBinds)
        return false;

    var loaderDlg;

    if(showLoader){
        var loaderId = "WIZARD_LOADER";

        if(altId){
            loaderId = altId;
        }

        loaderDlg = App.showCustomLoadingDialog("Working...", loaderId);
    }

    // var bindLoader = App.showBindLoader();
    globalLoadingOverlay.show();
    dojo.xhrPost({
        url: url,
        sync: content && content.sync ? true : false,
        form: formNode,
        content: content,
        handleAs: content && content.handleAs ? content.handleAs : "text",
        load: function(response, ioArgs){
            //hide the loader, for some odd reason it throws error if we hide the dialog immediately, thus the delay
            setTimeout(function(){globalLoadingOverlay.hide()}, 500);
            response = App.handleBindMessaging(response, ioArgs);

            if(onLoad)
                onLoad.apply(this, [response]);

        },
        error: function(error){
            //hide the loader
            globalLoadingOverlay.hide();
            onError = onError ? onError : App.bindError;
            onError.apply(this, [error]);
        }
    });
}

App.handleBindMessaging = function(response, ioArgs){
    if(ioArgs && ioArgs.handleAs == 'json')
        return App.handleBindJsonPayloadMessaging(response);
    else
        return App.handleBindMarkupPayloadMessaging(dojo.trim(response));
}
/*
 * application handles user messaging by JS escaping the message then inserting the message json
 * into a <textarea class='app-message'> therefore the json will not be altered when calling textarea.value.
 *
 * This method extracts and evals the json in the textarea then publishes to the correct message topic.
 */
App.handleBindMarkupPayloadMessaging = function(text){
    if(!text) return;

    var temp = dojo.doc.createElement("div");
    if(dojo.isString(text)){
        text = text.replace(/messenger/g, "textarea");
        temp.innerHTML = text;
    }else{
        temp.appendChild(text);
    }

    var messageWrapper = dojo.query(".app-message", temp).orphan();
    if(messageWrapper.length){
        var innerHTML = dojo.trim(messageWrapper[0].value);
//		var messagesObj = eval(innerHTML);//eval("[" + innerHTML + "]");
        var messagesObj = eval("[" + innerHTML + "]");
        dojo.publish(App.getTopic(), messagesObj);
    }

    return dojo.trim(temp.innerHTML);
}

App.handleBindJsonPayloadMessaging = function(json){
    if(json.messenger && json.messenger.messages)
        dojo.publish(App.getTopic(), json.messenger.messages);

    return json;
}

/*
 * Common error handler for bind returns
 */
App.bindError = function(error, args) {
    var message = error.message;
    if(message.indexOf('status:')){
        var statusCode = dojo.trim(message.substring(message.indexOf('status:')+7, message.length));
        var location = "";
        if(statusCode == '503' || statusCode =='0')
            location = "/ext/sellercentral/html/server-unavailable.html";
        else if(statusCode == '403')
            location= "/ext/sellercentral/html/session-timeout.html";

        if(location){
            window.location.href = location;
            return;
        }
    }

    App.unknownError(error);

    //remove loading icons
    dojo.query('.large-wait').forEach(function(elm) {
        dojo.removeClass(elm, 'large-wait');
    });
}

App.unknownError = function(error) {
    var message = "An unexpected error has occurred, contact support.";
    if(error.message)
        message += "<dl class='error-msg-description'><dt>Error Type</dt><dd>"+error.name+"</dd><dt>Error Message</dt><dd>"+error.message+"</dd></dl>";
    dojo.publish(App.getTopic(), [{message: message, type: "error", duration:"0"}]);
}

App.getTopic = function(){
    var modal=dijit.byId(App.DEFAULT_MODAL_ID);
    if(modal && modal.open && !modal.working)
        return "modal-toaster";
    return "application-toaster";
}

App.showCustomLoadingDialog = function(text, id) {
    text = "<div id='loading-dialog'><div class='dijitDialogPaneContent'>" + text + "</div></div>";
    var modal = new dijit.Dialog({id:id});
    modal.setContent(text);
    modal.startup();
    modal.show();
    return modal;
}

App.displayMessage = function(obj) {
    /* obj = 	{
     *			    message:[string] the display message
     *				type:[string] the message class.  See dojoc.Toaster.messageTypes for valid values.
     *				duration:[string] milliseconds, "0" will stay till clicked.
     *			}
     */
    if(!obj || !obj.message) return

    //size restriction added after a casting error led to a large message crashing the browser : jb7280 8/11/09
    if(obj.message.length > 4000)
        obj.message = obj.message.substr(0,4000) + " [message truncated].";
    dojo.publish(App.getTopic(), [obj]);
}

App.isErrorReported = function(html) {
    return html.search(/<span.*app-message-status.*>error<\/span>/i) != -1;
}

App.showDummyMsg = function (){
    //alert('here u go');
    var message = "<div class='info-msg-title'>Dummy Message</div>";
    App.displayMessage({message:message, type:'message', duration:"0"});

    //Scadmin.blockBinds = true;
    //Scadmin.displayMessage({message:"The server could not be reached. Please refresh the page.", type:"error", duration:"0"});
}

App.closeModal = function(obj) {
    var dlg = dijit.byId(App.DEFAULT_MODAL_ID);
    if (dlg && dlg.get("open")) {
        dlg.hide();
    }
    if(obj && obj.withError)
        App.bindError({message:"Unable to submit form."});
}
// use this to close any modal with custom/altId
App.closeModalWithId = function(modalId) {
    var modal = dijit.byId(modalId);
    if(modal){
        // hide the modal before destroy so that it gets removed from the stack of active dialogs
        if(modal.get("open"))
            modal.hide();
        modal.destroyRecursive();
    }
}

App.showLoadingDialog = function(text, id) {
    App.closeModal();

    var modal = new dojoc.Modal({id:id, duration:1, showButtons:false, showRequiredIndicator:false});
    modal.setContent(text);
    modal.startup();
    modal.show();
    return modal;
}
App.getFormattedFileSize = function(fSize){
    var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
    i=0;while(fSize>900){fSize/=1024;i++;}

    var formattedSize = (Math.round(fSize*100)/100)+' '+fSExt[i];
    return formattedSize;
}