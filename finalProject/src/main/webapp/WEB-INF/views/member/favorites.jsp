<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 거래, 경매는 이브닝 : 관심상품목록</title>
<style>
.product-list {
	width:100%;
	height:750px;
}

.product-entry .product-img{
	height: 200px !important;
}

.product-container {
	width: 200px;
	height: 250px;
	border: 1px solid black;
	display: inline-block;
}
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
			<li class="my-tab" onclick="clickRefresh();"><a href="myinfo.me">내
					정보 보기</a></li>
			<li class="my-tab active"><a href="favorites.me">관심상품목록</a></li>
			<li class="my-tab"><a href="dealDetail.me">입찰내역</a></li>
			<li class="my-tab"><a href="pList.py">결제내역</a></li>
			<li class="my-tab"><a href="mypost.me?category=Community">내가
					쓴 글</a></li>
			<li class="my-tab"><a href="message.sr">쪽지함</a></li>
		</ul>
		
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%; padding: 0;">
			<div class="contact-wrap" style="height: 950px;">
				<!-- <form style="height: 100%;"> -->
					<select id="boardType" class="form-control sidebar colorlib-form-2">
						<option value="SG">중고제품</option>
						<option value="A">경매제품</option>
					</select><br>
					<!-- 중고 리스트 -->
					<div class="product-list sg">
					<c:if test="${ alist != null && bc == 'SG' }">
						<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
							<div class="col-md-4 text-center">
								<div class="product-entry">
								
									<!-- 이미지 삽입 : 이미지 파일이 여러개일시 첫번째 이름을 등록 -->
									<c:forEach var="j" items="${ af }" begin="0" end="${ fn:length(af) }">
										<c:if test="${ j.SG_ID eq i.board.SG_ID }">
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
										<fmt:parseDate var="enroll" value="${ i.board.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
										<fmt:parseDate var="end" value="${ i.board.SG_END_DATE }" pattern="yyyy-MM-dd"/>
										
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
										<h3><a onclick="oneClick(${i.board.SG_ID});" style="cursor: pointer;">${ i.board.SG_BNAME }</a></h3>
										<p class="price">가격<span> <br> <fmt:formatNumber value="${i.board.SG_PRICE }" type="currency"/></span></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					</div>
					
					
					<!-- 옥션 리스트 -->
					<div class="product-list a">
					<c:if test="${ alist != null && bc == 'A' }">
						<c:forEach var="i1" items="${ alist }" begin="0" end="${ fn:length(alist) }">
							<div class="col-md-4 text-center">
								<div class="product-entry">
								
									<!-- 이미지 삽입 : 이미지 파일이 여러개일시 첫번째 이름을 등록 -->
									<c:forEach var="j1" items="${ af }" begin="0" end="${ fn:length(af) }">
										<c:if test="${ j1.SG_ID eq i1.board.SG_ID }">
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
										<fmt:parseDate var="enroll1" value="${ i1.board.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
										<fmt:parseDate var="end1" value="${ i1.board.SG_END_DATE }" pattern="yyyy-MM-dd"/>
										
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
												<span><a onclick="return false;" id="clickLike${ i1.board.SG_ID }"><i class="" id="clickTest${ i1.board.SG_ID }"></i><span id="likeCount${ i1.board.SG_ID }">${ i1.board.SG_LIKE }</span></a></span>
												<input type="text" id="Check${ i1.board.SG_ID }" value="false" hidden="hidden" >
												<input type="text" id="CountCheck${ i1.board.SG_ID }" value="false" hidden="hidden" >
												<script>
												
												$(function(){
												  $.ajax({
												    url:"selectLikeCheck.bo",
												    data:{
												      user_Id : "${ loginUser.user_id}",
												      sgId : "${ i1.board.SG_ID}"
												    },success: function(data){
												      if(data.result == 1){
												        $('#clickTest${ i1.board.SG_ID }').attr('class','icon-heart3');
												        $('#clickTest${ i1.board.SG_ID }').css('font-size','16px');
												        $('#Check${ i1.board.SG_ID }').val(true);
												        $('#CountCheck${ i1.board.SG_ID }').val(true);
												      }else if(data.result == 0){
												        $('#clickTest${ i1.board.SG_ID }').attr('class','icon-heart2');
												        $('#clickTest${ i1.board.SG_ID }').css('font-size','13px');
												        $('#Check${ i1.board.SG_ID }').val(data.check);
												        $('#CountCheck${ i1.board.SG_ID }').val(false);
												      }
												    }
												  });
												});
												// 좋아요 눌렀을시 이벤트
													$('#clickLike${ i1.board.SG_ID }').on('click',function(){
													  var userCheck = "${loginUser.user_id}";
													  
													  if(userCheck.length > 0){
														  $.ajax({
														    url: "selectLike.bo",
														    data: {
														      user_Id : "${ loginUser.user_id }",
														      sgId : "${ i1.board.SG_ID }",
														      likeCheck : $('#Check${ i1.board.SG_ID }').val()
														    },
														    success: function(data){
														      if(data == 1){
														        $('#clickTest${ i1.board.SG_ID }').attr('class','icon-heart3');
														        $('#clickTest${ i1.board.SG_ID }').css('font-size','16px');
														        if( $('#CountCheck${ i1.board.SG_ID}').val() == 'false' ){
															    	$('#likeCount${ i1.board.SG_ID }').html("${ i1.board.SG_LIKE + 1}");
														        }else{
														        	$('#likeCount${ i1.board.SG_ID }').html("${ i1.board.SG_LIKE}");
														        }
														      }else if(data == 0){
														        $('#clickTest${ i1.board.SG_ID }').attr('class','icon-heart2');
														        $('#clickTest${ i1.board.SG_ID }').css('font-size','13px');
														        if( $('#CountCheck${ i1.board.SG_ID}').val() == 'true' ){
														        	$('#likeCount${ i1.board.SG_ID }').html("${ i1.board.SG_LIKE - 1}");
														        }else{
															        $('#likeCount${ i1.board.SG_ID }').html("${ i1.board.SG_LIKE }");
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
		                                    <c:param name="sgId" value="${ i1.board.SG_ID }"/>
		                                 </c:url>
		                                 <h3><a href="${ detailView }" style="cursor: pointer;">${ i1.board.SG_BNAME }</a></h3>
		                                 <p class="price">현재 경매가<span> <br> <fmt:formatNumber value="${i1.board.SG_PRICE }" type="currency"/></span></p>
		                                 <p class="price">경매 시작가<span> <br> <fmt:formatNumber value="${i1.board.SG_SPRICE }" type="currency"/></span></p>
									</div>
									
								</div>
							</div>
						</c:forEach>
					</c:if>
					</div>		
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
				<!-- </form> -->
			</div>
		</div>
	</div>
	<script>
		$(function(){
			var bType = '${bc}';
			$('#boardType').val(bType).prop('selected', true);
			if(bType == 'A'){
				$('.sg').css("height", "0");
				$('.a').css("height", "750px");
			} else {
				$('.sg').css("height", "750px");
				$('.a').css("height", "0");
			}
			$('#boardType').on('change', function(){
				if($('#boardType').val() == 'A'){
					location.href="favorites.me?bCategory=A";
				} else if($('#boardType').val() == 'SG'){
					location.href="favorites.me?bCategory=SG";
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