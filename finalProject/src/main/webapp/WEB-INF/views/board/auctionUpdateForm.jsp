<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

/*  */
* {
	/* list-style: none; */
	/* font-family: Georgia, 'Times New Roman', Times, serif; */
	
}

#t1 {
	height: 30px;
	width: 800px;
	background: whitesmoke;
	position: relative;
}

.Ttoolbal li {
	float: left;
	height: 100%;
}

.Ttoolbal {
	display: inline-block;
}

.Ttoolbal>li>button {
	min-width: 30px;
	height: 100%;
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

.Ttoolbal>li>button:hover {
	background-color: #383838;
}

.Ttoolbal>li {
	margin-right: 5px;
}

/* i{
        font-weight: bold;
    } */
.inFontTag.on .font-style-bar {
	height: 200px;
}

.font-style-bar {
	width: 150px;
	height: 0px;
	background: blanchedalmond;
	position: absolute;
	overflow-y: scroll;
}

.clickspan {
	width: 0;
	height: 0;
	border-left: 4px solid transparent;
	border-right: 4px solid transparent;
	border-top: 4px solid #999;
	right: 4px;
	top: 16.5px;
}

.on .font-size-bar {
	height: 200px;
}

.font-size-bar {
	width: 80px;
	height: 0px;
	background: #999;
	position: absolute;
	overflow-y: scroll;
}

.on .text-sort-bar {
	height: 90px;
}

.text-sort-bar {
	width: 40px;
	height: 0px;
	background: #999;
	position: absolute;
	overflow: hidden;
}

.on .int-sort-bar {
	height: 180px;
}

.int-sort-bar {
	width: 150px;
	height: 0px;
	background: #999;
	position: absolute;
	overflow: hidden;
}

.on .int-video-bar {
	height: 60px;
}

.int-video-bar {
	width: 300px;
	height: 0px;
	background: #999;
	position: absolute;
	overflow: hidden;
	margin-left: -120px;
}

.uls {
	padding: 0;
	height: auto;
}

.uls li {
	width: 100%;
	height: 30px;
}

.uls>* {
	display: inline-block;
}

.fontC {
	display: none;
}

.font-C.on .fontC {
	display: block;
}

#insertField {
	text-align: initial;
}

