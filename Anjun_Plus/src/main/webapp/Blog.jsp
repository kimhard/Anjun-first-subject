<%@page import="Model.FileDTO"%>
<%@page import="Model.FileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.CommentDAO"%>
<%@page import="Model.CommentDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.PostDAO"%>
<%@page import="Model.PostDTO"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ZenBlog Bootstrap Template - Category</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS Files -->
  <link href="assets/css/variables.css" rel="stylesheet">
  <link href="assets/css/main.css" rel="stylesheet">

	<!-- 폰트어썸 script -->
	<script src="https://kit.fontawesome.com/10cd32872a.js" crossorigin="anonymous"></script>
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
	<style type="text/css">
.post-info{
	flex-grow: 3;
}
.loc-dot{
	flex-grow: 3;
}
.like-dislike{
	float:right;
	display: inline;
}
.video-post{
	flex-grow: 0;
}
.nav-item{
	flex-grow: 3;
}

	#img{
	text-align: center;
	</style>
	
</head>


<body>
<%
	UserDTO info = null;
	info = (UserDTO)session.getAttribute("info");

	int post_seq = Integer.parseInt(request.getParameter("post_seq"));
	System.out.println(post_seq);
	
	session.setAttribute("info", info);
	
	PostDTO dto = new PostDTO();
	PostDAO dao = new PostDAO();
	CommentDAO cmt = new CommentDAO();
	
	PostDTO result = dao.read(post_seq);
	
	ArrayList<CommentDTO> comments = cmt.read(post_seq);
	
	
	System.out.println(comments);
	
	
	FileDAO file = new FileDAO();
   	ArrayList<FileDTO> files = file.postFile(post_seq);
   	String filePath = "removebg.png";
   	if(files.size()!=0){
   		filePath = files.get(0).getMedia_file();

   		System.out.println(filePath);
   	}
	

	
	
%>

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">


			<a href="NewMain.jsp" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<img src="로고.png" alt="">
			</a>


			<nav id="navbar" class="navbar">
				<ul>

					         <li class="dropdown"><a href="category.html"><span>대응 요령</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
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
					<%if(info != null) {%>
					<li><a href="UserStamp2.jsp">출석</a></li>
					<%} %>
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
					<form action="SearchResult.jsp" method="get" class="search-form">
						<span class="icon bi-search"></span> <input name="searchWord" type="text"
							placeholder="Search" class="form-control">
							<input type="submit" style="display:none;"/>
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

    <section class="single-post-content">
      <div class="container">
        <div class="row">
          <div class="col-md-9 post-content" data-aos="fade-up">
          	<div class="inputform">

            <!-- ======= Single Post Content ======= -->
            
            <div class="single-post">
            
              <div class="post-meta"><span><%=result.getPost_dt().substring(0, 16)%></span></div>
              <!-- 날짜 -->
              <h1 class="mb-5"><%=result.getUser_id()%></h1>
              <!-- 아이디 -->
              <figure class="my-4">
                <div id="img"><img src="uploadedFiles/<%=filePath %>" alt="" class="img-fluid"></div>
              </figure>
              <p><%=result.getPost_content() %></p>
            </div><!-- End Single Post Content -->

            <!-- ======= Comments ======= -->
            <div class="comments">
              <h5 class="comment-title py-4">댓글 <%=comments.size() %></h5>
              
              <%for(int i=0; i<comments.size(); i++) {%>
	              <div class="comment d-flex">
	                <div class="flex-shrink-0">
	                  <div class="avatar avatar-sm rounded-circle">
	                    <img class="avatar-img" src="assets/img/person-2.jpg" alt="" class="img-fluid">
	                  </div>
	                </div>
	                <div class="flex-shrink-1 ms-2 ms-sm-3">
	                  <div class="comment-meta d-flex">
	                    <h6 class="me-2"><%=comments.get(i).getUser_id()%></h6>
	                    <span class="text-muted"><%=comments.get(i).getCmt_dt().substring(0, 16)%></span>
	                  </div>
	                  <div class="comment-body">
	                    <%=comments.get(i).getCmt_content()%>
	                  </div>
	                </div>
	              </div>
              <%} %>
            	  
            	  
            	  
              
              
            </div><!-- End Comments -->

            <!-- ======= Comments Form ======= -->
            <div class="row justify-content-center mt-5">

              <div class="col-lg-12">
                <h5 class="comment-title">Leave a Comment</h5>
                <div class="row">          
                  <div class="col-12 mb-3">
                    
					<form action="CommentService" method="get">
					
                    <textarea class="form-control" name="cmt_content" id="comment-message" placeholder="Enter your name" cols="30" rows="10"></textarea>
                  </div>
                  <input type="hidden" name="post_seq" value="<%=result.getPost_seq()%>">
                  <input type="hidden" name="user_id" value="<%=result.getUser_id()%>">
                  <div class="col-12">
                    <input type="submit" class="btn btn-primary" value="Post comment">
					</form>
                  </div>
                </div>
              </div>
            </div><!-- End Comments Form -->

          </div>
          </div>
          <div class="col-md-3">
						<!-- ======= Sidebar ======= -->


						<div class="aside-block">

							<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab"
								role="tablist">
								<li class="nav-item" role="presentation">
									<h3 class="aside-title">내 정보</h3>
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
												<img src="https://www.gsef2021.org/images/Comite/Ampliado/User-light.png" alt class="img-fluid">
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
								<iframe src="UserLocation.jsp"
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
							</ul>
						</div>
						<!-- End Tags -->

					</div>
					<%if(info != null) {%>
					<div class="button_container">
						<a href="Postform.jsp">
							<button class="btn"><span>글 작성 <i class="fa-regular fa-pen-to-square"></i></span></button></a>
					</div>
					<%} %>
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
              © Copyright <strong><span>ZenBlog</span></strong>. All Rights Reserved
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
              <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
              <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
              <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
              <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>
            

          </div>

        </div>

      </div>
    </div>
 
 
  </footer>

	
  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
  


</body>

</html>