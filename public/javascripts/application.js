// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var IBTCharts = {};

IBTCharts.confirmAndSubmit = function (node, eventInfo, e) {

	alert(eventInfo.node.data.$config.injectInto);
	return false;
	
	if (confirm('Do you wish to Assign to Branch ' + node.label + '?')) {
		alert(eventInfo.toSource());
	} else {
		alert('ok dont assign');
	};	
}