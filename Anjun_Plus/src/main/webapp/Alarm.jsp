<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title></title>
</head>
<body>
	<button onclick="calculate()">calculate</button>

	<script type="text/javascript">
	//권한 요청하기
		window.onload = function() {
			if (window.Notification) {
				Notification.requestPermission();
			}
		}
	// caluculate 버튼을 누를 때, 메시지 알람 전송 딜레이 (2초설정)
		function calculate() {
			setTimeout(function() {
				notify();
			}, 2000);
		}
	// 알림을 보냈을 때, 권한 요청 거절 / 요청 허락에 따른 메시지 출력.
		function notify() {
			if (Notification.permission !== 'granted') {
				alert('해당 서비스의 요청을 거절하셨습니다.');
			} else {
				var notification = new Notification(
						'안전+에서 알립니다..',
						{ 
							icon : 'https://i.postimg.cc/j27n4qQh/removebg.png',
							body : '광주 폭설...',
						});

	// 메시지 클릭시 해당 링크로 이동
				notification.onclick = function() {
					window.open('http://google.com');
				};
			}
		}
	</script>
</body>
</html>
