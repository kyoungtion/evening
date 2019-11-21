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

/* 댓글  */
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
#replyArea,#replyArea2{
height: 95px; width: 80%; resize: none;
}
.replyAddForm{
	float: left;
}
.replyAddBtn,.replyBtn{
width: 15%; height: 100px; float: right; margin-right: 15px;
}
.r_id{
	display: none;
}
/* 댓글 끝 */
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="evPage"
		style="height: auto; width: 100%; background: #ffffff; text-align: center;">
		<div class="pg"
			style="width: 65%; height: 1100px; display: inline-block; background: #f5f5f5;">
			<br>
			<div class="headLine" style="width: auto; display: inline-block;">
				<h2>${board.SG_BNAME }</h2>
				<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}"
					style="width: 500px; height: 500px;"> <br> <br>
				<p style="border-top: 1px solid gray;">${board.SG_ENROLL_DATE}<br>
				</p>
			</div>
			<div style="height: 300px; width: 100%; background: #f5f5f5;">
				<div style="display: inline-block;">
					<%-- <div style="width: 230px; float: left; padding: none;">
					<div style="height: 30px;"></div>
					<div style="width: 230px;height: 230px;background: white;">
						<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}" style="width: 100%; height: 100%;">
					</div>
					<!-- <p>썸네일 이미지</p> -->
				</div> --%>
					<div class="col-md-7" style="float: left; width: 500px;">
						<div class="colorlib-form" style="padding: 0em;">

							<div class=" row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">현재 경매가</label>
										<div class="form-control">
											<fmt:formatNumber var="price" value="${ board.SG_PRICE }"
												type="currency" />
											<span
												style="font-size: 20px; text-align: center; color: #ff8400;">${ price }</span>
										</div>
									</div>
									<div class="form-group">
										<label for="companyname">경매 시작가</label>
										<div class="form-control">
											<fmt:formatNumber var="sPrice" value="${ board.SG_SPRICE }"
												type="currency" />
											<span
												style="font-size: 20px; text-align: center; color: #ff8400;">${ sPrice }</span>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div style="float: left; width: 200px;">
										<label for="companyname">거래 방식</label>
										<div class="col-md-12">
											<div class="radio" style="background-color: white;">
												<c:if test="${ board.SG_DEAL eq 'DIRECT' }">
													<label><input type="radio" name="dealType"
														checked="checked"><span style="color: #ff8400;">직
															거래</span></label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio" name="dealType"
														disabled="disabled">택배 거래</label>
												</c:if>
												<c:if test="${ board.SG_DEAL eq 'DELIVERY' }">
													<label><input type="radio" name="dealType"
														disabled="disabled">직 거래</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio" name="dealType"
														checked="checked"><span style="color: #ff8400;">택배
															거래</span></label>
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

											<c:if test="${ board.SG_DELIVERY eq 'N' }">
												<label><input type="radio" name="dealType2"
													checked="checked"><span style="color: #ff8400;">배송비
														포함</span></label>
												&nbsp;&nbsp;
												<label><input type="radio" name="dealType2"
													disabled="disabled">무료 배송</label>
											</c:if>
											<c:if test="${ board.SG_DELIVERY eq 'Y' }">
												<label><input type="radio" name="dealType2"
													disabled="disabled">배송비 포함</label>
												&nbsp;&nbsp;
												<label><input type="radio" name="dealType2"
													checked="checked"><span style="color: #ff8400;">무료
														배송</span></label>
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
								<label for="companyname">거래 지역</label> <input type="text"
									name="sgArea" id="towncity" class="form-control"
									placeholder="판매자에게 연락해주세요." style="width: 280px;"
									value="${ board.SG_AREA }" readonly="readonly">
							</div>
							<br> <br>
							<div style="width: 200px; height: 50px; float: left;">
								<!-- 입찰버튼 로그인시에만 뜨도록 하기(원활한 작업하기위해 일단 조건문 주석처리 -->
								<c:if
									test="${ !empty loginUser && loginUser.user_id != board.USER_ID }">
									<form action="selectOne.bo" id="sendPrice" method="POST">
										<input type="number" hidden="hidden" id="auctionPrice"
											name="auctionPrice"> <input type="number"
											hidden="hidden" name="sgId" value="${ board.SG_ID }">
										<input type="text" hidden="hidden" name="userId"
											value="${ loginUser.user_id }">
									</form>
									<button class="btn btn-primary btn-outline"
										style="float: right; margin: 0px 50px 0 0px;"
										onclick="auctionStart()">입찰</button>
								</c:if>
								<script>
									// 입찰 기능 ( 입찰액 조건문  : 시작가보다 높고 현재 경매가와 같으면 안되며 숫자만 입력받아야됨)
										function auctionStart(){
										  var price = prompt("입찰할 금액을 적어주세요.","숫자만 입력 가능!(100단위이상부터 가능) )");
										  if( ( price >= ${ board.SG_SPRICE} && price > ${ board.SG_PRICE} ) ){
										    var floorPrice = Math.floor(price/100) * 100;
										    if(floorPrice == ${ board.SG_PRICE} ){
										      alert("입력하신 입찰액 : "+price+"("+floorPrice+")가 현재 경매가와 같습니다.\n다시입력해주세요.");
										    }else{
											    $('#auctionPrice').val(floorPrice);
											    $('#sendPrice').submit();
										    }
										  }else{
										    alert("1. 숫자만 입력해 주세요. \n2. 최소 시작가 이상으로 입력해주세요.\n3. 현재 경매가보다 높게 입력해주세요.");
										  }
										}
									</script>
								<!-- <span class="new">#New</span><span class="new">#New</span> -->
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
	<div style="width: 100%; height: 60px; display: inline-block;">
		<c:url value="boardupdateForm.bo?type=2" var="bUpdate">
			<c:param name="sgId" value="${board.SG_ID }" />
		</c:url>
		<button class="btn btn-primary">입찰</button>
		<!-- 본인 글 일시 -->
		<button class="btn btn-primary" onclick="location.href='${bUpdate}';">수정</button>
		<button class="btn btn-primary" onclick="deleteBtn();">글삭제</button>
	</div>
	</div>
	</div>
	<!-- 	<div style="width: 100%; height: 60px; display: inline-block;">
		<button class="btn btn-primary">구매</button>
		<button class="btn btn-primary"
			onclick="location.href='updateForm.ud';">수정</button>
	</div> -->

	<div style="width: 90%; height: 500px; display: inline-block;">${board.SG_INFO }</div>
	<!-- 댓글 -->
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
					<input type="hidden" id="replyInput">
					<button class="replyBtn" type="button" >댓글 등록</button>
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
	<!-- 댓글끝 -->
	<script>
		function deleteBtn(){
			
			var con_test = confirm("정말 삭제 하시겠습니까?");
			if(con_test){
				//alert(${board.SG_ID});
				location.href="deleteBoard.bo?sgId=${board.SG_ID}&type=2";
			}
		}
	</script>
	<script>
	var replyA='<div id="replyAdd" class="comment" style="background: gray;"><div class="comment2"></div><div style="padding-left: 60px; "><textarea id="replyArea2"></textarea><button class="replyAddBtn" onclick="test(this);" value=';
	var replyA2='>댓글쓰기</button></div></div>';
	var replyB=1;	
	$(document).ready(function() {
			var click = 0;
			$("#replyOpen").on("click", function() {
				if (click == 0) {
				$('')
				$('#replyOpen').html("댓글 닫기");
				$('#replyTag').css("height", "auto");
				getReplyList();
				click = 1;
				} else {
					$('#replyOpen').html("댓글 보기");
					$('#replyTag').css("height", 70);
					click = 0;			
				}
			});
			/* 대댓글 입력 */
			/* $('.replyAddBtn').on("click",function(){
				console.log("테스트");
				console.log($(this).val());
				var REPLY_INFO=$('#replyArea2').val().replace(/\n/gi,"<br>");
				var REPLY_ID=$(this).val();
				var SG_ID=${board.SG_ID};
				
				$.ajax({
		            url: "addReply.bo",
		            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:true,REPLY_ID:REPLY_ID},
		            type:"post",
		            success: function(data){
		               if(data=="success"){
		            	   replyDel();
		            	   getReplyList(); // 댓글 조회             	   
		               }
		            }
		        }); 
			}); */
			/* 댓글 입력 */
			$('.replyBtn').on("click",function(){
				var REPLY_INFO=$('#replyArea').val().replace(/\n/gi,"<br>");
				var SG_ID=${board.SG_ID};
				
				$.ajax({
		            url: "addReply.bo",
		            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:false},
		            type:"post",
		            success: function(data){
		               if(data=="success"){
		            	   getReplyList(); /* 댓글 조회 */
		            	   $("#replyArea").val("");
		               }
		            }
		        }); 
			});
			

			if ($('input[name="dealType"]').val() == "DELIVERY") {
				$('#delivery').css("opacity", 1);
			} else {
				$('#delivery').css("opacity", 0);
			}
		});
		
	/* 대댓글 입력 */
	function test(a){
		var REPLY_INFO=$('#replyArea2').val().replace(/\n/gi,"<br>");
		var REPLY_ID=$(a).val();
		var SG_ID=${board.SG_ID};
		
		$.ajax({
            url: "addReply.bo",
            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:true,REPLY_ID:REPLY_ID},
            type:"post",
            success: function(data){
               if(data=="success"){
            	   replyDel();
            	   getReplyList(); /* 댓글 조회 */		            	   
               }
            }
        }); 
	}
	
		function replyAdd(a){
			$('.replyAddForm').text("답글");
			$('.replyAddForm').attr("onclick","replyAdd(this)");
			$('#replyAdd').remove();
	
			$(a).text("닫기");
			$(a).attr("onclick","replyDel(this)");
			$(a).parent("div").parent("div").parent("div").after(replyA+$(a).val()+replyA2);
		};
		function replyDel(a){
			$('.replyAddForm').text("답글");
			$('.replyAddForm').attr("onclick","replyAdd(this)");
			$('#replyAdd').remove();
		}
		function replyDelete(a){
			var REPLY_ID=$(a).val();
			
			$.ajax({
	            url: "deleteReply.bo",
	            data: {REPLY_ID:REPLY_ID},
	            type:"post",
	            success: function(data){
	               if(data=="success"){
	            	   replyDel();
	            	   getReplyList(); /* 댓글 조회 */		   
	            	   $('#commentArea').html("");
	               }
	            }
	        }); 
		};
		 function getReplyList(){
	         var SG_ID = ${board.SG_ID};
	         
	         $.ajax({
	            url: "replyList.bo",
	            data: {SG_ID:SG_ID},
	            dataType: "json",
	            success: function(data){
	               $tableBody = $('#commentArea');
	               $tableBody.html("");
	               	var t1;
	            	var t2;
	            	var t3;
	            	var t4;
	               if(data.length > 0){
	                  for(var i in data){
			               if(data[i].REPLY_ADD<=0){
			               t1='<div name="'+ data[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
			               t2='</span></div><div><span>';
			               t3='</span></div><div style="height: 20px;"><button class="replyAddForm" onclick="replyAdd(this);" value=';
			               t4='>답글</button><button class="replyAddForm" onclick="replyDelete(this);" value="'+data[i].REPLY_ID+'">삭제</button><div style="float: right;">좋아요<span>0</span></div></div></div></div>';
			               }
	                	  if(data[i].REPLY_ADD<=0){
		                	 $tableBody.append(t1+decodeURIComponent(data[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data[i].REPLY_INFO.replace(/\+/g, " "))+t2+data[i].REPLY_UPDATE_DATE+t3+data[i].REPLY_ID+t4);
	                	  }
	                  }
	                  for(var i in data){
	                	  if(data[i].REPLY_ADD>0){
				            	t1='<div name="'+ data[i].REPLY_ID+'" class="comment" style="background: gray;"><div class="comment2"></div><div style="padding-left: 60px; width: 90%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
				            	t2='</span></div><div><span>';
				            	t3='</span></div><button onclick="replyDelete(this);" value="'+data[i].REPLY_ID+'">삭제</button></div></div>';
	                		  $('div[name='+data[i].REPLY_ADD+']').after(t1+decodeURIComponent(data[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data[i].REPLY_INFO.replace(/\+/g, " "))+t2+data[i].REPLY_UPDATE_DATE+t3);
		                  }
	                  }
	                  
	               }
	            }
	         });
	      } 
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>