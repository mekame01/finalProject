<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@2.0.0/dist/tf.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <form:form modelAttribute="upload" 
	action="${context}/upload/picture" method="post" enctype="multpart/form-data">
		<input type="file" style="border-radius:5px 5px 5px 5px; border: none; margin-top: 5px" name="file">
 </form:form>

<script type="text/javascript">

import * as tf from '@tensorflow/tfjs';
const model = 
	await tf.loadLayersModel('https://C:/CODE/G_SPRING/model/tfjs_dir/tfjs_target_dir/model.json');
console.log(model)
const example = tf.fromPixels(webcamElement);
const prediction = model.predict(example);
</script>

</body>
</html>