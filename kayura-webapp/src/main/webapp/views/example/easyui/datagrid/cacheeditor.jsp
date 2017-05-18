<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Basic DataGrid</k:section>

<k:section name="body">
	<h2>Cache Editor for DataGrid</h2>
	<p>This example shows how to cache the editors for datagrid to improve the editing speed.</p>
	<div style="margin:20px 0;"></div>

	<k:datagrid id="dg" title="Cache Editor for DataGrid"
		style="width:700px;height:auto" collapsible="true" singleSelect="true"
		iconCls="icon-edit"
		url="${ROOT}/res/easyui/jsondata/datagrid_data1.json"
		onClickRow="onClickRow" method="get" toolbar="#tb">
		<k:columns>
			<k:column field="itemid" width="80">Item ID</k:column>
			<k:column field="productid" width="100"
				formatter="function(value,row){return row.productname;}"
				editor="{type:'combobox',options:{valueField:'productid',textField:'productname',method:'get',url:'${ROOT}/res/easyui/jsondata/products.json',required:true}}">Product</k:column>
			<k:column field="listprice" width="80" align="right"
				editor="{type:'numberbox',options:{precision:1}}">List Price</k:column>
			<k:column field="unitcost" width="80" align="right"
				editor="'numberbox'">Unit Cost</k:column>
			<k:column field="attr1" width="250" editor="'text'">Attribute</k:column>
			<k:column field="status" width="60" align="center" halign="center"
				editor="{type:'checkbox',options:{on:'P',off:''}}">Status</k:column>
		</k:columns>
	</k:datagrid>

	<div id="tb" style="height: auto">
		<k:linkbutton iconCls="icon-save" plain="true" onclick="accept()">Accept</k:linkbutton>
		<k:linkbutton iconCls="icon-undo" plain="true" onclick="reject()">Reject</k:linkbutton>
		<k:linkbutton iconCls="icon-search" plain="true" onclick="getChanges()">GetChanges</k:linkbutton>
	</div>

</k:section>

<k:section name="code">
<pre><code class="html">&lt;e:datagrid id="dg" title="Cache Editor for DataGrid"
	style="width:700px;height:auto" collapsible="true" singleSelect="true"
	iconCls="icon-edit"
	url="${ROOT}/res/easyui/jsondata/datagrid_data1.json"
	onClickRow="onClickRow" method="get" toolbar="#tb"&gt;
	&lt;e:columns&gt;
		&lt;e:column field="itemid" width="80"&gt;Item ID&lt;/e:column&gt;
		&lt;e:column field="productid" width="100"
			formatter="function(value,row){return row.productname;}"
			editor="{type:'combobox',options:{valueField:'productid',textField:'productname',method:'get',url:'${ROOT}/res/easyui/jsondata/products.json',required:true}}"&gt;Product&lt;/e:column&gt;
		&lt;e:column field="listprice" width="80" align="right"
			editor="{type:'numberbox',options:{precision:1}}"&gt;List Price&lt;/e:column&gt;
		&lt;e:column field="unitcost" width="80" align="right"
			editor="'numberbox'"&gt;Unit Cost&lt;/e:column&gt;
		&lt;e:column field="attr1" width="250" editor="'text'"&gt;Attribute&lt;/e:column&gt;
		&lt;e:column field="status" width="60" align="center" halign="center"
			editor="{type:'checkbox',options:{on:'P',off:''}}"&gt;Status&lt;/e:column&gt;
	&lt;/e:columns&gt;
&lt;/e:datagrid&gt;

&lt;div id="tb" style="height: auto"&gt;
	&lt;e:button iconCls="icon-save" plain="true" onclick="accept()"&gt;Accept&lt;/e:button&gt;
	&lt;e:button iconCls="icon-undo" plain="true" onclick="reject()"&gt;Reject&lt;/e:button&gt;
	&lt;e:button iconCls="icon-search" plain="true" onclick="getChanges()"&gt;GetChanges&lt;/e:button&gt;
&lt;/div&gt;

