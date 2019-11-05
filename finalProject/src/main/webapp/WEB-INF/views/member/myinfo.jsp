<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@media (max-width: 700px){
	button {
	font-size : 10px;}
}

.tab-content, .tab-content.current, .tab-content.contact-wrap, .tab-content.current .contact-wrap {background:white !important;}
.tab-content.current input[type=text], .tab-content.current input[type=email], .tab-content.current input[type=tel]
{background: whitesmoke !important;}
.buttons input {font-size:12px;}
</style>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<!-- 내 정보 수정 -->
	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">

		<div class="mypageCategory no-drag">
			<ul class="my-tabs">
				<li class="my-tab"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
				<li class="my-tab"><a href="mypost.me">내가 쓴 글</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%;">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link current" data-tab="tab-1">내 정보 수정</li>
						<li class="tab-link" data-tab="tab-2">판매자 전환</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="clear-fix" style="width:100%; height:30px;"></div>
						<div class="contact-wrap" style="height: auto;">
							<form action="#">
								<div class="row form-group">
									<div class="col-md-6 padding-bottom">
										<label for="user_id">유저아이디</label> <input type="text"
											name="user_id" class="form-control no-drag" value="유저아이디"
											readonly>
									</div>
									<div class="col-md-6">
										<label for="nickname">별명</label> <input type="text"
											name="nickname" class="form-control" value="별명">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-6">
										<label for="phone">연락처</label> <input type="tel" name="phone1"
											class="form-control" value="010">
									</div>
									<div class="col-md-6">
										<label for="email">이메일</label> <input type="email"
											name="email" class="form-control" value="user@gmail.com">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-6" style="display:inline;">
										<!-- <label for="address">주소</label> <input type="text"
											name="address" class="form-control" value="서울시 강남구 역삼동"> -->
										<label for="post">우편번호</label>
										<input type="text" name="post" class="postcodify_postcode5 form-control" value="" size="6">
									</div>
									
									<div class="col-md-6">
										<label>&nbsp;&nbsp;검색하기</label><br>
										<button type="button" id="postcodify_search_button" class="btn btn-default" style="margin-top:5px;">검색</button>
									</div>
									<div class="col-md-12">
										<!-- <label for="address">주소</label> <input type="text"
											name="address" class="form-control" value="서울시 강남구 역삼동"> -->
										<label for="post">도로명 주소</label>
										<input type="text" name="address1" class="postcodify_address form-control" value="">
									</div>
									<div class="col-md-12">
										<!-- <label for="address">주소</label> <input type="text"
											name="address" class="form-control" value="서울시 강남구 역삼동"> -->
										<label for="post">상세 주소</label>
										<input type="text" name="address2" class="postcodify_extra_info form-control" value="">
									</div>
								</div>

								<!-- jQuery와 Postcodify를 로딩한다. -->
								<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
								<script>
									// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
									$(function(){
										$("#postcodify_search_button").postcodifyPopUp();
									});
								</script>
								<div class="clear-fix" style="width:100%; height:80px;"></div>
								<div class="form-group text-center buttons">
									<input type="submit" value="수정완료" class="btn btn-primary">
									<input type="button" value="비밀번호변경" class="btn btn-info">
									<input type="submit" value="회원탈퇴" class="btn btn-danger">
								</div>
							</form>
						</div>
					</div>
					
					<!-- 판매자 인증 화면 -->
					<div id="tab-2" class="tab-content">
						<div class="content-wrap" style="height:100%">
							<form action="#">
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="user_id">유저아이디</label> <input type="text"
											name="user_id" class="form-control" value="유저아이디"
											style="background: lightgray !important" disabled>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="phone">실명 인증</label>
										<input type="text" id="name"></input>
										<button type="button" id="certi">휴대폰 인증</button>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="email">계좌 인증</label>
										<button type="button" id="account">계좌 인증</button>
									</div>
								</div>


								<div class="form-group text-center">
									<input type="submit" value="판매자 전환신청" class="btn btn-primary">
									<input type="reset" value="취소" class="btn btn-info">
								</div>
							</form>
						</div>
					
					</div>

				</div>

			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>