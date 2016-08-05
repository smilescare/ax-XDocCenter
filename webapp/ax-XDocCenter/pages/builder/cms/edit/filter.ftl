<div dojoType="dojoc.Buttonbar">
	<form name="frmFilterFeatureCategories" method="POST" action="" id="frmFilterFeatureCategories">
		<div dojoType="dijit.form.TextBox" type="hidden" name="noConditionFind" value="Y"></div>
			<input dojoType="dijit.form.TextBox" type='hidden' value='' name='productFeatureCategoryId' />
			<input dojoType="dijit.form.TextBox" type='hidden' value='contains' name='productFeatureCategoryId_op' />
			<input dojoType="dijit.form.TextBox" type='hidden' value='Y' name='productFeatureCategoryId_ic' />
			<div dojoType="dijit.form.ValidationTextBox" name="description" 
				placeHolder="Description"></div>
			<input dojoType="dijit.form.TextBox" type='hidden' value='contains' name='description_op' />
			<span>
				<label for="chkFeatureCategoryDescription">Ignore Case</label>
				<input type="checkbox" dojoType="dijit.form.CheckBox" id="chkFeatureCategoryDescription" name="description_ic" value="Y" 
					checked="checked"
					onclick="Scadmin.chkWithHid('chkFeatureCategoryDescription','hidFeatureCategoryDescription')" title="Ignore Case?"/>
				<input id='hidFeatureCategoryDescription'  dojoType="dijit.form.TextBox" disabled="true" type='hidden' value='N' 
					name='description_ic' />
			</span>
			<div dojoType="dojoc.Button" iconClass="menu-icon-filter" 
					showLabel="true" title="Filter"
					onclick="Scadmin.refreshDataGrid('featureCategoriesGrids');">Filter</div>
	</form>
</div>