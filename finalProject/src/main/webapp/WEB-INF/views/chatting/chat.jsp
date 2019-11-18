<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script src="resources/js/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	//resize 이벤트가 발생할때마다 사이즈를 조절
	$(document).ready(function() {
		$(window).resize(disable);
		console.log("window 사이즈 조절 당하는 중")
		disable();
	});
	//w430 h560
	function disable() {
		var winWidth = $(window).width();
		var winHeight = $(window).height();
		if (winWidth > 430 || winWidth < 430) {
			window.resizeTo(430, 520)
			console.log("window 가로 사이즈 강제 조절")
		}
		if (winHeight > 560 || winHeight < 560) {
			window.resizeTo(430, 520)
			console.log("window 세로 사이즈 강제 조절")
		}
	}

	var wsocket;

	function connect() {
		
		wsocket = new WebSocket("ws://localhost:8989/evening/chat-ws.ch");
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;

		$('#message').attr('disabled', false);
	}

	function onOpen(evt) {
		
		var msg = 'msg:[' + $('#nickname').val() + '님 등장!]';
		wsocket.send(msg);
	

	}

	function onMessage(evt) {
		var data = evt.data;
	
		if (data.substring(0, 4) == 'msg:') {
			appendMessage(data.substring(4));
			/* 닉네임 추출 == 자기 닉네임과 같은지 체크 */
			
		}
	}

	function onClose(evt) {
		//퇴장 한 이후 부과적인 작업이 있을 경우 명시
		$('#nickname').val("");
		$('#message').attr('disabled', true);
	}

	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg);
		$('#message').val('');
	}

	function appendMessage(msg) {
		
		var $chatArea = $('#chatArea');
		var $enter;
		var $me;
		var $you;
		console.log(msg.substring(0,1));
			if(msg.substring(0,1)=='['){
				//$('#MiddleCMA').append(msg + '<br>');
				$enter = $("<div class='enterMsg'>").text(msg);
				$chatArea.append($enter);
			}else if(msg.substring(0,1)!='['){
				var str = msg;
				var checkstr = str.split(':');
				var checkname = checkstr[0];
				var context = checkstr[1];
				console.log("자른 checkname의 값 [nickname값이 나와야 한다]  !!" + checkname);
				console.log($('nickname').val());
				if(checkname == $('#nickname').val()){
					//$('#chatMessageArea').append('<div class="msg">'+context + '<br>'+'</div>');
					$me = $("<div class='msg meMsg'>").text(context);
					$chatArea.append($me);
					$chatArea.append("<br clear='all'>");
				}else{
					//$('#anotherCMA').append('<div class="msg">'+context + '<br>'+'</div>');
					$you = $("<div class='msg youMsg'>").text(context);
					$chatArea.append($you);
					$chatArea.append("<br clear='all'>");
					}
				}
		var maxScroll = $('#chatArea').height();
		$('#chatArea').scrollTop(maxScroll);
	}

	$(document).ready(function() {
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() {
			
			var nick = $('#nickname').val();
			var message = $('#message').val();
			var nickLength = (nick).length
			var messageLength = (message).length
			

			send();
		});
		$('#enterBtn').click(function() {
			if ($('#nickname').val() == '') {
				alert('이름을 입력하세요!');
				$('#nickname').focus();
				return;
			}
			$("#enter").hide();
			window.resizeTo(430, 520)
			connect();
		});

	});
</script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

#chatArea {
	width: auto;
	height: 400px;
	overflow-y: auto;
	border: 1px solid black;
	background-color: #6884b3;
	border: 1px solid #ddd;
}

div {
	font-family: 'Noto Sans KR', sans-serif;
}
.enterMsg{margin-left: 42%; color: white;}
.meMsg{
	float: right;
	overflow-y: auto;
	text-align: center;
	margin-bottom: 7px;
}
.youMsg{
	float: left;
	overflow-y: auto;
	text-align: center;
	margin-bottom: 7px;
}
.msg {
	padding: 5px;
	min-width: 80px;
	max-width: 200px;
	min-height: 25px;
	border-radius: 15px;
	color: black;
	background-color: #fdf01b;
	font-size: 1.3rem;
}

/* section {
	display: inline-block;
	
	padding: 7px 15px;
	margin-bottom: 10px;
	margin-top: 5px;
} */

#message {
	width: 350px;
	height: 30px;
}

::-webkit-scrollbar {
	display: none;
}
/* 
#chatMessageArea {
	float: right;
	overflow-y: auto;
	text-align: center;
}

#MiddleCMA {
	margin-left: auto;
	text-align: center;
	color: lightgray;
	
}

#anotherCMA {
	float: left;
	overflow-y: auto;
	text-align: center;
}*/
 


</style>
</head>

<body>

	<div id="enter">
		<hr>
		이름 : <input type="text" id="nickname">
		<button type="button" id="enterBtn" class="btn btn-default btn-sm">입장</button>

		<hr>
	</div>

	<div id="chatArea">
		<!-- <section id="chatMessageArea" class="msg"></section>
		
		<br clear="all">

		<section id="MiddleCMA" class="middle"></section>
		<section id="anotherCMA" class="msg"></section> -->

	</div>
	<input type="text" id="message" disabled>
	<button type="button" id="sendBtn" class="btn btn-default btn-sm">전송</button>
</body>
</html>
