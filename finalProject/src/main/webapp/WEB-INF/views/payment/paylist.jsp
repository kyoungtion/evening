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
	<body><!-- <body onload="getPayInfoList();"> -->
		<c:import url="/WEB-INF/views/common/header.jsp"/>
	<%-- 	<c:url var="pList" value="pList.py">
			<c:param name=""></c:param>
		</c:url> --%>
		
		
		<div class="my-panel" style="width:80%;">
			<div class="col-md-10 col-md-offset-1" style="margin:0; width:100%;">
				<div class="contact-wrap">
					<form style="height:100%; margin-left:0%;">
						<div class="row">
							<div class="col-md-12" style="margin-bottom:5%;">
							<span id="titlespan2">총 결제 내역 수 : ${ pi.listCount }</span>
							</div>
						</div>
						
					<div class="row content2">
						<table border="1" summary="" class="content-table">
						<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<col style="width:50px;">
							<col style="width:100px;" >
							<col style="width: 100px;">
							<col style="width: 200px;">
							<col style="width: 200px;">
							<col style="width: 300px;">
							<%-- <col style="width: 100px;" class=""> --%>
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
									<!-- <th cope="col">결제 update date</th> -->
									<th scope="col">결제 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${ list }">
									<tr>
<%-- 									<tr style="background-color:#FFFFFF; color:#333333;">
										 <td id="P_ID${pt.index }" class="P_ID" name="P_ID">${p.P_ID }</td>
										<td class="subject" id="subject"><span class="PID">${p.P_ID }</span>
										<span class="rWrap Before ${pt.index }"> [ </span><span><font
												id="rCount${pt.index}"></font></span><span
											class="rWrap After ${pt.index}"> ] </span></td> --%>

										<td>${p.p_No}</td>
										<td>${p.p_ID}</td>
										<td>${p.p_NICKNAME}</td>
										<td></td>
										<td>${p.MONEY}</td>
										<td>${p.PAYDAY}</td>
										<td style="text-align:center;">${p.p_STATUS}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<br>
					<div class="row">
						<div class="col-md-5" style="text-align: center; left: 35%; width: 350px;">
						<select id="searchfor" name="searchfor">
							<option value="P_ID">아이디</option>
							<option value="P_NICKNAME">닉네임</option>
						</select> <input id="searchText" name="searchText" type="search"/><input
							type="hidden">
						<button type="button" id="searchBtn" style="background: none; border: 0;">
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
				</div>
				
				</form>
				<button onclick="cancelPay()">환불하기</button>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
	
	<script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script><!-- jQuery CDN --->
  	<script>
    function cancelPay() {
      jQuery.ajax({
        "url": "http://www.myservice.com/payments/cancel",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
          "cancel_request_amount": , // 환불금액
          "reason": "테스트 결제 환불" // 환불사유
          "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
          "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
          "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
        }),
        "dataType": "json"
      });
    }
  </script>
	
	</body>
	</html>