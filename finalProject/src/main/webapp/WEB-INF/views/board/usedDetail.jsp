<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
<style>
/* Insert Css */
.form-field {
	width: 45%;
	float: left;
	margin: 0 0 0 30px;
}

.new {
	font-size: 11px;
	background: #FFC300;
	color: #fff;
	padding: .3em .5em;
	border-radius: 2px;
	margin-right: 5px;
}

.sbViewAtag {
	float: right;
	width: 40px;
	height: 50px;
	margin: -5px 5px 0 0;
	line-height: 1;
	font-size: 10px
}

.sbViewAtag_img {
	width: 100%;
	height: 30px;
	background: gray;
}

.row {
	line-height: normal;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="evPage"
		style="height: auto; width: 100%; background: #ffffff; text-align: center;">
		<div class="pg"
			style="width: 90%; display: inline-block; background: #f5f5f5;">
			<br>
			<div class="headLine" style="width: 50%; display: inline-block;">
				<h2>${board.SG_BNAME }</h2>
				<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}"
								style="width: 500px; height: auto;">
				<br><br>
				
				<p style="border-top: 1px solid gray;">${board.SG_ENROLL_DATE}</p>
			</div>
			<div style="height: 300px; width: 100%; background: #f5f5f5;">
				<div style="display: inline-block;">
					<%-- <div style="width: 230px; float: left; padding: none;">
						<div style="height: 30px;"></div>
						<div
							style="width: 200px; height: 200px; background: white; display: inline-block;">
							<img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}"
								style="width: 100%; height: 100%;">
						</div>
						<p>썸네일 이미지</p>
					</div> --%>
					<div class="col-md-7" style="float: left; width: 500px;">
						<div method="post" class="colorlib-form" style="padding: 0em;">

							<div class=" row">

								<br>
								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">가격</label>

										<fmt:formatNumber var="price" value="${board.SG_PRICE }"
											type="currency" />
										<div class="form-control" style="text-align: center;">
											<span style="font-size: 20px; color: #ff8400;">${price }</span>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div style="height: 70px;">
										<div style="float: left; width: 200px; height: 110px;">
											<label for="companyname">거래 방식</label>
											<div class="col-md-12">
												<div class="radio">
													<c:if test="${board.SG_DEAL eq '택배' }">
														<label><input type="radio" name="dealType"
															value="직거래" disabled>직거래</label>
														<label><input type="radio" name="dealType"
															value="택배" disabled checked>택배거래</label>
													</c:if>
													<c:if test="${board.SG_DEAL eq '직거래' }">
														<label><input type="radio" name="dealType"
															value="직거래" disabled checked>직거래</label>
														<label><input type="radio" name="dealType"
															value="택배" disabled>택배거래</label>
													</c:if>
												</div>
											</div>
											<div class="col-md-12">

												<c:if test="${board.SG_DEAL eq '직거래' }">
													<div class="radio" style="opacity: 0;">
												</c:if>
												<c:if test="${board.SG_DEAL eq '택배' }">
													<div class="radio" style="opacity: 1;">
												</c:if>
												<c:if test="${board.SG_DELIVERY eq 'N' }">
													<label><input type="radio" name="dealType2"
														value="N" disabled checked>배송비 별도</label>
													<label><input type="radio" name="dealType2"
														value="Y" disabled>무료배송</label>
												</c:if>
												<c:if test="${board.SG_DELIVERY eq 'Y' }">
													<label><input type="radio" name="dealType2"
														value="N" disabled>배송비 별도</label>
													<label><input type="radio" name="dealType2"
														value="Y" disabled checked>무료배송</label>
												</c:if>
											</div>
										</div>
									</div>
									<c:if test="${board.SG_DEAL eq '직거래' }">
										<div style="float: left;">
									</c:if>
									<c:if test="${board.SG_DEAL eq '택배' }">
										<div style="float: left; opacity: 0;">
									</c:if>
									<label for="companyname">거래 지역</label>
									<div class="form-control" style="width: 280px; height: 40px;">
										<a>${ board.SG_AREA}</a>
									</div>
								</div>
							</div>
							<br> <br>
							<div style="width: 200px; height: 50px; float: left;">
								<span class="new">#${board.TAG_NAME}</span>
								<!-- <span class="new">#New</span> -->
							</div>
							<div style="width: 200px; height: 50px; float: left;">
								<div class="sbViewAtag">
									<h3><i class="icon-eye"></i></h3>
									<a>${board.SG_COUNT}</a>
								</div>
								<div class="sbViewAtag">
									<h3><i class="icon-heart3"></i></h3>
									<a>1</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%; height: 60px; display: inline-block;">
		<button class="btn btn-primary">구매</button>
		<button class="btn btn-primary"
			onclick="location.href='updateForm.ud';">수정</button>
	</div>
	</div>
	<br>
	
	<div style="width: 90%; height: auto; display: inline-block;">
		${board.SG_INFO }</div>

	<script>
	$(document).ready(function () {
		console.log($('input[name="dealType"]'));
		if ($('input[name="dealType"]').val() == "택배") {
			$('#delivery').css("opacity",1);
		} else {			
			$('#delivery').css("opacity",0);
		}
	}
	</script>


	<br>
	<br>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>