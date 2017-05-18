<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Basic DataGrid</k:section>

<k:section name="body">

	<h2>DataGrid Complex Toolbar</h2>
	<p>The DataGrid toolbar can be defined from a &lt;div&gt; markup, so you can define the layout of toolbar easily.</p>
	<div style="margin:20px 0;"></div>
	
	<k:datagrid title="DataGrid Complex Toolbar" style="width:700px;height:250px" collapsible="true"
		singleSelect="true" url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get"
		toolbar="#tb" footer="#ft">
		<k:columns>
			<k:column field="itemid" width="80">Item ID</k:column>
			<k:column field="productid" width="100">Product</k:column>
			<k:column field="listprice" width="80" align="right">List Price</k:column>
			<k:column field="unitcost" width="80" align="right">Unit Cost</k:column>
			<k:column field="attr1" width="240">Attribute</k:column>
			<k:column field="status" width="60" align="center">Status</k:column>
		</k:columns>
	</k:datagrid>
	
	<div id="tb" style="padding:2px 5px;">
		Date From: <k:datebox id="fromDate" style="110px" required="true" tipPosition="top"></k:datebox>
		To: <k:datebox id="toDate" style="110px"></k:datebox>
		Language: <k:combobox id="" panelHeight="auto" style="width:100px">
			<k:selectitem label="java" value="java"/>
			<k:selectitem label="C" value="c"/>
			<k:selectitem label="Basic" value="basic"/>
			<k:selectitem label="Perl" value="perl"/>
			<k:selectitem label="Python" value="python"/>
		</k:combobox>
		<k:linkbutton iconCls="icon-search">Search</k:linkbutton>
	</div>
	
	<div id="ft" style="padding:2px 5px;">
		<k:linkbutton iconCls="icon-add" plain="true"></k:linkbutton>
		<k:linkbutton iconCls="icon-edit" plain="true"></k:linkbutton>
		<k:linkbutton iconCls="icon-save" plain="true"></k:linkbutton>
		<k:linkbutton iconCls="icon-cut" plain="true"></k:linkbutton>
		<k:linkbutton iconCls="icon-remove" plain="true"></k:linkbutton>
	</div>

</k:section>

<k:section name="code">
<pre><code class="html">&lt;e:datagrid title="DataGrid Complex Toolbar" style="width:700px;height:250px" collapsible="true"
	singleSelect="true" url="${ROOT}/res/easyui/jsondata/datagrid_data1.json" method="get"
	toolbar="#tb" footer="#ft"&gt;
	&lt;e:columns&gt;
		&lt;e:column field="itemid" width="80"&gt;Item ID&lt;/e:column&gt;
		&lt;e:column field="productid" width="100"&gt;Product&lt;/e:column&gt;
		&lt;e:column field="listprice" width="80" align="right"&gt;List Price&lt;/e:column&gt;
		&lt;e:column field="unitcost" width="80" align="right"&gt;Unit Cost&lt;/e:column&gt;
		&lt;e:column field="attr1" width="240"&gt;Attribute&lt;/e:column&gt;
		&lt;e:column field="status" width="60" align="center"&gt;Status&lt;/e:column&gt;
	&lt;/e:columns&gt;
&lt;/e:datagrid&gt;

&lt;div id="tb" style="padding:2px 5px;"&gt;
	Date From: &lt;e:datebox id="fromDate" style="110px" required="true" tipPosition="top"&gt;&lt;/e:datebox&gt;
	To: &lt;e:datebox id="toDate" style="110px"&gt;&lt;/e:datebox&gt;
	Language: &lt;e:combobox id="" panelHeight="auto" style="width:100px"&gt;
		&lt;e:selectitem label="java" value="java"/&gt;
		&lt;e:selectitem label="C" value="c"/&gt;
		&lt;e:selectitem label="Basic" value="basic"/&gt;
		&lt;e:selectitem label="Perl" value="perl"/&gt;
		&lt;e:selectitem label="Python" value="python"/&gt;
	&lt;/e:combobox&gt;
	&lt;e:linkbutton iconCls="icon-search"&gt;Search&lt;/e:linkbutton&gt;
&lt;/div&gt;

&lt;div id="ft" style="padding:2px 5px;"&gt;
	&lt;e:linkbutton iconCls="icon-add" plain="true"&gt;&lt;/e:linkbutton&gt;
	&lt;e:linkbutton iconCls="icon-edit" plain="true"&gt;&lt;/e:linkbutton&gt;
	&lt;e:linkbutton iconCls="icon-save" plain="true"&gt;&lt;/e:linkbutton&gt;
	&lt;e:linkbutton iconCls="icon-cut" plain="true"&gt;&lt;/e:linkbutton&gt;
	&lt;e:linkbutton iconCls="icon-remove" plain="true"&gt;&lt;/e:linkbutton&gt;
&lt;/div&gt;
</code></pre>
</k:section>

<%@ include file="/views/shared/_example.jsp" %>