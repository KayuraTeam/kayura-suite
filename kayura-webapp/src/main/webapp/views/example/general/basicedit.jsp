<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">基本列表</k:section>

<k:section name="head">
	<script type="text/javascript">

		$(function() {
			
		});
		

		function closeWindow() {
 			juasp.confirm("是否关闭？", function(r) {
 				if(r) { juasp.closeWin({ value : 1 }); }
 			});
		}
		
	</script>
</k:section>

<k:section name="body">

	<p>表单编辑页面</p>
	<div style="margin:20px 0;"></div>

	<k:linkbutton onclick="closeWindow();">关闭窗口</k:linkbutton>

</k:section>

<k:section name="code">
<pre><code class="html">

</code></pre>
</k:section>

<%@ include file="/views/shared/_example.jsp" %>