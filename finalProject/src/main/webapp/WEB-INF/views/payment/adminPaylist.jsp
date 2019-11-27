<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENING : 관리자메뉴</title>
<style>
.active {
	background: gray;
	color: white;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel" style="width: 100%; height: 1000px;">
		<div style="width: 100%; text-align: center !important; padding: 10px;">
			<ul class="my-tabs1">
				<li class="my-tab"><button class="btn" id="adminView"
						onclick="location.href='adminView.ad'">회원 관리</button></li>
				<li class="my-tab"><button class="btn" id="manageSeller"
						onclick="location.href='manageSeller.ad'">판매자 전환</button></li>
				<c:url var="qnaList" value="qna.ad">
					<c:param name="category" value="QNA" />
					<c:param name="viewName" value="adminQnaView" />
				</c:url>
				<li class="my-tab"><button class="btn active" id="pList" onclick="location.href='pList.py'">거래내역</button></li>
				<li class="my-tab"><button class="btn" id="qna"
						onclick="location.href='${qnaList}'">문의글 관리</button></li>
				<c:url var="adminNotice" value="adminNoticeView.ad">
					<c:param name="viewName" value="adminNotice"/>
				</c:url>
				<li class="my-tab"><button class="btn" id="insertNotice"
						onclick="location.href='${adminNotice}'">공지사항 관리</button></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1"
			style="margin: 0; width: 100%; background: whitesmoke;">
			<div class="contact-wrap" style="height: 900px; padding: 0;">
					<div class="container">
					<form style="height: 100%; margin-left: 0%;">
						<div class="row content" style="height: 700px !important;">
							<div class="col-md-12" style="margin-bottom: 5%;">
								<span class="titlespan2" id="listCount"></span>
							</div>
							<div class="row content2" style="padding: 0 30px; height:100%;">
								<table border="1" summary="" class="content-table">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 200px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<%-- <col style="width: 100px;" class=""> --%>
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 55px;">
									</colgroup>
									<thead>
										<tr style="">
											<th scope="col">번호</th>
											<th scope="col">아이디</th>
											<th scope="col">닉네임</th>
											<th scope="col">상품명</th>
											<th scope="col">금액</th>
											<th scope="col">결제 날짜</th>
											<th scope="col">수정 날짜</th>
											<!-- <th cope="col">결제 update date</th> -->
											<th scope="col">결제상태</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${ fn:length(list) > 0 }">
                        				<c:forEach var="p" items="${ list }" begin="0" end="${ fn:length(list) }" varStatus="paystatus">
												<c:if test="${ loginUser != null && loginUser.user_id == 'admin' }">
													<c:set var="pList" value="${ list }"/>
												</c:if>
												<tr>
													<%-- 									<tr style="background-color:#FFFFFF; color:#333333;">
													 <td id="P_ID${pt.index }" class="P_ID" name="P_ID">${p.P_ID }</td>
													<td class="subject" id="subject"><span class="PID">${p.P_ID }</span>
													<span class="rWrap Before ${pt.index }"> [ </span><span><font
															id="rCount${pt.index}"></font></span><span
														class="rWrap After ${pt.index}"> ] </span></td> --%>
					
													<td>${ paystatus.count }</td>
						                              <td>${p.p_ID}</td>
						                              <td>${p.p_NICKNAME}</td>
						                              <td>${p.board.SG_BNAME}</td>
						                              <td>${p.board.SG_PRICE}</td>
						                              <td>${p.PAYDAY}</td>
						                              <td>${p.p_UPDATE_DATE }</td>
						                              <td style="text-align:center;">${p.p_STATUS}</td>
						                              <c:if test="${ loginUser.user_id ne 'admin' }">
						                              <td><input type="checkbox" style="margin-left:10%;"></td>
						                              </c:if>
													<c:set var="listCount" value="${ fn:length(pList) }"/>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
						<br>
						<script>
							$(function(){
								var listCount = ${listCount};
								$('#listCount').text("총 결제 내역 수 : " + listCount);
							});
						</script>
						
						<br>
						<div class="row">
							<div class="col-md-5"
								style="text-align: center; left: 35%; width: 350px;">

								<%-- 						<input type="submit" value="검색" formaction="paylistSearch.py">
							<select name="search_option">
								<option value="p_ID" 
								<c:if test="${map.search_option == 'p_ID' }">selected</c:if>>아이디</option>
								<option value="p_NICKNAME" 
								<c:if test="${map.search_option == 'p_NICKNAME' }">selected</c:if>>닉네임</option>
								<option value="p_STATUS" 
								<c:if test="${map.search_option == 'p_STATUS' }">selected</c:if>>결제상태</option>						
							</select>
							<input name="keyword" value="${map.keyword }>
							<input type="submit" value="조회"> --%>

								<select id="searchfor" name="searchfor" style="border: 2px solid whitesmoke;">
									<option value="p_ID">아이디</option>
									<option value="p_NICKNAME">닉네임</option>
									<option value="p_STATUS">결제 상태</option>
								</select> <input id="searchText" name="searchText" type="search" /> <input
									type="hidden">
								<button type="button" id="searchBtn2"
									style="background: none; border: 0;">
									<i class="fas fa-search"></i>
								</button>

								<ul class="pagination">
									<!-- 이전 -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a href="#">◁</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="pList.py">
											<c:param name="page" value="${ pi.currentPage - 1 }" />
										</c:url>
										<li><a href="${ before }">◀</a></li>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="pList.py">
												<c:param name="page" value="${ p }" />
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									<!-- 다음 -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">▶</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="pList.py">
											<c:param name="page" value="${ pi.currentPage + 1 }" />
										</c:url>
										<li><a href="${ after }">▷</a></li>
									</c:if>
								</ul>
							</div>
							
						</div>
						</form>
					</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>