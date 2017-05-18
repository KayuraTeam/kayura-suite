<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HTML 转换</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>HTML/XML 语义转换工具</h3>
		<textarea id="v1" style="width: 80%; height: 250px;overflow: scroll;"></textarea>
		<button id="t" value="转换" style="width: 80%; height: 30px;">转换</button>
		<textarea id="v2" style="width: 80%; height: 250px;overflow: scroll;"></textarea>
	</div>
	<script type="text/javascript">
		var v1 = document.getElementById('v1');
		var v2 = document.getElementById('v2');
		var t = document.getElementById('t');

		function html_encode(str) {
			var s = "";
			if (str.length == 0)
				return "";
			s = str.replace(/</g, "&lt;");
			s = s.replace(/>/g, "&gt;");
			return s;
		}

		t.addEventListener('click', function() {
			var s1 = v1.value;
			v2.value = html_encode(s1)
		});
	</script>
</body>
</html>