<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에코</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#sendBtn').click(function(){
			sendMessage();
		});
	});
	
	var wsocket;
	function sendMessage(){
							/* 웹소켓은 http가 아니고 ws로 명시, echo-ws.do=>servlet-context.xml에 연결 */
							/* 메시지를 보내는 주소 */							
		wsocket = new WebSocket("ws://localhost:8080/ch16-Websocket/echo-ws.do");
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		wsocket.onopen = onOpen;
	}
	
	function onMessage(evt) {
		var data = evt.data;
		alert('서버에서 데이터 받음 : ' + data);
		wsocket.close();
	}
	
	function onClose(evt) {
		alert('연결 끊김');
	}
	
	function onOpen() {
		//서버에 데이터 전송
		wsocket.send($('#message').val());
	}
</script>
</head>

<body>
	<input type="text" id="message">
	<input type="button" id="sendBtn" value="전송	">
</body>
</html>
