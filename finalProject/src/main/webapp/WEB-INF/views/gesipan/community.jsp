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

.rWrap {
	visibility: hidden;
}
</style>
</head>
<body onload="getReplyList();">
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:set var="cate" value="Community" />
	<c:url var="gList" value="gList.ge">
		<c:param name="category" value="${ cate }" />
	</c:url>
	<div class="my-panel gesipan" style="height:1200px;">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap">
				<form style="height: 100%;">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<span id="titlespan">커뮤니티</span>&nbsp; 중고거래, 경매에 대해 자유롭게 이야기를 나눌
								수 있는 공간입니다.
								<div style="float: right; padding: 10px; display: block;">
								<c:if test="${ !empty sessionScope.loginUser }">
									<button class="btn btn-default" type="button"
										style="font-size: 10px;"
										onclick="location.href='gesipanInsertView.ge?g_category=${cate}'">글쓰기</button>
								</c:if>
								<c:if test="${ empty sessionScope.loginUser }">
									<br>
								</c:if>
								</div>
							</div>
						</div>
						<div class="row content">
							<table border="1" summary="" class="content-table">
								<colgroup
									class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
									<col style="width: 50px;">
									<col style="width: 50px;" class="displaynone">
									<col style="width: 450px;">
									<col style="width: 100px;">
									<col style="width: 100px;" class="">
									<col style="width: 55px;">
								</colgroup>
								<thead>
									<tr style="">
										<th scope="col">번호</th>
										<th scope="col" class="displaynone">카테고리</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col" class="">작성일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="g" items="${list}" varStatus="st">
										<c:if test="${ g.g_type == 'N' }">
											<tr style="background-color: #FFFFFF; color: #333333; font-weight:bold;">
												<td>&nbsp;<i class="fas fa-thumbtack"></i></td>
												<td id="g_id${st.index }" class="hidden g_id" name="gId">${ g.g_id }</td>
												<td class="subject" id="subject"><span class="gTitle">${ g.g_title }</span>
												<c:if test="${fn:contains(g.g_content, '<img src')}">
													
													<i class="fas fa-image"></i>
												</c:if> <%-- rCount 추가 나중에 --%> <span
												class="rWrap Before ${st.index}">[</span><span><font
													id="rCount${st.index}"></font></span><span
												class="rWrap After ${st.index}">]</span></td>
												<td>${ g.nickname }</td>
												<td>${ g.g_enroll_date }</td>
												<td>${ g.g_count }</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach var="g" items="${list}" varStatus="st">
										<c:if test="${ g.g_type != 'N' }">
											<tr style="background-color: #FFFFFF; color: #333333;">
												<td id="g_id${st.index }" class="g_id" name="gId">${ g.g_id }</td>
												<td class="subject" id="subject"><span class="gTitle">${ g.g_title }</span>
												<c:if test="${fn:contains(g.g_content, '<img src')}">
													
													<i class="fas fa-image"></i>
												</c:if> <%-- rCount 추가 나중에 --%> <span
												class="rWrap Before ${st.index}">[</span><span><font
													id="rCount${st.index}"></font></span><span
												class="rWrap After ${st.index}">]</span></td>
												<td>${ g.nickname }</td>
												<td>${ g.g_enroll_date }</td>
												<td>${ g.g_count }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<br>
						<div class="row">
							<div class="col-md-5"
								style="text-align: center; left:30%; width: 350px;">
								<!-- <div class="col-md-5" id="searchbox"> -->
								<select id="searchfor" name="searchfor">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
								</select> <input id="searchText" name="searchText" type="search" /> <input
									type="hidden" id="category" value="${ cate }">
								<button type="button" id="searchBtn"
									style="background: none; border: 0;">
									<i class="fas fa-search"></i>
								</button>


								<!-- </div> -->
								<ul class="pagination">
									<!-- 이전 페이지 -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a>&laquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="gList.ge">
											<c:param name="page" value="${ pi.currentPage - 1 } " />
											<c:param name="category" value="${ cate }" />
										</c:url>
										<li><a href="${ before }">&laquo;</a></li>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="gList.ge">
												<c:param name="page" value="${ p } " />
												<c:param name="category" value="${ cate }" />
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									<!-- 다음 -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">»</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="gList.ge">
											<c:param name="page" value="${ pi.currentPage + 1 } " />
											<c:param name="category" value="${ cate }" />
										</c:url>
										<li><a href="${ after }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	<script>
	
		// 게시글 상세정보 조회
		$(function(){
			$('.subject').click(function(){
				if(${sessionScope.loginUser != null}){
					var g_id = $(this).prev().text();
					location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage}+"&g_category=${cate}";
				} else {
					alert('회원만 조회가능합니다.');
				}
			});
		});
		
		function getReplyList(){
			var g_ref = document.getElementsByName("gId");
			var array = [];
			for(var i in g_ref){
				array.push(Number(g_ref[i].innerText));
			}
			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: "rCount.ge",
				data: {g_ref:array},
				dataType: "json",
				success: function(data) {
					console.log(Object.keys(data).length);
					var subject = $("#subject");
					for(var i in data){
						for(var j = 0; j < Object.keys(data).length; j++){
							var g_id = $('#g_id'+j).text();
							
							var rWrapBefore = $('.rWrap.Before.'+j);
							var rWrapAfter = $('.rWrap.After.'+j);
							var rCount = $('#rCount'+j);
							if(i == g_id && data[i] > 0){
								rWrapBefore.css("visibility", "visible");
								rWrapAfter.css("visibility", "visible");
								rCount.text(data[i]);
							} else if(i == g_id && data[i] <= 0){
								rWrapBefore.css("visibility", "hidden");
								rWrapAfter.css("visibility", "hidden");
							}
						}
					} 
				}, error: function(){
					console.log('안됨');
				}
			});
			
		}
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>