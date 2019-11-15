<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		    margin: 0;
		}


	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="evPage" style="height:auto;width: 100%;background: #ffffff;  text-align: center; ">
		<form id="insertForm" action="uInsert.ud" method="post" enctype="multipart/form-data">
			<div style="width: 90%; height: auto; background: #f5f5f5;display: inline-block;
		 ">
				<br>
				<div style="height: auto;width: 150px;">
					<h2>상품 등록</h2>
				</div>

				<div style="width: 90%;height: auto;display: inline-block;">
					<div style="width: 230px; float: left; padding: none;">
						<div style="height: 30px;"></div>
						<div onclick="shumnailImg();" style="width: 200px;height: 200px;background: white;display: inline-block; cursor: pointer;">
						<img id="smImgTag" style="width: 100%; height: 100%;"></div>
						<div style="display:none;">
						<input type='file' name='smImg' style="display:none;" id='smImg' accept="image/*" onchange="shumnailImgChange(this);" />
						<input type="text" name="imgNames" id="imgNames">
						<input type="text" name="deletImg" id="deletImg">
						</div>
						<p>썸네일 이미지</p>
					</div>
					<div class="col-md-7" style="float: left;width: 500px;">
						<div method="post" class="colorlib-form" style="padding: 0em;">

							<div class=" row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="fname">제 목</label>
										<input type="text" name="SG_BNAME" id="companyname" class="form-control"
											placeholder="제목">
									</div>
								</div>
								<div class="col-md-12">
									<label for="country">카테고리</label>
									<div class="form-group">
										<div class="form-field">
											<i class="icon icon-arrow-down3"></i>
											<select name="people" id="category" class="form-control" onchange="stChange();">
												<option value="전체">전체</option>
												<c:forEach var='ctgy' items="${ category }">
													<option value="${ ctgy }">${ ctgy }</option>
														
												</c:forEach>
											</select>

										</div>
										<div style="width: 30px;height: 1px;float: left;"></div>
									
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">경매 시작가</label>
										<input type="number" name="SG_SPRICE" id="towncity" class="form-control"
											placeholder="0원">
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
		
	<script>
	var all= ["전체"];
	var ps= ["가","나","다","라","마"];
	var bt= ["바","사","아","자","차"];
	var it= ["카","타"];
	var jj= ["파","하"];
	var sp= ["A","B"];
	var df= ["c"];
	
	function stChange(){
		var rselect = document.getElementById('category').value;
		var rsItem;
		switch(rselect){
		
		case "전체":rsItem=all; break;
		case "패션":rsItem=ps; break;
		case "뷰티":rsItem=bt;break;
		case "인테리어":rsItem=it; break;
		case "전자제품":rsItem=jj; break;
		case "스포츠":rsItem=sp; break;
		
		default :rsItem=Sejong; break;
		}
		$('#people').empty();
		$('#people').append('<option value="전체">전체</option>');
		for(var i=0;i<rsItem.length;i++){
			var option = $("<option>"+rsItem[i]+"</option>");
			$('#people').append(option);
		} 
	}
	
	function shumnailImgChange(value) {
		if (value.files && value.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {

				$('#smImgTag').attr('src', e.target.result);

			}
			reader.readAsDataURL(value.files[0]);

		}
	};
	$('input[name="SG_DEAL"]').change(function () {
		if ($(this).val() == "택배") {
			$('input[name="SG_DELIVERY"]').removeAttr("disabled");
			$('#radios2').fadeOut(300);
			$('#radios').fadeIn(300);
		} else {
			$('#radios').fadeOut(300);
			$('#radios2').fadeIn(300);
			$('input[name="SG_DELIVERY"]').attr("disabled", "true");
		}
	});
	function saveBtn() {
		var deletImgArr = new Array();
		var imgArray = $('#insertField img');
		$('#textForm').val(document.getElementById('insertField').innerHTML);			
		
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
	
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>