<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 경매, 거래는 이브닝 : 내 정보 보기</title>
<style>

@media (max-width: 700px){
	button {
	font-size : 10px;}
}

#down {
	visibility: hidden;
}

.product-list {
	width:100%;
	bakcground: white;
}

.product-entry .product-img{
	height: 200px !important;
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
	color:black;
	/* background: #f2d7c6; */
	/* background: whitesmoke; */
	text-align:center;
	margin:auto;
}

.seller {
	background: white !important;
	width: 300px !important;	
	color: black !important;
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
			<li class="my-tab active" onclick="clickRefresh();"><a href="myinfo.me">내
					정보 보기</a></li>
			<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
			<li class="my-tab"><a href="dealDetail.me">입찰내역</a></li>
			<li class="my-tab"><a href="pList.py">결제내역</a></li>
			<li class="my-tab"><a href="mypost.me?category=Community">내가
					쓴 글</a></li>
			<li class="my-tab"><a href="message.sr">쪽지함</a></li>
		</ul>
		<div class="col-md-10 col-md-offset-1 mypage"
			style="margin: 0; width: 80%; padding: 0;" id="tabs">
			<div class="contact-wrap" id="bigContainer" style="height: 950px;">
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
											<br> <i class="fas fa-user-check fa-3x"></i><br>
											<br>
											<h4>판매자 전환 신청이 완료되었습니다!</h4>
											<h6>사이트 관리자의 승인이 필요합니다</h6>
											<h6>최대한 빠른 시일 내에 처리해드리겠습니다</h6>
										</div>
									</c:if>
									<c:if test="${ loginUser.rank_code eq 'HM' }">
										<div id="seller" class="no-drag">
											<br>
											<br> <img src="resources/images/eve-logo.png"><br>
											<br>
											<h4>이미 판매자 회원입니다</h4>
											<h6>여러 회원들에게 당신의 중고제품을 판매할 수 있습니다</h6>
											<h6>경매로도 거래가 가능해요<i class="far fa-smile"></i></h6>
											<br><br>
											<button type="button" class="btn btn-primary seller" onclick="location.href='secondgoodList.bo'">중고거래 하러가기</button>
											<button type="button" class="btn btn-primary seller" onclick="location.href='auctionList.bo'">경매거래 하러가기</button>
										</div>
									</c:if>
									<c:if test="${ loginUser.rank_code eq 'E' }">
										<div id="seller" class="no-drag">
											<br>
											<br> <img src="resources/images/eve-logo.png"><br>
											<br>
											<h4>이클립스등급의 회원은 판매자 전환 신청이 불가능합니다</h4>
											<h6>강등된 지 일주일 후에 다시 초승달등급의 회원이 되었을 때</h6>
											<h6>판매자 회원 신청이 가능합니다</h6>
											<br><br>
											<button type="button" class="btn btn-primary seller" onclick="location.href='secondgoodList.bo'">중고거래 하러가기</button>
											<button type="button" class="btn btn-primary seller" onclick="location.href='auctionList.bo'">경매거래 하러가기</button>
										</div>
									</c:if>
								</div>
							</form>
						</div>
					</div>

					<!-- 내가 등록한 상품 -->
					<div id="tab-3" class="tab-content">
						<c:if test="${ loginUser.rankCode.rank_code eq 'NM' && loginUser.seller_request == 'N' }">
							<div class="contact-wrap" style="margin: 0;">
								<form action="sellerRequest.me" style="height: 100%;">
									<div class="containe form-field">
										<div id="seller">
											<br><img src="resources/images/eve-logo.png"><br>
											<h4>아직 판매자가 아니시네요..</h4>
											<h6>판매자가 되면</h6>
											<h6>여러 사람들과 중고 물품을 거래할 수 있습니다</h6>
											<button class="btn btn-primary" type="button" id="seller_request"
												style="font-size: 12px !important;">판매자 전환신청하러 가기</button>
										</div>
									</div>
								</form>
							</div>
							</c:if>
							<c:if test="${ loginUser.rankCode.rank_code eq 'NM' && loginUser.seller_request == 'Y' }">
								<div class="contact-wrap" style="margin: 0;">
								<!-- <div>
									판매자 전환 신청이 완료되었습니다. <br> 사이트 관리자의 승인이 필요합니다. <br>
									최대한 빠른 시일 내에 처리해드리겠습니다. <br>
									</div> -->
									<div id="seller" class="no-drag">
										<br>
										<br> <i class="fas fa-user-check fa-3x"></i><br>
										<br>
										<h4>판매자 전환 신청이 완료되었습니다!</h4>
										<h6>사이트 관리자의 승인이 필요합니다</h6>
										<h6>최대한 빠른 시일 내에 처리해드리겠습니다</h6>
									</div>
								</div>	
							</c:if>
												
												
												
							<!-- 내가 올린 상품 -->					
							<c:if test="${ loginUser.rankCode.rank_code eq 'HM' }">
								<div class="contact-wrap" style="margin: 0; margin-top:10px !important; padding:0 !important;">
									<form style="height: 100%;">
										<select id="boardType" class="form-control sidebar colorlib-form-2">
											<option value="SG">중고제품</option>
											<option value="A">경매제품</option>
										</select><br>
										<!-- 중고 리스트 -->
										<div class="product-list">
										<c:if test="${ alist != null && bc == 'SG' }">
											<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
												<div class="col-md-4 text-center">
													<div class="product-entry">
													
														<!-- 이미지 삽입 : 이미지 파일이 여러개일시 첫번째 이름을 등록 -->
														<c:forEach var="j" items="${ af }" begin="0" end="${ fn:length(af) }">
															<c:if test="${ j.SG_ID eq i.SG_ID }">
																<c:forTokens items="${ j.RENAMEFILENAME }" delims="," varStatus="jStatus">
																	<c:if test="${ jStatus.first }">
																		<c:set var="k" value="${ jStatus.current }" />
																	</c:if>
																</c:forTokens>
															</c:if>
														</c:forEach>
														<div class="product-img" style="background-image: url(resources/thumbnail/${ k })">
														
														<!-- 사진이 없을시 나타날 공백표시 -->
														<c:remove var="k"/>
														
														<!-- 테스트용 ( 날짜 계산 )  -->
															<jsp:useBean id="now" class="java.util.Date"/>
															<fmt:parseDate var="enroll" value="${ i.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
															<fmt:parseDate var="end" value="${ i.SG_END_DATE }" pattern="yyyy-MM-dd"/>
															
															<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
															<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>
				
																<p class="tag">
																	<c:if test="${ ( nowDays - enrollDays ) <= 7 }">
																		<span class="new">New</span>
																	</c:if>
																</p>
				
																<div class="cart">
																	<p>
																		<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
																		<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
																		<span><a href="#"><i class="icon-heart3"></i></a></span>
																		<!-- <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span> -->
																	</p>
																</div>
																
														</div>
														
														<div class="desc">
															<h3><a onclick="oneClick(${i.SG_ID});" style="cursor: pointer;">${ i.SG_BNAME }</a></h3>
															<p class="price">가격<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										</div>
										
										
										<!-- 옥션 리스트 -->
										<div class="product-list">
										<c:if test="${ alist != null && bc == 'A' }">
											<c:forEach var="i1" items="${ alist }" begin="0" end="${ fn:length(alist) }">
												<div class="col-md-4 text-center">
													<div class="product-entry">
													
														<!-- 이미지 삽입 : 이미지 파일이 여러개일시 첫번째 이름을 등록 -->
														<c:forEach var="j1" items="${ af }" begin="0" end="${ fn:length(af) }">
															<c:if test="${ j1.SG_ID eq i1.SG_ID }">
																<c:forTokens items="${ j1.RENAMEFILENAME }" delims="," varStatus="jStatus">
																	<c:if test="${ jStatus.first }">
																		<c:set var="k" value="${ jStatus.current }" />
																	</c:if>
																</c:forTokens>
															</c:if>
														</c:forEach>
														<div class="product-img" style="background-image: url(resources/thumbnail/${ k })">
														
														<!-- 사진이 없을시 나타날 공백표시 -->
														<c:remove var="k1"/>
														
														<!-- 테스트용 ( 날짜 계산 )  -->
															<jsp:useBean id="now1" class="java.util.Date"/>
															<fmt:parseDate var="enroll1" value="${ i1.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
															<fmt:parseDate var="end1" value="${ i1.SG_END_DATE }" pattern="yyyy-MM-dd"/>
															
															<fmt:parseNumber value="${ now1.time / (1000*60*60*24) }" integerOnly="true" var="nowDays1"/>
															<fmt:parseNumber value="${ enroll1.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays1"/>
															<fmt:parseNumber value="${ end1.time / (1000*60*60*24) }" integerOnly="true" var="endDays1"/>
				
															<p class="tag">
																<c:if test="${ ( nowDays1 - enrollDays1 ) <= 7 }">
																	<span class="new">New</span>
																</c:if>
																<c:if test="${ (endDays1 - nowDays1) >= 0 }">
																	<span class="sale">D - ${ endDays1 - nowDays1 }</span>
																</c:if>
																<c:if test="${ (endDays1 - nowDays1) < 0 }">
																	<span class="sale">경매 종료</span>
																</c:if>
															</p>
			
															<div class="cart">
																<p> <!-- 좋아요 부분 -->
																	<span><a onclick="return false;" id="clickLike${ i1.SG_ID }"><i class="" id="clickTest${ i1.SG_ID }"></i><span id="likeCount${ i1.SG_ID }">${ i1.SG_LIKE }</span></a></span>
																	<input type="text" id="Check${ i1.SG_ID }" value="false" hidden="hidden" >
																	<input type="text" id="CountCheck${ i1.SG_ID }" value="false" hidden="hidden" >
																	<script>
																	
																	$(function(){
																	  $.ajax({
																	    url:"selectLikeCheck.bo",
																	    data:{
																	      user_Id : "${ loginUser.user_id}",
																	      sgId : "${ i1.SG_ID}"
																	    },success: function(data){
																	      if(data.result == 1){
																	        $('#clickTest${ i1.SG_ID }').attr('class','icon-heart3');
																	        $('#clickTest${ i1.SG_ID }').css('font-size','16px');
																	        $('#Check${ i1.SG_ID }').val(true);
																	        $('#CountCheck${ i1.SG_ID }').val(true);
																	      }else if(data.result == 0){
																	        $('#clickTest${ i1.SG_ID }').attr('class','icon-heart2');
																	        $('#clickTest${ i1.SG_ID }').css('font-size','13px');
																	        $('#Check${ i1.SG_ID }').val(data.check);
																	        $('#CountCheck${ i1.SG_ID }').val(false);
																	      }
																	    }
																	  });
																	});
																	// 좋아요 눌렀을시 이벤트
																		$('#clickLike${ i1.SG_ID }').on('click',function(){
																		  var userCheck = "${loginUser.user_id}";
																		  
																		  if(userCheck.length > 0){
																			  $.ajax({
																			    url: "selectLike.bo",
																			    data: {
																			      user_Id : "${ loginUser.user_id }",
																			      sgId : "${ i1.SG_ID }",
																			      likeCheck : $('#Check${ i1.SG_ID }').val()
																			    },
																			    success: function(data){
																			      if(data == 1){
																			        $('#clickTest${ i1.SG_ID }').attr('class','icon-heart3');
																			        $('#clickTest${ i1.SG_ID }').css('font-size','16px');
																			        if( $('#CountCheck${ i1.SG_ID}').val() == 'false' ){
																				    	$('#likeCount${ i1.SG_ID }').html("${ i1.SG_LIKE + 1}");
																			        }else{
																			        	$('#likeCount${ i1.SG_ID }').html("${ i1.SG_LIKE}");
																			        }
																			      }else if(data == 0){
																			        $('#clickTest${ i1.SG_ID }').attr('class','icon-heart2');
																			        $('#clickTest${ i1.SG_ID }').css('font-size','13px');
																			        if( $('#CountCheck${ i1.SG_ID}').val() == 'true' ){
																			        	$('#likeCount${ i1.SG_ID }').html("${ i1.SG_LIKE - 1}");
																			        }else{
																				        $('#likeCount${ i1.SG_ID }').html("${ i1.SG_LIKE }");
																			        }
																			      }
																			    }
																			  });
																		  }
																		});
																	</script>
																</p>
															</div>
														</div>
														<div class="desc">
															<c:url var="detailView" value="selectOne.bo">
							                                    <c:param name="sgId" value="${ i1.SG_ID }"/>
							                                 </c:url>
							                                 <h3><a href="${ detailView }" style="cursor: pointer;">${ i1.SG_BNAME }</a></h3>
							                                 <p class="price">현재 경매가<span> <br> <fmt:formatNumber value="${i1.SG_PRICE }" type="currency"/></span></p>
							                                 <p class="price">경매 시작가<span> <br> <fmt:formatNumber value="${i1.SG_SPRICE }" type="currency"/></span></p>
														</div>
														
													</div>
												</div>
											</c:forEach>
										</c:if>
										</div>
									</form>
								</div>
							</c:if>
							<div class="row"> <!-- 페이지 이동 바(페이징 처리) -->
							<div class="col-md-12">
								<ul class="pagination">
									<!-- 이전 페이지 -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a>&laquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="myinfo.me">
											<c:if test="${ alist != null && bc == 'A' }">
												<c:param name="bCategory" value="A"/>
											</c:if>
											<c:if test="${ alist != null && bc == 'SG' }">
												<c:param name="bCategory" value="SG"/>
											</c:if>
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<li><a href="${ before }">&laquo;</a></li>
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="myinfo.me">
												<c:if test="${ alist != null && bc == 'A' }">
													<c:param name="bCategory" value="A"/>
												</c:if>
												<c:if test="${ alist != null && bc == 'SG' }">
													<c:param name="bCategory" value="SG"/>
												</c:if>
												<c:param name="page" value="${ p }"/>
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									
									<!-- 다음 페이지 -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">&raquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="myinfo.me">
											<c:if test="${ alist != null && bc == 'A' }">
												<c:param name="bCategory" value="A"/>
											</c:if>
											<c:if test="${ alist != null && bc == 'SG' }">
												<c:param name="bCategory" value="SG"/>
											</c:if>
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<li><a href="${ after }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
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
	
	
	<!-- 내가 올린 상품 스크립트 -->
	<script>
		$(function(){
			var bType = '${bc}';
			$('#boardType').val(bType).prop('selected', true);
			console.log(bType =='SG');
			$('#boardType').on('change',function(){
				if($('#boardType').val() == 'A'){
					location.href="myinfo.me?bCategory=A";
				} else if($('#boardType').val() == 'SG'){
					location.href="myinfo.me?bCategory=SG";
				}
			});
		});
	
		$(function(){
			var activeTabIndex = $.cookie('activeTabIndex');
			if('${ bc }' == 'A' && activeTabIndex == 2){
				$('#bigContainer').attr('style',"");
				$('#bigContainer').attr('style',"height: 1100px");
			} else {
				$('#bigContainer').attr('style',"");
				$('#bigContainer').attr('style',"height: 950px");
			}
		});
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>