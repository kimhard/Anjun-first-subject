<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<style>
/* <link rel="stylesheet" href=".css"> */
.images {
	overflow: hidden;
	cursor: pointer;
}

.blur {
	-webkit-filter: blur(10px);
	-moz-filter: blur(10px);
	-o-filter: blur(10px);
	-ms-filter: blur(10px);
	filter: blur(10px);
}

.jbBox {
	border: 1px solid #bcbcbc;
	padding: 20px;
}
</style>

<body>

	<img src='ImgSample.png' class='images blur'>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(function() {
			$('.images').click(function() {
				$(this).toggleClass('blur');
				alert("activate");
			});
		});
	</script>
	<h4>민감한 이미지 입니다. 그래도 보시겠습니까?</h4>
</body>

</html>