&lt;script type="text/javascript"&gt;
	(function($){
		function getCacheContainer(t){
			var view = $(t).closest('div.datagrid-view');
			var c = view.children('div.datagrid-editor-cache');
			if (!c.length){
				c = $('&lt;div class="datagrid-editor-cache" style="position:absolute;display:none"&gt;&lt;/div&gt;').appendTo(view);
			}
			return c;
		}
		function getCacheEditor(t, field){
			var c = getCacheContainer(t);
			return c.children('div.datagrid-editor-cache-' + field);
		}
		function setCacheEditor(t, field, editor){
			var c = getCacheContainer(t);
			c.children('div.datagrid-editor-cache-' + field).remove();
			var e = $('&lt;div class="datagrid-editor-cache-' + field + '"&gt;&lt;/div&gt;').appendTo(c);
			e.append(editor);
		}
		
		var editors = $.fn.datagrid.defaults.editors;
		for(var editor in editors){
			var opts = editors[editor];
			(function(){
				var init = opts.init;
				opts.init = function(container, options){
					var field = $(container).closest('td[field]').attr('field');
					var ed = getCacheEditor(container, field);
					if (ed.length){
						ed.appendTo(container);
						return ed.find('.datagrid-editable-input');
					} else {
						return init(container, options);
					}
				}
			})();
			(function(){
				var destroy = opts.destroy;
				opts.destroy = function(target){
					if ($(target).hasClass('datagrid-editable-input')){
						var field = $(target).closest('td[field]').attr('field');
						setCacheEditor(target, field, $(target).parent().children());
					} else if (destroy){
						destroy(target);
					}
				}
			})();
		}
	})(jQuery);
&lt;/script&gt;
&lt;script type="text/javascript"&gt;
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dg').datagrid('validateRow', editIndex)){
			var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
			var productname = $(ed.target).combobox('getText');
			$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
			$('#dg').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickRow(index){
		if (editIndex != index){
			if (endEditing()){
				$('#dg').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndex = index;
			} else {
				$('#dg').datagrid('selectRow', editIndex);
			}
		}
	}
	function accept(){
		if (endEditing()){
			$('#dg').datagrid('acceptChanges');
		}
	}
	function reject(){
		$('#dg').datagrid('rejectChanges');
		editIndex = undefined;
	}
	function getChanges(){
		var rows = $('#dg').datagrid('getChanges');
		alert(rows.length+' rows are changed!');
	}
&lt;/script&gt;
</code></pre>
</k:section>

<k:section name="footer">
<script type="text/javascript">
	(function($){
		function getCacheContainer(t){
			var view = $(t).closest('div.datagrid-view');
			var c = view.children('div.datagrid-editor-cache');
			if (!c.length){
				c = $('<div class="datagrid-editor-cache" style="position:absolute;display:none"></div>').appendTo(view);
			}
			return c;
		}
		function getCacheEditor(t, field){
			var c = getCacheContainer(t);
			return c.children('div.datagrid-editor-cache-' + field);
		}
		function setCacheEditor(t, field, editor){
			var c = getCacheContainer(t);
			c.children('div.datagrid-editor-cache-' + field).remove();
			var e = $('<div class="datagrid-editor-cache-' + field + '"></div>').appendTo(c);
			e.append(editor);
		}
		
		var editors = $.fn.datagrid.defaults.editors;
		for(var editor in editors){
			var opts = editors[editor];
			(function(){
				var init = opts.init;
				opts.init = function(container, options){
					var field = $(container).closest('td[field]').attr('field');
					var ed = getCacheEditor(container, field);
					if (ed.length){
						ed.appendTo(container);
						return ed.find('.datagrid-editable-input');
					} else {
						return init(container, options);
					}
				}
			})();
			(function(){
				var destroy = opts.destroy;
				opts.destroy = function(target){
					if ($(target).hasClass('datagrid-editable-input')){
						var field = $(target).closest('td[field]').attr('field');
						setCacheEditor(target, field, $(target).parent().children());
					} else if (destroy){
						destroy(target);
					}
				}
			})();
		}
	})(jQuery);
</script>
<script type="text/javascript">
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dg').datagrid('validateRow', editIndex)){
			var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
			var productname = $(ed.target).combobox('getText');
			$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
			$('#dg').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickRow(index){
		if (editIndex != index){
			if (endEditing()){
				$('#dg').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndex = index;
			} else {
				$('#dg').datagrid('selectRow', editIndex);
			}
		}
	}
	function accept(){
		if (endEditing()){
			$('#dg').datagrid('acceptChanges');
		}
	}
	function reject(){
		$('#dg').datagrid('rejectChanges');
		editIndex = undefined;
	}
	function getChanges(){
		var rows = $('#dg').datagrid('getChanges');
		alert(rows.length+' rows are changed!');
	}
</script>
</k:section>

<%@ include file="/views/shared/_example.jsp" %>