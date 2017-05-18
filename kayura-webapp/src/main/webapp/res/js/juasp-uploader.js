/**
 * 使用 WebUploader 的封装文件/图片上传组件.
 * 
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */

// 文件上传组件.
(function($, win) {

	var $queue = null;
	var MB = 1024 * 1024, GB = MB * 1024;
	var icons = ['avi','bmp','bz2','db','doc','docx','exe','gif','jpg','jpge','mov',
				 'mp3','mp4','mpg','mpp','msi','pdf','png','ppt','pptx','rar','rdp',
				 'sql','tar','txt','vsd','wps','xls','xlsx','zip','htm','html','mht',
				 'mhtml','tif','tiff','iso','jar','rp','oom','pdm','psd','xml','xsm',
				 'wma','wmv','vtx','udl','reg','chm','ini'];
	
	function newid() {
		return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
	}
	
	juasp.getIconName = function(postfix){
		
		if(!juasp.isEmpty(postfix)){
			var i = icons.indexOf(postfix.toLowerCase());
			if(i>=0){
				return icons[i];
			} else {
				return "unknown";
			}
		} else {
			return "unknown";
		}
	}
	
	juasp.removefile = function (frid, fileName){
		
		juasp.ajaxPost({
			url: juasp.APPROOT + '/file/remove.json', 
			data: { id : frid, isBiz : 1 },
			success: function(r) {
				var t = $("#fc_" + frid);
				t.fadeOut('fast', function(){ t.remove(); });
				juasp.infoTips("文件 [" + fileName + "] 已经被移除。");
			}
		});
	}
	
	// ...
	function init(target){
		
		if (!WebUploader.Uploader.support()) {
			var error = "上传控件不支持您的浏览器！请尝试升级flash版本或者使用Chrome引擎的浏览器。";
			$(target).text(error);
			return;
		}

		var opts = $.data(target, 'uploader').options;
		var targetId = target.id;
		var $target = $(target);

		if ($queue == null) {
			$queue = $('<div class="webuploader-filequeues-list"></div>');
			$queue.appendTo("body");
		}

		if(opts.showlist) {
			var $list = $("<div style='list-style: none;padding: 5px;'></div>");
			$target.after($list);
		}
		
		if(!opts.actions.upload){
			$target.remove();
		}
		
		// 下载文件列表.
		if(opts.showlist) {
			
			juasp.ajaxPost({
				url: juasp.APPROOT + '/file/find.json', 
				data: {
					bizId : opts.formData.bizId,
					category : opts.formData.category,
					tags : opts.formData.tags
				},
				success: function(r) {
					for(var i in r.data){
						appendFileList(r.data[i]);
					}
				}
			});
		}
		
		var uploader = WebUploader.create($.extend({ 
			pick : '#' + targetId,
			formData : opts.formData
		}, opts.innerOptions));

		$.data(target, 'uploader', { options: opts, uploader : uploader });
		
		uploader.on('uploadFinished', function () {

			if(typeof opts.onFinished == "function") {
				opts.onFinished();
			}
		});
		
		uploader.on('filesQueued', function (files) {

			for(var i in files){
				$queue.append("<li id='li_" + files[i].id + "' class='webuploader-filequeues-item'>" + files[i].name + "</li>"); 
			}
		});
		
		uploader.on('uploadSuccess', function (file, response) {
			
			var t = $queue.find("#li_" + file.id);
			t.html("<span style='color:#A9A9A9'>" + file.name + " 上传完成.</span>");
			
			setTimeout(function() {
				t.fadeOut('slow', function(){ t.remove(); });
			}, 3000);
		});
		
		uploader.on('uploadProgress', function (file, percentage) {
			
			var t = $queue.find("#li_" + file.id);
			
			if(percentage == 1) {
				t.html("<span style='color:#A9A9A9'>" + file.name + " 上传完成.</span>");
			} else {
				t.html("<span style='color:#0000FF'>" + file.name + " 上传中 " + Math.round(percentage * 100) + " %</span>");
			}
		});
		
		uploader.on('error', function(type) {
			
			/**
			 * type {String} 错误类型。
			 * Q_EXCEED_NUM_LIMIT 在设置了fileNumLimit且尝试给uploader添加的文件数量超出这个值时派送。
			 * Q_EXCEED_SIZE_LIMIT 在设置了Q_EXCEED_SIZE_LIMIT且尝试给uploader添加的文件总大小超出这个值时派送。
			 * Q_TYPE_DENIED 当文件类型不满足时触发。
			 */

			if(type == "Q_EXCEED_NUM_LIMIT"){
				juasp.errorTips("添加文件时超出了本次限制的最大文件数。");
			}
			
		});
		
		uploader.on('uploadAccept', function(o, r) {

			if(opts.showlist) {
				if(r.type == juasp.SUCCESS) {
					r.data.isUploader = true;
					appendFileList(r.data);
				} else {
					juasp.errorTips(r.message);
				}
			} else {
				if(juasp.isNotEmpty(r.type)) {
					if(r.type != juasp.SUCCESS) {
						juasp.errorTips(r.message);
					}
				}
			}
		});
		
		function appendFileList(data){
			
			var html = '<li id="fc_' + data.frId + '" class="webuploader-fileitems">' ;
			
			if(opts.showicon){
				html += '<img class="webuploader-fileitem-icon" src="'+ juasp.ROOT + '/res/images/types/' + juasp.getIconName(data.postfix)+ '.png">';
			}
			
			html += '<a href="' + juasp.APPROOT + '/file/get?id=' + data.frId + '" '
			html += 'title="文件大小: ' + data.fileSize + '; 上传者: ' + data.uploaderName + ';">' + data.fileName + '</a>';
			
			if(opts.showinfos){
				html += "<span class='webuploader-fileitem-info'>(大小: " + data.fileSize + ", " + data.uploadTime + ")</span>";
			}
			
			if(opts.actions.remove && data.isUploader) {
				html += '<a href="javascript:void(0)" onclick="juasp.removefile(\'' + data.frId + '\',\'' + data.fileName + '\')">'; 
				html += '<img class="webuploader-fileitem-action-icon" src="'+ juasp.ROOT + '/res/images/icons/clear.png"></a>';
			}
			
			html += '</li>';
			$list.append(html);
		}
	}

	var webuploader = function(options, param){
		
		if (typeof options == 'string'){
			return webuploader.methods[options](this, param);
		}
		
		options = options || {};
		return this.each(function(){
			var state = $.data(this, 'uploader');
			if (state){
				$.extend(true, state.options, options);
			} else {
				var opts = $.extend(true, {}, webuploader.defaults, options);
				state = $.data(this, 'uploader', {
					options: opts
				});
				init(this);
			}
		});
	};
	
	// 上传组件支持方法.
	webuploader.methods = {
		setFormData: function(jq, param){
			var state = $.data(jq[0], 'uploader');
			if (state) {
				var opts = state.options;
				opts.formData = $.extend(true, {}, opts.formData, param);
				state.uploader.options.formData = opts.formData;
			}
		}
	};
	
	// 上传组件默认属性.
	webuploader.defaults = {
		onFinished : function () { },
		onSuccess : function (file, res) { } ,
		showlist : false,
		showicon : true,
		showinfos : true,
		actions : {
			upload : true,
			remove : true
		},
		formData: {				// 附件上传可接收的参数范本示例.
			bizId : '',			// ● 绑定业务表单Id.
			category : '',		// ● 该附件在表单中的分类.
			folderId : '',		// ● 可指定添加到的文件夹.在指定了bizId时,该值将被忽略.
			serial : 0,			// ● 排序码.
			allowChange : 0,	// ● 是否允许编辑.
			isEncrypt : 0,		// ● 是否加密文件.
			tags : ''			// ● 自定义标签,使用逗号间隔.
		},
		innerOptions : {
			swf: juasp.ROOT + '/res/webuploader/Uploader.swf',
			server: juasp.APPROOT + '/file/upload.json',
			auto: true,						// 设置为 true 后，不需要手动调用上传，有文件选择即开始上传。
			fileNumLimit: 999,				// 验证文件总数量, 超出则不允许加入队列。
			fileSizeLimit: 100 * MB,		// 验证文件总大小是否超出限制, 超出则不允许加入队列。
			fileSingleSizeLimit: 20 * MB,	// 验证单个文件大小是否超出限制, 超出则不允许加入队列。
			fileVal : "file",				// 设置文件上传域的name。
			method: "POST",					// 文件上传方式，POST或者GET。
			duplicate: true
		}
	};
	
	$.fn.uploader = webuploader;
	
}(jQuery, window));