<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.product-container {
	width: 200px;
	height: 250px;
	border: 1px solid black;
	display: inline-block;
}
.my-panel{display:flex;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel">
		<!-- <div style="width: 100%; text-align: center !important; padding: 10px;">
			<ul class="my-tabs1">
				<li class="my-tab"><button class="btn"
						onclick="location.href='myinfo.me'">내 정보 보기</button></li>
				<li class="my-tab"><button class="btn active"
						onclick="location.href='favorites.me'">관심상품목록</button></li>
				<li class="my-tab"><button class="btn"
						onclick="location.href='dealDetail.me'">거래내역</button></li>
				<li class="my-tab"><button class="btn"
						onclick="location.href='mypost.me'">내가 쓴 글</button></li>
			</ul>
		</div> -->
		<ul class="my-tabs">
			<li class="my-tab" onclick="clickRefresh();"><a href="myinfo.me">내 정보 보기</a></li>
			<li class="my-tab active"><a href="favorites.me">관심상품목록</a></li>
			<li class="my-tab" onclick="clickRefresh();"><a href="dealDetail.me">거래내역</a></li>
			<li class="my-tab"><a href="mypost.me?category=Community">내가 쓴 글</a></li>
		</ul>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%; padding: 0;">
			<div class="contact-wrap" style="height: 900px;">
				<form style="height: 100%;">
					<div class="container form-field ">
						
					
						<select id="people" class="form-control sidebar colorlib-form-2">
							<option value="">중고제품</option>
							<option value="">경매제품</option>
						</select><br>
							
						<!-- 여기안에 상품 리스트 넣으면 됨 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
					</div>
				</form>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>