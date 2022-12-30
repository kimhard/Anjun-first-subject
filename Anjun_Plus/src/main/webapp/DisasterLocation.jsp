<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DisasterLocation</title>
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
			level : 4
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var lat;
		var lon;
		var userLat;
		var userLon;

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:4px;"></div>'; // 인포윈도우에 표시될 내용입니다

				userLat=locPosition.getLat();
				userLon=locPosition.getLng();
				console.log(userLat);
				console.log(userLon);
				
				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [
					{
						title : '내위치',
						latlng : new kakao.maps.LatLng(lat, lon)
					},
					{
						title : '재난위치',
						latlng : new kakao.maps.LatLng(35.13281166373863,
								126.9024713924392)
					}, ];

			// 마커 이미지의 주소
			var markerImageUrl = 'https://i.postimg.cc/xj3dRgxD/User-Location.png', markerImageSize = new kakao.maps.Size(
					40, 42), // 마커 이미지의 크기
			markerImageOptions = {
				offset : new kakao.maps.Point(19, 41)
			// 마커 좌표에 일치시킬 이미지 안의 좌표
			};

			// 마커 이미지를 생성한다
			var markerImage1 = new kakao.maps.MarkerImage(markerImageUrl,
					markerImageSize, markerImageOptions);

			// 지도에 마커와 인포윈도우를 표시하는 함수입니다
			function displayMarker(locPosition, message) {

				// 마커를 생성합니다
				var marker1 = new kakao.maps.Marker({
					position : locPosition,
					map : map,
					image : markerImage1
				// 마커이미지 설정 
				});

			}

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://i.postimg.cc/vT0gSvvz/Disaster-Location.png";

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(40, 42);
			var markerImageOptions = {
				offset : new kakao.maps.Point(19, 41)
			// 마커 좌표에 일치시킬 이미지 안의 좌표
			};

			// 마커 이미지를 생성합니다    
			var markerImage2 = new kakao.maps.MarkerImage(imageSrc, imageSize,
					markerImageOptions);

			// 마커를 생성합니다
			var marker2 = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[1].latlng, // 마커를 표시할 위치
				image : markerImage2
			// 마커 이미지 
			});

			// 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
			var points = [ new kakao.maps.LatLng(35.1869008, 126.8492471),
				positions[1].latlng];

			// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
			var bounds = new kakao.maps.LatLngBounds();

			var i, marker;
			for (i = 0; i < points.length; i++) {
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(points[i]);
			}

			map.setBounds(bounds);

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		
		console.log(getDistance(35.1869008,126.8492471,37.39880986512285,
				126.6431184447251));
		
		
		// 위도와 경도를 가진 두 점 사이의 거리를 구하는 공식
		function getDistance(lat1, lon1, lat2, lon2) {
		    if ((lat1 == lat2) && (lon1 == lon2))
		        return 0;

		    var radLat1 = Math.PI * lat1 / 180;
		    var radLat2 = Math.PI * lat2 / 180;
		    var theta = lon1 - lon2;
		    var radTheta = Math.PI * theta / 180;
		    var dist = Math.sin(radLat1) * Math.sin(radLat2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radTheta);
		    if (dist > 1)
		        dist = 1;

		    dist = Math.acos(dist);
		    dist = dist * 180 / Math.PI;
		    dist = dist * 60 * 1.1515 * 1.609344 * 1000;
		    if (dist < 100) dist = Math.round(dist / 10) * 10;
		    else dist = Math.round(dist / 100) * 100;

		    return dist;
		}
		
		
	</script>

</body>
</html>