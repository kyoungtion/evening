<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
<link rel="stylesheet" href="resources/css/bInsert.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="evPage" style="height:auto;width: 100%;background: #ffffff;  text-align: center; ">
		<form id="insertForm" action="uInsert.bo?aDay=0&type=1" method="post" enctype="multipart/form-data">
			<div style="width: 90%; height: auto; background: #f5f5f5;display: inline-block;
		 ">
				<br>
				<input type="hidden" name="b_Category" value="SG">
				<input type="hidden" name="USER_ID" value="${ loginUser.user_id }">
				<input type="hidden" name="SG_NAME" value="${ loginUser.nickName }">
				<div style="height: auto;width: 150px;">
					<h2>상품 등록</h2>
				</div>

					<div style=" padding: none; display: inline-block;">
						<div style="height: 30px;"></div>
						<div onclick="shumnailImg();" style="width: 400px;height: 400px;background: white;display: inline-block; cursor: pointer;">
						<img id="smImgTag" style="width: 100%; height: 100%;"></div>
						<div style="display:none;">
						<input type='file' name='smImg' style="display:none;" id='smImg' accept="image/*" onchange="shumnailImgChange(this);" />
						<input type="text" name="imgNames" id="imgNames">
						<input type="text" name="deletImg" id="deletImg">
						</div>
						<p>썸네일 이미지</p>
					</div>
				<div style="width: 90%;height: auto;display: inline-block;">
					<div class="col-md-7" style="width: 600px; float: none; display: inline-block;">
						<div method="post" class="colorlib-form" style="padding: 0em;">

							<div class=" row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="fname">제 목</label>
										<input type="text" name="SG_BNAME" id="companyname" class="form-control"
											placeholder="제목">
									</div>
								</div>
								<div class="col-md-12" style="width: 50%;">
									<label for="country">카테고리</label>
									<div class="form-group">
										<div class="form-field" style="width: 100%;">
											<i class="icon icon-arrow-down3"></i>
											<select name="TAG_NAME" id="category" class="form-control" onchange="stChange();">
												<option value="전체">전체</option>
												<c:forEach var='ctgy' items="${ category }">
													<option value="${ ctgy }">${ ctgy }</option>
												</c:forEach>
											</select>

										</div>
										
									</div>
								</div>
								<div style="float: left; width: 200px; height: 110px;">
										<label for="companyname">거래 방식</label>
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="SG_DEAL" value="DELIVERY" checked>택배거래</label>
												<label><input type="radio" name="SG_DEAL" value="DIRECT" >직거래</label>
											</div>
										</div>
										<div class="col-md-12">
											<div id="radios" class="radio">
												<label><input type="radio" name="SG_DELIVERY" value="N"  checked>배송비
													별도</label>
												<label><input type="radio" name="SG_DELIVERY" value="Y" >무료배송</label>
											</div>
										</div>
									</div>

								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">가격</label>
										<input type="number" name="SG_PRICE" id="towncity" class="form-control"
											placeholder="0원">
									</div>
								</div>

								<div class="form-group" style="height: 50px; width: 280px;">
									<!-- <div style="float: left; width: 200px;">
										<label for="companyname">거래 방식</label>
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="SG_DEAL" value="직거래" checked>직거래</label>
												<label><input type="radio" name="SG_DEAL" value="택배">택배거래</label>
											</div>
										</div>
										<div class="col-md-12">
											<div id="radios" class="radio">
												<label><input type="radio" name="SG_DELIVERY" value="N" disabled checked>배송비
													포함</label>
												<label><input type="radio" name="SG_DELIVERY" value="Y" disabled>무료배송</label>
											</div>
										</div>
									</div> -->
									<div id="radios2" style="display: none;" >
										<label for="companyname">거래 지역</label>
										<input type="text" id="towncity" name="SG_AREA" class="form-control" placeholder="Town or City"
											style=" margin-left: 15px;" value="지역무관">
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div style="display: inline-block;width: 90%;">
			<c:import url="/WEB-INF/views/common/toolbar.jsp"/>
				<div id="insertField" contenteditable="true"
					style="width:100%; min-height:400px;border: 1px solid whitesmoke; ">
				</div>
				<br>
				<input type="text" name="SG_INFO" id="textForm" style="display:none;">
				<button type="button" class="btn btn-primary" onclick="saveBtn();" style="float: right;"> 글쓰기 </button>
			</div>
		</form>
		<form id="imgAjax"  method="post" enctype="multipart/form-data">
			<ul id="ImgInputs" style="display: none;">
				<li><input type='file' name='trImgFile' id='trImgFile' accept="image/*" onchange="TintsetImg(this);" />
				</li>
			</ul>
		</form>  
		
	<script src="resources/js/bInsert.js"></script>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>