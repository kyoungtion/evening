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
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:set var="cate" value="${ g.g_category }" />
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
							<div class="row reply">
							<!-- 댓글수 -->
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
						</div>
						<div style="float:left; margin-top:10px; display:inline-block;" >
							<c:url var="glist" value="gList.ge">
								<c:param name="page" value="${ page }"/>
								<c:param name="category" value="${ cate }"/>
							</c:url>
							<button class="btn btn-default" onclick="location.href='${ glist }'" style="font-size:12px;">목록으로 돌아가기</button>
						</div>
						<div style="float:right; margin-top:10px; display:inline-block;">
							<c:url var="gUpdateView" value="gUpdateView.ge">
								<c:param name="g_id" value="${ g.g_id }"/>
								<c:param name="page" value="${ page }"/>
							</c:url>
							<c:url var="gDelete" value="gDelete.ge">
								<c:param name="g_id" value="${ g.g_id }"/>
							</c:url>
							<button class="btn btn-primary" style="font-size:12px;" onclick="location.href='${ gUpdateView }'">수정하기</button>
							<button class="btn btn-danger" style="font-size:12px;" onclick="checkDelete();">삭제하기</button>
						</div>
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
	<script>
		$(function(){
			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 10000); 
		});
	
		$('#rSubmit').on('click', function(){
			var reply_content = $('#rContent').val();
			var g_ref = ${ g.g_id };
			if(reply_content == ""){
				alert('댓글을 입력해주세요.');				
			} else {
				$.ajax({
					url: "addReply.ge",
					data: {reply_content:reply_content, g_ref:g_ref},
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
	                       $rContent = $("<td>").text(decodeURIComponent(data[i].reply_content.replace(/\+/g , " ")));
	                       $rCreateDate = $("<td>").text(data[i].reply_enroll_date);
	                       
	                       $tr.append($rWriter);
	                       $tr.append($rContent);
	                       $tr.append($rCreateDate);
	                       $tableBody.append($tr);
	                       
	                    }
	                    
	                 }
	                 else{
	                    $tr = $("<tr>");
	                    $rContent = $("<td colspan = '3'>").text("등록된 댓글이 없습니다.");
	                    
	                    $tr.append($rContent);
	                    $tableBody.append($tr);
	                 }
				}
			});
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
		
		function checkDelete(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href="gDelete.ge?g_id"+${g.g_id};
			} else {
				return;
			}
		}
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>