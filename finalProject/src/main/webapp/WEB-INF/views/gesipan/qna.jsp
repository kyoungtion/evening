<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
#qnaBody td {
	padding: 5px;
	border-bottom: 1px solid whitesmoke;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:set var="cate" value="QNA"/>
	<div class="my-panel">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap">
				<form style="height: 100%;">
					<div class="container">

						<!-- 자주 묻는 질문 -->
						<div class="faqContainer">
							<div class="panel-group" id="accordion">
								<span id="titlespan">자주 묻는 질문</span>
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
						<hr>
						<div class="clear-fix" style="width: 100%; height: 50px;"></div>
						<div class="row">
							<div class="col-md-12">
								<span id="titlespan">문의사항</span>&nbsp; 궁금하거나 건의할 사항이 있으면 글을 남겨주세요. 최대한 빠르게 답변드리겠습니다.
								<div style="float: right; padding: 10px; display: block;">
									<button class="btn btn-default" type="button" style="font-size: 10px;" onclick="location.href='gesipanInsertView.ge?g_category=${cate}'">글쓰기</button>
								</div>
							</div>
						</div>
						<div class="row content" style="height: 600px;">
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
											<span class="title">[개선해주세요]</span>
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
											<span class="title">문의사항</span>
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