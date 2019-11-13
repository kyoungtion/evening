<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.subject:hover {
	cursor:pointer;
	font-weight:bold;
}
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
	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">
		<div class="mypageCategory no-drag">
			<ul class="my-tabs">
				<li class="my-tab"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
				<li class="my-tab"><a href="mypost.me">내가 쓴 글</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%;">
			<div class="contact-wrap" style="height: 900px;">
				<form style="height: 100%;">
					<div class="container">
						<ul class="tabs no-drag">
							<li class="tab-link current" data-tab="tab-1">글 목록</li>
						</ul>
						<div id="tab-1" class="tab-content current" style="height:100% !important">
							<div class="container">
								<div class="row">
									<select id="boardSelect">
										<option value="Community">커뮤니티</option>
										<option value="Selling">삽니다</option>
										<option value="QNA">문의게시판</option>
									</select><br> <br>
									
								</div>
								<div class="row content" style="height:600px;">
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
												<tr style="background-color: #FFFFFF; color: #333333;">
													<td id="g_id${st.index }" class="g_id" name="gId">${ g.g_id }</td>
													<td class="displaynone"></td>
													<td class="subject" id="subject"><span class="gTitle">${ g.g_title }</span>
														<c:if test="${fn:contains(g.g_content, '<img src')}">
															<!-- <img src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_img.gif"
															alt="파일첨부" class="ec-common-rwd-image"> -->
															<i class="fas fa-image"></i>
														</c:if> <%-- rCount 추가 나중에 --%> <span
														class="rWrap Before ${st.index}">[</span><span><font
															id="rCount${st.index}"></font></span><span
														class="rWrap After ${st.index}">]</span></td>
													<td>${ g.nickname }</td>
													<td>${ g.g_enroll_date }</td>
													<td>${ g.g_count }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								
								
								<br>
								<div class="row">
									<div class="col-md-5"
										style="text-align: center; left: 24%; width: 350px;">
										<!-- <select id="searchfor" name="searchfor">
											<option value="title">제목</option>
											<option value="writer">작성자</option>
										</select> <input id="searchText" name="searchText" type="search" /> 
										
										<input type="hidden" id="category">
										<button type="button" id="searchBtn"
											style="background: none; border: 0;">
											<i class="fas fa-search"></i>
										</button> -->
		
		
										<!-- </div> -->
										<ul class="pagination">
											<!-- 이전 -->
											<c:if test="${ pi.currentPage <= 1} ">
												<li class="disabled"><a href="#">«</a></li>
											</c:if>
											<c:if test="${ pi.currentPage > 1 }">
												<c:url var="before" value="mypost.me">
													<c:param name="page" value="${ pi.currentPage - 1 } " />
													<c:param name="category" value="${ cate }" />
												</c:url>
												<li><a href="${ before }">«</a></li>
											</c:if>
											<!-- 페이지 -->
											<c:forEach var="p" begin="${ pi.startPage }"
												end="${ pi.endPage }">
												<c:if test="${ p eq pi.currentPage }">
													<li class="active"><a>${ p }</a></li>
												</c:if>
												<c:if test="${ p ne pi.currentPage }">
													<c:url var="pagination" value="mypost.me">
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
												<c:url var="after" value="mypost.me">
													<c:param name="page" value="${ pi.currentPage + 1 } " />
													<c:param name="category" value="${ cate }" />
												</c:url>
												<li><a href="${ after }">»</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	
	$(function(){
		$('#boardSelect').val('${category}').prop("selected", true);
		category = $('#boardSelect').val();
		$('#category').val(category);

		$('#boardSelect').change(function(){
			selectValue = $('#boardSelect option:selected').val();
			<%-- user_id = "<%= session.getAttribute("user_id")%>"; --%>
			category = $('#boardSelect option:selected').val();
			location.href="mypost.me?category="+category;
			
		});
	});

	// 게시글 상세정보 조회
	$(function(){
		$('.subject').click(function(){
			var g_id = $(this).prev().prev().text();
			location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage};
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