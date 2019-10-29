<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mypageCategory {
	float: left;
	width: 150px;
	padding: 10px;
}

.container {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

ul.tabs li.current {
	background: #F2D7C6;
	color: #222;
}

.tab-content {
	display: none;
	height: 90%;
	background: #F2D7C6;
	padding: 10px;
	margin: 0;
	border: 0;
}

.tab-content.current {
	display: inherit;
}

.page-container {
	float: right;
}

.btn.btn-info {
	font-size: 9px;
}

.post-container {
	width: 100%;
	height: 85%;
}

.mypost {
	border: 1px solid #8b8787;
	width: 100%;
}

.mypost th {
	font-size: 11px;
	color: #8b8787;
	height: 35px;
	border-bottom: 1px solid #8b8787;
	text-align: center;
}

.mypost td {
	height: 20px;
	color: black;
	font-size: 13px;
	padding: 10px;
	border-bottom: 1px dotted #8b8787;
	text-align: center;
}

.post-title {
	text-align: left !important;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">
		<div class="mypageCategory">
			<ul class="my-tabs">
				<li class="my-tab"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
				<li class="my-tab"><a href="mypost.me">내가 쓴 글</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%;">
			<div class="contact-wrap" style="height: 900px;">
				<form style="height: 100%;">
					<h3 style="font-size: 15px">내가 쓴 글</h3>
					<div class="container">
						<ul class="tabs">
							<li class="tab-link current" data-tab="tab-1">글 목록</li>
						</ul>
						<div id="tab-1" class="tab-content current">
							<select>
								<option>커뮤니티</option>
								<option>삽니다</option>
								<option>문의게시판</option>
							</select><br>
							<br>
							<div class="post-container">
								<table class="mypost">
									<thead>
										<tr>
											<th style="width: 30px;">No.</th>
											<th style="width: 450px;">제목</th>
											<th style="width: 80px;">작성일</th>
											<th style="width: 80px;">조회수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3</td>
											<td class="post-title">안녕하세요</td>
											<td>2019/10/24</td>
											<td>100</td>
										</tr>
										<tr>
											<td>2</td>
											<td class="post-title">안녕하세요</td>
											<td>2019/10/23</td>
											<td>89</td>
										</tr>
										<tr>
											<td>1</td>
											<td class="post-title">안녕하세요</td>
											<td>2019/10/22</td>
											<td>33</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="page-container">
								<ul class="pagination">
									<li class="disabled"><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>