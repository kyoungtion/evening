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
						
						<h2><span style="font-size: 50px;">�߰� �ŷ� �Խ���</span></h2>
						
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
										<div class="product-img" style="background-image: url(resources/images/${ k })">
										
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
											<p class="price">����<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
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
										<c:url var="before" value="secondgoodList.bo">	
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
											<c:url var="pagination" value="secondgoodList.bo">
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
										<c:url var="after" value="secondgoodList.bo">
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
			                     
			                     <div style="background-color: orange; padding-left: 10px;"><a href="#" style="color: white;">�ֱ� ��ϼ�</a></div>
			                     
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

