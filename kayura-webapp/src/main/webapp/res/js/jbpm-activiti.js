'use strict';

var JBPMN = JBPMN || {};

JBPMN.APPROOT = (function(win){
	var hostPath = win.location.href.substring(0, win.location.href.indexOf(win.location.pathname));
	var projectName = win.location.pathname.substring(0, win.location.pathname.substr(1).indexOf('/') + 1);
	return hostPath + projectName;
}(window));

JBPMN.BPMNROOT = JBPMN.APPROOT + "/rest";
JBPMN.SERVICEROOT = JBPMN.APPROOT + "/workflow/service";
JBPMN.RESTROOT = JBPMN.APPROOT + "/workflow/rest";

