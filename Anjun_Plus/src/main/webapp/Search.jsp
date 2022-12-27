<%@page import="Model.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="SearchCss.css">
<body>


	<div class="content">
		<form action="SearchService">
			<select name="keyWord">
				<option value="post_content">내용</option>
				<option value="user_id">아이디</option>
				<option value="post_hashtag">해쉬태그</option>
			</select> <input type="text" name="searchWord"> <input type="submit"
				value="Search">
		</form>
	</div>
</body>
</html>