#insertField ul {
	list-style: initial;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="evPage"
		style="height: auto; width: 100%; background: #ffffff; text-align: center;">
		<form id="insertForm" action="boardUpdate.bo?type=2" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="SG_ID" value="${ board.SG_ID }">
			<div
				style="width: 90%; height: auto; background: #f5f5f5; display: inline-block;">
				<br>
				<div style="height: auto; width: 150px;">
					<h2>상품 수정</h2>
				</div>

				<div style="padding: none; display: inline-block;">
					<div style="height: 30px;"></div>
					<div onclick="shumnailImg();"
						style="width: 400px; height: 400px; background: white; display: inline-block; cursor: pointer;">
						<img id="smImgTag" style="width: 100%; height: 100%;"
							src="/evening/resources/thumbnail/${at.RENAMEFILENAME}">
					</div>
					<div style="display: none;">
						<input type='file' name='smImg' style="display: none;" id='smImg'
							accept="image/*" onchange="shumnailImgChange(this);" /> <input
							type="text" name="imgNames" id="imgNames"> <input
							type="text" name="deletImg" id="deletImg">
					</div>
					<p>썸네일 이미지</p>
				</div>
				<div style="width: 90%; height: auto; display: inline-block;">
					<div class="col-md-7"
						style="width: 600px; float: none; display: inline-block;">
						<div class="colorlib-form" style="padding: 0em;">

							<div class=" row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="fname">제 목</label> <input type="text"
											name="SG_BNAME" id="companyname" class="form-control"
											placeholder="제목" value="${ board.SG_BNAME }">
									</div>
								</div>
								<div class="col-md-12" style="width: 50%;">
									<label for="country">카테고리</label>
									<div class="form-group">
										<div class="form-field" style="width: 100%;">
											<i class="icon icon-arrow-down3"></i> <select name="TAG_NAME"
												id="category" class="form-control" onchange="stChange();">
												<option value="전체">전체</option>
												<c:forEach var='ctgy' items="${ category }">
													<c:if test="${ ctgy ==board.TAG_NAME}">
														<option value="${ ctgy }" selected="selected">${ ctgy }</option>
													</c:if>
													<c:if test="${ ctgy !=board.TAG_NAME}">
														<option value="${ ctgy }">${ ctgy }</option>
													</c:if>
												</c:forEach>
											</select>

										</div>

									</div>
								</div>
								<div style="float: left; width: 200px; height: 110px;">
									<label for="companyname">거래 방식</label>
									<div class="col-md-12">
										<div class="radio">
											<c:if test="${board.SG_DEAL eq 'DELIVERY' }">
												<label><input type="radio" name="SG_DEAL"
													value="DELIVERY" checked>택배거래</label>
												<label><input type="radio" name="SG_DEAL"
													value="DIRECT">직거래</label>
											</c:if>
											<c:if test="${board.SG_DEAL eq 'DIRECT' }">
												<label><input type="radio" name="SG_DEAL"
													value="DELIVERY">택배거래</label>
												<label><input type="radio" name="SG_DEAL"
													value="DIRECT" checked>직거래</label>
											</c:if>
										</div>
									</div>
									<div class="col-md-12">
										<c:if test="${board.SG_DEAL eq 'DIRECT' }">
											<div id="radios" style="opacity: 0">
												<label><input type="radio" name="SG_DELIVERY"
													value="N">배송비 별도</label> <label><input type="radio"
													name="SG_DELIVERY" value="Y" checked>무료배송</label>
											</div>
										</c:if>

										<c:if test="${board.SG_DEAL eq 'DELIVERY'}">
											<div id="radios" style="opacity: 1">
												<c:if test="${board.SG_DELIVERY eq 'Y' }">
													<label><input type="radio" name="SG_DELIVERY"
														value="N">배송비 별도</label>
													<label><input type="radio" name="SG_DELIVERY"
														value="Y" checked>무료배송</label>
												</c:if>
												<c:if test="${board.SG_DELIVERY eq 'N' }">
													<label><input type="radio" name="SG_DELIVERY"
														value="N" checked>배송비 별도</label>
													<label><input type="radio" name="SG_DELIVERY"
														value="Y">무료배송</label>
												</c:if>
											</div>
										</c:if>

									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">경매 시작가</label>
										 <input type="number" readonly="readonly" name="SG_SPRICE" id="towncity" class="form-control" placeholder="0원" value="${board.SG_SPRICE }">
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
									<c:if test="${board.SG_DEAL eq 'DIRECT' }">
										<div id="radios2" style="opacity: 1;">
											<label for="companyname">거래 지역</label> <input type="text"
												id="towncity" name="SG_AREA" class="form-control"
												placeholder="Town or City" style="margin-left: 15px;"
												value="${board.SG_AREA }">
										</div>
									</c:if>
									<c:if test="${board.SG_DEAL eq 'DELIVERY' }">
										<div id="radios2" style="opacity: 0;">
											<label for="companyname">거래 지역</label> <input type="text"
												id="towncity" name="SG_AREA" class="form-control"
												placeholder="Town or City" style="margin-left: 15px;"
												value="${board.SG_AREA }">
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>


				</div>

			</div>
			<div style="display: inline-block; width: 90%;">
				<c:import url="/WEB-INF/views/common/toolbar.jsp" />
				<div id="insertField" contenteditable="true"
					style="width: 100%; min-height: 400px; border: 1px solid whitesmoke;">${board.SG_INFO }
					</div>
				<br> <input type="text" name="SG_INFO" id="textForm"
					style="display: none;">
				<button type="button" class="btn btn-primary" onclick="saveBtn();"
					style="float: right;">수정 완료</button>
			</div>
		</form>
		<form id="imgAjax" method="post" enctype="multipart/form-data">
			<ul id="ImgInputs" style="display: none;">
				<li><input type='file' name='trImgFile' id='trImgFile'
					accept="image/*" onchange="TintsetImg(this);" /></li>
			</ul>
		</form>

		<script>
			function shumnailImgChange(value) {
				if (value.files && value.files[0]) {

					var reader = new FileReader();

					reader.onload = function(e) {

						$('#smImgTag').attr('src', e.target.result);

					}
					reader.readAsDataURL(value.files[0]);

				}
			};
			$('input[name="SG_DEAL"]').change(function() {
				if ($(this).val() == "DELIVERY") {
					$('input[name="SG_DELIVERY"]').removeAttr("disabled");
					$('#radios2').css("opacity", 0);
					$('#radios').css("opacity", 1);
				} else {
					$('#radios2').css("opacity", 1);
					$('#radios').css("opacity", 0);
					$('input[name="SG_DELIVERY"]').attr("disabled", "true");
				}
			});
			function saveBtn() {
				var deletImgArr = new Array();
				var imgArray = $('#insertField img');
				$('#textForm').val(
						document.getElementById('insertField').innerHTML);

				for (var i = 0; i < imgArray.length; i++) {
					deletImgArr[i] = imgArray.eq(i).attr('name');
				}
				$('#imgNames').val(imgNamesArr);
				$('#deletImg').val(deletImgArr);
				$('#insertForm').submit();
			};

			function shumnailImg() {
				$('#smImg').click();
			};
		</script>

		<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>