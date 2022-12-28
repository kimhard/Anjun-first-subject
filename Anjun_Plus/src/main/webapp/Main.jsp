<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
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

	 <iframe src="http://localhost:8083/Anjun_Plus/UserLocation.jsp"
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
	<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<!-- <script src="assets/js/jquery.scrollex.min.js"></script> -->
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		navigator.geolocation.getCurrentPosition(success, error);
		
		function success(position) {
			console.log(position);
			    const latitude = position.coords.latitude;  // 경도  
			    const longitude = position.coords.longitude;  // 위도
			    const coordsObj = {
			        latitude,
			        longitude
			    };
			    saveCoords(latitude, longitude);
			    getWeather(latitude, longitude);
		}
	
		function error() {
			console.log("위치 정보를 가져올 수 없습니다." + err);
		}

		function saveCoords(latitude, longitude) {
			sessionStorage.setItem("userLat", latitude);
			sessionStorage.setItem("userLng", longitude);
			console.log(sessionStorage.getItem("userLat"));
			console.log(sessionStorage.getItem("userLng"));
		    }
	
		function requestCoords() {
		    navigator.geolocation.getCurrentPosition(success, error);
		}
		
		function getWeather(lat, lng) {
			fetch(`https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lng}&appid=b408d025daceb6920be202dc72f52ccc&units=metric`,)
			.then(response => response.json())
			.then(data => console.log(`온도 : ${data.main.temp}, 날씨 : ${data.weather[0].main}`));
		}
	</script>

</body>
</html>