<!-- 编辑内容区域 body -->
<!-- 工具栏区域 tool -->
<!DOCTYPE html>
<html>
<head>
<title>公司资料</title>
<link rel="stylesheet" type="text/css"
	href="/kayura-uasp/res/easyui/themes/metro-gray/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/kayura-uasp/res/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="/kayura-uasp/res/js/juasp.css">
<script type="text/javascript" src="/kayura-uasp/res/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/kayura-uasp/res/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/kayura-uasp/res/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/kayura-uasp/res/js/juasp-core.js"></script>
<script type="text/javascript" src="/kayura-uasp/res/js/juasp-easyui.js"></script>
<script type="text/javascript">
	var jctx = (function() {

		var events = juasp.getEvents({
			onSaved : function() {
			}
		});

		function _submitForm() {
			$('#ff').form('submit', {
				url : '/kayura-uasp/org/company/save.json',
				onlySuccess : function(r) {
					var t = $("#shortName").textbox("getValue");
					var data = {
						result : 1,
						'id' : r.data.id,
						text : t
					};
					if (events.onSaved) {
						events.onSaved(data);
					}

					if ($("#autoNew").checked) {
						juasp.closeWin(data);
					} else {
						$("#ff").form("reset");
					}

				}
			});
		}

		return {
			submitForm : _submitForm
		};

	}());
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false" style="padding: 5px;">
		<div class="easyui-layout" data-options='fit:true'>
			<div style="padding: 10px 30px 10px 30px;"
				data-options='region:"center"'>
				<!-- 编辑内容区域 body -->
				<form id="ff" method='POST'>
					<input type="hidden" id="companyId" name="companyId" /><input
						type="hidden" id="parentId" name="parentId"
						value="2C16E91427CB4E608B24A71D407477BB" />
					<table cellpadding="5">
						<tr>
							<td>上级公司:</td>
							<td>交通集团</td>
						</tr>
						<tr>
							<td>公司代码:</td>
							<td><input id="code" class="easyui-textbox"
								style="width: 180px;"
								data-options='validType:"length[1,32]",value:"",required:true'
								name="code" /></td>
						</tr>
						<tr>
							<td>公司简称:</td>
							<td><input id="shortName" class="easyui-textbox"
								style="width: 180px;"
								data-options='validType:"length[1,32]",value:"",required:true'
								name="shortName" /></td>
						</tr>
						<tr>
							<td>公司全称:</td>
							<td><input id="fullName" class="easyui-textbox"
								style="width: 250px;"
								data-options='validType:"length[1,64]",value:"",required:true'
								name="fullName" /></td>
						</tr>
						<tr>
							<td>公司描述:</td>
							<td><input id="description" class="easyui-textbox"
								style="height: 50px; width: 250px;"
								data-options='validType:"length[1,512]",multiline:true,value:""'
								name="description" /></td>
						</tr>
						<tr>
							<td>行业类型:</td>
							<td><input id="tndustryId" class="easyui-textbox"
								data-options='validType:"length[1,512]",value:""'
								name="tndustryId" /></td>
						</tr>
						<tr>
							<td>排序值:</td>
							<td><input id="serial" class="easyui-numberbox"
								data-options='min:0.0,precision:0.0,value:0.0' name="serial" /></td>
						</tr>
						<tr>
							<td>是否启用:</td>
							<td><select id="status" class="easyui-combobox"
								data-options='panelHeight:"50px",value:"1"' name="status"><option
										value="1">启用</option>
									<option value="0">禁用</option></select></td>
						</tr>
					</table>
				</form>
			</div>
			<div style="text-align: right; padding: 5px 0 0;"
				data-options='border:false,region:"south"'>
				<!-- 工具栏区域 tool -->
				<div style="float: left; margin-left: 10px;">
					<label for="autoNew"><input type="checkbox" id="autoNew">提交完成后新增下一条</label>
				</div>
				<a class="easyui-linkbutton" style="width: 80px"
					data-options='iconCls:"icon-ok"' href="javascript:void(0)"
					onclick="jctx.submitForm()">提交</a><span> <a
					class="easyui-linkbutton" style="width: 80px"
					data-options='iconCls:"icon-cancel"' href="javascript:void(0)"
					onclick="juasp.closeWin(0)">取消</a>
			</div>
		</div>
	</div>
</body>
</html>