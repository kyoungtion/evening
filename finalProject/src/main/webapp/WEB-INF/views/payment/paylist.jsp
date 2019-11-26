<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>결제 내역</title>
	<style type="text/css">
	</style>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
<%-- 		<c:url var="pList" value="paylistSearch.py">	
		</c:url> --%>
		<div class="my-panel" style="width:80%;">
			<div class="col-md-10 col-md-offset-1" style="margin-left:20%; width:80%;">
				<div class="contact-wrap">
					<form style="height:100%; margin-left:0%;">
						<div class="row">
							<div class="col-md-12" style="margin-bottom:5%;">
							 <c:if test="${ loginUser.user_id eq admin }">
							<span id="titlespan2">총 결제 내역 수 : ${ pi.listCount }</span>
							 </c:if> 
							</div>
						</div>
						
					<div class="row content2">
						<table border="1" summary="" class="content-table">
						<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<col style="width:50px;">
							<col style="width:120px;" >
							<col style="width: 120px;">
							<col style="width: 200px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<%-- <col style="width: 100px;" class=""> --%>
							<col style="width: 100px;">
							<col style="width: 60px;">
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
									<c:if test="${ loginUser.user_id ne 'admin' }">
									<th scope="col">선택</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
							<!-- 결제 내역 -->
							<c:set var="Count" value="1"/>
							<c:if test="${ fn:length(list) > 0 }">							
							<c:forEach var="p" items="${ list }" begin="0" end="${ fn:length(list) }" varStatus="paystatus">
							<c:if test="${ loginUser.user_id ne 'admin' && p.p_ID eq loginUser.user_name }">	
									<tr>
<%-- 									<tr style="background-color:#FFFFFF; color:#333333;">
										 <td id="P_ID${pt.index }" class="P_ID" name="P_ID">${p.P_ID }</td>
										<td class="subject" id="subject"><span class="PID">${p.P_ID }</span>
										<span class="rWrap Before ${pt.index }"> [ </span><span><font
												id="rCount${pt.index}"></font></span><span
											class="rWrap After ${pt.index}"> ] </span></td> --%>
	
										<td>${ Count }</td>
										<c:set var="Count" value="${ Count+1 }" />									
										<td>${p.p_ID}</td>
										<td>${p.p_NICKNAME}</td>
										<td>${p.gp_ID}</td>
										<td>${p.MONEY}</td>
										<td>${p.PAYDAY}</td>
										<td>${p.p_UPDATE_DATE }</td>
										<td style="text-align:center;">${p.p_STATUS}</td>
 										<td><input class="chk" id="chk" name="chk"
														type="checkbox" value="${ p.p_No }"></td>
									</tr>
								</c:if>
								</c:forEach>								
								</c:if>
								<c:remove var="Count" />
								
								
								
								<c:if test="${ fn:length(list) > 0 }">
								<c:forEach var="p" items="${ list }" begin="0" end="${ fn:length(list) }" varStatus="paystatus">
								<c:if test="${ loginUser.user_id eq 'admin' }">
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
										<td >${p.gp_ID}</td>
										<td>${p.MONEY}</td>
										<td>${p.PAYDAY}</td>
										<td>${p.p_UPDATE_DATE }</td>
										<td style="text-align:center;">${p.p_STATUS}</td>
										<c:if test="${ loginUser.user_id ne 'admin' }">
										<td><input type="checkbox" style="margin-left:10%;"></td>
										</c:if>
									</tr>
								</c:if>
								</c:forEach>
								
								</c:if>
								
							</tbody>
						</table>
					</div>
					
					<br>
					<div class="row">
						<div class="col-md-5" style="text-align: center; left: 35%; width: 350px;">
						
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
					
						<select id="searchfor" name="searchfor">
							<option value="p_ID">아이디</option>
							<option value="p_NICKNAME">닉네임</option>
							<option value="p_STATUS">결제 상태</option>
						</select> <input id="searchText" name="searchText" type="search"/> <input
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
								<c:url var="before" value="pList.py" >
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
					<c:if test="${ loginUser.user_id ne 'admin' }">	
					<div class="col-md-5" style="text-align:center; left:35%;">
						<%-- <button type="button" onclick="location.href='${pdelete}'" class="btn btn-outline-dark">결제 취소 요청</button> --%>
						<button type="button" id="pdelete" class="btn btn-outline-dark">결제 취소 요청</button>
					</div>
					</c:if>
									
				</div>
				
				</form>
				
			</div>
		</div>
	</div>
	
	<script>
 	$('#pdelete').on('click', function() {
		if (confirm("결제 취소 하시겠습니까?")) {

			var ids = "";
			$('input:checkbox:checked').each(function(index) {
				if (index != 0) {
					ids += "," + $(this).val();
				} else {
					ids += $(this).val();
				}

				location.href = "pdelete.py?ids=" + ids;
			});
		}
	});	 
/* 	$('#pdelete').on('click', function() {
		var confirm_val = confirm("결제 취소 하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			
			$("input[class='chk']:checked").each(function(){
				checkArr.push($(this).attr("data-pNum"));
			});
			
			$.ajax({
				url : "/pdelete.py",
				type: "post"
				data : {chk : checkArr },
				success : function(){
					location.href="plist";
					}
				});
			}
		}); */
	</script>
	
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
	
	</body>
	</html>