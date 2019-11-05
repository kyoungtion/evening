<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.subject:hover {
	cursor:pointer;
	font-weight:bold;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">
		<div class="mypageCategory no-drag">
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
					<div class="container">
						<ul class="tabs no-drag">
							<li class="tab-link current" data-tab="tab-1">글 목록</li>
						</ul>
						<div id="tab-1" class="tab-content current">
							<select id="boardSelect">
								<option value="Community">커뮤니티</option>
								<option value="Selling">삽니다</option>
								<option value="QNA">문의게시판</option>
							</select><br> <br>
							<div class="container">
								<div class="row content" style="height:600px;">
									<table border="1" summary="" class="content-table">
										<colgroup
											class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
											<col style="width: 50px;">
											<col style="width: 50px;" class="displaynone">
											<col style="width: 450px;">
											<col style="width: 100px;">
											<col style="width: 100px;" class="">
											<col style="width: 100px;">
										</colgroup>
										<thead>
											<tr style="">
												<th scope="col">번호</th>
												<th scope="col" class="displaynone">카테고리</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col" class="">작성일</th>
												<th scope="col">조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr style="background-color: #FFFFFF; color: #333333;">
												<td>324</td>
												<td class="displaynone"></td>
												<td class="subject">
												<span class="title">내가 쓴 글이야</span>
												 <!-- 파일첨부 아이콘 --> 
												 <img src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_file.gif"
													alt="파일첨부" class="ec-common-rwd-image">
												 <!-- 댓글 --> 
												 <span class="comment">[1]</span>
												</td>
												<td>작성자이름</td>
												<td class="txtLess ">작성날짜</td>
												<td>조회수</td>
											</tr>
											<tr style="background-color: #FFFFFF; color: #333333;">
												<td>324</td>
												<td class="displaynone"></td>
												<td class="subject">
													<!-- 잠금아이콘 --><img
													src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif"
													alt="비밀글" class="ec-common-rwd-image"> 
													<!-- 파일제목 -->
													<span class="title">이것도 내가 쓴 글</span>
													<!-- 파일첨부 아이콘 --> 
													<img
													src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_file.gif"
													alt="파일첨부" class="ec-common-rwd-image"> 
													<!-- 댓글 -->
													<span class="comment">[1]</span>
												</td>
												<td>작성자이름</td>
												<td>작성날짜</td>
												<td>조회수</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="row">
									<div class="col-md-8"
										style="text-align: center; left: 27%; width: 350px;">
										<!-- <div class="col-md-5" id="searchbox"> -->

										<!-- </div> -->
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

							<!-- <div class="page-container">
								<ul class="pagination">
									<li class="disabled"><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div> -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$('tbody tr').on('click', function() {
			location.href = "#";
		});

		
		$('#boardSelect').change(function(){

			selectValue = $('#boardSelect option:selected').val();
			
			<%-- user_id = "<%= session.getAttribute("user_id")%>"; --%>
			

		});
		
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>