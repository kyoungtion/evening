<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
.btn.btn-info {
	font-size: 9px;
}

.displaynone {
	display: none;
}

.panel-title a {
	color: black !important;
	font-size: 13px !important;
}

.pagination li a {
	padding: 10px 10px !important;
}

select {
	border: whitesmoke;
}

.searchBox input {
	width: 200px;
	height: 22px !important;
	border: whitesmoke;
}

::-webkit-scrollbar table {
	display: none;
}

.tab-content {
	height: 500px !important;
}

.col-md-12.col-xs-12 {
	background: white;
	width: 100%;
	height: 500px;
	padding: 20px;
}

.content-tab {
	border: 0;
	width: 100%;
}

.content-tab tr td {
	border-bottom: 1px solid whitesmoke;
	height: 30px;
}

.searchBox {
	float: none !important;
	text-align: center;
	height:30px;
	width:100%;
}

.my-panel {
	width: 100%;
	height: 1000px;
	margin: auto;
}

.col-md-10 col-md-offset-1 {
	
}

.contact-wrap {
	width: 100%;
	height: 1050px;
}

.container {
	width: 100%;
}

.col-md-12.table {
	height: 400px;
}

.page-container {
	text-align: center;
	float: none !important;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="my-panel">
		<div class="col-md-10 col-md-offset-1"
			style="margin: 0; width: 100% !important;">
			<div class="contact-wrap">
				<form style="width: 100%;">
					<div class="container">
						<div class="faqContainer">
							<div class="panel-group" id="accordion">
								<h4>자주 묻는 질문</h4>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse1"> <i class="fas fa-check"></i> 제품에 하자가
												있는 경우에는 보상받을 수 있나요?
											</a>
										</h4>
									</div>
									<div id="collapse1" class="panel-collapse collapse">
										<div class="panel-body">
											이브닝에서는 거래가 이루어지는 공간만을 제공하며, 거래 중인 상품에 대해서는 보상 책임이 없습니다.<br>판매자와
											연락하시기 바랍니다.
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse2"> <i class="fas fa-check"></i> 등급이
												내려갔어요. 왜 내려 간 것인가요?
											</a>
										</h4>
									</div>
									<div id="collapse2" class="panel-collapse collapse">
										<div class="panel-body">입찰 취소, 거래 취소 등을 하면서 패널티를 받으면 등급이
											내려갈 수 있습니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse3"> <i class="fas fa-check"></i> 입찰중간에는
												입찰가 수정을 할 수 없나요?
											</a>
										</h4>
									</div>
									<div id="collapse3" class="panel-collapse collapse">
										<div class="panel-body">마이페이지-거래내역-입찰중인내역에서 입찰가 수정이
											가능합니다.</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clear-fix" style="width: 100%; height: 80px;"></div>
						<div>
							<div class="row">
								<div class="col-md-12">
									<h4>문의 사항</h4>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-12 col-xs-12" style="background: white;">
									<div class="col-md-12 table">
										<table class="content-tab">
											<colgroup>
												<col style="width: 50px;">
												<col style="width: 100px;" class="displaynone">
												<col style="width: 400px;">
												<col style="width: 100px;">
												<col style="width: 100px;" class="">
												<col style="width: 55px;" class="displaynone">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col" class="displaynone">카테고리</th>
													<th scope="col">제목</th>
													<th scope="col">작성자</th>
													<th scope="col" class="">작성일</th>
													<th scope="col" class="displaynone">조회</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td class="displaynone"></td>
													<td>
														<!-- 잠금아이콘 --> <img
														src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif"
														alt="비밀글" class="ec-common-rwd-image"> <!-- 파일제목 -->
														<a href="/board/free/read.html?no=2582213&amp;board_no=57"
														style="color: #333333;">[개선해주세요]</a> <!-- 파일첨부 아이콘 --> <img
														src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_file.gif"
														alt="파일첨부" class="ec-common-rwd-image"> <span
														class="comment">[1]</span>
													</td>
													<td class="post-title">작성자</td>
													<td>작성일</td>
													<td class="displaynone"></td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
								</div>
								<div class="clear-fix" style="width:100%; height:30px;"></div>
								<div class="row" style="display:flex;">
									<div class="searchBox">
										<select>
											<option value="title">제목</option>
											<option value="writer">작성자</option>
										</select> <input type="text" />
										<button style="background: none; border: 0;">
											<i class="fas fa-search"></i>
										</button>
									</div>
									<div style="float: right; padding: 10px; display: block;">
										<button class="btn btn-default" type="button"
											style="font-size: 10px;"
											onclick="location.href='qnaInsertView.ge'">글쓰기</button>
									</div>
								</div>
								<div class="page-container">
									<ul class="pagination">
										<li class="disabled"><a href="#">«</a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							
						</div>

						
						<br>
					</div>
				</form>
			</div>
		</div>

	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>