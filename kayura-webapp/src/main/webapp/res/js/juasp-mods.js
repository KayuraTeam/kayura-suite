/**
 * 统一应用支撑平台 用于提供组织机构功能 脚本库.
 * 
 * Copyright 2015-2015 the original author or authors. HomePage:
 * http://www.kayura.org
 */

var juasp = juasp || {};

(function($, win) {
	
	var ROOTPATH = juasp.APPROOT;
	
	juasp = $.extend(juasp, {
		
		selectOrg: function() {
			
		},
		selectEmployee: function(opts){
			
			var _opts = $.extend({
				singleSelect: true,
				onClose: function(r) { }
			}, opts);
			
			juasp.openWin({
				url : ROOTPATH + "/org/employee/select",
				width : "650px",
				height : "550px",
				title : "选择员工",
				onClose : function(r) {
					_opts.onClose(r);
				}
			});
		}
	});
	
}(jQuery, window));
