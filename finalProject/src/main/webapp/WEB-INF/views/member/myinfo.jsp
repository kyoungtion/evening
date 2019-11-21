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

#down {
	visibility: hidden;
}
.tab-content, .tab-content.current, .tab-content.contact-wrap, .tab-content.current .contact-wrap {background:white !important;}
.tab-content.current input[type=text], .tab-content.current input[type=email], .tab-content.current input[type=tel]
{background: whitesmoke !important;padding:10px !important; height:40px !important;}
.buttons input {font-size:12px;}
input:focus {background-color: white !important; border:1px solid lightgray !important;}
.my-tabs li.active{background: white !important;}

.my-panel{display:flex;}
</style>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<!-- 내 정보 수정 -->
	<div class="my-panel">
		<ul class="my-tabs">
			<li class="my-tab active"><a href="myinfo.me">내 정보 보기</a></li>
			<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
			<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
			<li class="my-tab"><a href="mypost.me?category=Community">내가 쓴 글</a></li>
		</ul>
		<div class="col-md-10 col-md-offset-1 mypage" style="margin: 0; width: 80%; padding: 0;">
			<div class="contact-wrap">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link current" data-tab="tab-1">내 정보 수정</li>
						<li class="tab-link" data-tab="tab-2">내가 올린 상품</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="contact-wrap" style="margin-top: 20px; border:0.5px solid lightgray" >
							<form action="mUpdate.me" id="mUpdate" method="POST">
								<div class="row form-group">
									<div class="col-md-6 padding-bottom">
										<label for="user_id">유저아이디</label> <input type="text"
											name="user_id" id="user_id" class="form-control no-drag" value="${ sessionScope.loginUser.user_id }"
											readonly >
									</div>
									<div class="col-md-6">
										<label for="nickname">별명</label> <input type="text"
											name="nickName" class="form-control" value="${ sessionScope.loginUser.nickName }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-6">
										<label for="phone">연락처</label> <input type="tel" name="phone"
											class="form-control" value="${ sessionScope.loginUser.phone }">
									</div>
									<div class="col-md-6">
										<label for="email">이메일</label> <input type="email"
											name="user_email" class="form-control" value="user@gmail.com">
									</div>
								</div>
				
								<c:forTokens var="addr" items="${ sessionScope.loginUser.address }" delims="/" varStatus="st">
									<c:if test="${ st.index eq 0 && addr >= '0' && addr <= '99999' }">
										<c:set var="post" value="${ addr }"/>
									</c:if>
									<c:if test="${ st.index eq 0 && !(addr >= '0' && addr <= '99999') }">
										<c:set var="address1" value="${ addr }"/>
									</c:if>
									<c:if test="${ st.index eq 1 }">
										<c:set var="address1" value="${ addr }"/>
									</c:if>
									<c:if test="${ st.index eq 2 }">
										<c:set var="address2" value="${ addr }"/>
									</c:if>
								</c:forTokens>
								
								<div class="row form-group">
									<div class="col-md-6" style="display:inline;">
										<label for="post">우편번호</label>
										<input type="text" name="post" class="postcodify_postcode5 form-control" value="${ post }" size="6">
									</div>
									
									<div class="col-md-6">
										<label>&nbsp;&nbsp;검색하기</label><br>
										<button type="button" id="postcodify_search_button" class="btn btn-default" style="margin-top:5px;">검색</button>
									</div>
									<div class="col-md-12">
										<label for="post">도로명 주소</label>
										<input type="text" name="address1" class="postcodify_address form-control" value="${ address1 }">
									</div>
									<div class="col-md-12">
										<label for="post">상세 주소</label>
										<input type="text" name="address2" class="postcodify_extra_info form-control" value="${ address2 }">
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
									<input type="button" id="mUpdateBtn" value="수정완료" class="btn btn-primary">
									<input type="button" onclick="updatePwdView();" value="비밀번호변경" class="btn btn-info">
									<input type="button" onclick="deleteMember();" value="회원탈퇴" class="btn btn-danger">
								</div>
							</form>
						</div>
					</div>
					
					<!-- 내가 등록한 상품 화면 -->
					<div id="tab-2" class="tab-content">
						<div class="contact-wrap"  style="margin:0 !important;">
							<form action="#">
								<div class="container">
								
								<!-- 여기안에 상품 리스트 넣으면 됨 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
									
									<select>
										<option>중고제품</option>
										<option>경매제품</option>
									</select><br>
									<br>
									<div class="product-container">상품</div>
									<div class="product-container">상품</div>
									<div class="product-container">상품</div>
									<div class="product-container">상품</div>
									<div class="product-container">상품</div>
									<div class="product-container">상품</div>
									<div class="page-container">
										<ul class="pagination">
											<li class="disabled"><a href="#">&laquo;</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">&raquo;</a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- 내 정보 수정 관련 스크립트 -->
	<script>
	
		
		$('#mUpdateBtn').on('click', function(){
			if(confirm("수정하시겠습니까?")){
				$('#mUpdate').submit();
				alert('회원정보가 수정되었습니다.');
			}
		});
		
		
		function updatePwdView(){
			
			var url = "updatePwdView.me";
			var name = "비밀번호 수정";
	
			var option = "width=620px, height=450px, top=100, left=200, resizable=0, location=0, scrollbars=0, tollbars=0, status=0";
			window.open(url, name, option);
			
		}
		
		function deleteMember(){
			if(confirm("정말로 탈퇴하시겠습니까?") == true){
				var user_id = '${loginUser.user_id}';
				var pwd = prompt("비밀번호를 입력하세요");
				$.ajax({
					url:"checkPwd.me",
					data:{user_id:user_id, user_pwd:pwd },
					success: function(){
						onSuccess();
					}
				});
			}
		};
		
		function onSuccess(){
			alert('탈퇴되었습니다.');
			location.href="mDelete.me";
		};
	</script>
	

	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>