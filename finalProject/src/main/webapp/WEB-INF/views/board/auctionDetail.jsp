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

#replyArea, #replyArea2,#replyUpArea {
	height: 95px;
	width: 80%;
	resize: none;
}

.replyAddForm {
	float: left;
}

.replyAddBtn, .replyBtn {
	width: 15%;
	height: 100px;
	float: right;
	margin-right: 15px;
}

.r_id {
	display: none;
}
/* 댓글 끝 */
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="evPage"
		style="height: auto; width: 100%; background: #ffffff; text-align: center;">
		<div class="pg" style="width: 1000px; height: 1130px; display: inline-block; background: #f5f5f5;">
			<br>
			<div class="headLine" style="width: auto; display: inline-block;">
				<h2>${board.SG_BNAME }</h2>
				<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}"
					style="width: 500px; height: 500px;"> <br> <br>
				<p style="border-top: 1px solid gray;">${board.SG_ENROLL_DATE} </p>
				<!-- 경매 마감 날짜 계산 -->
				<jsp:useBean id="now" class="java.util.Date"/>
				<fmt:parseDate var="enroll" value="${ board.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
				<fmt:parseDate var="end" value="${ board.SG_END_DATE }" pattern="yyyy-MM-dd"/>
				
				<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
				<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>
				<fmt:parseNumber value="${ end.time / (1000*60*60*24) }" integerOnly="true" var="endDays"/>
				
					<span class="" style="color: red; font-size: 25px;">
						<c:if test="${ (endDays - nowDays) > 0 }">
							D - ${ endDays - nowDays }
						</c:if>
						<c:if test="${ (endDays - nowDays) == 0 }">
							D - Day
						</c:if>
						<c:if test="${ (endDays - nowDays) < 0 }">
							경매 종료
							<c:set var="endAuction" value="true"/>
						</c:if>
					</span>
			</div>
			<div style="height: 300px; width: 100%; background: #f5f5f5;">
				<div style="display: inline-block;">
					<div class="col-md-7" style="float: left; width: 500px;">
						<div class="colorlib-form" style="padding: 0em;">
							<div class="row">
								<br>
								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">현재 경매가</label>
										<fmt:formatNumber var="price" value="${ board.SG_PRICE }"
											type="currency" />
										<div class="form-control">
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
													<label><input type="radio" name="dealType" checked="checked"><span style="color: #ff8400;">직 거래</span></label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio" name="dealType" disabled="disabled">택배 거래</label>
												</c:if>
												<c:if test="${ board.SG_DEAL eq 'DELIVERY' }">
													<label><input type="radio" name="dealType" disabled="disabled">직 거래</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio" name="dealType" checked="checked"><span style="color: #ff8400;">택배 거래</span></label>
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
								<div style="float: left;">								
								<label for="companyname">거래 지역</label> <input type="text"
									name="sgArea" id="towncity" class="form-control"
									placeholder="판매자에게 연락해주세요." style="width: 280px;"
									value="${ board.SG_AREA }" readonly="readonly">
							</div>
							<br> <br>
							<div style="width: 200px; height: 50px; float: left; margin-top: 10px;">
								<span class="new">#${board.TAG_NAME}</span>
								<c:if test="${ ( nowDays - enrollDays ) <= 7 }">
									<span class="new">New</span>
								</c:if>	
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
							<div style="width: 200px; float: left;">
							<div style="width: 100%; height: 60px; display: inline-block;">
			<!-- 입찰버튼 로그인시에만 뜨도록 하기(원활한 작업하기위해 일단 조건문 주석처리 ) -->
			<c:if test="${ !empty loginUser && loginUser.user_id != board.USER_ID && !endAuction eq true }">
				<form action="selectOne.bo" id="sendPrice" method="POST">
					<input type="number" hidden="hidden" id="auctionPrice"
						name="auctionPrice"> <input type="number" hidden="hidden"
						name="sgId" value="${ board.SG_ID }"> <input type="text"
						hidden="hidden" name="userId" value="${ loginUser.user_id }">
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
			<!-- 본인 글 일시 && !endAuction eq true-->
			<c:if test="${ !empty loginUser && loginUser.user_id == board.USER_ID  }">
				<c:url value="boardupdateForm.bo?type=2" var="bUpdate">
					<c:param name="sgId" value="${board.SG_ID}" />
				</c:url>
				<button class="btn btn-primary" onclick="location.href='${bUpdate}';">수정</button>
				<button class="btn btn-primary" onclick="deleteBtn();">글삭제</button>
			</c:if>
		</div>
		</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
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
			<div id="commentArea"></div>
			<!-- 댓글 입력 -->
			<div class="comment">
				<div style="padding-left: 60px;">
					<textarea id="replyArea"></textarea>
					<input type="hidden" id="replyInput">
					<button class="replyBtn" type="button">댓글 등록</button>
				</div>
			</div>
		</div>

		<!-- 댓글 페이징 -->
		<br> <br>
		<div style="width: 100%; text-align: center;">
			<div id="pageingArea" style="width: 200px; height: 30px; display: inline-block;">
							<ul class="pagination">
									
							</ul> 
			</div>
		</div>
		<br>
	</div>
	<hr>
	<!-- 댓글끝 -->
	<script>
		function deleteBtn(){
			
			var con_test = confirm("정말 삭제 하시겠습니까?\n(마감전에 삭제할시 패널티를 받을수 있습니다.)");
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
	var replyUpNum=0;
	var replyUplb="";
	var replyUpTag="";
	
	$('#replyTag').click(function (e) {		
		if(replyUpNum!=0){
		if (!$(e.target).is('div[name='+replyUpNum+'],div[name="'+replyUpNum+'"] *,div[name='+replyUpNum+'] button' ) && e.target.value!=replyUpNum) {
			replyUpTag.html(replyUplb);
			replyUpNum=0;
			replyUplb="";
			replyUpTag="";
		}
		}

	}); 
	$(document).ready(function() {
			var click = 0;
			$("#replyOpen").on("click", function() {
				if (click == 0) {
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
			/* 댓글 입력 */
			$('.replyBtn').on("click",function(){
				var REPLY_INFO=$('#replyArea').val().replace(/\n/gi,"<br>");
				var SG_ID=${board.SG_ID};
				if(${!empty loginUser}){
				var USER_ID="${loginUser.user_id}"; 
				var NICKNAME="${loginUser.nickName}";
				
				$.ajax({
		            url: "addReply.bo",
		            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:false,USER_ID:USER_ID,NICKNAME:NICKNAME},
		            type:"post",
		            success: function(data){
		               if(data=="success"){
		            	   getReplyList(); /* 댓글 조회 */
		            	   $("#replyArea").val("");
		               }
		            }
		        }); 
				}else{
					alert("로그인 후 이용해주세요.")
				}
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
		var USER_ID="${loginUser.user_id}"; 
		var NICKNAME="${loginUser.nickName}";
		$.ajax({
            url: "addReply.bo",
            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:true,REPLY_ID:REPLY_ID,USER_ID:USER_ID,NICKNAME:NICKNAME},
            type:"post",
            success: function(data){
               if(data=="success"){
            	   replyDel();
            	   getReplyList(); /* 댓글 조회 */		            	   
               }
            }
        }); 
	};
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
		};
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
		function replyDeleteAdd(a){
			var REPLY_ID=$(a).val();			
			$.ajax({
	            url: "deleteReplyAdd.bo",
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
		function replyAddUpdate(id){
			$('#replyAdd').remove();
			var UpText=$('#'+$(id).val()).html().replace(/<br>/gi,"\n");
			var UpId=$(id).val();
			replyUpTag=$(id).parent("div");
			replyUpNum=$(id).parent("div").parent("div").attr('name');
			replyUplb=$(id).parent("div").html();
			 replyDel();
			$(id).parent("div").html('<textarea id="replyUpArea">'+UpText+'</textarea><button class="replyAddBtn" onclick="replyUpdateAjax(this);" value='+UpId+'>댓글 수정</button><div></div>');
		};
		function replyUpdate(id){
			var UpText=$('#'+$(id).val()).html().replace(/<br>/gi,"\n");
			var UpId=$(id).val();
			replyUpTag=$(id).parent("div").parent("div").parent("div");
			replyUpNum=$(id).parent("div").parent("div").parent("div").attr('name'); 
			replyUplb=$(id).parent("div").parent("div").parent("div").html();
			replyDel();
			$(id).parent("div").parent("div").parent("div").html('<div style="padding-left: 60px;"><textarea id="replyUpArea">'+UpText+'</textarea><button class="replyUpBtn" onclick="replyUpdateAjax(this);" value='+UpId+'>댓글 수정</button></div>');
		};
		function replyUpdateAjax(id){
			var REPLY_INFO=$('#replyUpArea').val().replace(/\n/gi,"<br>");
			var REPLY_ID=$(id).val();
			var page=$('.active').val();
			$.ajax({
	            url: "replyUpdate.bo",
	            data: {REPLY_INFO:REPLY_INFO,REPLY_ID:REPLY_ID},
	            type:"post",
	            success: function(data){
	               if(data=="success"){
	            	   getReplyList(page); /* 댓글 조회 */		            	   
	               }
	            }
	        }); 
		};
		 function getReplyList(page){
	         var SG_ID = ${board.SG_ID};
	         $.ajax({
	            url: "replyList.bo",
	            data: {SG_ID:SG_ID,page:page},
	            dataType: "json",
	            success: function(data){         
	               $tableBody = $('#commentArea');
	               $tableBody.html("");
	               	var t1;
	            	var t2;
	            	var t3;
	            	var t4;
	            	var t5;
	            	var t6;
	            	var t7;
	               if(data.rlist.length > 0){
	                  for(var i in data.rlist){
		                i=parseInt(i);
		                i2=parseInt(i)-1;
		                if(i>0){
				               if(data.rlist[i].REPLY_ADD!=data.rlist[i2].REPLY_ADD){
				            	   t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
					               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
					               t3='</span></div><div><span>'+data.rlist[i].REPLY_UPDATE_DATE+'</span></div><div style="height: 20px;">';
					               t4='<button class="replyAddForm" onclick="replyAdd(this);" value=';
					               t5='>답글</button>';
					               t6='<button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
					               t7='<div style="float: right;">좋아요<span>0</span></div></div></div></div>';
					           if((data.rlist[i].USER_ID)=="${ loginUser.user_id}" && ${!empty loginUser}){
				                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t6+t7);				            	
					            }else if((data.rlist[i].USER_ID)!="${ loginUser.user_id}" && ${!empty loginUser}){
				                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t7);
				            	}else{
				                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t7);
				            	}
				               }	                 
				               if(data.rlist[i].REPLY_ADD==data.rlist[i2].REPLY_ADD){
					            	t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment" style="background: gray;"><div class="comment2"></div><div style="padding-left: 60px; width: 90%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
					            	t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
					            	t3='</span></div><div><span>'+data.rlist[i].REPLY_UPDATE_DATE+'</span></div>';
					            	t4='<button type="button" onclick="replyAddUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDeleteAdd(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
					            	t5='</div></div>';
		                		  if((data.rlist[i].USER_ID)=="${ loginUser.user_id}" && ${!empty loginUser}){
		                		  $('div[name='+data.rlist[i].REPLY_ADD+']').after(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+t5);
						            }else{
		                		  $('div[name='+data.rlist[i].REPLY_ADD+']').after(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t5);
					            	}
				               }
	                	  }else{
	                		   t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
				               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
				               t3='</span></div><div><span>'+data.rlist[i].REPLY_UPDATE_DATE+'</span></div><div style="height: 20px;">';
				               t4='<button class="replyAddForm" onclick="replyAdd(this);" value=';
				               t5='>답글</button>';
				               t6='<button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
				               t7='<div style="float: right;">좋아요<span>0</span></div></div></div></div>';
				               if((data.rlist[i].USER_ID)=="${ loginUser.user_id}" && ${!empty loginUser}){
			                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t6+t7);				            	
				               }else if((data.rlist[i].USER_ID)!="${ loginUser.user_id}" && ${!empty loginUser}){
				            	   $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t7);
				               }else{
				            	   $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t7);
			            	}
	                	  }
	                  }
	               }
	               
	               $('.pagination').html("");
	               if(data.pi.currentPage<=1){
	               $('.pagination').append('<li class="disabled"><a>&laquo;</a></li>');	            	 
	               }
					if(data.pi.currentPage>1){
						$('.pagination').append('<li><a onclick="getReplyList('+(data.pi.currentPage-1)+')">&laquo;</a></li>');
					}
					for(var p=data.pi.startPage; p<=data.pi.endPage; p++){
						if(p == data.pi.currentPage){
							$('.pagination').append('<li class="active" value='+p+'><a>'+ p +'</a></li>');
						}
						if(p != data.pi.currentPage){							
							$('.pagination').append('<li><a onclick="getReplyList('+p+')">'+ p +'</a></li>');
						}
					}
					if(data.pi.currentPage >= data.pi.maxPage){
						$('.pagination').append('<li class="disabled"><a href="#">&raquo;</a></li>');
					}
					if(data.pi.currentPage < data.pi.maxPage){
						$('.pagination').append('<li><a onclick="getReplyList('+(data.pi.currentPage+1)+')">&raquo;</a></li>');
					}
	            }
	         });
	      };
	</script>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>