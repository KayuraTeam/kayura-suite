<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Basic DataGrid</k:section>

<k:section name="head">
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</k:section>

<k:section name="body">
	
	<h2>CheckBox Selection on DataGrid</h2>
	<p>Click the checkbox on header to select or unselect all selections.</p>
	<div style="margin:20px 0;"></div>
	
	<k:datagrid id="dg" title="CheckBox Selection on DataGrid" style="width:700px;height:250px"
		rownumbers="true" singleSelect="true" url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get">
		<k:columns>
			<k:column field="ck" checkbox="true"></k:column>
			<k:column field="itemid" width="80">Item ID</k:column>
			<k:column field="productid" width="100">Product</k:column>
			<k:column field="listprice" width="80" align="right">List Price</k:column>
			<k:column field="unitcost" width="80" align="right">Unit Cost</k:column>
			<k:column field="attr1" width="220">Attribute</k:column>
			<k:column field="status" width="60" align="center">Status</k:column>
		</k:columns>
	</k:datagrid>
	
	<div style="margin:10px 0;">
		<span>选取模式: </span>
		<k:combobox id="sm" onSelect="function(t){$('#dg').datagrid({singleSelect:(t.value == 0)})}" >
			<k:selectitem label="Single Row" value="0"/>
			<k:selectitem label="Multiple Rows" value="1"/>
		</k:combobox><br/>
		SelectOnCheck: <input type="checkbox" checked onchange="$('#dg').datagrid({selectOnCheck:$(this).is(':checked')})"><br/>
		CheckOnSelect: <input type="checkbox" checked onchange="$('#dg').datagrid({checkOnSelect:$(this).is(':checked')})">
	</div>
	
</k:section>

<k:section name="code">
<pre><code class="html">&lt;e:datagrid id="dg" title="CheckBox Selection on DataGrid" style="width:700px;height:250px"
	rownumbers="true" singleSelect="true" url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get"&gt;
	&lt;e:columns&gt;
		&lt;e:column field="ck" checkbox="true"&gt;&lt;/e:column&gt;
		&lt;e:column field="itemid" width="80"&gt;Item ID&lt;/e:column&gt;
		&lt;e:column field="productid" width="100"&gt;Product&lt;/e:column&gt;
		&lt;e:column field="listprice" width="80" align="right"&gt;List Price&lt;/e:column&gt;
		&lt;e:column field="unitcost" width="80" align="right"&gt;Unit Cost&lt;/e:column&gt;
		&lt;e:column field="attr1" width="220"&gt;Attribute&lt;/e:column&gt;
		&lt;e:column field="status" width="60" align="center"&gt;Status&lt;/e:column&gt;
	&lt;/e:columns&gt;
&lt;/e:datagrid&gt;

&lt;div style="margin:10px 0;"&gt;
	&lt;span&gt;Selection Mode: &lt;/span&gt;
	&lt;select onchange="$('#dg').datagrid({singleSelect:(this.value==0)})"&gt;
		&lt;option value="0"&gt;Single Row&lt;/option&gt;
		&lt;option value="1"&gt;Multiple Rows&lt;/option&gt;
	&lt;/select&gt;&lt;br/&gt;
	SelectOnCheck: &lt;input type="checkbox" checked onchange="$('#dg').datagrid({selectOnCheck:$(this).is(':checked')})"&gt;&lt;br/&gt;
	CheckOnSelect: &lt;input type="checkbox" checked onchange="$('#dg').datagrid({checkOnSelect:$(this).is(':checked')})"&gt;
&lt;/div&gt;
</code></pre>
</k:section>

<%@ include file="/views/shared/_example.jsp" %>