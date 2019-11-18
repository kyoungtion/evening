<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등급 변경</title>

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

.lab2{
	font-weight:100;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<form id="updateCodeForm" action="updateRankCode.ad">
			<div class="row row-pb-md">
				<div class="col-md-10 col-md-offset-1" style="margin-top: 50px;">
					<div class="product-name" style="text-align: left;">
						<div class="one-eight text-center" style="width: 100%;">
							<span>&nbsp;등급 변경</span>
						</div>
					</div>
					<div class="product-cart"
						style="text-align: center; display: inline-block;">
						<br>
						<div style="display: inline-block; text-align: right;">
							<label class="lab">현재 등급&nbsp;</label><br> 
							<label class="lab">변경할 등급&nbsp;</label><br> 
						</div>
						<div
							style="text-align: center; display: inline-block;">
							<%-- <input type="hidden" name="user_id" value="${ sessionScope.loginUser.user_id }"> --%>
							<label class="lab2">${ m.rankCode.rank_name } ( ${ m.rankCode.rank_img } )</label><br>
							<label class="displaynone" id="rank_code">${ m.rankCode.rank_code }</label>
							<input type="hidden" name="user_id" value="${ m.user_id }">
							<select id="selectCode" name="rank_code">
								<option hidden selected value="none">회원등급</option>
								<option value="NM">초승달</option>
								<option value="HM">반달</option>
								<option value="FM">보름달</option>
								<option value="E">이클립스</option>
							</select>
							<%-- <label class="lab2">${ m.rankCode.rank_name } ( ${ m.rankCode.rank_img } )</label> --%>
						</div>
						<div style="display:inline-block;"></div><br>
						<div style="display:inline-block;">
							<span id="notice"></span>
						</div>
					</div>
					<div class="one-eight text-center">
						<button id="updateCode" type="button" class="btn btn-primary">회원등급 변경</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		$(function(){
			var myCode = $('#rank_code').text();
			if($('#selectCode').val() =="none"){
				$('#updateCode').attr("disabled", "disabled");
			} else {
				$('#updateCode').removeAttr("disabled");
			}
			$('#selectCode').on('change', function(){
				if(myCode == $('#selectCode').val()){
					alert('같은 등급으로는 변경할 수 없습니다.');
					$('#selectCode').val('none');
				}
				
				if($('#selectCode').val() =='none'){
					$('#updateCode').attr("disabled", "disabled");
				} else {
					$('#updateCode').removeAttr("disabled");
				}
			});
			
			$('#updateCode').click(function(){
				if(confirm("변경하시겠습니까?")){
					$('#updateCodeForm').submit();
					window.close();
					window.opener.location.reload();
				}
			});
		});
		
		
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