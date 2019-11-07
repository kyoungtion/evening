<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- header css -->
<link rel="stylesheet" href="resources/css/header.css">
<!-- Modernizr JS -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>

</head>
<body>

	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들어주자 -->
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />


	<header class="ebHeader">
	 <c:if test="${empty sessionScope.loginUser }">
		<div class="ebHeader-bar no-drag">
			<div style="height: 100%; overflow: hidden;">
				<div id="hLogo">
					<img src="resources/images/eve-logo.png">
				</div>
				<div id="navTag">
					<ul id="hNav">
						<li><a href="">경매</a></li>
						<li><a href="usedListAll.ud">중고거래</a></li>
						<li><a href="">게시판</a></li>
						<!-- 비회원시 -->

						<li><a href="login.me">로그인</a></li>
						<li><a href="">채팅</a></li>
						<li><a href="">회원가입</a></li>
		</c:if>
							
		<c:if test="${ !empty sessionScope.loginUser }">
							
						<!-- 로그인시 -->
						
						<li class="nav_sub"><a>마이페이지</a>
							<div style="position: fixed;">
								<ul id="test">
									<li><a href="myinfo.me">내정보보기</a></li>
									<li><a href="favorites.me">관심 목록</a></li>
									<li><a href="dealDetail.me">거래 내역</a></li>
									<li><a href="mypost.me">내가 쓴 글</a></li>
								</ul>
							</div></li>
						<li><a href="javascript:void(0);"
							onclick="window.open('pushMain.pu', '알림창', 'top=10, left=10, width=920, height=510, status=no, menubar=no, toolbar=no, resizable=no');"><img
								src="https://i.imgur.com/CNXbr6P.png"></a></li>
					</ul>
				</div>
			</div>
		</div>
		</c:if>
	</header>
	<div class="catalog no-drag">
		<div style="text-align: center; display: inline-block;">
			<ul class="catalog-ul">
				<li class="catalog-tap"><a style="font-size: 21px;">중고</a>
					<ul class="catalogTag">
						<li>중고</li>
						<li>중고</li>
						<li>중고</li>
						<li>중고</li>
					</ul></li>
				<li class="catalog-tap"><a style="font-size: 21px;">경매</a>
					<ul class="catalogTag">
						<li>경매</li>
						<li>경매</li>
						<li>경매</li>
						<li>경매</li>
					</ul></li>
				<li class="catalog-tap"><a style="font-size: 21px;">게시판</a>
					<ul class="catalogTag">
						<li>게시판</li>
						<li>게시판</li>
						<li>게시판</li>
						<li>게시판</li>
					</ul></li>
			</ul>
		</div>
	</div>








	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>


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
	<!-- header-->
	<script src="resources/js/header.js"></script>

	<script src="resources/js/mypage.js"></script>
</body>
</html>