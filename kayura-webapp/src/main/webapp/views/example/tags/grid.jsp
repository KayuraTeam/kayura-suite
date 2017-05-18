<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Panel 标签</k:section>

<k:section name="head">
</k:section>

<k:section name="body">
	<k:datagrid id="tg" title="表格" idField="id"
		queryParams="{name:'fdf'}"
		url="${ROOT}/example/general/order/find.json" remoteSort="true">
		<k:column field="ck" checkbox="true" />
		<k:column field="orderDate" sortable="true">Order Date</k:column>
		<k:column field="shipViaName" sortable="true">ShipVia</k:column>
		<k:column field="shipName" sortable="true">Ship Name</k:column>
		<k:column field="shipAddress" sortable="true">Address</k:column>
	</k:datagrid>
</k:section>

<%@ include file="shared/_simple.jsp"%>