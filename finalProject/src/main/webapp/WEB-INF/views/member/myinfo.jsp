<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mypageCategory {
	float: left;
	width: 150px;
	padding: 10px;
}

.container {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

ul.tabs li.current {
	background: #F2D7C6;
	color: #222;
}

.tab-content {
	display: none;
	height: 90%;
	background: #F2D7C6;
	padding: 15px;
	margin: 0;
	border: 0;
}

.tab-content.current {
	display: inherit;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<!-- 내 정보 수정 -->
	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">

		<div class="mypageCategory">
			<ul class="my-tabs">
				<li class="my-tab"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
				<li class="my-tab"><a href="mypost.me">내가 쓴 글</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%;">
			<div class="contact-wrap" style="height: 900px;">
				<h3 style="font-size: 15px">내 정보 보기</h3>
				<div class="container">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">내 정보 수정</li>
						<li class="tab-link" data-tab="tab-2">판매자 전환</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="contact-wrap" style="height: 100%;">
							<form action="#">
								<div class="row form-group">
									<div class="col-md-6 padding-bottom">
										<label for="user_id">유저아이디</label> <input type="text"
											name="user_id" class="form-control" value="유저아이디"
											style="background: lightgray !important" disabled>
									</div>
									<div class="col-md-6">
										<label for="nickname">별명</label> <input type="text"
											name="nickname" class="form-control" value="별명">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="phone">연락처</label> <input type="tel" name="phone"
											class="form-control" value="01011112222">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="email">이메일</label> <input type="email"
											name="email" class="form-control" value="user@gmail.com">
									</div>
								</div>

								<div class="row form-group">
									<div class="col-md-12">
										<label for="address">주소</label> <input type="text"
											name="address" class="form-control" value="서울시 강남구 역삼동">
									</div>
								</div>

								<div class="form-group text-center">
									<input type="submit" value="수정완료" class="btn btn-primary">
									<input type="button" value="비밀번호변경" class="btn btn-info"
										id="test"> <input type="submit" value="회원탈퇴"
										class="btn btn-danger" style="float: right;">
								</div>
							</form>
						</div>
					</div>
					<div id="tab-2" class="tab-content">판매자 전환 내용</div>

				</div>

			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>