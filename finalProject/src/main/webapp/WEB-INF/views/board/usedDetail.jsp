<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
<link rel="stylesheet" href="resources/css/detail.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div>
	<c:if test="${ empty loginUser }">
		<input id="empty" type="hidden" value="">
	</c:if>
	<c:if test="${ !empty loginUser }">
		<input id="empty" type="hidden" value="on">
	</c:if>
	<input id="sgId" type="hidden" value="${ board.SG_ID }">
	<input id="userId" type="hidden" value="${ loginUser.user_id }">
	<input id="nickName" type="hidden" value="${ loginUser.nickName }">
	
		<div class="evPage"	style="height: auto; width: 100%; background: #ffffff; text-align: center;">
			<div class="pg" style="width: 1000px; height: 1130px; display: inline-block; background: #f5f5f5;">
				<br>
				<div class="headLine" style="width: auto; display: inline-block;">
					<h2>${board.SG_BNAME }</h2>
					<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}" style="width: 500px; height: 500px;"> 
					<br>
					<br>
					<p style="border-top: 1px solid gray;">${board.SG_ENROLL_DATE}</p>
				</div>
				<div style="height: 300px; width: 100%; background: #f5f5f5;">
					<div style="display: inline-block;">
						<div class="col-md-7" style="float: left; width: 500px;">
							<div method="post" class="colorlib-form" style="padding: 0em;">

								<div class=" row">

									<br>
									<div class="col-md-12">
										<div class="form-group">
											<label for="companyname">가격</label>
											<fmt:formatNumber var="price" value="${board.SG_PRICE }" type="currency" />
											<div class="form-control" style="text-align: center;">
												<span style="font-size: 20px; color: #ff8400;">${price }</span>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div style="height: 70px;">
											<div style="float: left; width: 200px; height: 110px;">
												<label for="companyname">거래 방식</label>
												<div class="col-md-12">
													<div class="radio">
														<c:if test="${board.SG_DEAL eq 'DELIVERY' }">
															<label><input type="radio" name="dealType"
																value="직거래" disabled>직거래</label>
															<label><input type="radio" name="dealType"
																value="택배" disabled checked><span
																style="color: #ff8400;">택배거래</span></label>
														</c:if>
														<c:if test="${board.SG_DEAL eq 'DIRECT' }">
															<label><input type="radio" name="dealType"
																value="직거래" disabled checked><span
																style="color: #ff8400;">직거래</span></label>
															<label><input type="radio" name="dealType"
																value="택배" disabled>택배거래</label>
														</c:if>
													</div>
												</div>
												<div class="col-md-12">

													<c:if test="${board.SG_DEAL eq 'DIRECT' }">
														<div class="radio" style="opacity: 0;">
													</c:if>
													<c:if test="${board.SG_DEAL eq 'DELIVERY' }">
														<div class="radio" style="opacity: 1;">
													</c:if>
													<c:if test="${board.SG_DELIVERY eq 'N' }">
														<label><input type="radio" name="dealType2"
															value="N" disabled checked><span
															style="color: #ff8400;">배송비 별도</span></label>
														<label><input type="radio" name="dealType2"
															value="Y" disabled>무료배송</label>
													</c:if>
													<c:if test="${board.SG_DELIVERY eq 'Y' }">
														<label><input type="radio" name="dealType2"
															value="N" disabled>배송비 별도</label>
														<label><input type="radio" name="dealType2"
															value="Y" disabled checked><span
															style="color: #ff8400;"> 무료배송</span></label>
													</c:if>
												</div>
											</div>
										</div>
										<c:if test="${board.SG_DEAL eq 'DIRECT' }">
											<div style="float: left;">
										</c:if>
										<c:if test="${board.SG_DEAL eq 'DELIVERY' }">
											<div style="float: left; opacity: 0;">
										</c:if>
										<label for="companyname">거래 지역</label>
										<div class="form-control" style="width: 280px; height: 40px;">
											<a>${ board.SG_AREA}</a>
										</div>
									</div>
								</div>
								<br> <br>
								<div style="width: 200px; height: 50px; float: left;">
									<span class="new">#${board.TAG_NAME}</span>
									<!-- <span class="new">#New</span> -->
								</div>
								<div style="width: 200px; height: 50px; float: left;">
									<!-- 좋아요랑 조회수 표시 -->
									<div class="sbViewAtag">
										<h3>
											<i class="icon-eye"></i>
										</h3>
										<a>${board.SG_COUNT}</a>
									</div>
									<div class="sbViewAtag">
										<h3>
										<i class="icon-heart2" id="clickTest" style="font-size: 18px;"></i>
										</h3>
										<a id="likeCount">${ board.SG_LIKE }</a>
									</div>
									<script>
									// 로그인한 유저가 좋아요를 했는지 않했는지
							  		var likeCheck = false;
									var likeCountCheck = false;
									
									$(function(){
									  $.ajax({
									    url:"selectLikeCheck.bo",
									    data:{
									      user_Id : "${ loginUser.user_id}",
									      sgId : "${ board.SG_ID}"
									    },success: function(data){
									      if(data.result == 1){
									        $('#clickTest').attr('class','icon-heart3');
									        $('#clickTest').css('font-size','');
									        likeCheck=true;
									        likeCountCheck=true;
									      }else if(data.result == 0){
									        $('#clickTest').attr('class','icon-heart2');
									        $('#clickTest').css('font-size','18px');
									        likeCheck=data.check;
									        likeCountCheck=false; 
									      }
									    }
									  });
									  
									  $.ajax({
									    url:"createCookie.bo",
									    data:{
									      user_Id : "${ loginUser.user_id }",
									      sgId : "${ board.SG_ID }"
									    }
									  });
									});
									// 좋아요 눌렀을시 이벤트
										$('#clickTest').on('click',function(){
										  var userCheck = "${ loginUser.user_id}";
										  
										  if(userCheck.length > 0){
											  $.ajax({
											    url: "selectLike.bo",
											    data: {
											      user_Id : "${ loginUser.user_id }",
											      sgId : "${ board.SG_ID }",
											      likeCheck : likeCheck
											    },
											    success: function(data){
											      if(data == 1){
											        $('#clickTest').attr('class','icon-heart3');
											        $('#clickTest').css('font-size','');
											        if(likeCountCheck==false){
												    	$('#likeCount').html("${ board.SG_LIKE + 1}");
											        }else{
											        	$('#likeCount').html("${ board.SG_LIKE}");
											        }
											        likeCheck=true;
											      }else if(data == 0){
											        $('#clickTest').attr('class','icon-heart2');
											        $('#clickTest').css('font-size','18px');
											        if(likeCountCheck==true){
											        	$('#likeCount').html("${ board.SG_LIKE - 1}");
											        }else{
												        $('#likeCount').html("${ board.SG_LIKE }");
											        }
											        likeCheck=true;
											      }
											    }
											  });
										  }
										});
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div style="width: 100%; height: 60px; display: inline-block;">
			<c:url value="boardupdateForm.bo?type=1" var="bUpdate">
				<c:param name="sgId" value="${board.SG_ID }" />
			</c:url>
			<c:url value="shipInfo.py" var="shipInfo">
				<c:param name="sgId" value="${ board.SG_ID }"/>
			</c:url>
			<c:if test="${ !empty loginUser && loginUser.user_id ne board.USER_ID }">
			<button class="btn btn-primary" onclick="location.href='${ shipInfo }'">구매 </button>			
			</c:if>
			<c:if test="${ !empty loginUser && loginUser.user_id eq board.USER_ID }">
			<button class="btn btn-primary" onclick="location.href='${bUpdate}';">수정</button>
			<button class="btn btn-primary" onclick="deleteBtn();">글삭제</button>
			</c:if>
			<button class="btn btn-primary" onclick="location.href = document.referrer;">뒤로가기</button>
		</div>
	</div>
	<br>

	<div
		style="width: 90%; min-height: 300px; height: auto; display: inline-block;">${board.SG_INFO }</div>
	<div id="replyTag">
		<div
			style="width: 800px; height: auto; padding-left: 50px; display: inline-block; text-align: initial;">
			<br>
			<div style="width: 100%; height: 50px; text-align: center;">
				<span id="replyOpen" style="display: inline-block; cursor: pointer;">댓글
					보기</span>
			</div>
			<hr>
			<div class="comment">
				<span>댓글 쓰기</span>
			</div>
			<div id="commentArea">
		
	</div>
			<!-- 댓글 입력 -->
			<div class="comment">
				<div style="padding-left: 60px;">
					<textarea id="replyArea"></textarea>
					<button class="replyBtn" type="button" >댓글 등록</button>
				</div>
			</div>
		</div>

		<!-- 댓글 페이징 -->
		<br>
		<br>
		<div style="width: 100%; text-align: center;">
			<div id="pageingArea" style="width: 200px; height: 30px; display: inline-block;">
							<ul class="pagination">
									
							</ul> 
			</div>
		</div>
		<br>
	</div>
	<hr>
	<script>
	var sgId=parseInt($('#sgId').val());
	function deleteBtn() {
		var con_test = confirm("정말 삭제 하시겠습니까?");
		if (con_test) {
			//alert(${board.SG_ID});
			location.href = "deleteBoard.bo?sgId="+sgId+"&type=1";
			
		}
	};
	</script>
	<script src="resources/js/detail.js"></script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>