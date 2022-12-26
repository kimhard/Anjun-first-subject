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
<%
request.setCharacterEncoding("UTF-8");


//검색어
String keyWord = request.getParameter("keyWord");
String searchWord = request.getParameter("searchWord");

//글 목록 전체 가져오기
PostDAO dao = new PostDAO(); // Dao 정보 가져오기
ArrayList<PostDTO> boards = dao.getBoardSearch(keyWord, searchWord);

//검색 전체  list count
int count = dao.getCount(keyWord, searchWord);


%>	
	
<div class="content">
	<table width="800px" align="center">
	<b>Title Search</b> : 
	<form action="Search.jsp" method="get">
	<select name="keyWord">
		<option value="post_content">내용(content)</option>
		<option value="USER_ID">아이디(id)</option>
		<option value="POST_HASHTAG">해쉬태그(hashtag)</option>		
		</select>
	<input type="text" name="searchWord">
	<input type="submit" value="Search">
	</form>
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
		<%
		if(boards.size() > 0){
			String viewPath = "";
			for(PostDTO board : boards){
				viewPath = request.getContextPath()+"/Anjun_Plus/Search.jsp?seq="+board.getPost_seq(); //getContextPath 가 bigdata
				String space = "";
				int spaceCount = board.getPost_seq();
				for(int i=0;i<=spaceCount;i++){
					space += "&nbsp;";
				}
		%>
		<tr>
			<td><%=board.getPost_seq() %></td>
			<td><a><%=board.getPost_content() %></a></td>
			<td><%=board.getUser_id() %></td>
			<td><%=board.getPost_dt() %></td>
			<td><%=board.getPost_likes() %></td>
		</tr>
		<%
			}
		}else {
			out.println("<tr><td colspan='6'>게시글이 없습니다.</td></tr>");
		}
		
		%>
		
	</table>
</div>
</body>
</html>