/**
 * 统一应用支撑平台脚本库.
 * 
 * Copyright 2015-2015 the original author or authors. 
 * HomePage: http://www.kayura.org
 * 
 * 最后更新时间: 2016/07/19
 */

var juasp = { };

(function($, win, doc) {

	// 计算站点根路径
	juasp.ROOT = (function(win){
		var hostPath = win.location.href.substring(0, win.location.href.indexOf(win.location.pathname));
		var projectName = win.location.pathname.substring(0, win.location.pathname.substr(1).indexOf('/') + 1);
		return hostPath + projectName;
	}(win));

	// 站点 web 根路径.
	juasp.APPROOT = juasp.ROOT;
	
	// 应用 rest 根路径.
	juasp.RESTROOT = juasp.ROOT + "/rest";
	
	// 如果当前框架是顶层，就创建缓存对象.
	var $cache = null;
	if (win == win.top) {
		$cache = new ClassMap();
		win.$cache = $cache;
	} else {
		if(win.top.$cache == undefined){
			$cache = new ClassMap();
		} else {
			$cache = win.top.$cache;
		}
	}

	/**
	 * 随机生成指定长度的字符串.默认为32位长度.
	 * 
	 * @param {Integer} len 可指定的字符长度.
	 */
	function _newId(len) {
		var str = "", range = 32, arr = ['0', '1', '2', '3', '4', '5', '6',
				'7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
				'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
				'V', 'W', 'X', 'Y', 'Z'];

		if ('number' == typeof len) {
			range = len;
		}

		for (var i = 0; i < range; i++) {
			var pos = Math.round(Math.random() * (arr.length - 1));
			str += arr[pos];
		}

		return str;
	}

	/**
	 * 将文件大小数据量转换为 KB,MB... 显示方式.
	 */
	function _bytesToSize(bytes) {

		if (bytes === 0)
			return '0 B';
		var k = 1024, sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB',
				'YB'], i = Math.floor(Math.log(bytes) / Math.log(k));

		return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
	}

	/**
	 * 获取当前页面的顶层窗口对象.
	 */
	function _getTop() {
		
		if(win.top.juasp == undefined){
			return win;
		} else {
			return win.top;
		}
	}

	/**
	 * 获取当前页面框架中的内容框架页对象. 若当前是顶层页将获得当前页对象.
	 */
	function _getContent() {

		var ctt = win;

		if (ctt == win.top) {
			return ctt;
		}

		while (ctt.name != 'contentframe') {
			ctt = win.parent;
		}

		return ctt;
	}

	/**
	 * 获取顶层框架页标签的jQuery对象.
	 */
	function $top(tag) {

		return _getTop().$(tag);
	}

	/**
	 * 获取内容框架页标签的jQuery对象.
	 */
	function $content(tag) {

		return _getContent().$(tag);
	}

	/**
	 * 获取缓存对象值.
	 * 
	 * @param {String} key 缓存关键字.
	 * @param {Object} newValue 若指定了newValue将返回原值后,用新值替换缓存.若新值为 null 将仅移除原缓存值.
	 */
	function _getCache(key, newValue) {

		var value = $cache.get(key);

		if ('undefined' != typeof newValue) {
			_removeCache(key);
			if (newValue != null) {
				_setCache(key, newValue);
			}
		}

		return value;
	}

	/**
	 * 设置一个缓存对象.若该缓存Key值存在,将替换原缓存对象.
	 * 
	 * @param {String} key 缓存关键字.
	 * @param {Object} value 缓存对象.
	 */
	function _setCache(key, value) {

		$cache.set(key, value);
	}

	/**
	 * 移除一个缓存对象.
	 * 
	 * @param {String} key 缓存关键字.
	 */
	function _removeCache(key) {

		$cache.removeKey(key);
	}

	/**
	 * 获取当前页面中的查询参数值,若无该参数将返回null.
	 * 
	 * @param {String} name 查询参数名称.
	 */
	function _getQueryParam(name) {

		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		return (r != null) ? (r[2]) : null;
	}

	/**
	 * 对一个url地址添加一个参数值,并返回新的url地址.
	 * 
	 * @param {String} url 一个原url地址.
	 * @param {String} paramName 查询参数名称.
	 * @param {String} paramValue 查询参数值.
	 */
	function _addUrlParam(url, paramName, paramValue) {

		var u = url;
		if (url != null && url.length > 0) {
			u = u + (url.indexOf("?") > 0 ? "&" : "?") + paramName + "="
					+ paramValue;
		}
		return u;
	}

	function _isEmpty(value) {

		return value == undefined || value == null || value == "";
	}
	
	function _isNotEmpty(value){
		
		return _isEmpty(value) == false;
	}
	
	function _isString(value) {
		return (typeof value == 'string') && value.constructor == String;
	}
	

	function _setCookie(c_name, value, expiredays) {
		var exdate = new Date()
		exdate.setDate(exdate.getDate() + expiredays)
		doc.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
	}

	function _getCookie(c_name) {
		if (doc.cookie.length > 0) {
			c_start = doc.cookie.indexOf(c_name + "=")
			if (c_start != -1) {
				c_start = c_start + c_name.length + 1
				c_end = doc.cookie.indexOf(";", c_start)
				if (c_end == -1)
					c_end = doc.cookie.length
				return unescape(doc.cookie.substring(c_start, c_end))
			}
		}
		return ""
	}
	

	/** 绑定常用方法至引导对象 * */

	juasp.$top = $top;
	juasp.$content = $content;
	juasp.getCache = _getCache;
	juasp.setCache = _setCache;
	juasp.removeCache = _removeCache;
	juasp.getQueryParam = _getQueryParam;
	juasp.addUrlParam = _addUrlParam;
	juasp.newId = _newId;
	juasp.isEmpty = _isEmpty;
	juasp.isNotEmpty = _isNotEmpty;
	juasp.isString = _isString;
	juasp.bytesToSize = _bytesToSize;
	
	juasp.setCookie = _setCookie;
	juasp.getCookie = _getCookie;

	juasp.SUCCESS = "success";
	juasp.ERROR = "error";
	juasp.FAILED = "failed";
	
	/**
	 * 封装的 jquery 组件的 ajax 请求.
	 * 
	 * opts: {
			url: "",
			type: "POST",
			data: {},
			dataType: 'json',
			ajaxBeforeSend: function() { },
			ajaxComplete: function(xhr, textStatus) { },
			ajaxError: function(xhr, textStatus, errorThrown) { },
			success: function(r) { },
			failure: function(r) { },
			error: function(r) { },
			unknown: function(r) { }
		}
	 */
	function _ajax(opts){
		
		var cfg = $.extend({
			url: "",
			type: "POST",
			data: {},
			dataType: 'json',
			ajaxBeforeSend: function() { },
			ajaxComplete: function(xhr, textStatus) { },
			ajaxDataFilter: function(data, type) { },
			ajaxError: function(xhr, textStatus, errorThrown) { },
			success: function(r) {
				_infoTips(r.message);
			},
			failure: function(r) {
				_errorTips(r.message);
			},
			error: function(r) {
				_alert('ERROR', r.message, 'e');
			},
			unknown: function(r) {
				console.log("调用发生未知错误: " + JSON.stringify(r));
			}
		}, opts);
		
		$.ajax({
			url : cfg.url,
			type : cfg.type,
			data : cfg.data,
			dataType : cfg.dataType,
			beforeSend : function(xhr) {  // 发消命令前事件.
				if (typeof cfg.ajaxBeforeSend == 'function') {
					cfg.ajaxBeforeSend(xhr);
				}
			},
			success : function(result, status) {

				// 先执行完成回调事件,根据返回值决定是否执行后续代码
				if (typeof cfg.complete == 'function') {
					cfg.complete(result);
					return;
				}
				
				// 处理执行成功时的事件,若未指定事件,将显示一个成功消息
				if (result.success) {
					if (typeof cfg.success == 'function') {
						cfg.success(result);
					} else {
						if(result.message) {
							_infoTips(result.message);
						}
					}
				}

				// 系统返回执行异常时的处理,为未预期异常类型
				else if (!result.success && result.type == 'error') {
					if (typeof cfg.error == 'function') {
						cfg.error(result);
					} else {
						if(result.message) {
							_errorTips(result.message);
						}
					}
				}

				// 处理执行发生失败时的事件,若未指定事件,将显示一个警告消息
				else if (!result.success && result.type == 'failed') {
					if (typeof cfg.failure == 'function') {
						cfg.failure(result);
					} else {
						if(result.message) {
							_errorTips(result.message);
						}
					}
				}

				// 处理未知的请求结果事件
				else {
					if (typeof cfg.unknown == 'function') {
						cfg.unknown(result);
					} else {
						if(result.message) {
							_errorTips(result.message);
						}
					}
				}
			},
			complete : function(xhr, textStatus) { // 调用完成事件.
				if (typeof cfg.ajaxComplete == 'function') {
					cfg.ajaxComplete(xhr, textStatus);
				}
			},
			error : function(xhr, textStatus, errorThrown) { // 调用异常事件.
				if (typeof cfg.ajaxError == 'function') {
					cfg.ajaxError(xhr, textStatus, errorThrown);
				}
			}
		});
	}

	function _ajaxGet(opts){
		_ajax($.extend({ type: "GET" }, opts));
	}
	
	function _ajaxPost(opts){
		_ajax($.extend({ type: "POST" }, opts));
	}
	
	function _ajaxPut(opts){
		_ajax($.extend({ type: "PUT" }, opts));
	}
	
	function _ajaxDelete(opts){
		_ajax($.extend({ type: "DELETE" }, opts));
	}
	
	/**
	 * 用于跳转一个指定的URL地址，并可以指定其跳转模式.
	 * 
	 * @param {String} targetUrl 跳转目标地址.
	 * @param {Integer} mode 可选值: 0 当前页跳转(默认); 1 内容页跳转; 2 主页跳转.
	 * @param {String} returnUrl 可选值：可指定的跳转返回地址.
	 * @returns void
	 */
	function _skipUrl(targetUrl, mode, returnUrl) {

		var skipWin = win;

		if (mode == 1) {
			skipWin = _getContent();
		} else if (mode == 2) {
			skipWin = _getTop();
		}

		var url = targetUrl;
		if (returnUrl != null && returnUrl.length > 0) {
			url = url + (targetUrl.indexOf("?") > 0 ? "&" : "?") + "returnUrl="
					+ returnUrl;
		}

		skipWin.location.href = url;
	}

	/**
	 * 在任何页面中调用此方式，都可以在主框架页中，打开一个选项卡页面.
	 * 
	 * @param {String} title 选项卡标题名称.
	 * @param {String} url 指定打开的链接地址.
	 * @param {String} icon 选项卡图标(暂不可用).
	 */
	function _openTab(title, url, iconCls, closable) {

		/* 取到选项卡的jquery对象 */
		var tab = $top("#mainTabs");
		
		/* 判断指定标题的选项卡是否存在,存在则显示它 */
		if (tab.tabs('exists', title)) {
			tab.tabs('select', title);
		} else {
			var content = '<iframe name="contentframe" scrolling="no" frameborder="0" src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			tab.tabs('add', {
				title : title,
				content : content,
				iconCls : iconCls,
				closable : closable != undefined ? closable : true
			});
			tab.find(".panel-body").last().css("overflow", "hidden");
		}
	}

	/**
	 * 用于打开一个页面窗口.
	 * 
	 * @param {Object} <b>opts 参数选项:</b> </br>title 窗口标题, </br>width 宽度,
	 *            </br>height 高度, </br>iconCls 窗口图标, </br>url 页面地址, </br>onClose
	 *            窗口关闭事件.
	 * 
	 */
	function _openWin(opts) {

		var wid = _newId();

		var w = $top("<div id='win_" + wid + "' />");
		_setCache("wid_" + wid, w);
		
		if(opts.events){
			_setCache("wevents_" + wid, opts.events);
		}

		w.window({
			title : opts.title,
			width : opts.width,
			height : opts.height,
			shadow : false,
			modal : true,
			iconCls : opts.iconCls,
			closed : false,
			minimizable : false,
			onClose : function(e) {
				_removeCache("wid_" + wid);
				if(opts.events){
					_removeCache("wevents_" + wid);
				}
				if (typeof opts.onClose == 'function') {
					var result = _getCache("win_result_" + wid, null);
					opts.onClose(result);
				} else {
					_removeCache("win_result_" + wid);
				}
				$(this).parent().remove();
			},
			onOpen : function(e) {
				w.css("overflow", "hidden");
			}
		});

		var url = _addUrlParam(opts.url, '_wid', wid);
		w.append('<iframe scrolling="auto" frameborder="0" src="' + url + '" '
				+ 'style="width:100%;height:100%;"></iframe>');

		w.window('open');
	}

	function _getEvents(defaultEvents) {
		var wid = _getQueryParam("_wid");
		if (wid != null) {
			var events = _getCache("wevents_" + wid);
			return events;
		} else {
			return defaultEvents;
		}
	}
	
	/**
	 * 关闭当前打开的窗口.
	 * 
	 * @param {Object} result 返回给调用者的结果对象.
	 */
	function _closeWin(result) {
		var wid = _getQueryParam("_wid");
		if (wid != null) {
			var w = _getCache("wid_" + wid, null);
			_setCache("win_result_" + wid, result);
			if (w != null) {
				w.window('close');
			}
		}
	}

	/**
	 * 显示一个确认对话框.
	 * 
	 * @param {String} content 显示的内容.
	 * @param {Event} onclose(r) 确认 true 或取消 false 响应的事件.
	 */
	function _confirm(content, onclose) {
		win.top.$.messager.confirm('确认', content, onclose);
	}

	/**
	 * 显示一个信息框.
	 * 
	 * @param {String} title 信息框的标题.
	 * @param {String} content 显示的内容.
	 */
	function _message(title, content) {

		win.top.$.messager.show({
			title : title,
			msg : content,
			timeout : 5000,
			showType : 'slide'
		});
	}

	/**
	 * 显示一个处理进度框.
	 */
	function _showprogress(title, content) {

		var win = win.top.$.messager.progress({
			title : title,
			msg : content
		});
	}

	/**
	 * 关闭当前处理进度框.
	 */
	function _closeprogress() {
		win.top.$.messager.progress('close');
	}

	/**
	 * 弹出一个提示信息框.
	 * 
	 * @param {String} title 信息框的标题.
	 * @param {String} content 显示的内容.
	 * @param {String} icon 消息框类型. e 错误, i 信息, q 询问, w 警告.
	 */
	function _alert(title, content, icon, fn) {

		if( _isNotEmpty(content) ) {
			
			if (icon == "e") {
				icon == "error";
			} else if (icon == "i") {
				icon == "info";
			} else if (icon == "q") {
				icon == "question";
			} else if (icon == "w") {
				icon == "warning";
			}
	
			win.top.$.messager.alert(title, content, icon, fn);
		}
	}

	function _getTipQueue() {

		var tipQueue = _getCache("tipQueue");
		if (tipQueue == null) {
			tipQueue = new Array();
			_setCache("tipQueue", tipQueue);
		}
		return tipQueue;
	}

	function _tips(type, content) {

		if( _isNotEmpty(content) ) {

			if (win == _getTop()) {
	
				var tipQueue = _getTipQueue();
				if (tipQueue.length > 0) {
					try {
						var e = tipQueue[tipQueue.length - 1];
						e.hide();
					} catch (e) { }
				}
	
				var $tip = $top('<div class="juasp-tipsfrom"><span class="juasp-icon juasp-icon-' + type +'"></span><span class="juasp-'
						+ type + 'tips">' + content + '</span></div>');
				$tip.appendTo("body");
	
				tipQueue.push($tip);
	
				setTimeout(function() {
					var t = tipQueue.shift();
					if (t != null) {
						t.fadeOut('slow', function() {
							t.remove();
						});
					}
				}, 3000);
			} else {
	
				_getTop().tips(type, content);
			}
		}
	}

	win.tips = _tips;

	function _infoTips(content) {

		_tips('info', content);
	}

	function _warnTips(content) {

		_tips('warn', content);
	}

	function _errorTips(content) {

		_tips('error', content);
	}

	/**
	 * 显示一个用户可以输入文本的并且带“确定”和“取消”按钮的消息窗体。
	 * 
	 * @param {String} title 信息框的标题.
	 * @param {String} content 显示的内容.
	 * @param {Event} onclose(r) 返回 r 值与 content 类型长度相同.
	 */
	function _prompt(title, content, onclose) {
		win.top.$.messager.prompt(title, content, function(r) {
			onclose(r);
		});
	}

	/** 绑定方法 **/

	juasp.ajaxGet = _ajaxGet;
	juasp.ajaxPost = _ajaxPost;
	juasp.ajaxPut = _ajaxPut;
	juasp.ajaxDelete = _ajaxDelete;
	
	juasp.skipUrl = _skipUrl;
	juasp.openTab = _openTab;
	juasp.openWin = _openWin;
	juasp.closeWin = _closeWin;
	juasp.getEvents = _getEvents;
	juasp.confirm = _confirm;
	juasp.infoTips = _infoTips;
	juasp.warnTips = _warnTips;
	juasp.errorTips = _errorTips;
	juasp.prompt = _prompt;
	juasp.alert = _alert;
	juasp.message = _message;

}(jQuery, window, document));

/**
 * 定义一个 Key,Value 的集合类型.
 */
function ClassMap() {

	this.map = new Array();

	var struct = function(key, value) {
		this.key = key;
		this.value = value;
	};

	this.get = function(key) {
		for (var i = 0; i < this.map.length; i++) {
			if (this.map[i].key === key) {
				return this.map[i].value;
			}
		}
		return null;
	};

	this.set = function(key, value) {
		for (var i = 0; i < this.map.length; i++) {
			if (this.map[i].key === key) {
				this.map[i].value = value;
				return;
			}
		}
		this.map[this.map.length] = new struct(key, value);
	};

	this.removeKey = function(key) {
		var v;
		for (var i = 0; i < this.map.length; i++) {
			v = this.map.pop();
			if (v.key === key)
				continue;

			this.map.unshift(v);
		}
	};

	this.getCount = function() {
		return this.map.length;
	};

	this.isEmpty = function() {
		return this.map.length <= 0;
	};
}