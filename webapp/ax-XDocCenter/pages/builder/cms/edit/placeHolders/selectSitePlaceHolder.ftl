<div style="text-align:center;margin:0 auto;width:100%;">
	<h3>No Web Site Selected</h3>
	<h5 style="font-weight:normal;">A Web Site needs to be selected before you can start managing its contens, please select a Web Site below to proceed.</h5>
	<img src="<@ofbizContentUrl>/app/xdoc/page-builder/img/DocumentsAndConversations.jpg</@ofbizContentUrl>" style="width:450px;" />
    <div class="ax-btnPrimaryOutline">
        <div data-dojo-type="dijit/form/Button" showLabel="true">Select Web Site&nbsp;&nbsp;<i class="material-icons md-24">chevron_right</i>
			<script type="dojo/method" event="onClick" args="item">
				dijit.byId("fsSelectedWebsite").focus();
			</script>
		</div>
	</div>
	<hr class="dashed-separator">
</div>
<div>
	<h4 class="text-center">Recently Edited Documents</h4>
	<div data-dojo-type="dijit/layout/ContentPane" href="<@ofbizUrl>recentDocuments</@ofbizUrl>" >
	</div>

</div>
