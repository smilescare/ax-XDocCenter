/*
 * Toaster Component
 * dojoc.Toast
 * Message that slides in from the corner of the screen, used for notifications like "new email"
 */
define("dojoc/Toast", [
	"dojo/dom-class",
	"dojo/_base/declare",
    "dijit/_WidgetBase",
    "dijit/_TemplatedMixin",
    "dojo/text!./templates/Toast.html"
], function(domClass, declare, _WidgetBase, _TemplatedMixin, template){
    return declare("dojoc.Toast", [_WidgetBase, _TemplatedMixin], {
        // template contains the content of the file "templates/Toaster.html"
		templateString: template,

		// messageTypes: Enumeration
		//		Possible message types.
		messageTypes: {
			SUCCESS: "success",
			MESSAGE: "message",
			WARNING: "warning",
			ERROR: "error",
			FATAL: "fatal"
		},

		// defaultType: String
		//		If message type isn't specified (see "messageTopic" parameter),
		//		then display message as this type.
		//		Possible values in messageTypes enumeration ("message", "warning", "error", "fatal")
		type: "message",

		// duration: Integer
		//		Number of milliseconds to show message
		duration: "2000",

		message: "",
		fadeAnim: null,
		fadeDuration: 1000,
		_hideTimer: null,
		postCreate: function(){
			if(!this.message)
				this.message = this.type;
			/* add class specific to message type */
			//domClass.add(this.domNode, "dijitToast" + this._capitalize(this.type));
			domClass.add(this.dijitToastContentWrapper, this.type);

			/* add message contents */
			this.dijitToastContent.innerHTML = dojo.trim(this.message);	

			var self = this;
			this.fadeAnim = dojo.fadeOut({
				node: this.domNode,
				duration: this.fadeDuration
			});

			this.connect(this.fadeAnim, 'onEnd', '_hide');

			this.connect(this, 'onSelect', function(evt){
				this._cancelHideTimer();
				this.fadeAnim.play();
			});
		},

		_capitalize: function(/* String */w){
			return w.substring(0,1).toUpperCase() + w.substring(1);
		},

		onSelect: function(/*Event*/e){
			// summary: callback for when user clicks the message
		},

		_hide: function(){
			this.onHide();
			this.destroy();
		},

		onHide: function(){
			// summary: callback for onEnd of fade animation
		},

		startHideTimer:function(){
			//if duration == 0 we keep the message displayed until clicked
			if(this.duration==0) return;

			this._hideTimer = setTimeout(dojo.hitch(this, function(evt){
				// we must hide the iframe in order to fade
				// TODO: figure out how to fade with a BackgroundIframe
				if(this.bgIframe && this.bgIframe.iframe){
					this.bgIframe.iframe.style.display="none";
				}
				this.fadeAnim.play();
			}), this.duration);
		}, 

		_cancelHideTimer:function(){
			if(!this._hideTimer) return;
			clearTimeout(this._hideTimer);
			this._hideTimer=null;
		},

		destroy: function(){
			if(this.fadeAnim.status() == "playing")
				this.fadeAnim.stop();

			this.inherited(arguments);
		}
    
    });
});

