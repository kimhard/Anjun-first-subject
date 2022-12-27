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
		window.onload = function() {
			if (window.Notification) {
				Notification.requestPermission();
			}
		}

		function calculate() {
			setTimeout(function() {
				notify();
			}, 2000);
		}

		function notify() {
			if (Notification.permission !== 'granted') {
				alert('해당 서비스의 요청을 거절하셨습니다.');
			} else {
				var notification = new Notification(
						'안전+에서 알립니다..',
						{
							icon : 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
							body : '광주 폭설...',
						});

				notification.onclick = function() {
					window.open('http://google.com');
				};
			}
		}
	</script>
</body>
</html>
