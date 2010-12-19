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
};

$('.toggle_history').live('click', function() {
	var history_id = this.id.split("_");
	history_id.shift();
	history_id = '#' + history_id.join("_");
	
	$(history_id).toggle();
	
	var isShown = ($(history_id).css("display") == "none" ? false : true);

	this.innerHTML = (isShown ? "Hide History" : "Show History");
	
	if ( isShown ) {
		$(history_id).data('jsp').reinitialise();
	}
});