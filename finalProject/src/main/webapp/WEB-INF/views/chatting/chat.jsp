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
		disable();
		getNotificationPermission();
	});
	//w430 h560
	function getNotificationPermission() {
		    // 브라우저 지원 여부 체크
		    if (!("Notification" in window)) {
		        alert("데스크톱 알림을 지원하지 않는 브라우저입니다.");
		    }
		    // 데스크탑 알림 권한 요청
		    Notification.requestPermission(function (result) {
		        // 권한 거절
		        if(result == 'denied') {
		            alert('알림을 차단하셨습니다. 브라우저의 사이트 설정에서 변경하실 수 있습니다.');
		            return false;
		        }
		    });
		}
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
		
		wsocket = new WebSocket("ws://localhost:9292/evening/chat-ws.ch");
		//서버로부터 메시지를 받으면 호출되는 함수 지정
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
			if(msg.substring(0,1)=='['){
				$enter = $("<div class='enterMsg'>").text(msg);
				$chatArea.append($enter);
			}else if(msg.substring(0,1)!='['){
				var str = msg;
				var checkstr = str.split(':');
				var checkname = checkstr[0];
				var context = checkstr[1];
				if(checkname == $('#nickname').val()){
					$me = $("<div class='msg meMsg'>").text(context);
					$chatArea.append($me);
					$chatArea.append("<br clear='all'>");
				}else{
					$name =$("<div class='name'><br>").text(checkname);
					$you = $("<div class='msg youMsg'>").text(context);
					$chatArea.append($name);
					$chatArea.append("<br clear='all'>");
					$chatArea.append($you);
					$chatArea.append("<br clear='all'>");
					console.log("$you"+$you);
					 var img  = new Array();
						img[0]="https://t1.daumcdn.net/friends/prod/category/category_rion_on.png", 
						img[1]="https://t1.daumcdn.net/friends/prod/category/category_apeach_on.png", 
						img[2]="https://t1.daumcdn.net/friends/prod/category/category_muzi_on.png", 
						img[3]="https://t1.daumcdn.net/friends/prod/category/category_frodo_on.png"
     				function imgRandom(imgArr) {
      				  return imgArr[Math.floor(Math.random() * 3)];
   						 }
					 // 데스크탑 알림 요청
					 var options = {
								body:msg,
								 icon: imgRandom(img),  
								/* icon : "https://t1.daumcdn.net/friends/prod/category/category_rion_on.png", */
								dir: 'rtl'
		    }
					 var notification = new Notification("채팅알림", options);
		    // 3초뒤 알람 닫기
		    setTimeout(function(){
		        notification.close();
		    },5000);
					}
				}
		var objDiv = document.getElementById("chatArea");
objDiv.scrollTop = objDiv.scrollHeight;
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
.name{
	float: left;
	text-align: center;
		margin-bottom: 7px;
	color: white;
}
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