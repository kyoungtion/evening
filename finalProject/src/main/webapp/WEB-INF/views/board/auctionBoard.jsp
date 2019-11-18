<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
	<title>��� �ŷ� �Խ���</title>
	</head>
	<body>
	
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		
	<div class="colorlib-loader"></div>

	<div id="page">

		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">
						<div class="row row-pb-lg">

						<button class="btn btn-primary btn-outline"style="float: right; margin: 0px 50px 0 0px;"
							onclick="location.href='insertF.bo?type=2';">�۾���</button>
								
						<h2><span style="font-size: 50px;">��� �ŷ� �Խ���</span></h2>
						
						<!-- ��ǰ ����Ʈ -->
						<c:if test="${ fn:length(alist) > 0 }">
						
							<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
								<div class="col-md-4 text-center">
									<div class="product-entry">
									
										<!-- �̹��� ���� : �̹��� ������ �������Ͻ� ù��° �̸��� ��� -->
										<c:forEach var="j" items="${ af }" begin="0" end="${ fn:length(af) }">
											<c:if test="${ j.SG_ID eq i.SG_ID }">
												<c:forTokens items="${ j.RENAMEFILENAME }" delims="," varStatus="jStatus">
													<c:if test="${ jStatus.first }">
														<c:set var="k" value="${ jStatus.current }" />
													</c:if>
												</c:forTokens>
											</c:if>
										</c:forEach>
										<div class="product-img" style="background-image: url(resources/thumbnail/${ k })">
										
										<!-- ������ ������ ��Ÿ�� ����ǥ�� -->
										<c:remove var="k"/>
										
										<!-- �׽�Ʈ�� ( ��¥ ��� )  -->
											<jsp:useBean id="now" class="java.util.Date"/>
											<fmt:parseDate var="enroll" value="${ i.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
											<fmt:parseDate var="end" value="${ i.SG_END_DATE }" pattern="yyyy-MM-dd"/>
											
											<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
											<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>
											<fmt:parseNumber value="${ end.time / (1000*60*60*24) }" integerOnly="true" var="endDays"/>

												<p class="tag">
													<c:if test="${ ( nowDays - enrollDays ) <= 7 }">
														<span class="new">New</span>
													</c:if>
													<c:if test="${ (endDays - nowDays) >= 0 }">
														<span class="sale">D - ${ endDays - nowDays }</span>
													</c:if>
													<c:if test="${ (endDays - nowDays) < 0 }">
														<span class="sale">��� ����</span>
													</c:if>
												</p>

												<div class="cart">
													<p>
														<!-- <span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
														<span><a href="selectOne.ud"><i class="icon-eye"></i></a></span> -->
														<span><a href="#"><i class="icon-heart3"></i></a></span>
														<!-- <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span> --> <!-- �ʿ���������Ƽ� ����� (���������) -->
													</p>
												</div>
												
										</div>
										
										<div class="desc">
											<c:url var="detailView" value="selectOne.bo">
			                                    <c:param name="sgId" value="${ i.SG_ID }"/>
			                                 </c:url>
			                                 <h3><a href="${ detailView }" style="cursor: pointer;">${ i.SG_BNAME }</a></h3>
			                                 <p class="price">���� ��Ű�<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
			                                 <p class="price">��� ���۰�<span> <br> <fmt:formatNumber value="${i.SG_SPRICE }" type="currency"/></span></p>
										</div>
										
									</div>
								</div>
							</c:forEach>
						</c:if>
							
						</div>
						
						<div class="row"> <!-- ������ �̵� ��(����¡ ó��) -->
							<div class="col-md-12">
								<ul class="pagination">
									<!-- ���� ������ -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a>&laquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="auctionList.bo">	
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<li><a href="${ before }">&laquo;</a></li>
									</c:if>
									
									<!-- ������ -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="auctionList.bo">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									
									<!-- ���� ������ -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">&raquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="auctionList.bo">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<li><a href="${ after }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						
					</div>
					
					<div class="col-md-2 col-md-pull-10">
						<div class="sidebar"> <!-- ���̵�� -->
							<div class="side"> <!-- side �ϳ��� �����̵�� ĭ �Ѱ��� �߰��� -->
								<h2>���� ����</h2>
								<div class="fancy-collapse-panel">
			                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			                     
			                     <c:url var="recentList" value="auctionList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="recent"/>
			                     </c:url>
			                     
			                     <c:if test="${ modeSet eq 'recent' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ recentList }" style="color: white;">�ֱ� ��ϼ�</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'recent' }">
				                     <div><a href="${ recentList }">�ֱ� ��ϼ�</a></div>
			                     </c:if>
			                     
			                     <c:url var="endTimeList" value="auctionList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }" />
			                     	<c:param name="mode" value="endTime"/>
			                     </c:url>
			                     <c:if test="${ modeSet eq 'endTime' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ endTimeList }" style="color: white;">���� �ð���</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'endTime' }">
				                     <div><a href="${ endTimeList }">���� �ð���</a></div>
			                     </c:if>
			                     
			                     <c:url var="priceAscList" value="auctionList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="priceAsc" />
			                     </c:url>
			                      <c:if test="${ modeSet eq 'priceAsc' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ priceAscList }" style="color: white;">���� ������ ��</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'priceAsc' }">
			                     	<div><a href="${ priceAscList }">���� ������ ��</a></div>
			                     </c:if>
			                     
			                     <c:url var="priceDescList" value="auctionList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="priceDesc"/>
			                     </c:url>
			                     <c:if test="${ modeSet eq 'priceDesc' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ priceDescList }" style="color: white;">���� ������ ��</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'priceDesc' }">
			                     	<div><a href="${ priceDescList }">���� ������ ��</a></div>
			                     </c:if>
			                     
			                     <c:url var="CountList" value="auctionList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="CountList" />
			                     </c:url>
			                     <c:if test="${ modeSet eq 'CountList' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ CountList }" style="color: white;">��ȸ��</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'CountList' }">
			                     	<div><a href="${ CountList }">��ȸ��</a></div>
			                     </c:if>
			                     
			                     
			                     
			                     <br>
			                     <div style="font: bolder; font-size: 15px;">�� ��ǰ �� : ${ pi.listCount }</div>
			                     
			                  </div>
			               </div>
						</div>

							<div class="side">
								<h2>�ֱٿ� �� ����</h2>
								<div>test</div>
							</div>
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<c:import url="/WEB-INF/views/common/footer.jsp"/>

	</body>
</html>

