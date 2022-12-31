<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<title>ZenBlog Bootstrap Template - Category</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
	
<!-- Template Main CSS Files -->
<link href="assets/css/variables.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">

<!-- 폰트어썸 script -->
<script src="https://kit.fontawesome.com/10cd32872a.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
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
<!-- 이미지 업로드 -->
<script>
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$target.css('display', '');
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
				$target
						.html('<img src="' + e.target.result + '" border="0" alt="" />');
			}
			reader.readAsDataURL(html.files[0]);
		}
	}
</script>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 100%;
	max-width: 100%;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>

</head>

<body>
<%
	UserDTO info = (UserDTO)session.getAttribute("info");

%>

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">

			<a href="NewMain.jsp" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<img src="https://i.postimg.cc/j27n4qQh/removebg.png" alt="">
				<h1>안전+</h1>
			</a>

			 <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="ManualService?category=natural&query=flooding"><span>대응 요령</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li class="dropdown"><a href="#"><span>자연재난</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="ManualService?category=natural&query=flooding">침수</a></li>
                  <li><a href="ManualService?category=natural&query=hurricane">태풍</a></li>
                  <li><a href="ManualService?category=natural&query=downpour">호우</a></li>
                  <li><a href="ManualService?category=natural&query=thunderstroke">낙뢰</a></li>
                  <li><a href="ManualService?category=natural&query=gale">강풍</a></li>
                  <li><a href="ManualService?category=natural&query=storm">풍랑</a></li>
                  <li><a href="ManualService?category=natural&query=heavySnow">대설</a></li>
                  <li><a href="ManualService?category=natural&query=heatWave">폭염</a></li>
                  <li><a href="ManualService?category=natural&query=yellowDust">황사</a></li>
                  <li><a href="ManualService?category=natural&query=earthquake">지진</a></li>
                  <li><a href="ManualService?category=natural&query=tsunami">해일</a></li>
                  <li><a href="ManualService?category=natural&query=drought">가뭄</a></li>
                  <li><a href="ManualService?category=natural&query=flood">홍수</a></li>
                  <li><a href="ManualService?category=natural&query=landslide">산사태</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>사회재난</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="ManualService?category=social&query=fire">화재</a></li>
                  <li><a href="ManualService?category=social&query=wildfire">산불</a></li>
                  <li><a href="ManualService?category=social&query=collapse">건축물붕괴</a></li>
                  <li><a href="ManualService?category=social&query=explosion">폭발</a></li>
                  <li><a href="ManualService?category=social&query=carAccident">교통사고</a></li>
                  <li><a href="ManualService?category=social&query=electricGas">전기ㆍ가스사고</a></li>
                  <li><a href="ManualService?category=social&query=railroad">철도ㆍ지하철사고</a></li>
                  <li><a href="ManualService?category=social&query=shipCollision">해양 선박사고</a></li>
                  <li><a href="ManualService?category=social&query=waterPollution">수질오염</a></li>
                  <li><a href="ManualService?category=social&query=blackout">정전 및 전력부족</a></li>
                  <li><a href="ManualService?category=social&query=marinePollution">해양오염사고</a></li>
                  <li><a href="ManualService?category=social&query=chemicalAccident">화학물질사고</a></li>
                  <li><a href="ManualService?category=social&query=particulate">미세먼지</a></li>
                </ul>
              </li>
            </ul>
          </li>

          <li><a href="Shelter.jsp">대피소</a></li>
          <li><a href="UserStamp2.jsp">출석</a></li>
        </ul>
      </nav>

			<!-- .navbar -->

			<div class="position-relative">
				<a href="#" class="mx-2"><span class="temp">℃</span></a> <a href="#"
					class="mx-2"><span class="weather"></span></a> <a href="#"
					class="mx-2 js-search-open"><span class="bi-search"></span></a> <i
					class="bi bi-list mobile-nav-toggle"></i>

				<!-- ======= Search Form ======= -->
				<div class="search-form-wrap js-search-form-wrap">
					<form action="search-result.html" class="search-form">
						<span class="icon bi-search"></span> <input type="text"
							placeholder="Search" class="form-control">
						<button class="btn js-search-close">
							<span class="bi-x"></span>
						</button>
					</form>
				</div>
				<!-- End Search Form -->

			</div>

		</div>

	</header>
	<!-- End Header -->

	<main id="main">
		<section>
			<div class="container">
				<div class="row">

					<div class="col-md-9" data-aos="fade-up">






						<!-- 여기에입력 -->









						<div class="col-lg-12 text-center mb-5">

							<form action="UploadCheck.jsp" method="post" class="inputform" encType = "multipart/form-data"  >
								<div class="col-lg-12 text-center mb-5"></div>
								<div>
									<textarea rows="20" style="width: 100%;" name="post_content"
										placeholder='  ▶ 안전+ 게시물 작성 가이드라인

 *게시글 작성 이전에 꼭 확인해주세요!*

 폭력적 또는 혐오스러운 콘텐츠, 성적인 콘텐츠, 스팸 혹은 혼동을 야기하는 콘텐츠, 허위정보를 유포하는 콘텐츠, 증오 또는 학대하는 콘텐츠 등의 특정 위반 사항이 있는 경우 삭제 처리 될 수 있으며, 이용이 제한될 수 있습니다. 

 의도적으로 허위 정보를 게시하여 시민들에게 혼동을 가중시키거나 피해를 입힌 사실이 확인될 경우 법적인 조치가 이루어질 수 있으니 유의해주시길 바랍니다.

  ▶ 안전+ 이용 안내 
 - 폭력적 또는 혐오스러운 콘텐츠 : 안전+는 모두에게 적합한 환경을 유지하기 위해 폭력적인 이미지를 허용하지 않으며 과도하게 폭력적인 동영상 또는 이미지를 삭제할 수 있습니다. 재난으로 인한 인명, 물적피해에 공유되는 이미지는 허용할 수 있습니다.
 - 성적인 콘텐츠 : 안전+는 나체 이미지를 허용하지 않습니다.
 - 스팸 혹은 혼동을 야기하는 콘텐츠 : 안전+는 원치 않는 이메일, 댓글, 좋아요 또는 기타 상업적 또는 피해를 주는 콘텐츠를 만들거나 전송하는 행위를 허용하지 않습니다.
 - 허위정보를 유포하는 콘텐츠 : 안전+는 일어나지도 않은 재난을 허위로 유포하는 행위를 허용하지 않습니다. 허위정보로 인해 혼동을 야기할 경우 게시글을 삭제할 수 있습니다.
 - 증오 또는 학대하는 콘텐츠 : 안전+는 폭력 위협, 혐오 발언 및 개인을 공격 대상으로 삼는 콘텐츠를 삭제합니다. 인종, 민족, 국적, 성, 성별, 성 정체성, 성적 지향, 종교, 장애 또는 질병을 기반으로 타인을 공격하거나 학대하는 행위를 허용하지 않습니다.
 
  ▶ 게시물 신고 사유를 위반하면 어떻게 되나요?
 - 안전+의 정책은 가이드라인을 위반하는 콘텐츠를 삭제하는 것입니다. 이미지 또는 관련 내용이 가이드라인을 따르지 않는 경우 게시물 전체가 삭제될 수 있습니다. 가이드라인을 위반하는 계정은 비활성화될 수 있습니다.'></textarea>
								</div>
								<div class="post-entry-1 border-bottom">
									<input class="tag" placeholder="hash tags" name="post_hashtag">

								</div>
								<div class="text-center">
									<label for="image" class="fa-sharp fa-solid fa-camera fa-2x"
										style="cursor: pointer;"></label> <input type="file"
										name="post_file" id="image" style="display: none;"
										accept="image/*" capture="camera"
										onchange="getThumbnailPrivew(this,$('#cma_image'))" />
									
									<div id="image_container"></div>
									<div id="cma_image"
										style="width: 100%; max-width: 100%; border: 1px solid #000; display: none;"></div>


									<i class="fa-sharp fa-solid fa-video fa-2x"></i> 
									
									
									<input type="submit" value="글쓰기">
								</div>
							</form>



						</div>









						<!-- 여기까지 -->








					</div>

					<div class="col-md-3">
						<!-- ======= Sidebar ======= -->
						<div class="aside-block">

							<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab"
								role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="pills-popular-tab"
										data-bs-toggle="pill" data-bs-target="#pills-popular"
										type="button" role="tab" aria-controls="pills-popular"
										aria-selected="true">내 정보</button>
								</li>
							</ul>
							<div class="tab-content" id="pills-tabContent">

								<!-- Popular -->
								<div class="tab-pane fade show active" id="pills-popular"
									role="tabpanel" aria-labelledby="pills-popular-tab">
									<div class="post-entry-1 border-bottom">
										<div class="box multiple-box-shadows">
											<%
											if (info != null) {
												String grade = info.getGrade();

												if (grade.equals("A")) {
													grade = "VIP";
												} else if (grade.equals("B")) {
													grade = "GOLD";
												} else if (grade.equals("C")) {
													grade = "SILVER";
												} else {
													grade = "IRON";
												}
											%>
											<div class="post-meta author"></div>
											<div class="photo">
												<img src="assets/img/person-2.jpg" alt class="img-fluid">
											</div>
											<!-- 내 이름을 누르면 바로 내 정보로 이동하도록 링크 수정 -->
											<h2 class="mb-2">
												<a href="Profile.jsp"><%=info.getId()%></a>
											</h2>
											<h3 class="mb-2"><%=grade%></h3>
											
											<button class="custom-btn btn-10">
												<a href="MyBlog.jsp">내 게시물</a>
											</button>
											<button class="custom-btn btn-10">
												<a href="LogoutService">로그아웃</a>
											</button>
											<%
											} else {
											%>
											<a href="Login.jsp"><div>로그인</div></a>
											<%
											}
											%>
										</div>
									</div>
								</div>
								<!-- End Popular -->


							</div>
						</div>

						<div class="aside-block">
							<h3 class="aside-title">내 위치</h3>
							<div class="video-post">
								<iframe src="http://localhost:8090/Anjun_Plus/UserLocation.jsp"
									scrolling="no"></iframe>
							</div>
						</div>
						<!-- End Video -->

						<div class="aside-block">
							<h3 class="aside-title">Tags</h3>
							<ul class="aside-tags list-unstyled">
								<li><a href="category.html">지진</a></li>
								<li><a href="category.html">홍수</a></li>
								<li><a href="category.html">침수</a></li>
								<li><a href="category.html">Food</a></li>
								<li><a href="category.html">Politics</a></li>
								<li><a href="category.html">Celebrity</a></li>
								<li><a href="category.html">Startups</a></li>
								<li><a href="category.html">Travel</a></li>
							</ul>
						</div>
						<!-- End Tags -->

					</div>

				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">



		<div class="footer-legal">
			<div class="container">

				<div class="row justify-content-between">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						<div class="copyright">
							© Copyright <strong><span>ZenBlog</span></strong>. All Rights
							Reserved
						</div>

						<div class="credits">
							<!-- All the links in the footer should remain intact. -->
							<!-- You can delete the links only if you purchased the pro version. -->
							<!-- Licensing information: https://bootstrapmade.com/license/ -->
							<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>

					</div>

					<div class="col-md-6">
						<div class="social-links mb-3 mb-lg-0 text-center text-md-end">
							<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
								href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
								href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
								href="#" class="google-plus"><i class="bi bi-skype"></i></a> <a
								href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
						</div>

					</div>

				</div>

			</div>
		</div>

	</footer>

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>


	<script src="https://unpkg.com/@yaireo/tagify"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
		rel="stylesheet" type="text/css" />

	<!-- Tag -->
	<script>
		var input = document.querySelector('.tag')
		var tagify = new Tagify(input);

		// 태그가 추가되면 이벤트 발생
		tagify.on('add', function() {
			console.log(tagify.value); // 입력된 태그 정보 객체
		})
	</script>
	<!-- 이미지 업로드 -->
	<script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>

	<script>
function btn(){
    alert('사진이 업로드 되었습니다.');
}
</script>
</body>

</html>