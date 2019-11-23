<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<%-- <!-- 리스트 불러오기 (ajax 대용) -->
	<c:if test="${ empty alist }">
						<script>
              $(function() {
                location.href = "home.do";
              });
            </script>
					</c:if> --%>
	
	<div class="page">
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
					<li style="background-image: url(resources/images/img-big.JPG);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-md-pull-2 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner">
										<div class="desc">
											<h2 class="head-1">실시간 인기 상품을</h2>
											<h2 class="head-2">아래에서</h2>
											<h2 class="head-3">만나보세요</h2>
											<p class="category">
												<span>중고거래 &amp; 중고제품 경매를 한 곳에서</span>
											</p>
											<button class="btn btn-primary" id="btn1">인기상품 보기</button>
											<!-- <p><a href="" id="btn1" class="btn btn-primary">인기상품 보기</a></p> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>
		<script>
      $(document).ready(function() {

        $('#btn1').click(function() {

          var offset = $('#moveto').offset(); //선택한 태그의 위치를 반환

          //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

          $('html').animate({
            scrollTop: offset.top
          }, 400);

        });

      });
    </script>
	</div>







	<div>

		<!--- 내용 입력 페이지 (실시간 품목) -->
		<div class="colorlib-shop">
			<div class="container">
				<br>
				<br>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2 id="moveto">
							<span style="font-size: 50px;">실시간 인기 품목</span>
						</h2>
						<p>곧 마감되는 경매품목이나 사람들이 많은 관심을 가지고있는 중고제품들</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(resources/images/item-5.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="icon-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="icon-eye"></i></a></span> <span><a
											href="#"><i class="icon-heart3"></i></a></span> <span><a
											href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a href="shop.html">Floral Dress</a>
								</h3>
								<p class="price">
									<span>$300.00</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(resources/images/item-6.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="icon-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="icon-eye"></i></a></span> <span><a
											href="#"><i class="icon-heart3"></i></a></span> <span><a
											href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a href="shop.html">Floral Dress</a>
								</h3>
								<p class="price">
									<span>$300.00</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(resources/images/item-7.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="icon-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="icon-eye"></i></a></span> <span><a
											href="#"><i class="icon-heart3"></i></a></span> <span><a
											href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a href="shop.html">Floral Dress</a>
								</h3>
								<p class="price">
									<span>$300.00</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 text-center">
						<div class="product-entry">
							<div class="product-img"
								style="background-image: url(resources/images/item-8.jpg);">
								<p class="tag">
									<span class="new">New</span>
								</p>
								<div class="cart">
									<p>
										<span class="addtocart"><a href="cart.html"><i
												class="icon-shopping-cart"></i></a></span> <span><a
											href="product-detail.html"><i class="icon-eye"></i></a></span> <span><a
											href="#"><i class="icon-heart3"></i></a></span> <span><a
											href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a href="shop.html">Floral Dress</a>
								</h3>
								<p class="price">
									<span>$300.00</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기까지 실시간 품목 라인-->

		<!-- 신규등록 품목-->
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
						<h2>
							<span style="font-size: 50px;">신규 등록된 품목</span>
						</h2>
						<p>올라온지 일주일도 안된 품목들</p>
					</div>
				</div>
				<div class="row">

					<c:if test="${ fn:length(alist) > 0 }">
						<c:forEach var="i" items="${ alist }" begin="0"
							end="${ fn:length(alist) }">
							<div class="col-md-4 text-center">
								<div class="product-entry">

									<!-- 이미지 삽입 : 이미지 파일이 여러개일시 첫번째 이름을 등록 -->
									<c:forEach var="j" items="${ af }" begin="0"
										end="${ fn:length(af) }">
										<c:if test="${ j.SG_ID eq i.SG_ID }">
											<c:forTokens items="${ j.RENAMEFILENAME }" delims=","
												varStatus="jStatus">
												<c:if test="${ jStatus.first }">
													<c:set var="k" value="${ jStatus.current }" />
												</c:if>
											</c:forTokens>
										</c:if>
									</c:forEach>
									<div class="product-img"
										style="background-image: url(resources/images/${ k })">

										<!-- 사진이 없을시 나타날 공백표시 -->
										<c:remove var="k" />

										<!-- 테스트용 ( 날짜 계산 )  -->
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:parseDate var="enroll" value="${ i.SG_ENROLL_DATE }"
											pattern="yyyy-MM-dd" />
										<fmt:parseDate var="end" value="${ i.SG_END_DATE }"
											pattern="yyyy-MM-dd" />

										<fmt:parseNumber value="${ now.time / (1000*60*60*24) }"
											integerOnly="true" var="nowDays" />
										<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }"
											integerOnly="true" var="enrollDays" />
										<fmt:parseNumber value="${ end.time / (1000*60*60*24) }"
											integerOnly="true" var="endDays" />

										<p class="tag">
											<c:if test="${ ( nowDays - enrollDays ) <= 7 }">
												<span class="new">New</span>
											</c:if>
											<c:if test="${ i.b_Category eq 'A' }">
												<c:if test="${ (endDays - nowDays) >= 0 }">
													<span class="sale">D - ${ endDays - nowDays }</span>
												</c:if>
												<c:if test="${ (endDays - nowDays) < 0 }">
													<span class="sale">경매 종료</span>
												</c:if>
											</c:if>
										</p>

										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i
														class="icon-shopping-cart"></i></a></span>

												<c:url var="boardDetail" value="selectOne.ud">
													<c:param name="SG_ID" value="${ i.SG_ID }" />
												</c:url>
												<span><a href="selectOne.ud"><i class="icon-eye"></i></a></span>

												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<!-- <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span> -->
												<!-- 필요없을꺼같아서 대기중 (삭제대기중) -->
											</p>
										</div>

									</div>

									<div class="desc">
										<h3>
											<a href="product-detail.html">${ i.SG_BNAME }</a>
										</h3>
										<p class="price">
											<c:choose>
												<c:when test="${ i.b_Category eq 'A' }">
												급매가
										 	</c:when>
												<c:when test="${ i.b_Category eq 'SG' }">
										 		가격
										 	</c:when>
											</c:choose>
											<span> <br> <fmt:formatNumber
													value="${i.SG_PRICE }" type="currency" /></span>
										</p>

										<p class="price">
											<c:if test="${ i.b_Category eq 'A' }">
												경매시작가<span> <br>
													<fmt:formatNumber value="${i.SG_SPRICE }" type="currency" />
												</span>
											</c:if>
											<c:if test="${ i.b_Category eq 'SG' }">
												&nbsp;<span> <br> &nbsp; </span>
											</c:if> 
										</p>

									</div>

								</div>
							</div>
						</c:forEach>
					</c:if>

				</div>
			</div>
		</div>
		<!-- 신규 품목 종료-->

		<!-- 페이지 -->


	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>