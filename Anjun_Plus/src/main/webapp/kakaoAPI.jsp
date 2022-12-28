<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 범위 재설정 하기</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca54d6e7a228681985539226b15919d4"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
		var points = [ new kakao.maps.LatLng(35.1869008, 126.8492471),
				new kakao.maps.LatLng(35.13280805475722, 126.90246700791299)];

		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();

		var i, marker;
		for (i = 0; i < points.length; i++) {
			// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			marker = new kakao.maps.Marker({
				position : points[i]
			});
			marker.setMap(map);

			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(points[i]);
		}

		map.setBounds(bounds);
			
			
			
	</script>
</body>
</html>