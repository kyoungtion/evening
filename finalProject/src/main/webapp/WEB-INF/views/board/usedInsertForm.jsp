<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="evPage" style="height:auto;width: 100%;background: #ffffff;  text-align: center; ">
		<form>
			<div style="width: 90%; height: auto; background: #f5f5f5;display: inline-block;
		 ">
				<br>
				<div style="height: auto;width: 150px;">
					<h2>상품 등록</h2>
				</div>

				<div style="width: 90%;height: auto;display: inline-block;">
					<div style="width: 230px; float: left; padding: none;">
						<div style="height: 30px;"></div>
						<div style="width: 200px;height: 200px;background: white;display: inline-block;"></div>
						<p>썸네일 이미지</p>
					</div>
					<div class="col-md-7" style="float: left;width: 500px;">
						<div method="post" class="colorlib-form" style="padding: 0em;">

							<div class=" row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="fname">제 목</label>
										<input type="text" id="companyname" class="form-control"
											placeholder="Company Name">
									</div>
								</div>
								<div class="col-md-12">
									<label for="country">카테고리</label>
									<div class="form-group">
										<div class="form-field">
											<i class="icon icon-arrow-down3"></i>
											<select name="people" id="people" class="form-control">
												<option value="#">Select country</option>
												<option value="#">Alaska</option>
												<option value="#">China</option>
												<option value="#">Japan</option>
												<option value="#">Korea</option>
												<option value="#">Philippines</option>
											</select>

										</div>
										<div style="width: 30px;height: 1px;float: left;"></div>
										<div class="form-field">
											<i class="icon icon-arrow-down3"></i>
											<select name="people" id="people" class="form-control">
												<option value="#">Select country</option>
												<option value="#">Alaska</option>
												<option value="#">China</option>
												<option value="#">Japan</option>
												<option value="#">Korea</option>
												<option value="#">Philippines</option>
											</select>

										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label for="companyname">가격</label>
										<input type="text" id="towncity" class="form-control"
											placeholder="Town or City">
									</div>
								</div>

								<div class="form-group">
									<div style="float: left; width: 200px;">
										<label for="companyname">거래 방식</label>
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="dealType" value="1" checked>직거래</label>
												<label><input type="radio" name="dealType" value="2">택배거래</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="dealType2" disabled checked>배송비
													포함</label>
												<label><input type="radio" name="dealType2" disabled>무료배송</label>
											</div>
										</div>
									</div>
									<div>
										<label for="companyname">거래 지역</label>
										<input type="text" id="towncity" class="form-control" placeholder="Town or City"
											style="width: 280px;">
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div style="display: inline-block;width: 90%;">
			<c:import url="/WEB-INF/views/common/toolbar.jsp"/>
				<%-- <div style="height: 30px; background: lemonchiffon;">

					<ul class="Ttoolbal" style="height: 100%;">
						<li><button type="button" id="bold" class="fontM" value="bold" title="굵기"
								style="font-weight: bold;"><i>B</i></button>
						</li>


						<li><button type="button" id="italic" class="fontM" value="italic" title="기울기">
								<i style="font-style: italic; font-weight: bold;">I</i></button></li>

						<li><button type="button" id="underLine" class="fontM" value="underLine" title="밑줄">
								<i style="text-decoration-line: underline; font-weight: bold;">U</i></button></li>
						<li><button type="button" id="strikeThrough" class="fontM" value="strikeThrough" title="가로선 삽입">
								<i style="text-decoration: line-through;">S</i></button></li>
						<li class="inFontTag">
							<button type="button" class="btn-1 fs_btn" title="글꼴"> <i class="btn-1"
									style="font-weight: bold;">A</i>
								<div class="btn-1" style="float: right; width: auto;"><span class="clickspan"></span>
								</div>
							</button>
							<div class="btn-1 font-style-bar">
								<ul class="btn-1 uls" style="padding-left: 10px;">


									<li><button type="button" class="fontM2" id="fontName" value="돋움">
											<a style="font-family: 돋움;" title="돋움">돋움</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName" value="굴림">
											<a style="font-family: 굴림;" title="굴림">굴림</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName" value="궁서">
											<a style="font-family: 궁서;" title="궁서">궁서</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName" value="바탕">
											<a style="font-family: 바탕;" title="바탕">바탕</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName" value="맑은 고딕">
											<a style="font-family: 맑은 고딕;" title="맑은 고딕">맑은 고딕</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName"
											value="Arial,Helvetica,sans-serif">
											<a style="font-family: Arial,Helvetica,sans-serif;" title="Arial">
												Arial</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName"
											value="Arial Black,Arial Bold,Gadget,Helvetica,sans-serif">
											<a style="font-family: Arial Black,Arial Bold,Gadget,Helvetica,sans-serif;"
												title="Arial Black">Arial Black</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName" value="Georgia,serif">
											<a style="font-family: Georgia,serif;" title="Georgia">Georgia</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName"
											value="Tahoma,Geneva,sans-serif">
											<a style="font-family: Tahoma,Geneva,sans-serif;" title="Tahoma">Tahoma</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName"
											value="'Times New Roman',Times,serif">
											<a style="font-family: 'Times New Roman',Times,serif;"
												title="Times New Roman">Times New
												Roman</a>
										</button></li>

									<li><button type="button" class="fontM2" id="fontName"
											value="Verdana,Geneva,sans-serif">
											<a style="font-family: Verdana,Geneva,sans-serif;"
												title="Verdana">Verdana</a>
										</button></li>
								</ul>
							</div>

						</li>
						<li class="inSizeTag"><button type="button" class="fsz_btn" title="글자 크기"> <i
									style="font-weight: bold;">T</i>
								<div style="float: right; width: auto;"><span class="clickspan"></span></div>
							</button>
							<div class="font-size-bar">
								<ul class="uls" style="text-align: center;">
									<li><button type="button" id="fontSize" class="fontM2" value="8">
											<a title="8">8</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="9">
											<a title="9">9</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="10">
											<a title="10">10</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="11">
											<a title="11">11</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="12">
											<a title="12">12</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="14">
											<a title="14">14</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="16">
											<a title="16">16</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="18">
											<a title="18">18</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="20">
											<a title="20">20</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="22">
											<a title="22">22</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="24">
											<a title="24">24</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="26">
											<a title="26">26</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="30">
											<a title="30">30</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="36">
											<a title="36">36</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="48">
											<a title="48">48</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="60">
											<a title="60">60</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="72">
											<a title="72">72</a>
										</button></li>
									<li><button type="button" id="fontSize" class="fontM2" value="96">
											<a title="96">96</a>
										</button></li>
								</ul>
							</div>

						</li>
						<li>
							<div style="height: 100%;width: 1px; background: #666;"></div>
						</li>

						<li><button type="button" id="removeFormat" class="fontM" title="서식 제거" value="removeFormat">
								<img src="resources/img/11.PNG" style="width: 20px;"></button></li>

						<li class="font-C "><button type="button" id="fontColor" class="ftC" title="글자 색" value="black">
								<img class="tcimg" src="img/33.PNG" style="width: 20px;"></button>
							<div class="fontC">
								<div id="rgbPicker" class="rgbClick"
									style="position: absolute; margin: 0; display: block;"></div>
								<div class="rgbClick" style="position: absolute; margin-top: 258px; height: 30px;">
									<div class="selectC"
										style=" width: 100px; height: 30px; background: black; float: left;"></div>
									<button type="button" class="ftc-btn" style="height: 100%; width: 50px;">변경</button>
								</div>
							</div>
							<div id="rgbValue" style="float: left; display: none;"></div>
						</li>



						<li class="textSort"><button type="button" class="ts_btn" title="정렬"> <img class="ts_img"
									src="img/center.PNG" style="width: 20px;">

							</button>
							<div class="text-sort-bar">
								<ul class="uls" style="text-align: center;">
									<li><button type="button" id="justifyCenter" class="fontM" value="justifyCenter"
											title="가운데 정렬">
											<img src="img/center.PNG" style="width: 20px;">
										</button></li>
									<li><button type="button" id="justifyLeft" class="fontM" value="justifyLeft"
											title="왼쪽 정렬">
											<img src="img/left.PNG" style="width: 20px;">
										</button></li>
									<li><button type="button" id="justifyRight" class="fontM" value="justifyRight"
											title="오른쪽 정렬">
											<img src="img/right.PNG" style="width: 20px;">
										</button></li>

								</ul>
							</div>

						</li>

						<li class="intSort"><button type="button" class="is_btn" title="숫자 리스트"> <img class="is_img"
									src="img/intSort.PNG" style="width: 20px;">

							</button>


							<div class="int-sort-bar">
								<ul class="uls" style="text-align: left; padding-left: 10px;">

									<li><button type="button" id="insertorderedList" class="fontM3" value="default">
											<a style="font-family: Verdana,Geneva,sans-serif;" title="기본">기본</a>
										</button></li>
									<li><button type="button" id="insertorderedList" class="fontM3" value="lower-alpha">
											<a style="font-family: Verdana,Geneva,sans-serif;" title="소문자 알파벳">소문자
												알파벳</a>
										</button></li>
									<li><button type="button" id="insertorderedList" class="fontM3" value="lower-greek">
											<a style="font-family: Verdana,Geneva,sans-serif;" title="소문자 그리스어">소문자
												그리스어</a>
										</button></li>
									<li><button type="button" id="insertorderedList" class="fontM3" value="lower-roman">
											<a style="font-family: Verdana,Geneva,sans-serif;" title="소문자 로마자">소문자
												로마자</a>
										</button></li>
									<li><button type="button" id="insertorderedList" class="fontM3" value="upper-alpha">
											<a style="font-family: Verdana,Geneva,sans-serif;" title="대문자 알파벳">대문자
												알파벳</a>
										</button></li>
									<li><button type="button" id="insertorderedList" class="fontM3" value="upper-roman">
											<a style="font-family: Verdana,Geneva,sans-serif;" title="대문자 로마자">대문자
												로마자</a>
										</button></li>
								</ul>
							</div>

						</li>
						<li><button type="button" id="insertUnorderedList" class="fontM2" value="insertUnorderedList"
								title="점 리스트">
								<img src="img/dotList.PNG" style="width: 15px;"></button></li>

						<li><button type="button" id="insertHTML" class="fontM2" value="<hr>" title="가로선 삽입">
								<img src="img/hr.PNG" style="width: 15px;"></button></li>
						<li>
							<div style="height: 100%;width: 1px; background: #666;"></div>
						</li>
						<li><button type="button" id="iimg" class="insertImg" value="insertImage" title="이미지 삽입">
								<img src="img/img.PNG" style="width: 20px;"></button></li>

						<li class="inVideo"><button type="button" id="ivideo" class="insertVideo" value="insertHTML"
								title="동영상 삽입">
								<img src="img/video.PNG" style="width: 20px;"></button>
							<div class="int-video-bar">

								<input type="text" style="width: 100%; height: 30px;">
								<button type="button" id="insertorderedList" class="fontM3" value="default"
									style="float: right;">
									<a style="font-family: Verdana,Geneva,sans-serif;" title="기본">기본</a>
								</button>
							</div>
						</li>
						<!-- <iframe width="640" height="360" src="https://www.youtube.com/embed/UM8_pjQa9pw?&amp;wmode=opaque" ></iframe> -->

					</ul>

				</div> --%>


				<div id="insertField" contenteditable="true"
					style="width:100%; min-height:400px;border: 1px solid whitesmoke; ">
					<div>텍스트 편집기</div>
				</div>
				<br>
				<button type="button" class="btn btn-primary" style="float: right;"> 글쓰기 </button>
			</div>
		</form>
		<form id="imgAjax"  method="post" enctype="multipart/form-data">
			<ul id="ImgInputs" style="display: none;">
				<li><input type='file' name='trImgFile' id='trImgFile' accept="image/*" onchange="TintsetImg(this);" />
				</li>
			</ul>
		</form>
	
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>