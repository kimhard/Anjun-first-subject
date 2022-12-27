<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>geolocation</title>
<style type="text/css">
	body, html {
		height: 100%;
	}
</style>

</head>
<body>
	<div id="map" style="width: 100%; height: 100%;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca54d6e7a228681985539226b15919d4"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				
				sessionStorage.setItem("", );
				

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:4px;"></div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		
		 // 마커이미지의 주소입니다
		var imageSrc = 'https://postfiles.pstatic.net/MjAyMjEyMjdfNSAg/MDAxNjcyMTA0NzM4NTcx.5gl6dBHe7CISa63-3Q-_sgHosEHedffrm03u5W9VCqUg.6XLC4AwyBr7y1gNOjBzFTKcXEBES86Lc9omi22sBG8Mg.PNG.dldhgkdl/%EB%82%B4%EC%9C%84%EC%B9%98.png?type=w773',    
	    imageSize = new kakao.maps.Size(60, 65), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	        markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다


		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
	    		position: markerPosition, 
				image: markerImage // 마커이미지 설정 
				map : map,
				position : locPosition
			});

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
	        // 마커가 지도 위에 표시되도록 설정합니다
	        marker.setMap(map); 
		
	</script>
</body>
</html>