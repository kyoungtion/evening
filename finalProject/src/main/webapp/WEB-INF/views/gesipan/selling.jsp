<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENING : 커뮤니티</title>
<style>

#searchText {
	width: 200px;
	height: 25px;
	border: whitesmoke;
}

#title{font-size:20px;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:set var="cate" value="Selling"/>
	<div class="my-panel">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap">
				<form style="height: 100%;">
					<div class="container">
						<div class="row">
							<div class="col-md-12 title">
								<span id="titlespan">삽니다</span>&nbsp; 구입하고 싶은 물건이 있으면 글을 등록해주세요. 자유롭게 거래가 가능한 게시판입니다.
								<div style="float: right; padding: 10px; display: block;">
									<button class="btn btn-default" type="button" style="font-size: 10px;" onclick="location.href='gesipanInsertView.ge?g_category=${cate}'">글쓰기</button>
								</div>
							</div>
						</div>
						<div class="row content">
							<table border="1" summary="" class="content-table">
								<colgroup
									class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
									<col style="width: 50px;">
									<col style="width: 50px;" class="displaynone">
									<col style="width: 450px;">
									<col style="width: 100px;">
									<col style="width: 100px;" class="">
									<col style="width: 55px;" class="displaynone">
								</colgroup>
								<thead>
									<tr style="">
										<th scope="col">번호</th>
										<th scope="col" class="displaynone">카테고리</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col" class="">작성일</th>
										<th scope="col" class="displaynone">조회</th>
									</tr>
								</thead>
								<tbody>
									<tr style="background-color: #FFFFFF; color: #333333;"
										class="xans-record-">
										<td>324</td>
										<td class="displaynone"></td>
										<td class="subject">
											<!-- 파일제목 --> 
											<span class="title">이거 삽니다.</span>
											<!-- 파일첨부 아이콘 -->
											<img src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_file.gif"
											alt="파일첨부" class="ec-common-rwd-image">
											<!-- 댓글 -->
											<span class="comment">[1]</span>
										</td>
										<td>작성자이름</td>
										<td class="txtLess ">작성날짜</td>
										<td class="displaynone">작성날짜</td>
									</tr>
									<tr style="background-color: #FFFFFF; color: #333333;">
										<td>324</td>
										<td class="displaynone"></td>
										<td class="subject">
											<!-- 잠금아이콘 --> <img
											src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif"
											alt="비밀글" class="ec-common-rwd-image"> 
											<!-- 파일제목 -->
											<span class="title">저거삽니다.</span>
											<!-- 파일첨부 아이콘 --> 
											<img src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_file.gif"
											alt="파일첨부" class="ec-common-rwd-image"> 
											<span class="comment">[1]</span>
										</td>
										<td>작성자이름</td>
										<td class="txtLess ">작성날짜</td>
										<td class="displaynone">작성날짜</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<br>
						<div class="row" >
							<div class="col-md-5" style="text-align: center; left:35%; width: 350px;">
							<!-- <div class="col-md-5" id="searchbox"> -->
								<select>
									<option value="title">제목</option>
									<option value="writer">작성자</option>
								</select>
								<input id="searchText" type="text"/>
								<button style="background:none; border:0;"><i class="fas fa-search"></i>
								</button>
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
				</form>
			</div>
		</div>

	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>