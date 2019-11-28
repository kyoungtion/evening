<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENING : 커뮤니티</title>
<style>
#searchText {
	width: 200px;
	height: 25px;
	border: whitesmoke;
}

#title {
	font-size: 20px;
}

tbody td {
	border-bottom: 0 !important;
}

#gContent {
	font-size: 15px !important;
}

.rUpdate, .rDelete, .rUpOk, .rUpNo {
	font-size: 10px;
	border: 1px solid whitesmoke;
	background: white;
}

#rUpText{
	height:20px;
}

#reGesipan {
	font-size: 12px;
}

.row.table {
	min-height: 450px;
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:if test="${ g.g_category != 'Notice'}">
		<c:set var="cate" value="${ category }" />
	</c:if>
	<!-- 목록으로 돌아가기 버튼 url -->
	<c:url var="gList" value="gList.ge">
		<c:param name="category" value="${ cate }" />
		<c:param name="page" value="${ page }" />
	</c:url>
	<div class="my-panel" style="height:1000px;;">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap">
				<!-- <form style="height: 100%;"> -->
					<div class="container">
						<div class="row">
							<div class="col-md-12 title">
								<c:if test="${ g.g_category == 'Community' }">
									<c:set var="g_cate" value="커뮤니티" />
								</c:if>
								<c:if test="${ g.g_category == 'Selling' }">
									<c:set var="g_cate" value="삽니다" />
								</c:if>
								<c:if test="${ g.g_category == 'QNA' }">
									<c:set var="g_cate" value="문의사항"/>
								</c:if>
								<%-- <div style="float: right; padding: 10px; display: block;">
									<button class="btn btn-default" type="button" style="font-size: 10px;" onclick="location.href='gesipanInsertView.ge?g_category=${cate}'">글쓰기</button>
								</div> --%>
							</div>
						</div>
						<div class="row content" style="height:auto;">
							<div class="row table">
								<table border="1" summary="" class="content-table">
									<colgroup>
										<col style="width: 50px;">
										<col style="width: 350px;">
										<col style="width: 10px;">
										<col style="width: 50px;">
										<col style="width: 50px;">
										<col style="width: 50px;">
										<col style="width: 50px;">
										<col style="width: 80px;">
									</colgroup>
									<thead>
										<tr style="border-bottom: 1px solid whitesmoke;">
											<th scope="col">글번호:${ g.g_id }</th>
											<th scope="col"><font size="4">${ g.g_title }</font></th>
											<th scope="col">|</th>
											<th scope="col">${ g_cate }</th>
											<th scope="col" class="displaynone"></th>
											<th scope="col" class="displaynone"></th>
											<th scope="col" class="displaynone"></th>
											<th scope="col"><small>${ g.g_update_date }</small></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4"><i class="fas fa-user"></i>&nbsp;${ g.nickname }</td>
											<td colspan="1">조회수 : ${ g.g_count }</td>
										</tr>
										<tr>
											<td id="gContent" colspan="5">${ g.g_content }</td>
										<tr>
									</tbody>
								</table>
							</div>
							<c:if test="${ g.g_type != 'N' && g.g_writer != 'admin'}">
							<div class="row reply">
								<b id="rCount"></b>
								<b class="data_count"><em id="messagebyte">0</em>/300자</b>
								<table class="replyTable" style="width:100%; height:100px;">
									<colgroup>
										<col style="width: 100%;">
										<col style="width: 20%;">
									</colgroup>
							      <tr>
							         <td>
							            <textarea id ="rContent" name="rContent" style="width: 100% !important;height: 100%; resize:none;"></textarea>
							         </td>
							         <td>
							            <button class="btn btn-default" id = "rSubmit" style=" height:100%; border-color: rgb(169, 169, 169); border-radius:0;">등록하기</button>            
							         </td>
							      </tr>
							   </table>
							   <table class = "replyTable" id = "rtb" style="width:100%;">
							  		<colgroup>
										<col style="width: 50px;">
										<col style="width: 500px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
									</colgroup>
							      <thead>
							         <tr>
							            <th></th>
							            <th></th>
							            <th></th>
							            <th></th>
							         </tr>
							      </thead>
							      <tbody></tbody>
							   </table>
							</div>
						</c:if>
						</div>
						<input type="hidden" id="user_id" name="user_id" value="${ sessionScope.loginUser.user_id }">
						<input type="hidden" id="nickname" name="nickname" value="${ sessionScope.loginUser.nickName }">
						
						<div style="float:left; margin-top:10px; display:inline-block;" >
							<c:if test="${ viewName != null }">
								<c:if test="${ viewName == 'adminQnaView' }">
									<c:url var="glist" value="qna.ad">
										<c:param name="page" value="${ page }"/>
										<c:param name="category" value="QNA"/>
										<c:param name="viewName" value="adminQnaView"/>
									</c:url>
									<c:url var="gUpdateView" value="gUpdateView.ge">
										<c:param name="g_id" value="${ g.g_id }"/>
										<c:param name="page" value="${ page }"/>
										<c:param name="viewName" value="adminQnaView"/>
									</c:url>
									<c:url var="gDelete" value="gDelete.ge">
										<c:param name="page" value="${ page }"/>
										<c:param name="g_id" value="${ g.g_id }"/>
										<c:param name="viewName"  value="adminQnaView"/>
										<c:param name="category" value="QNA"/>
									</c:url>
								</c:if>
								<c:if test="${ viewName == 'adminNotice' }">
									<c:url var="glist" value="adminNoticeView.ad">
										<c:param name="page" value="${ page }"/>
										<c:param name="category" value="${ category }"/>
										<c:param name="viewName" value="adminNotice"/>
									</c:url>
									<c:url var="gUpdateView" value="gUpdateView.ge">
										<c:param name="g_id" value="${ g.g_id }"/>
										<c:param name="page" value="${ page }"/>
										<c:param name="viewName" value="adminNotice"/>
									</c:url>
									<c:url var="gDelete" value="gDelete.ge">
										<c:param name="page" value="${ page }"/>
										<c:param name="g_id" value="${ g.g_id }"/>
										<c:param name="viewName"  value="adminNotice"/>
										<c:param name="category" value="Notice"/>
									</c:url>
								</c:if>
								<c:url var="reInsert" value="gesipanReInsertView.ge">
									<c:param name="g_id" value="${ g.g_id }"/>
									<c:param name="g_category" value="${ g.g_category }"/>
									<c:param name="viewName" value="${ viewName }"/>
									<c:param name="page" value="${ page }"/>
								</c:url>
								<c:if test="${ viewName == 'mypost' }">
									<c:url var="glist" value="mypost.me">
										<c:param name="page" value="${ page }"/>
										<c:param name="category" value="${ category }"/>
										<%-- <c:param name="viewName" value="mypost"/> --%>
									</c:url>
									<c:url var="gUpdateView" value="gUpdateView.ge">
										<c:param name="g_id" value="${ g.g_id }"/>
										<c:param name="page" value="${ page }"/>
										<c:param name="viewName" value="mypost"/>
									</c:url>
									<c:url var="gDelete" value="gDelete.ge">
										<c:param name="page" value="${ page }"/>
										<c:param name="g_id" value="${ g.g_id }"/>
										<c:param name="viewName"  value="mypost"/>
										<c:param name="category" value="${ category }"/>
									</c:url>
								</c:if>
								<c:url var="reInsert" value="gesipanReInsertView.ge">
									<c:param name="g_id" value="${ g.g_id }"/>
									<c:param name="g_category" value="${ g.g_category }"/>
									<c:param name="viewName" value="${ viewName }"/>
									<c:param name="page" value="${ page }"/>
								</c:url>
							</c:if>
							<c:if test="${ viewName == null }">
								<c:url var="glist" value="gList.ge">
									<c:param name="page" value="${ page }"/>
									<c:param name="category" value="${ g.g_category }"/>
								</c:url>
								<c:url var="reInsert" value="gesipanReInsertView.ge">
									<c:param name="g_id" value="${ g.g_id }"/>
									<c:param name="g_category" value="${ g.g_category }"/>
								</c:url>
								<c:url var="gUpdateView" value="gUpdateView.ge">
									<c:param name="g_id" value="${ g.g_id }"/>
									<c:param name="page" value="${ page }"/>
									<c:param name="category" value="${ g.g_category }"/>
								</c:url>
								<c:url var="gDelete" value="gDelete.ge">
									<c:param name="page" value="${ page }"/>
									<c:param name="g_id" value="${ g.g_id }"/>
									<c:param name="category" value="${ g.g_category }"/>
								</c:url>
								<%-- <c:set var="glist" value="document.referrer"/> --%>
							</c:if>
							<c:if test="${ g.g_category ne 'Notice' }">
								<button class="btn btn-default" onclick="location.href='${ glist }'" style="font-size:12px; display:inline-block;">목록으로 돌아가기</button>
							</c:if>
							<c:if test="${ g.g_category eq 'Notice' }">
								<button class="btn btn-default" onclick="location.href=document.referrer" style="font-size:12px; display:inline-block;">목록으로 돌아가기</button>
							</c:if>
							<c:if test="${ loginUser.user_id == 'admin' && g.g_category == 'QNA' }">
								<button class="btn btn-default" id="reGesipan" onclick="location.href='${reInsert}'">답글<i class="fas fa-pencil-alt"></i></button>
							</c:if>
						</div>
						<div style="float:right; margin-top:10px; display:inline-block;">
							<!-- 관리자가 아닐 때 수정 -->
							<c:if test="${loginUser.user_id == g.g_writer && g.g_writer != 'admin'}">
								<button class="btn btn-primary" style="font-size:12px;" onclick="location.href='${ gUpdateView }'">수정하기</button>
							</c:if>
							<!-- 관리자일때 관리자글(공지글)만 수정 -->
							<c:if test="${ g.g_writer == 'admin' && loginUser.user_id == 'admin'}">
								<button class="btn btn-primary" style="font-size:12px;" onclick="location.href='${ gUpdateView }'">수정하기</button>
							</c:if>
							<!-- 관리자 외 유저일 때 삭제-->
							<c:if test="${ g.g_writer == sessionScope.loginUser.user_id && g.g_order == 0 && g.g_type != 'N' && g.g_writer != 'admin'}">
								<a href="${ gDelete }" class="btn btn-danger" style="font-size:12px;" onclick="return confirm('삭제하시겠습니까?')">삭제하기</a>
							</c:if>
							<!-- 관리자일 때 삭제-->
							<c:if test="${(g.g_type == 'N' || g.g_type=='G') && loginUser.user_id == 'admin'}">
								<a href="${ gDelete }" class="btn btn-danger" style="font-size:12px;" onclick="return confirm('삭제하시겠습니까?')">삭제하기</a>
							</c:if>
						</div>
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
	<script>
		$(function(){
			var cate = '${g.g_category}';
			console.log(cate);
			var locked = '${g.locked}';
			console.log(locked);
		});
		
	
		function callback(){
			getReplyList();
		}
		$(function(){
			getReplyList();
			
			/* setInterval(function(){
				getReplyList();
			}, 10000);  */
		});
	
		$('#rSubmit').on('click', function(){
			var reply_content = $('#rContent').val();
			var g_ref = ${ g.g_id };
			var user_id = $('#user_id').val();
			var nickname = $('#nickname').val();
			if(reply_content == ""){
				alert('댓글을 입력해주세요.');				
			} else {
				$.ajax({
					url: "addReply.ge",
					data: {user_id:user_id,
							nickname:nickname,	
						reply_content:reply_content, g_ref:g_ref},
					type: "post",
					success: function(data) {
						if(data == "success") {
							getReplyList();
							$('#rContent').val("");
						}
					}
				});
			}
		});
		
		function getReplyList() {
			if(g.g_writer != 'admin'){
				
			
			var g_ref = ${ g.g_id };
			$.ajax({
				url: "rList.ge",
				data: {g_ref:g_ref},
				dataType: "json",
				success: function(data) {
					$tableBody = $("#rtb tbody");
	                $tableBody.html("");
	                
	                var $tr;
	                var $rWriter;
	                var $rContent;
	                var $rCreateDate;
				
	                $("#rCount").text("댓글 (" + data.length + ")");
	                
	                if(data.length > 0){
	                    for(var i in data){
	                       $tr = $("<tr>");
	                       $rWriter = $("<td>").text(decodeURIComponent(data[i].nickname.replace(/\+/g , " ")));
	                       $rContent = $("<td class='rContent'>").text(decodeURIComponent(data[i].reply_content.replace(/\+/g , " ")));
	                       $rCreateDate = $("<td>").text(data[i].reply_enroll_date);
	                       $r_id = $("<td class='displaynone'>").text(data[i].g_reply_id);

	                       /* 회원아이디 비교 */
	                       if(data[i].user_id == '${sessionScope.loginUser.user_id}'){
		                       $rButtons = $("<td>");
		                       $rUpButton = $("<button class='rUpdate'>").text("수정");
		                       $rUpOk = $("<button class='rUpOk' style='display:none'>").text("완료");
		                       $rUpNo = $("<button class='rUpNo' style='display:none'>").text("취소");
		                       $rDeButton = $("<button class='rDelete'>").text("삭제");
	                       }
	                       
	                       $tr.append($rWriter);
	                       $tr.append($rContent);
	                       $tr.append($rCreateDate);
	                       $tr.append($r_id);
	                       if(data[i].user_id == '${sessionScope.loginUser.user_id}'){
	                      		$rButtons.append($rUpButton).append($rUpOk).append($rUpNo).append($rDeButton);
	                   			$tr.append($rButtons);
	                       }
	                       $tableBody.append($tr);
	                    }
	                    
	                 }
	                 else{
	                    $tr = $("<tr>");
	                    $rContent = $("<td colspan = '3'>").text("등록된 댓글이 없습니다.");
	                    
	                    $tr.append($rContent);
	                    $tableBody.append($tr);
	                 }
				
	                $('.rUpdate').on('click', function(){
	                	var r_id = $(this).parent().prev().text();
	                	
	                	// <td id='rContent'>
	    				var r_content = $(this).parent().siblings('.rContent');
	    				var r_content_val = r_content.text();
	    				console.log(r_content);
	    				r_content.html("<input type='text' id='rUpText' value='"+r_content_val+"'>");
	    				$(this).attr("style","display:none");
	    				$(this).siblings('.rUpOk').attr("style","display:inline-block;");
	    				$(this).siblings('.rUpNo').attr("style","display:inline-block;");
	    				
	    				$('.rUpOk').on('click', function(){
	    					
	    					$.ajax({
	    						url:"rUpdate.ge",
	    						data:{g_reply_id:r_id,
	    								r_content:$('#rUpText').val()},
	    						success: function(data){
	    							if(data == "success") {
	    								getReplyList();
	    							}
	    						}
	    					});
	    					/* alert(r_id + $('#rUpText').val());
	    					location.href="rUpdate.ge?g_reply_id="+r_id+"&r_content="+$('#rUpText').val();
	    					getReplyList(); */
	    				});
	    				
	    				
	    				$('.rUpNo').on('click', function(){
	    					r_content.html("");
	    					r_content.text(r_content_val);
	    					$(this).siblings('.rUpdate').attr("style","display:inline-block");
	    					$(this).siblings('.rUpOk').attr("style","display:none");
	    					$(this).attr("style","display:none");
	    				});
	                });
	                
	                $('.rDelete').on('click', function(){
	                	var r_id = $(this).parent().prev().text();
	                	$.ajax({
    						url:"rDelete.ge",
    						data:{g_reply_id:r_id},
    						success: function(data){
    							if(data == "success") {
    								$(this).parent().parent().attr("style","display:none");
    								callback();
    							}
    						}
    					});
	                });
				}
			});
			
			}
		}
		
		$(function(){
			$('#rContent').on('keyup',function(){
				if($(this).val().length > 300){
					alert('300자까지만 입력가능합니다.');
					$(this).val($(this).val().substring(0,300));
				}
				
				$('#messagebyte').text($(this).val().length);
			});
		});
		
		/* function checkDelete(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				if('${viewName}' == null){
					location.href="gDelete.ge?g_id="+$('#g_id').val()+"&category="+'${cate}';
				} else {
					location.href="gDelete.ge?g_id="+$('#g_id').val()+"&viewName=adminViewName";
				}
			} else {
				return;
			}
		} */
		
		$(function(){
			
			if('${g.g_order}' != 0){
				$('#reGesipan').attr("style", "display:none");
			}
		});
		
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>