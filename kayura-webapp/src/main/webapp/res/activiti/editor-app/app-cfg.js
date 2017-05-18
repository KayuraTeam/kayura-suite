'use strict';

var ACTIVITI = ACTIVITI || {};

ACTIVITI.PREDEFINEPROPERTIES = [{
	packages : ['UserTask'],
	id: 'need_send_sms',
	name: '需要发短信通知',
	type: 'bool',
	variable: '1',
	items: null
}, {
	packages : ['UserTask'],
	id: 'required_comment',
	name: '必需要填写意见',
	type: 'bool',
	variable: '1',
	items: null
}, {
	packages : ['UserTask'],
	id: 'text_value',
	name: '文本输入测试项',
	type: 'string',
	variable: '默认值',
	items: null
}, {
	packages : ['UserTask'],
	id: 'selected_value',
	name: '下拉选择测试项',
	type: 'string',
	variable: '0',
	items: [{key:'0',value:'是的'},{key:'1', value:'不是'}]
}];
