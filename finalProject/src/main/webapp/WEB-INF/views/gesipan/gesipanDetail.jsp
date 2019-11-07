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
	<div class="my-panel">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap">
				<form style="height: 100%;">
					<div class="container">
						<div class="row">
							<div class="col-md-12 title">
								<c:if test="${ g.g_category == 'Community' }">
									<c:set var="g_cate" value="커뮤니티" />
								</c:if>
								<c:if test="${ g.g_category == 'Selling' }">
									<c:set var="g_cate" value="삽니다" />
								</c:if>
								<%-- <div style="float: right; padding: 10px; display: block;">
									<button class="btn btn-default" type="button" style="font-size: 10px;" onclick="location.href='gesipanInsertView.ge?g_category=${cate}'">글쓰기</button>
								</div> --%>
							</div>
						</div>
						<div class="row content">
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
											<th scope="col"><font size="5">${ g.g_title }</font></th>
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
							<h6 id="rCountH6">댓글 수[]</h6>
								<table class = "replyTable">
							      <tr>
							         <td>
							            <textarea rows = "5" cols = "50" id ="rContent"></textarea>
							         </td>
							         <td>
							            <button id = "rSubmit" style="width:100%; height:100%;">등록하기</button>            
							         </td>
							      </tr>
							   </table>
							   
							   <table class = "replyTable" id = "rtb">
							      <thead>
							         <tr>
							            <td colspan = "2"><b id = "rCount"></b></td>
							         </tr>
							      </thead>
							      <tbody></tbody>
							   </table>
							</div>
						</div>
					</div>
				</form>
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
		
		$('#rSubmit').on("click", function(){
			
		});
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>