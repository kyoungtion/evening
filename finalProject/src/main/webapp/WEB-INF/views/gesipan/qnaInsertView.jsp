<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#insertField {background: white;}
	.contact-wrap h3 {
		font-family:'Noto Sans KR', sans-serif !important;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
		<div class="contact-wrap" style="height: 900px;">
			<form style="height: 100%;">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="contact-wrap">
								<h3>문의글 작성</h3>

								<div class="row form-group">
									<div class="col-md-6 padding-bottom">
										<label for="fname">글제목</label> <input type="text" id="fname"
											class="form-control" value="문의합니다.">
									</div>
									<div class="col-md-6 padding-bottom">
										<label for="fname">작성자</label> <input type="text" id="fname"
											class="form-control" value="작성자아이디">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-md-12">
										<label for="message">문의 내용</label>
										<c:import url="/WEB-INF/views/common/toolbar.jsp" />
										<div id="insertField" contenteditable="true"
											style="width: 100%; min-height: 400px; border: 1px solid whitesmoke;">
										</div>

									</div>
								</div>
								<div class="form-group text-center">
									<input type="submit" value="문의글 작성하기"
										class="btn btn-primary">
								</div>

							</div>
						</div>
					</div>
				</div>
			</form>
			<form id="imgAjax" method="post" enctype="multipart/form-data">
				<ul id="ImgInputs" style="display: none;">
					<li><input type='file' name='trImgFile' id='trImgFile'
						accept="image/*" onchange="TintsetImg(this);" /></li>
				</ul>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>