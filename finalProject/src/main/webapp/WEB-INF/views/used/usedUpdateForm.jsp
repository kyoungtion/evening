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
					<h2>상품 수정</h2>
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
									<div style="">
											<label for="companyname">거래 지역</label>
											<input type="text" id="towncity" class="form-control"
											placeholder="Town or City" style="width: 280px;">
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div style="display: inline-block;width: 90%;">
				<c:import url="/WEB-INF/views/common/toolbar.jsp"/>


				<div id="text" contenteditable="true"
					style="width:100%; min-height:400px;border: 1px solid whitesmoke; ">
					텍스트 편집기</div>
				<br>
				<button class="btn btn-primary" style="float: right;"> 저장 완료 </button>
			</div>
		</form>
		
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>