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
#seller {
	border-radius: 150px;
	width:300px;
	height:300px;
	color:white;
	/* background: #f2d7c6; */
	background: whitesmoke;
	text-align:center;
	margin:auto;
}
</style>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<!-- 내 정보 수정 -->
	<div class="my-panel">
		<ul class="my-tabs">
			<li class="my-tab active" onclick="clickRefresh();"><a href="myinfo.me">내 정보 보기</a></li>
			<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
			<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
			<li class="my-tab"><a href="mypost.me?category=Community">내가
					쓴 글</a></li>
			<li class="my-tab"><a href="message.sr">쪽지함</a></li>
		</ul>
		<div class="col-md-10 col-md-offset-1 mypage"
			style="margin: 0; width: 80%; padding: 0;" id="tabs">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link" data-tab="tab-1"><a href="#tab-1">내 정보 수정</a></li>
						<li class="tab-link" data-tab="tab-2"><a href="#tab-2">판매자 전환 신청</a></li>
						<li class="tab-link" data-tab="tab-3"><a href="#tab-3">내가 올린 상품</a></li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="contact-wrap"
							style="margin-top: 20px; border: 0.5px solid lightgray">
							<form action="mUpdate.me" id="mUpdate" method="POST">
								<div class="row form-group">
									<div class="col-md-6 padding-bottom">
										<label for="user_id">유저아이디</label> <input type="text"
											name="user_id" id="user_id" class="form-control no-drag"
											value="${ sessionScope.loginUser.user_id }" readonly>
									</div>
									<div class="col-md-6">
										<label for="nickname">별명</label> <input type="text"
											name="nickName" class="form-control"
											value="${ sessionScope.loginUser.nickName }">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-6">
										<label for="phone">연락처</label> <input type="tel" name="phone"
											class="form-control"
											value="${ sessionScope.loginUser.phone }">
									</div>
									<div class="col-md-6">
										<label for="email">이메일</label> <input type="email"
											name="user_email" class="form-control" value="user@gmail.com">
									</div>
								</div>

								<c:forTokens var="addr"
									items="${ sessionScope.loginUser.address }" delims="/"
									varStatus="st">
									<c:if
										test="${ st.index eq 0 && addr >= '0' && addr <= '99999' }">
										<c:set var="post" value="${ addr }" />
									</c:if>
									<c:if
										test="${ st.index eq 0 && !(addr >= '0' && addr <= '99999') }">
										<c:set var="address1" value="${ addr }" />
									</c:if>
									<c:if test="${ st.index eq 1 }">
										<c:set var="address1" value="${ addr }" />
									</c:if>
									<c:if test="${ st.index eq 2 }">
										<c:set var="address2" value="${ addr }" />
									</c:if>
								</c:forTokens>

								<div class="row form-group">
									<div class="col-md-6" style="display: inline;">
										<label for="post">우편번호</label> <input type="text" name="post"
											class="postcodify_postcode5 form-control" value="${ post }"
											size="6">
									</div>

									<div class="col-md-6">
										<label>&nbsp;&nbsp;검색하기</label><br>
										<button type="button" id="postcodify_search_button"
											class="btn btn-default" style="margin-top: 5px;">검색</button>
									</div>
									<div class="col-md-12">
										<label for="post">도로명 주소</label> <input type="text"
											name="address1" class="postcodify_address form-control"
											value="${ address1 }">
									</div>
									<div class="col-md-12">
										<label for="post">상세 주소</label> <input type="text"
											name="address2" class="postcodify_extra_info form-control"
											value="${ address2 }">
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
								<div class="clear-fix" style="width: 100%; height: 80px;"></div>
								<div class="form-group text-center buttons">
									<input type="button" id="mUpdateBtn" value="수정완료"
										class="btn btn-primary"> <input type="button"
										onclick="updatePwdView();" value="비밀번호변경" class="btn btn-info">
									<input type="button" onclick="deleteMember();" value="회원탈퇴"
										class="btn btn-danger">
								</div>
							</form>
						</div>
					</div>

					<!-- 내가 판매자 전환 화면 -->
					<div id="tab-2" class="tab-content">
						<div class="contact-wrap" style="margin: 0;">
							<form action="sellerRequest.me" style="height: 100%;">
								<div class="container form-field">
									<c:if
										test="${ loginUser.rankCode.rank_code eq 'NM' && loginUser.seller_request == 'N' }">
										<div id="seller">
											<br>
											<br>
											<br> <img src="resources/images/eve-logo.png"><br>
											<h5>판매자가 되어</h5>
											<h6>여러 사람들과 중고 물품을 거래해보세요!</h6>
											<button class="btn btn-primary" type="button" id="seller_request"
												style="font-size: 12px !important;">판매자 전환 신청하러 가기</button>
										</div>
									</c:if>
									<c:if test="${ loginUser.rankCode.rank_code eq 'NM' && loginUser.seller_request == 'Y' }">
										<!-- <div>
											판매자 전환 신청이 완료되었습니다. <br> 사이트 관리자의 승인이 필요합니다. <br>
											최대한 빠른 시일 내에 처리해드리겠습니다. <br>
										</div> -->
										<div id="seller" class="no-drag">
											<br>
											<br>
											<br> <i class="fas fa-user-check fa-3x"></i><br>
											<br>
											<h5>판매자 전환 신청이 완료되었습니다!</h5>
											<h6>사이트 관리자의 승인이 필요합니다</h6>
											<h6>최대한 빠른 시일 내에 처리해드리겠습니다</h6>
										</div>
									</c:if>
								</div>
							</form>
						</div>
					</div>

					<!-- 내가 등록한 상품 -->
					<div id="tab-3" class="tab-content">
						<div class="contact-wrap" style="margin: 0;">
							<form action="sellerRequest.me" style="height: 100%;">
								<div class="containe form-field">
									<c:if test="${ loginUser.m_type ne 'seller'}">
										<div id="seller">
											<br> <br> <img src="resources/images/eve-logo.png"><br>
											<h6>아직 판매자가 아니시네요..</h6>
											<h5>판매자가 되면</h5>
											<h6>여러 사람들과 중고 물품을 거래할 수 있습니다</h6>
											<button class="btn btn-primary" type="button" id="seller_request"
												style="font-size: 12px !important;">판매자 전환신청하러 가기</button>
										</div>
									</c:if>
								</div>
							</form>
							<!-- 여기안에 상품 리스트 넣으면 됨 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
							<c:if test="${ loginUser.rankCode.rank_code eq 'HM' }">

							</c:if>

























						</div>

					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- 내 정보 수정 관련 스크립트 -->
	<script>
	
		/* 탭 메뉴 새로고침시 고정 스크립트 */
		$(function(){
			
			$('#tabs').tabs();
			var tabs = $('#tabs').tabs({
				activate: function(event, ui){
					var active = $('#tabs').tabs('option', 'active');
					$.cookie('activeTabIndex', active);
				}
			});
			
			var activeTabIndex = $.cookie('activeTabIndex');
			
			if(activeTabIndex != undefined){
				tabs.tabs('option','active',activeTabIndex);
			}
			
			
			
			/* if (location.hash == "#tab-1"){         
				$('.tabs').find('li').eq(0).addClass('current').siblings().removeClass('current');        
				
			} else if(location.hash == "#tab-2"){         
				$('.tabs').find('li').eq(1).addClass('current').siblings().removeClass('current');         
				
			} else if(location.hash == "#tab-3"){         
				$('.tabs').find('li').eq(2).addClass('current').siblings().removeClass('current');         
			}
			
			$('ul.tabs li').click(function(){
		        $('ul.tabs li').removeClass('current');
	
		        $(this).addClass('current');
			}); */
		});
		
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

	<!-- 판매자 전환 신청 스크립트 -->
	<script>
		$('#seller_request').on('click', function(){
			var user_id = '${ loginUser.user_id }';
			$.ajax({
				url:"sellerRequest.me",
				data:{user_id:user_id},
				success:function(data){
					if(data == "success"){
						alert('판매자 전환 신청이 완료되었습니다.');
						location.reload();
						var tabs = $('#tabs').tabs({
							activate: function(event, ui){
								var active = $('#tabs').tabs('option', 'active');
								$.cookie('activeTabIndex', active);
							}
						});
						
						var activeTabIndex = $.cookie('activeTabIndex');
						
						if(activeTabIndex != undefined){
							tabs.tabs('option','active',activeTabIndex);
						}
						
					} else {
						alert('오류가 발생했습니다. 관리자에게 문의바랍니다.');
					}
				}
			});
					
		});
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>