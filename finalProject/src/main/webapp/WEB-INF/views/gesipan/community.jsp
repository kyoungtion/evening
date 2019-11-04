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

tbody tr:hover {
	background-color: whitesmoke;
	font-weight: bold;
	cursor:pointer;
}


#tab-1{
	border: 1px white solid !important;
}

.displaynone {display:none;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">
			<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
				<div class="contact-wrap" style="height: 900px;">
					<form style="height: 100%;">
					<h4>커뮤니티 게시판</h4>
						<div class="container">
							
							<div id="tab-1" class="tab-content current">
								<div class="post-container">
									<table class="mypost">
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
												<th scope="col">&nbsp;번호</th>
												<th scope="col" class="displaynone">&nbsp;카테고리</th>
												<th scope="col">&nbsp;제목</th>
												<th scope="col">&nbsp;작성자</th>
												<th scope="col" class="">&nbsp;작성일</th>
												<th scope="col" class="displaynone">&nbsp;조회</th>
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
						</div>
					</form>
				</div>
			</div>
		
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>