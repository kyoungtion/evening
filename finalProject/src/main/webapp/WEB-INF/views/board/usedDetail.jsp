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
	width: 90%;
	min-width:900px;
	height: 70px;
	background: whitesmoke;
	display: inline-block;
	overflow: hidden;
}
#replyArea,#replyArea2,#replyUpArea{
height: 95px; width: 80%; resize: none;
}
.replyAddForm{
	float: left;
}
.replyAddBtn,.replyBtn,.replyUpBtn{
width: 15%; height: 100px; float: right; margin-right: 15px;
}
.r_id{
	display: none;
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div>
		<div class="evPage"	style="height: auto; width: 100%; background: #ffffff; text-align: center;">
			<div class="pg" style="width: 75%; height: 1050px; display: inline-block; background: #f5f5f5;">
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
			<button class="btn btn-primary" onclick="location.href='${ shipInfo }'">구매 </button>
			<button class="btn btn-primary" onclick="location.href='${bUpdate}';">수정</button>
			<button class="btn btn-primary" onclick="deleteBtn();">글삭제</button>
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
		function deleteBtn() {
			var con_test = confirm("정말 삭제 하시겠습니까?");
			if (con_test) {
				//alert(${board.SG_ID});
				location.href = "deleteBoard.bo?sgId=${board.SG_ID}&type=1";
			}
		};
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
			$(id).parent("div").parent("div").parent("div").html('<div style="padding-left: 60px;"><textarea id="replyUpArea">'+UpText+'</textarea><button class="replyUpBtn" onclick="replyUpdateAjax(this); value='+UpId+'">댓글 수정</button></div>');
			
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
/* 				               t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
				               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
				               t3='</span></div><div><span>';
				               t4='</span></div><div style="height: 20px;"><button class="replyAddForm" onclick="replyAdd(this);" value=';
				               t5='>답글</button><button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button><div style="float: right;">좋아요<span>0</span></div></div></div></div>';
			                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+data.rlist[i].REPLY_UPDATE_DATE+t4+data.rlist[i].REPLY_ID+t5); */
				            	   t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
					               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
					               t3='</span></div><div><span>'+data.rlist[i].REPLY_UPDATE_DATE+'</span></div><div style="height: 20px;">';
					               t4='<button class="replyAddForm" onclick="replyAdd(this);" value=';
					               t5='>답글</button>';
					               t6='<button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
					               t7='<div style="float: right;">좋아요<span>0</span></div></div></div></div>';
					            //if(${data.rlist[i].REPLY_ID eq loginUser.user_id && !empty loginUser}){
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
	                		  /*  t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><span style="width: 20px; height: 20px; background: white;">아이콘</span><span>';
				               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
				               t3='</span></div><div><span>';
				               t4='</span></div><div style="height: 20px;"><button class="replyAddForm" onclick="replyAdd(this);" value=';
				               t5='>답글</button><button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button><div style="float: right;">좋아요<span>0</span></div></div></div></div>';
				            
			                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+data.rlist[i].REPLY_UPDATE_DATE+t4+data.rlist[i].REPLY_ID+t5); */
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



	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>