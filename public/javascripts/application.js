// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var IBTCharts = {};

IBTCharts.confirmAndSubmit = function (node, eventInfo, e) {

	var chart_id = eventInfo.node.data.$config.injectInto;
	var frm_id = "#edit_" + chart_id.split("_").splice(1).join("_");

	$(frm_id + " input#ibtr_respondent_id").val(node.label);
	$(frm_id + " input#ibtr_event").val('assign');
	$(frm_id + " input#ibtr_event").val('assign');
	
	$(frm_id).submit();

	return false;	
}