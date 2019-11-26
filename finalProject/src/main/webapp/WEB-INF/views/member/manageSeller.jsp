<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 거래, 경매는 이브닝 : 관리자 메뉴</title>
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
				<li class="my-tab"><button class="btn active" id="manageSeller"
						onclick="location.href='manageSeller.ad'">판매자 전환</button></li>
				<c:url var="qnaList" value="qna.ad">
					<c:param name="category" value="QNA" />
					<c:param name="viewName" value="adminQnaView" />
				</c:url>
				<li class="my-tab"><button class="btn" id="pList" onclick="location.href='pList.py'">거래내역</button></li>
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
				<!-- <form style="height: 100%;"> -->
					<div class="container">
						<div class="row content" style="height: 800px;">
							<div class="row content table" style="height: 600px;">
								<input type="checkbox" id="selectAll"> <label
									for="selectAll">전체선택</label>
								<script>
									$(function() {
										$('#selectAll').click(function() {
											if ($('#selectAll').is(":checked")) {
												$("input[name='chk']").prop('checked',true);
											} else {
												$("input[name='chk']").prop('checked',false);
											}
										});

										$('#chk').on('click',function() {
											if ($('#chk').is(":checked") == false) {
												$('#selectAll').attr("checked",false);
											}
										});
									});
								</script>
								<table border="1" summary="" class="content-table">
									<colgroup>
										<col style="width: 2%">
										<col style="width: 6%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 12%;">
										<col style="width: 35%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr style="">
											<th scope="col"><i class="fas fa-check"></i></th>
											<th scope="col">아이디</th>
											<th scope="col">이름(별명)</th>
											<th scope="col">연락처</th>
											<th scope="col">이메일</th>
											<th scope="col">주소</th>
											<th scope="col">신청 날짜</th>
											<th scope="col">패널티 점수</th>
											<th scope="col" style="text-align: center;">승인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="m" items="${list}" varStatus="st">
											<tr style="background-color: #FFFFFF; color: #333333;">
												<td class="displaynone" id="listLength">${fn:length(list)}</td>
												<td><input class="chk" id="chk" name="chk"
													type="checkbox" value="${ m.user_id }"></td>
												<td id="user_id${st.index}">${ m.user_id }</td>
												<td>${ m.user_name }(${m.nickName })</td>
												<td>${ m.phone }</td>
												<td>${ m.user_email }</td>
												<td>${ m.address }</td>
												<td>${ m.seller_request_date }</td>
												<td>${ m.penalty_point }</td>
												<td style="text-align: center;">
													<button id="memberAccept.${st.index}" class="btn-info memberAccept">승인</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div
								style="width: 100%; border-top: 1px solid whitesmoke; height: 100px; padding-top: 10px;">
								<div class="row">
									<div style="text-align:right; margin-right:20px;">
										<!-- <button class="btn-primary">등급변경</button> -->
										<button type="button" class="btn-primary" id="acceptAllMember">선택회원 전부 승인</button>
									</div>
					
									<div class="col-md-5" style="text-align: center; width: 100%;">
										<select id="searchfor" name="searchfor">
											<option value="user_id">아이디</option>
											<option value="user_name">이름</option>
										</select> <input id="searchText" name="searchText" type="search" onkeyup="enterkey();" /> 
										<input type="hidden" id="category" value="${ cate }">
										<button type="button" id="searchMemberBtn" style="background: none; border: 0;">
											<i class="fas fa-search"></i>
										</button><br>
										<!-- </div> -->
										<ul class="pagination">
											<!-- 이전 페이지 -->
											<c:if test="${ pi.currentPage <= 1 }">
												<li class="disabled"><a>&laquo;</a></li>
											</c:if>
											<c:if test="${ pi.currentPage > 1 }">
												<c:url var="before" value="manageSeller.ad">
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
													<c:url var="pagination" value="manageSeller.ad">
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
												<c:url var="after" value="manageSeller.ad">
													<c:param name="page" value="${ pi.currentPage + 1 } " />
												</c:url>
												<li><a href="${ after }">»</a></li>
											</c:if>
										</ul>
									</div>
								</div>
								
							</div>
						</div>
						<br>
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('.memberAccept').on('click', function(){
				var user_id = $(this).attr('id');
				var indexof = user_id.indexOf('.');
				var i = user_id.substring(indexof + 1);
	
				user_id = $('#user_id' + i).text();
	
				if (confirm('해당 회원을 판매자회원으로 승인하시겠습니까?')) {
					location.href = "memberAccept.ad?user_id=" + user_id;
				}
			});
		});
		
		/* $('#acceptAllMember').on('click', function(){
			if(confirm('선택한 회원 모두 판매자회원으로 승인하시겠습니까?')){
				var ids = "";
				$('input:checkbox:checked').each(funcion(index){
					if(index != 0){
						ids += "," + $(this).val();
					} else {
						ids += $(this).val();
					}
					
					location.href="memberAcceptAll.ad?ids="+ids;
				})
			}
		}); */
		
		$('#acceptAllMember').on('click', function(){
			if(confirm("선택한 회원 모두 판매자 회원으로 승인하시겠습니까?")){
				var ids = "";
				$('input:checkbox:checked').each(function(index) {
					if (index != 0) {
						ids += "," + $(this).val();
					} else {
						ids += $(this).val();
					}

					location.href = "memberAcceptAll.ad?ids=" + ids;
				});
			}
		});
	
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>