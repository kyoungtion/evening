<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
	<style >
		.sbItem_div {
			width: 200px;
			height: 290px;
			margin: 30px 25px 30px 25px;
			float: left;
		}

		.favorites_c {
			/* 관심 상품 */
			width: 30px;
			height: 30px;
			background: white;
			position: absolute;
			float: right;
			margin: -30px 0 0 170px;
			opacity: .7;
		}

		.favorites_c:hover {
			background: #D98396;
		}

		.sbList_c {
			width: 200px;
			height: 290px;
			background: #fafafa;
			;
		}

		.sbList_c:hover {
			opacity: .5;
		}

		.sbListImg {
			width: 190px;
			height: 140px;
			background: red;
			margin: 5px 0 0 5px;
		}

		.sbListText {
			width: 190px;
			height: 135px;
			background: #fafafa;
			margin: 5px 0 0 5px;
			text-align: center;
		}

		.sbListBorder {
			border-bottom: 1px solid gray;
		}

		.sbItemText_div {
			width: 100%;
			height: 20px;
			margin-top: 5px;
		}

		.user_tier {
			float: left;
			width: 35px;
			height: 35px;
			background: #D98396;
			margin-left: 5px;
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

		.searchBar {
			width: auto;
			height: 30px;
			display: table-cell;
			vertical-align: middle;
		}



		#searchText {
			height: 30px;
		}

		#paging_ul li {
			float: left;
		}

		.listPaging {
			display: inline-block;
		}
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	
	<div style="width: 100%; height: 80px; display: table; border-bottom: .5px solid gray;">
		<div class="searchBar">
			<div style=" display: table-cell;
			vertical-align: middle; float: left; margin: 10px 0 0 50px;">
				<select>
					<option>셀렉트옵션</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
				<select>
					<option>셀렉트옵션2</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>

				<button style="height: 25px;">검색</button>
			</div>
			<button class="btn btn-primary btn-outline" style="float: 
			right;margin: 0px 50px 0 0px;"
			onclick="location.href='insertForm.ud';">글쓰기</button>
		</div>

	</div>
	<div class="evPage" style="height:auto;width: 100%;background: #ffffff; ">
		<br>
		<div style="height: 700px; ">
			<div class="sbItem_div">
				<div id="favorites" class="favorites_c"></div>
				<div id="sbList" class="sbList_c">
					<div style="height: 1px;"></div>
					<div class="sbListImg">
					</div>
					<div class="sbListText">
						<div class="sbListBorder"><a>이거팝니다.</a></div>
						<div class="sbListBorder">
							<a>300,000원</a> </div>
						<div class="sbItemText_div">
							<a style="font-size: 10px; float: left;">카테고리>카테고리</a>
							<a style="font-size: 10px; float: right;">2019-10-24<br>No.111</a>
						</div>
						<div class="sbItemText_div">
							<a style="float: left; font-size: 12px;">작성자</a>
						</div>
						<img class="user_tier"></img>
						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>


						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
					</div>

				</div>

			</div>
			<!--  -->
			<div class="sbItem_div">
				<div id="favorites" class="favorites_c"></div>
				<div id="sbList" class="sbList_c">
					<div style="height: 1px;"></div>
					<div class="sbListImg">
					</div>
					<div class="sbListText">
						<div class="sbListBorder"><a>이거팝니다.</a></div>
						<div class="sbListBorder">
							<a>300,000원</a> </div>
						<div class="sbItemText_div">
							<a style="font-size: 10px; float: left;">카테고리>카테고리</a>
							<a style="font-size: 10px; float: right;">2019-10-24<br>No.111</a>
						</div>
						<div class="sbItemText_div">
							<a style="float: left; font-size: 12px;">작성자</a>
						</div>
						<img class="user_tier"></img>
						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>


						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
					</div>

				</div>

			</div>
			<div class="sbItem_div">
				<div id="favorites" class="favorites_c"></div>
				<div id="sbList" class="sbList_c">
					<div style="height: 1px;"></div>
					<div class="sbListImg">
					</div>
					<div class="sbListText">
						<div class="sbListBorder"><a>이거팝니다.</a></div>
						<div class="sbListBorder">
							<a>300,000원</a> </div>
						<div class="sbItemText_div">
							<a style="font-size: 10px; float: left;">카테고리>카테고리</a>
							<a style="font-size: 10px; float: right;">2019-10-24<br>No.111</a>
						</div>
						<div class="sbItemText_div">
							<a style="float: left; font-size: 12px;">작성자</a>
						</div>
						<img class="user_tier"></img>
						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>


						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
					</div>

				</div>

			</div>
			<div class="sbItem_div">
				<div id="favorites" class="favorites_c"></div>
				<div id="sbList" class="sbList_c">
					<div style="height: 1px;"></div>
					<div class="sbListImg">
					</div>
					<div class="sbListText">
						<div class="sbListBorder"><a>이거팝니다.</a></div>
						<div class="sbListBorder">
							<a>300,000원</a> </div>
						<div class="sbItemText_div">
							<a style="font-size: 10px; float: left;">카테고리>카테고리</a>
							<a style="font-size: 10px; float: right;">2019-10-24<br>No.111</a>
						</div>
						<div class="sbItemText_div">
							<a style="float: left; font-size: 12px;">작성자</a>
						</div>
						<img class="user_tier"></img>
						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>


						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
					</div>

				</div>

			</div>
			<div class="sbItem_div">
				<div id="favorites" class="favorites_c"></div>
				<div id="sbList" class="sbList_c">
					<div style="height: 1px;"></div>
					<div class="sbListImg">
					</div>
					<div class="sbListText">
						<div class="sbListBorder"><a>이거팝니다.</a></div>
						<div class="sbListBorder">
							<a>300,000원</a> </div>
						<div class="sbItemText_div">
							<a style="font-size: 10px; float: left;">카테고리>카테고리</a>
							<a style="font-size: 10px; float: right;">2019-10-24<br>No.111</a>
						</div>
						<div class="sbItemText_div">
							<a style="float: left; font-size: 12px;">작성자</a>
						</div>
						<img class="user_tier"></img>
						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>


						<div class="sbViewAtag"><img class="sbViewAtag_img"></img><a>1</a> </div>
					</div>

				</div>

			</div>

		</div>
		<div class="listBottomBar" style="text-align: center;">
			<div class="listPaging">
				<ul class="pagination">
					<li class="disabled"><a href="#">«</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">»</a></li>
				</ul>
			</div>
			<br>
			<div class="col-md-10 col-md-offset-1">
				<div class="total-wrap">
					<div class="row" style="display: inline-block;">
						<div class="col-md-8">
							<form action="#">
								
								<div class="row form-group" style="float: left;width: 200%;">
										<div class="col-md-9" style="width: auto;">
												<select>
														<option>작성자</option>
														<option>제목</option>
														<option>내용</option>
													</select>
											</div>
									<div class="col-md-9" style="width: 45%;">
										<input type="text" name="quantity" class="form-control input-number"
											placeholder="Your Coupon Number...">
									</div>
									<div class="col-md-3">
										<input type="submit" value="Apply Coupon" class="btn btn-primary">
									</div>
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
			<!-- <div class="col-md-6">
				<form class="form-inline qbstp-header-subscribe">
					<div class="row">
						<div class="col-md-12 col-md-offset-0">
							<div class="form-group">
								<input type="text" class="form-control" id="email" placeholder="Enter your email">
								<button type="submit" class="btn btn-primary">Subscribe</button>
							</div>
						</div>
					</div>
				</form>
			</div> -->
			<!-- <div class="bottomSearch" style="float: right; margin: 0 3% 0 0;">
				<select>
					<option>작성자</option>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input id="searchText" type="text">
				<button>검색</button>
			</div> -->
		</div>













	</div>
	<script >
	$('.sbItem_div').click(function(){
		location.href='selectOne.ud';
	});
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>