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
	.product-name.content .one-eight, .product-cart.content .one-eight{
		width: 140px;
	}
	
	* {
		font-size: 12px !important;
	}

</style>
</head>
<body>
	<div class="container"><br>
		<div class="row row-pb-md">
			<div class="col-md-10 col-md-offset-1">
				<div class="product-name" style="text-align:left;">
					<div class="one-forth text-left" style="width:280px">
						<span>&nbsp;입찰 중인 상품 정보</span>
					</div>
					<div class="one-eight text-left" style="width:200px">
						<span>&nbsp;상품 이름</span>
					</div>
					<!-- <div class="one-eight text-center">
						<span>현재 입찰가</span>
					</div>
					<div class="one-eight text-center">
						<span>내 입찰가</span>
					</div>
					<div class="one-eight text-center">
						<span>입찰취소</span>
					</div> -->
				</div>
				<div class="product-cart">
					<div class="one-forth" style="width:280px">
						<div class="product-img"></div>
						<div class="display-tc">
							<h3>Product Image</h3>
						</div>
					</div>
					<div class="one-eight text-left" style="width:200px">
						<div class="display-tc">
							<span class="price">Product name</span>
						</div>
					</div>
					
				</div>
				
				
				<div class="product-name content">
					
					<div class="one-eight text-center">
						<span>&nbsp;입찰시작가</span>
					</div>
					<div class="one-eight text-center">
						<span>&nbsp;현재 입찰가</span>
					</div>
					<div class="one-eight text-center">
						<span>&nbsp;내 입찰가</span>
					</div>
					<div class="one-eight text-center">
						<span id="cancelAuc">&nbsp;입찰취소</span>
					</div>
				</div>
				<div class="product-cart content">
					
					<div class="one-eight text-center">
						<div class="display-tc">
							<span class="price">10000원</span>
						</div>
					</div>
					<div class="one-eight text-center">
						<div class="display-tc">
							<span class="price">10000원</span>
							
						</div>
					</div>
					<div class="one-eight text-center">
						<div class="display-tc">
							<form action="updateAuc.me">
								<input type="text" name="quantity"
									class="form-control input-number text-center" value="1" min="1"
									max="100">
							</form>
						</div>
					</div>
					<div class="one-eight text-center">
						<div class="display-tc">
							<a href="#" class="closed"></a>
						</div>
					</div>
				</div>
					<div class="one-eight text-center">
						<button class="btn btn-primary">입찰내역 수정</button>
					</div>
			</div>
		</div>

	</div>
	
	<script>
		$(function(){
			$('#cancelAuc').on('click', function(){
				if(confirm("취소하시면 등급에 영향을 미칠 수 있습니다. 취소하시겠습니까?"))
			})
			
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