<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>bpmn-js seed</title>
  <style type="text/css">
    html, body, #canvas { height: 100%; padding: 0; }
    #save-button { position: absolute; top: 20px; right: 20px; border: solid 5px green; }
  </style>
  <link rel="stylesheet" href="${ROOT}/res/bpmn-js/assets/diagram-js.css">
  <link rel="stylesheet" href="${ROOT}/res/bpmn-js/assets/bpmn-font/css/bpmn-embedded.css">
</head>
<body>
  <div id="canvas"></div>
  <button id="save-button">保存流程图</button>
  
  <!-- bpmn-js modeler -->"
  <script src="${ROOT}/res/js/jquery.min.js"></script>
  <script src="${ROOT}/res/bpmn-js/bpmn-modeler.js"></script>
  
  <!-- application -->
  <script type="text/javascript">
  
  (function(BpmnModeler, $) {

		 // create modeler
		 var bpmnModeler = new BpmnModeler({ container: '#canvas' });
		
		 // import function
		 function importXML(xml) {
		
		   // import diagram
		   bpmnModeler.importXML(xml, function(err) {
		
		     if (err) {
		       return console.error('无法导入 BPMN 2.0 流程图', err);
		     }
		
		     var canvas = bpmnModeler.get('canvas');
		
		     // zoom to fit full viewport
		     canvas.zoom('fit-viewport');
		   });
		
		
		   // save diagram on button click
		   var saveButton = document.querySelector('#save-button');
		
		   saveButton.addEventListener('click', function() {
		
		     // get the diagram contents
		     bpmnModeler.saveXML({ format: true }, function(err, xml) {
		
		       if (err) {
		         console.error('流程图保存失败。', err);
		       } else {
		         console.info('流程图已经保存');
		         console.info(xml);
		       }
		
		       alert('流程图已经保存 (查看控制台 console (F12))');
		     });
		   });
		 }
		  
		$.ajax({
		 	type: "POST", 
		 	url: "${ROOT}/bpm/proc/res?t=1&id=${id}",
		 	success: function(data){
			  importXML(data);
			}
		});
	  
	})(window.BpmnJS, window.jQuery);
  
  </script>
</body>
</html>