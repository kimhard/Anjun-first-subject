<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
	<h5>회원가입 정보 입력</h5>
	<form action="JoinService" method="post">
		아이디 <br>
		 <input type="text" name="id"><br> 
		비밀번호 <br> 
		<input type="password" name="pw"><br> 
		닉네임 <br> 
		<input type="text"name="nick"><br> 
		이름<br> 
		<input type="text" name="name"><br>
		이메일<br> 
		<input type="text" name="email"><br>
		주민등록번호<br> 
		<input type="text" name="rrn"><br>
		<input type="submit" value="회원가입">
	
	</form>
</body>
</html>