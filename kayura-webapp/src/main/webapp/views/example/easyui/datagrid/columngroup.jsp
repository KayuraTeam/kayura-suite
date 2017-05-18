<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Basic DataGrid</k:section>

<k:section name="body">

	<h2>Column Group</h2>
	<p>The header cells can be merged. Useful to group columns under a category.</p>
	<div style="margin:20px 0;"></div>

	<k:datagrid title="Column Group" style="width:700px;height:250px"
		collapsible="true" singleSelect="true" rownumbers="true"
		url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get">
		<thead>
			<tr>
				<k:column field="itemid" width="80" rowspan="2">Item ID</k:column>
				<k:column field="productid" width="100" rowspan="2">Product</k:column>
				<th colspan="4">Item Details</th>
			</tr>
			<tr>
				<k:column field="listprice" width="80" align="right">List Price</k:column>
				<k:column field="unitcost" width="80" align="right">Unit Cost</k:column>
				<k:column field="attr1" width="240">Attribute</k:column>
				<k:column field="status" width="60" align="center">Status</k:column>
			</tr>
		</thead>
	</k:datagrid>
</k:section>

<k:section name="code">
<pre><code class="html">&lt;e:datagrid title="Column Group" style="width:700px;height:250px"
	collapsible="true" singleSelect="true" rownumbers="true"
	url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get"&gt;
	&lt;thead&gt;
		&lt;tr&gt;
			&lt;e:column field="itemid" width="80" rowspan="2"&gt;Item ID&lt;/e:column&gt;
			&lt;e:column field="productid" width="100" rowspan="2"&gt;Product&lt;/e:column&gt;
			&lt;th colspan="4"&gt;Item Details&lt;/th&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;e:column field="listprice" width="80" align="right"&gt;List Price&lt;/e:column&gt;
			&lt;e:column field="unitcost" width="80" align="right"&gt;Unit Cost&lt;/e:column&gt;
			&lt;e:column field="attr1" width="240"&gt;Attribute&lt;/e:column&gt;
			&lt;e:column field="status" width="60" align="center"&gt;Status&lt;/e:column&gt;
		&lt;/tr&gt;
	&lt;/thead&gt;
&lt;/e:datagrid&gt;
</code></pre>
</k:section>

<%@ include file="/views/shared/_example.jsp" %>