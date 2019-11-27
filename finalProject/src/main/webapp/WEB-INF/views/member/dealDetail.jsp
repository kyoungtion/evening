<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 거래, 경매는 이브닝 : 입찰 내역</title>

<style>
.update {font-size:10px !important; padding:5px !important;}
#cancel{text-align:center !important;}
.my-panel{display:flex;}
ul.tabs li{width:48% !important;}
.ui-tabs .ui-tabs-nav li{width: 48.5% !important;}
.sale {
	font-size: 11px;
        background: #DD3E3E;
        color: #fff;
        padding: .3em .5em;
        -webkit-border-radius: 2px;
        -moz-border-radius: 2px;
        -ms-border-radius: 2px;
        border-radius: 2px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<script>
		$(function(){
			console.log('${list}');
		})
	</script>
	<div class="my-panel" >
			<ul class="my-tabs">
				<li class="my-tab" onclick="clickRefresh();"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab active"><a href="dealDetail.me">입찰내역</a></li>
				<li class="my-tab"><a href="pList.py">결제내역</a></li>
				<li class="my-tab"><a href="mypost.me?category=Community">내가 쓴 글</a></li>
				<li class="my-tab"><a href="message.sr">쪽지함</a></li>
			</ul>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%; padding: 0;" id="tabs">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<!-- <ul class="tabs no-drag">
						<li class="tab-link" data-tab="tab-1"><a href="#tab-1">입찰중인 상품</a></li>
						<li class="tab-link" data-tab="tab-2"><a href="#tab-2">결제완료내역</a></li>
					</ul> -->
					<div id="tab-1" class="tab-content current">
						<div class="contact-wrap" style="margin:0 !important;">
							<div class="row content" style="height: 620px; padding:0;">
								<table border="1" summary="" class="content-table">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 80px;">
										<col style="width: 50px;">
										<col style="width: 50px;" class="displaynone">
										<col style="width: 200px;">
										<col style="width: 100px;">
										<col style="width: 100px;" class="">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="" class="no-drag">
											<th scope="col"></th>
											<th scope="col">번호</th>
											<th scope="col" class="displaynone">카테고리</th>
											<th scope="col">상품 이름</th>
											<th scope="col">현재 입찰가</th>
											<th scope="col">내 입찰가</th>
											<th scope="col" id="cancel">&nbsp;입찰취소</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="a" items="${ list }">
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											
											<!-- 진행중 여부 -->
											<jsp:useBean id="now" class="java.util.Date"/>
											<fmt:parseDate var="enroll" value="${ a.board.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
											<fmt:parseDate var="end" value="${ a.board.SG_END_DATE }" pattern="yyyy-MM-dd"/>
											
											<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
											<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>
											<fmt:parseNumber value="${ end.time / (1000*60*60*24) }" integerOnly="true" var="endDays"/>
											<c:if test="${ (endDays - nowDays) >= 0 }">
												<td><span class="sale">D - ${ endDays - nowDays }</span></td>
											</c:if>
											<c:if test="${ (endDays - nowDays) < 0 }">
												<td><span class="sale">경매 종료</span></td>
											</c:if>
											<td>${ a.sg_Id }</td>
											<td class="displaynone"></td>
											<td>${ a.board.SG_BNAME }</td>
											<td>${ a.board.SG_SPRICE }</td>
											<td>${ a.a_Price }</td>
											<c:if test="${ a.a_Check == 'N'}">
												<form action="deleteAuc.py" method="get" id="deleteAuctionHistory">
													<input type="number" value="${ a.sg_Id }" name="sgId" hidden="hidden">
													<input type="number" value="${ a.a_Id }" name="aId" hidden="hidden">
													<input type="number" value="${	a.a_Price }" name="price" hidden="hidden">
													<td id="cancel"><input type="submit" onclick="deleteAuc();" class="btn btn-danger update" value="취소"></td>
												</form>
											</c:if>
											<c:if test="${ a.a_Check == 'Y' }">
												<td><span>취소완료</span></td>
											</c:if>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row"> <!-- 페이지 이동 바(페이징 처리) -->
								<div class="col-md-12">
									<ul class="pagination">
										<!-- 이전 페이지 -->
										<c:if test="${ pi.currentPage <= 1 }">
											<li class="disabled"><a>&laquo;</a></li>
										</c:if>
										<c:if test="${ pi.currentPage > 1 }">
											<c:url var="before" value="dealDetail.me">	
												<c:param name="page" value="${ pi.currentPage - 1 }"/>
											</c:url>
											<li><a href="${ before }">&laquo;</a></li>
										</c:if>
										
										<!-- 페이지 -->
										<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
											<c:if test="${ p eq pi.currentPage }">
												<li class="active"><a>${ p }</a></li>
											</c:if>
											
											<c:if test="${ p ne pi.currentPage }">
												<c:url var="pagination" value="dealDetail.me">
													<c:param name="page" value="${ p }"/>
												</c:url>
												<li><a href="${ pagination }">${ p }</a></li>
											</c:if>
										</c:forEach>
										
										<!-- 다음 페이지 -->
										<c:if test="${ pi.currentPage >= pi.maxPage }">
											<li class="disabled"><a href="#">&raquo;</a></li>
										</c:if>
										<c:if test="${ pi.currentPage < pi.maxPage }">
											<c:url var="after" value="dealDetail.me">
												<c:param name="page" value="${ pi.currentPage + 1 }"/>
											</c:url>
											<li><a href="${ after }">&raquo;</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>

					</div>
					<script>
						function deleteAuc() {
							
							if(confirm("입찰 취소하시겠습니까? 취소하시면 패널티가 부여되며, 등급이 하락될 수 있습니다.") == true){
								$('#deleteAuctionHistory').submit();
							};
						}
					</script>
					
					
					<!-- 결제 내역 -->
					<%-- <div id="tab-2" class="tab-content">
						<div class="contact-wrap"  style="margin:0 !important;">
							<div class="row content" style="height: 620px;">
								<table border="1" summary="" class="content-table">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
										<col style="width: 50px;" class="displaynone">
										<col style="width: 450px;">
										<col style="width: 100px;">
										<col style="width: 100px;" class="">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="">
											<th scope="col">번호</th>
											<th scope="col" class="displaynone">카테고리</th>
											<th scope="col">상품 이름</th>
											<th scope="col">상품 가격</th>
											<th scope="col" class="displaynone">내 입찰가</th>
											<th scope="col"  id="cancel">&nbsp;상세보기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ list }" var="a">
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>${ a.sg_Id }</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td class="displaynone">8,000</td>
											<td  id="cancel"><button onclick="updateAuc();"
													class="btn btn-info update">보기</button></td>
										</tr>
										</c:forEach>
									</tbody>
									
								</table>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;">
									<ul class="pagination">
										<li class="disabled"><a href="#">«</a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div> --%>

				</div>

			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			
			/* $('#tabs').tabs();
			var tabs = $('#tabs').tabs({
				activate: function(event, ui){
					var active = $('#tabs').tabs('option', 'active');
					$.cookie('activeTabIndex', active);
				}
			});
			
			var activeTabIndex = $.cookie('activeTabIndex');
			
			if(activeTabIndex != undefined){
				tabs.tabs('option','active',activeTabIndex);
			} */
			
			
			
			/* if (location.hash == "#tab-1"){         
				$('.tabs').find('li').eq(0).addClass('current').siblings().removeClass('current');        
				
			} else if(location.hash == "#tab-2"){         
				$('.tabs').find('li').eq(1).addClass('current').siblings().removeClass('current');         
				
			} else if(location.hash == "#tab-3"){         
				$('.tabs').find('li').eq(2).addClass('current').siblings().removeClass('current');         
			}거래내역
			
			$('ul.tabs li').click(function(){
		        $('ul.tabs li').removeClass('current');
	
		        $(this).addClass('current');
			}); */
		});
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>