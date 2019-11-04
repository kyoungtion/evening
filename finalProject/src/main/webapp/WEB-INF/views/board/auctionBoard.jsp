<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Store Template</title>
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
						
						<!-- ��ǰ ����Ʈ -->
						<c:if test="${ fn:length(alist) > 0 }">
						
							<!-- ���� �Խ��� �̹��� �����ϱ� -->
							<c:if test="${ pi.currentPage == 1 }">
								<c:set var="imageCount" value="1"/>
							</c:if>
							<c:if test="${ pi.currentPage == 2 }">
								<c:set var="imageCount" value="7"/>
							</c:if>
							<c:if test="${ pi.currentPage == 3 }">
								<c:set var="imageCount" value="13"/>
							</c:if>
						
							<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
								<div class="col-md-4 text-center">
									<div class="product-entry">
										<div class="product-img" style="background-image: url(resources/images/item-${imageCount}.jpg);">
										
										<!-- ��ǰ �̹��� ���� ����(����) -->
										<c:if test="${ i.SG_ID <= 18 }">
											<c:set var="imageCount" value="${imageCount + 1}"/>
											<c:if test="${ imageCount > 15 }">
												<c:set var="imageCount" value="1"/>
											</c:if> 
										</c:if>
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
														<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
														<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
														<span><a href="#"><i class="icon-heart3"></i></a></span>
														<!-- <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span> -->
													</p>
												</div>
												
										</div>
										
										<div class="desc">
											<h3><a href="product-detail.html">${ i.SG_BNAME }</a></h3>
											<p class="price">�޸Ű�<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
											<p class="price">��Ž��۰�<span> <br> <fmt:formatNumber value="${i.SG_SPRICE }" type="currency"/></span></p>
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
			                     
			                     <div><a href="">�ֱ� ��ϼ�</a></div>
			                     <div><a href="">���� �ð���</a></div>
			                     <br>
			                     <div style="font: bolder; font-size: 15px;">�� ��ǰ �� : ${ pi.listCount }</div>
			                     
			                  </div>
			               </div>
						</div>

							<div class="side">
								<h2>�ֱٿ� �� ����</h2>
								<div>test D</div>
								<div>test S</div>
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
