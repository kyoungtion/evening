<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENING : 관리자 메뉴</title>
<style>
.subject:hover {
	cursor: pointer;
	font-weight: bold;
}

#searchText {
	width: 200px;
	height: 25px;
	border: whitesmoke;
}

.rWrap {
	visibility: hidden;
}

.my-tabs {
	list-style:none;
	margin:0;
}

.my-tabs li {
	float: left;
	margin:0;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel"
		style="width: 100%; height: 1000px;">
		<div style="">		
			<ul class="my-tabs">
				<li class="my-tab"><a href="adminView.me">회원 관리</a></li>
				<li class="my-tab"><a href="qna.me">문의글 관리</a></li>
				<!-- <li class="my-tab"><a href="dealDetail.me">거래내역</a></li> -->
				<li class="my-tab"><a href="insertNotice.me">공지사항 작성</a></li>
			</ul>
		</div>	
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap" style="height: 900px;">
				<form style="height: 100%;">
					<div class="container">
						<div class="row content" style="height: 600px;">
							<table border="1" summary="" class="content-table">
								<colgroup>
									<col style="width: 60px;">
									<col style="width: 100px;">
									<col style="width: 100px;">
									<col style="width: 100px;">
									<col style="width: 200px;">
									<col style="width: 100px;">
								</colgroup>
								<thead>
									<tr style="">
										<th scope="col">회원번호</th>
										<th scope="col">이름(아이디)</th>
										<th scope="col">별명</th>
										<th scope="col">연락처</th>
										<th scope="col">주소</th>
										<th scope="col">등급</th>
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

						<!-- 페이징 -->
						<div class="row">
							<div class="col-md-5"
								style="text-align: center; left: 24%; width: 350px;">

								<!-- </div> -->
								<ul class="pagination">
									<!-- 이전 -->
									<c:if test="${ pi.currentPage <= 1} ">
										<li class="disabled"><a href="#">«</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="mypost.me">
											<c:param name="page" value="${ pi.currentPage - 1 } " />
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
										</c:url>
										<li><a href="${ after }">»</a></li>
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
	
	
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>