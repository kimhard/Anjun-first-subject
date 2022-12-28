<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

	<button onclick="location.href='Join.jsp'">
		<a href="JoinService">회원가입</a>
	</button>
	<button>
		<a href="#menu">로그인</a>
	</button>
	<br>

	<iframe src="http://localhost:8083/Anjun_Plus/KakaoAPI.jsp"
		width="400px" height="400px"></iframe>


	<!-- Menu -->
	<nav id="menu">	
		<div id="loginMenu">
			<ul class="links">
			<!-- Q3. 로그인 기능 만들기 -->
				<li><h3>로그인</h3></li>
					<form action = "LoginService" method="post">
						<li><input type="text" name="email" placeholder="ID를 입력하세요"></li>
						<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
						<li><input type="submit" value="LogIn" class="button fit"></li>
						<br>
						<li><a href="Join.jsp">ID가 없으신가요?</a>
					</form>
			</ul>
		</div>
	</nav>



	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<!-- <script src="assets/js/jquery.scrollex.min.js"></script> -->
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>


	<!-- <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
	<script type="text/javascript"></script> -->
</body>
</html>