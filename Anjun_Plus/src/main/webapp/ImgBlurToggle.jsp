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
.images {
	overflow: hidden;
	position: absolute;
	cursor: pointer;
}

.blur {
	-webkit-filter: blur(10px);
	-moz-filter: blur(10px);
	-o-filter: blur(10px);
	-ms-filter: blur(10px);
	filter: blur(10px);
}

#word {
	color: red;
	position: absolute;
	z-index: 1;
	left: 100px;
	top: 100px;
}
</style>

<body>
	<table>
		<tr>
			<td class='hidden' id="word">민감한 이미지 입니다. <br>그래도 보시겠습니까?
			<td>
		</tr>
	</table>
	<img src='SampleImg.jpg' class='images blur hidden '>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(function() {
			$('.images').click(function() {
				$(this).toggleClass('blur hidden');
			});
		});
	</script>
</body>

</html>