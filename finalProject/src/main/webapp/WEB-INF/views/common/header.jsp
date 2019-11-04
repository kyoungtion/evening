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
<!-- Modernizr JS -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>



<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	/* font-family: 'Gothic A1', sans-serif; */
}

a:hover, a:active, a:focus {
	color: #D98396;
	outline: none;
	text-decoration: none;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: black;
}

body {
	margin: 0;
}

.ebFooter {
	bottom: 0;
	width: 100%;
	height: 100px;
}

.ebHeader {
	height: 80px;
	width: 100%;
}

.ebHeader-bar {
	position: fixed;
	width: 100%;
	height: 80px;
	text-align: center;
	transition: .5s;
	/* overflow: hidden; */
	background: white;
	z-index: 100;
	border-bottom: .5px solid whitesmoke;
}

.scroll .ebHeader-bar {
	height: 40px;
	transition: .5s;
}

.scroll2 .ebHeader-bar {
	height: 0px;
	transition: .5s;
}

.scroll #hLogo {
	height: 38px;
	width: 38px;
	transition: .5s;
	margin: 1px 0 0 2px;
}

#hNav {
	list-style: none;
	display: table-cell;
	vertical-align: middle;
}

#hNav a {
	width: 100%;
}

#hNav>li {
	float: left;
	margin-right: 10px;
	color: white;
	min-width: 60px;
	font-size: 15px;
	/* cursor: pointer; */
}

#navTag {
	display: table;
	position: relative;
	float: right;
	height: 100%;
}

#hLogo {
	cursor: pointer;
	float: left;
	width: 70px;
	height: 70px;
	background: gray;
	margin: 4px 0 0 4px;
	transition: .1s;
}

#hLogo img {
	background: white;
	height: 100%;
}

.catalog {
	z-index: 99;
	display: inline-block;
	text-align: center;
	width: 100%;
	height: 60px;
	background: white;
	margin: auto;
	position: relative; /* 
	border-bottom: 1px solid #D98396; */
}

.catalog ul {
	padding: 0;
}

.catalog div {
	text-align: center;
	display: inline-block;
	border-bottom: whitesmoke;
}

.catalog-tap {
	float: left;
	width: 200px;
	height: 30px;
	/* border: .1px solid black; */
	margin: 15px 2px 0 0;
}

.catalog-tap>ul li {
	display: inline-block;
	width: 200px;
	height: 30px;
	margin: 4px 0 0 0;
}

.catalogTag {
	z-index: 10;
	margin-top: -5px;
	overflow: hidden;
	width: 100%;
	height: 0px;
	transition: .5s;
	background: #F2D7C6;
}

.catalog-tap:hover {
	background: #F2D7C6;
}

.catalog-tap.on .catalogTag {
	transition: .5s;
	/* border: .1px solid black; */
	border-top: 5px;
	height: 135px;
}

@media ( max-width : 980px) {
}

.nav_sub {
	/* position: relative; */
	z-index: 0;
}

.nav_sub>div {
	height: 0px;
	overflow: hidden;
	width: 75px;
	background: white;
	transition: .5s;
}

.nav_sub.on {
	transition: .5s;
	background: white;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

.nav_sub.on>div {
	height: 100px;
}

#test {
	padding: 0;
}

#test a {
	font-size: 13px;
}



span:after, span:before {
	background: #D98396 !important;
}
</style>
</head>
<body>

	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들어주자 -->
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />


	<header class="ebHeader">
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
						<li><a href="">로그인</a></li>
						<li><a href="">회원가입</a></li>
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
						<li><img src="../push_bell/img/bell.png" alt=""></li>
					</ul>
				</div>
			</div>
		</div>
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
	<script>
		var scla = window.scrollY || document.documentElement.scrollTop;
		var before = scla;
		$(document).scroll(function (e) {
			scla = window.scrollY || document.documentElement.scrollTop;

			if (scla > 15) {
				$('.ebHeader').addClass('scroll');

				if (before < scla && scla > 50) {
					$('.ebHeader').addClass('scroll2');
					$('.nav_sub').removeClass('on');
					console.log('up');
				} else {
					$('.ebHeader').removeClass('scroll2')
				}
				// else {
				//     $('.ebHeader').removeClass('scroll2');
				//     console.log('down');
				// }
			} else {
				$('.ebHeader').removeClass('scroll');
				$('.ebHeader').removeClass('scroll2')
			}
			before = scla;
		});

		$('.catalog-tap').hover(function () {
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
		}, function () {
			$(this).removeClass('on');
		});

		$('.catalog-ul li').hover(function () {
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
		}, function () {
			$(this).removeClass('on');
		});
		$('.nav_sub').hover(function () {
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
		}, function () {
			$(this).removeClass('on');
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