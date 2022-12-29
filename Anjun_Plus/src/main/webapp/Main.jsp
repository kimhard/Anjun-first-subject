<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 폰트어썸 script -->
<script src="https://kit.fontawesome.com/10cd32872a.js" crossorigin="anonymous"></script>
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
	<!-- 날씨를 표시하는 div -->
	<div>
		<i class="temp">℃</i>
		<i class="weather"></i>
	</div>

	<iframe src="http://localhost:8011/Anjun_Plus/UserLocation.jsp" width="400px" height="400px"></iframe>

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
		
		function getWeather(latitude, longitude) {
			$.getJSON('https://api.openweathermap.org/data/2.5/weather?lat=35.1074481&lon=126.8828409&appid=b408d025daceb6920be202dc72f52ccc&units=metric',function(data){
				console.log(data.main.temp);
				console.log(data.weather[0].main);
				var $temp = data.main.temp;
				var $weather = data.weather[0].main;
				
				$('.temp').prepend($temp);
				if($weather=="Clouds"){
					$('.weather').attr('class','weather fa-solid fa-cloud-sun');
				}else if($weather=="Clear"){
					$('.weather').attr('class','weather fa-solid fa-sun');
				}else if($weather=="Thunderstorm"){
					$('.weather').attr('class','weather fa-solid fa-cloud-bolt');
				}else if($weather=="Drizzle"){
					$('.weather').attr('class','weather fa-solid fa-cloud-rain');
				}else if($weather=="Rain"){
					$('.weather').attr('class','weather fa-solid fa-cloud-showers-heavy');
				}else if($weather=="Snow"){
					$('.weather').attr('class','weather fa-regular fa-snowflake');
				}else if($weather=="Atmosphere"){
					$('.weather').attr('class','weather fa-solid fa-smog');
				}else{
					$('.weather').attr('class','weather fa-solid fa-cloud');
				}
			})
		}
		

	</script>

</body>
</html>