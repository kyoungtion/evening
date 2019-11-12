<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입찰내역 수정</title>

<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	rel="stylesheet">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<!-- Animate.css -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="resources/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="resources/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="resources/css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="resources/css/style.css">

<link
	href="https://fonts.googleapis.com/css?family=Gothic+A1|Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- Mypage style (경희) -->
<link rel="stylesheet" href="resources/css/mypage.css">
<!-- Modernizr JS -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>

<style>
.product-name.content .one-eight, .product-cart.content .one-eight {
	width: 140px;
}

* {
	font-size: 12px !important;
}

input[type=password] {
	width: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<form id="updatePwdForm" action="updatePwd.me" method="POST">
			<div class="row row-pb-md">
				<div class="col-md-10 col-md-offset-1" style="margin-top: 50px;">
					<div class="product-name" style="text-align: left;">
						<div class="one-eight text-center" style="width: 100%;">
							<span>&nbsp;입찰 중인 상품 정보</span>
						</div>
					</div>
					<div class="product-cart"
						style="text-align: center; display: inline-block;">
						<br>
						<div
							style="display: inline-block; text-align: right;">
							<label>현재 비밀번호&nbsp;</label><br> <label>변경할
								비밀번호&nbsp;</label><br> <label>변경할 비밀번호 확인&nbsp;</label><br>
						</div>
						<div
							style="text-align: center; display: inline-block;">
							<input type="password" name="user_pwd" id="pwd" placeholder="현재 비밀번호를 입력하세요."><br>
							<input type="password" id="newPwd" name="newPwd"
								placeholder="변경할 비밀번호를 입력하세요." required><br> <input
								id="checkPwd" type="password" name="newPwd2"
								placeholder="변경할 비밀번호 확인 " required>
						</div><br>
						<div style="display:inline-block;"></div><br>
						<div style="display:inline-block;">
							<span id="notice"></span>
						</div>
					</div>
					<div class="one-eight text-center">
						<button id="updatePwd" type="button" onclick="updatePwd();" class="btn btn-primary">비밀번호 변경</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		$(function() {
			$('#alert-success').hide();
			$('#alert-danger').hide();
			$('#checkPwd').keyup(function() {
				var newPwd = $('#newPwd').val();
				var checkPwd = $('#checkPwd').val();
				if (newPwd != "" && checkPwd != "") {
					if (newPwd == checkPwd) {
						$('#notice').text("비밀번호가 일치합니다.");
						$('#notice').css('color', 'lightsteelblue');
						$('#updatePwd').removeAttr("disabled");
					} else if (newPwd != checkPwd) {
						$('#notice').text("");
						$('#notice').text("비밀번호가 일치하지 않습니다.");
						$('#notice').css('color', 'tomato');
						$('#updatePwd').attr("disabled", "disabled");
					}
				}
				if (newPwd == "" && checkPwd == "") {
					$('#notice').text("");
				}
			});
		});
		
		function updatePwd(){
			var user_id = '${sessionScope.loginUser.user_id}';
			var pwd = $('#pwd');
			$.ajax({
				url:"checkPwd.me",
				data:{user_id:user_id, user_pwd : pwd},
				type:"POST",
				success: function(data){
					if(data == "success"){
						$('#updatePwdForm').submit();
					} else {
						alert('현재 비밀번호가 일치하지 않습니다.');
					}
				}
			});
		}
	</script>

	<!-- jQuery -->
	<script src="resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="resources/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="resources/js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="resources/js/main.js"></script>

	<script src="resources/js/mypage.js"></script>
</body>
</html>