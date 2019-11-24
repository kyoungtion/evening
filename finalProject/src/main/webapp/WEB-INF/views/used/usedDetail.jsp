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
			width: 30px;
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
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	
	<div class="evPage" style="height:auto;width: 100%;background: #ffffff;  text-align: center; ">
		<div class="pg" style="width: 90%; display: inline-block; background: #f5f5f5;;">
			<br>
			<div class="headLine" style="width:50%; display: inline-block;">
				<h2>${board.SG_BNAME }</h2>
				<p style="border-top: 1px solid gray;">2019-10-27</p>
			</div>
			<div style="height: 300px;width: 100%; background: #f5f5f5;">

				<div style="width: 230px; float: left; padding: none;">
					<div style="height: 30px;"></div>
					<div style="width: 200px;height: 200px;background: white;display: inline-block;"></div>
					<p>썸네일 이미지</p>
				</div>
				<div class="col-md-7" style="float: left;width: 500px;">
					<div method="post" class="colorlib-form" style="padding: 0em;">

						<div class=" row">

							<br>
							<div class="col-md-12">
								<div class="form-group">
									<label for="companyname">가격</label>
									<input type="text" id="towncity" class="form-control" placeholder="Town or City">
								</div>
							</div>

							<div class="form-group">
								<div style="float: left; width: 200px;">
									<label for="companyname">거래 방식</label>
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="dealType" value="1" disabled
													checked>직거래</label>
											<label><input type="radio" name="dealType" value="2" disabled>택배거래</label>
										</div>
									</div>
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="dealType2" disabled>배송비
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
								<br><br>
								<div style="width: 200px; height: 50px; float: left;">
									<span class="new">#New</span><span class="new">#New</span>
								</div>
								<div style="width: 200px; height: 50px; float: left;">
									<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
									<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div style="    width: 100%;
			height: 60px;
			display: inline-block;">
				<button class="btn btn-primary" onclick="location.href='shipInfo.py';">구매 </button>
				<button class="btn btn-primary" onclick="location.href='updateForm.ud';" >수정 </button>
			</div>
		</div>
		<div style="width: 90%; height: 500px; background: lemonchiffon;display: inline-block; ">
			<p>gte</p>
		</div>
		
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>