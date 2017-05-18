<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Basic DataGrid</k:section>

<k:section name="body">
	<h2>Cell Editing in DataGrid</h2>
	<p>Click a cell to start editing.</p>
	<div style="margin:20px 0;"></div>
	<k:datagrid id="dg" title="Cell Editing in DataGrid" style="width:700px;height:auto" collapsible="true"
		iconCls="icon-edit" singleSelect="true" url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get">
		<k:columns>
			<k:column field="itemid" width="80">Item ID</k:column>
			<k:column field="productid" width="100" editor="'text'">Product</k:column>
			<k:column field="listprice" width="80" align="right" editor="{type:'numberbox',options:{precision:1}}">List Price</k:column>
			<k:column field="unitcost" width="80" align="right" editor="'numberbox'">Unit Cost</k:column>
			<k:column field="attr1" width="250" editor="'text'">Attribute</k:column>
			<k:column field="status" width="60" align="center" editor="{type:'checkbox',options:{on:'P',off:''}}">Status</k:column>
		</k:columns>
	</k:datagrid>
</k:section>

<k:section name="code">
<pre><code class="html">&lt;e:datagrid id="dg" title="Cell Editing in DataGrid" style="width:700px;height:200px" collapsible="true"
	iconCls="icon-edit" singleSelect="true" url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get"&gt;
	&lt;e:columns&gt;
		&lt;e:column field="itemid" width="80"&gt;Item ID&lt;/e:column&gt;
		&lt;e:column field="productid" width="100" editor="'text'"&gt;Product&lt;/e:column&gt;
		&lt;e:column field="listprice" width="80" align="right" editor="{type:'numberbox',options:{precision:1}}"&gt;List Price&lt;/e:column&gt;
		&lt;e:column field="unitcost" width="80" align="right" editor="'numberbox'"&gt;Unit Cost&lt;/e:column&gt;
		&lt;e:column field="attr1" width="250" editor="'text'"&gt;Attribute&lt;/e:column&gt;
		&lt;e:column field="status" width="60" align="center" editor="{type:'checkbox',options:{on:'P',off:''}}"&gt;Status&lt;/e:column&gt;
	&lt;/e:columns&gt;
&lt;/e:datagrid&gt;

&lt;script type="text/javascript"&gt;
	$.extend($.fn.datagrid.methods, {
		editCell : function(jq, param) {
			return jq.each(function() {
				var opts = $(this).datagrid('options');
				var fields = $(this).datagrid('getColumnFields', true)
						.concat($(this).datagrid('getColumnFields'));
				for (var i = 0; i &lt; fields.length; i++) {
					var col = $(this)
							.datagrid('getColumnOption', fields[i]);
					col.editor1 = col.editor;
					if (fields[i] != param.field) {
						col.editor = null;
					}
				}
				$(this).datagrid('beginEdit', param.index);
				var ed = $(this).datagrid('getEditor', param);
				if (ed) {
					if ($(ed.target).hasClass('textbox-f')) {
						$(ed.target).textbox('textbox').focus();
					} else {
						$(ed.target).focus();
					}
				}
				for (var i = 0; i &lt; fields.length; i++) {
					var col = $(this)
							.datagrid('getColumnOption', fields[i]);
					col.editor = col.editor1;
				}
			});
		},
		enableCellEditing : function(jq) {
			return jq.each(function() {
				var dg = $(this);
				var opts = dg.datagrid('options');
				opts.oldOnClickCell = opts.onClickCell;
				opts.onClickCell = function(index, field) {
					if (opts.editIndex != undefined) {
						if (dg.datagrid('validateRow', opts.editIndex)) {
							dg.datagrid('endEdit', opts.editIndex);
							opts.editIndex = undefined;
						} else {
							return;
						}
					}
					dg.datagrid('selectRow', index).datagrid('editCell', {
						index : index,
						field : field
					});
					opts.editIndex = index;
					opts.oldOnClickCell.call(this, index, field);
				}
			});
		}
	});

	$(function() {
		$('#dg').datagrid().datagrid('enableCellEditing');
	})
&lt;/script&gt;
</code></pre>
</k:section>

<k:section name="footer">
<script type="text/javascript">
	$.extend($.fn.datagrid.methods, {
		editCell : function(jq, param) {
			return jq.each(function() {
				var opts = $(this).datagrid('options');
				var fields = $(this).datagrid('getColumnFields', true)
						.concat($(this).datagrid('getColumnFields'));
				for (var i = 0; i < fields.length; i++) {
					var col = $(this)
							.datagrid('getColumnOption', fields[i]);
					col.editor1 = col.editor;
					if (fields[i] != param.field) {
						col.editor = null;
					}
				}
				$(this).datagrid('beginEdit', param.index);
				var ed = $(this).datagrid('getEditor', param);
				if (ed) {
					if ($(ed.target).hasClass('textbox-f')) {
						$(ed.target).textbox('textbox').focus();
					} else {
						$(ed.target).focus();
					}
				}
				for (var i = 0; i < fields.length; i++) {
					var col = $(this)
							.datagrid('getColumnOption', fields[i]);
					col.editor = col.editor1;
				}
			});
		},
		enableCellEditing : function(jq) {
			return jq.each(function() {
				var dg = $(this);
				var opts = dg.datagrid('options');
				opts.oldOnClickCell = opts.onClickCell;
				opts.onClickCell = function(index, field) {
					if (opts.editIndex != undefined) {
						if (dg.datagrid('validateRow', opts.editIndex)) {
							dg.datagrid('endEdit', opts.editIndex);
							opts.editIndex = undefined;
						} else {
							return;
						}
					}
					dg.datagrid('selectRow', index).datagrid('editCell', {
						index : index,
						field : field
					});
					opts.editIndex = index;
					opts.oldOnClickCell.call(this, index, field);
				}
			});
		}
	});

	$(function() {
		$('#dg').datagrid().datagrid('enableCellEditing');
	})
</script>
</k:section>

<%@ include file="/views/shared/_example.jsp" %>