<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
<style>
/* Insert Css */
.form-field {
	width: 45%;
	float: left;
	margin: 0 0 0 30px;
}

.new {
	font-size: 11px;
	background: #FFC300;
	color: #fff;
	padding: .3em .5em;
	border-radius: 2px;
	margin-right: 5px;
}

.sbViewAtag {
	float: right;
	width: 40px;
	height: 50px;
	margin: -5px 5px 0 0;
	line-height: 1;
	font-size: 10px
}

.sbViewAtag_img {
	width: 100%;
	height: 30px;
	background: gray;
}

.row {
	line-height: normal;
}

.radio {
	background: white;
}

.comment {
	height: auto;
	border-bottom: 1px solid black;
	padding: 20px 0 10px;
	width: 100%;
}

.comment2 {
	border-width: 0 0 1px 1px;
	border-style: solid;
	opacity: .4;
	width: 15px;
	float: left;
	height: 15px;
	margin: 10px 0px 0px 20px;
}

.comment div {
	margin-bottom: 10px;
}

#replyTag {
	width: 1000px;
	height: 70px;
	background: whitesmoke;
	display: inline-block;
	overflow: hidden;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div>
		<div class="evPage"
			style="height: auto; width: 100%; background: #ffffff; text-align: center;">
			<div class="pg"
				style="width: 75%; height: 1050px; display: inline-block; background: #f5f5f5;">
				<br>
				<div class="headLine" style="width: auto; display: inline-block;">
					<h2>${board.SG_BNAME }</h2>
					<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}"
						style="width: 500px; height: 500px;"> <br>
					<br>

					<p style="border-top: 1px solid gray;">${board.SG_ENROLL_DATE}</p>
				</div>
				<div style="height: 300px; width: 100%; background: #f5f5f5;">
					<div style="display: inline-block;">
						<%-- <div style="width: 230px; float: left; padding: none;">
						<div style="height: 30px;"></div>
						<div
							style="width: 200px; height: 200px; background: white; display: inline-block;">
							<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}"
								style="width: 100%; height: 100%;">
						</div>
						<p>썸네일 이미지</p>
					</div> --%>
						<div class="col-md-7" style="float: left; width: 500px;">
							<div method="post" class="colorlib-form" style="padding: 0em;">

								<div class=" row">

									<br>
									<div class="col-md-12">
										<div class="form-group">
											<label for="companyname">가격</label>

											<fmt:formatNumber var="price" value="${board.SG_PRICE }"
												type="currency" />
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
									<div class="sbViewAtag">
										<h3>
											<i class="icon-eye"></i>
										</h3>
										<a>${board.SG_COUNT}</a>
									</div>
									<div class="sbViewAtag">
										<h3>
											<i class="icon-heart3"></i>
										</h3>
										<a>${board.SG_LIKE }</a>
									</div>
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
			<button class="btn btn-primary">구매</button>
			<button class="btn btn-primary" onclick="location.href='${bUpdate}';">수정</button>
			<button class="btn btn-primary" onclick="deleteBtn();">글삭제</button>
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

			<!-- 댓글 입력 -->
			<div class="comment">
				<div style="padding-left: 60px;">
					<textarea id="replyArea" style="height: 95px; width: 80%; resize: none;"></textarea>
					<input type="hidden" id="replyInput">
					<button class="replyBtn" type="button"
						style="width: 15%; height: 100px; float: right; margin-right: 15px;">댓글 등록</button>
				</div>
			</div>
		</div>

		<!-- 댓글 페이징 -->
		<br>
		<br>
		<div style="width: 100%; text-align: center;">
			<div style="width: 200px; height: 30px; display: inline-block;">
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>4</button>
				<button>5</button>
			</div>
		</div>
		<br>
	</div>
	<hr>
	<script>
		function deleteBtn() {
			var con_test = confirm("정말 삭제 하시겠습니까?");
			if (con_test) {
				//alert(${board.SG_ID});
				location.href = "deleteBoard.bo?sgId=${board.SG_ID}&type=1";
			}
		};
	</script>
	<script>
		$(document).ready(function() {
			var click = 0;
			$("#replyOpen").on("click", function() {
				if (click == 0) {
				$('#replyOpen').html("댓글 닫기");
				$('#replyTag').css("height", "auto");
					click = 1;
				} else {
					$('#replyOpen').html("댓글 보기");
					$('#replyTag').css("height", 70);
					click = 0;			
				}
			});
			/* 댓글 입력 */
			$('.replyBtn').on("click",function(){
				var REPLY_INFO=$('#replyArea').val().replace(/\n/gi,"<br>");
				var SG_ID=${board.SG_ID};
				
				$.ajax({
		            url: "addReply.bo",
		            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID},
		            type:"post",
		            success: function(data){
		               if(data=="success"){
		            	   //getReplyList(); /* 댓글 조회 */
		            	   $("#rContent").val("");
		               }
		            }
		        }); 
			});

			console.log($('input[name="dealType"]'));
			if ($('input[name="dealType"]').val() == "DELIVERY") {
				$('#delivery').css("opacity", 1);
			} else {
				$('#delivery').css("opacity", 0);
			}
		});
	</script>



	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>