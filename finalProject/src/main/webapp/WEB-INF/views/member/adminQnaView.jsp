<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 거래, 경매는 이브닝 : 관리자 메뉴</title>
<style>
.subject:hover {
	cursor: pointer;
	font-weight: bold;
}

#searchText {
	width: 200px;
	height: 25px;
	border: whitesmoke;
}

.rWrap {
	visibility: hidden;
}

.my-tabs1 {
	padding-top: 10px;
	list-style: none;
}

.my-tabs1 li {
	display: inline;
}

.btn {
	font-size: 12px !important;
}

.active {
	background: gray;
	color: white;
}

.navbar {
	margin-bottom: 0px !important;
	min-height: 0px !important;
}

.nav>li>a {
	position: relative;
	display: inline-block;
	padding: 5px 10px !important;
}

.dropdown-item {
	cursor: pointer;
}
</style>
</head>
<body onload="getReplyList();">
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel" style="width: 100%; height: 1000px;">
		<div
			style="width: 100%; text-align: center !important; padding: 10px;">
			<ul class="my-tabs1">
				<li class="my-tab"><button class="btn" id="adminView"
						onclick="location.href='adminView.ad'">회원 관리</button></li>
				<li class="my-tab"><button class="btn" id="manageSeller"
						onclick="location.href='manageSeller.ad'">판매자 전환</button></li>
				<c:url var="qnaList" value="qna.ad">
					<c:param name="category" value="QNA" />
					<c:param name="viewName" value="adminQnaView" />
				</c:url>
				<li class="my-tab"><button class="btn" id="pList" onclick="location.href='pList.py'">거래내역</button></li>
				<li class="my-tab"><button class="btn active" id="qna"
						onclick="location.href='${qnaList}'">문의글 관리</button></li>
				<c:url var="adminNotice" value="adminNoticeView.ad">
					<c:param name="viewName" value="adminNotice"/>
				</c:url>
				<li class="my-tab"><button class="btn" id="insertNotice"
						onclick="location.href='${adminNotice}'">공지사항 관리</button></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1"
			style="margin: 0; width: 100%; background: whitesmoke;">
			<div class="contact-wrap" style="height: 900px; padding: 0;">
				<form style="height: 100%;">
					<div class="container">
						<div class="row content" style="height: 800px;">
							<div class="row content table" style="height: 600px;">
								<table border="1" summary="" class="content-table">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
										<col style="width: 50px;" class="displaynone">
										<col style="width: 450px;">
										<col style="width: 100px;">
										<col style="width: 100px;" class="">
										<col style="width: 55px;">
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
										<c:forEach var="g" items="${list}" varStatus="st">
											<tr style="background-color: #FFFFFF; color: #333333;">
												<td id="g_id${st.index }" class="g_id" name="gId">${ g.g_id }</td>
												<td class="displaynone" id="g_pwd">${ g.g_pwd }</td>
												<td class="subject" id="subject${st.index }"><c:if
														test="${ g.g_order eq 1 }">
														<i class="fas fa-angle-right"></i>
													</c:if> <c:if test="${ g.locked eq 'Y' }">
														<i class="fas fa-lock"></i>
													</c:if> <span class="gTitle">${ g.g_title }</span> <c:if
														test="${fn:contains(g.g_content, '<img src')}">
														<!-- <img src="//img0001.echosting.cafe24.com/front/type_b/image/common/icon_img.gif"
													alt="파일첨부" class="ec-common-rwd-image"> -->
														<i class="fas fa-image"></i>
													</c:if> <%-- rCount 추가 나중에 --%> <span
													class="rWrap Before ${st.index}">[</span><span><font
														id="rCount${st.index}"></font></span><span
													class="rWrap After ${st.index}">]</span></td>
												<td>${ g.nickname }</td>
												<td>${ g.g_enroll_date }</td>
												<td>${ g.g_count }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div
								style="width: 100%; border-top: 1px solid whitesmoke; height: 100px; padding-top: 10px;">
								<div class="row">
									<div class="col-md-5" style="text-align: center; width: 100%;">
										<!-- </div> -->
										<ul class="pagination">
											<!-- 이전 페이지 -->
											<c:if test="${ pi.currentPage <= 1 }">
												<li class="disabled"><a>&laquo;</a></li>
											</c:if>
											<c:if test="${ pi.currentPage > 1 }">
												<c:url var="before" value="qna.ad">
													<c:param name="page" value="${ pi.currentPage - 1 } " />
													<c:param name="category" value="QNA" />
												</c:url>
												<li><a href="${ before }">«</a></li>
											</c:if>
											<!-- 페이지 -->
											<c:forEach var="p" begin="${ pi.startPage }"
												end="${ pi.endPage }">
												<c:if test="${ p eq pi.currentPage }">
													<li class="active"><a>${ p }</a></li>
												</c:if>
												<c:if test="${ p ne pi.currentPage }">
													<c:url var="pagination" value="qna.ad">
														<c:param name="page" value="${ p } " />
														<c:param name="category" value="QNA" />
													</c:url>
													<li><a href="${ pagination }">${ p }</a></li>
												</c:if>
											</c:forEach>
											<!-- 다음 -->
											<c:if test="${ pi.currentPage >= pi.maxPage }">
												<li class="disabled"><a href="#">»</a></li>
											</c:if>
											<c:if test="${ pi.currentPage < pi.maxPage }">
												<c:url var="after" value="qna.ad">
													<c:param name="page" value="${ pi.currentPage + 1 } " />
													<c:param name="category" value="QNA" />
												</c:url>
												<li><a href="${ after }">»</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<br>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		// 게시글 상세정보 조회
		$(function(){
			var index = ${fn:length(list)};
			
			for(var i = 0; i < index; i++){
				
				$('#subject'+i).click(function(){
					if(${sessionScope.loginUser.user_id == 'admin'}){
						var g_id = $(this).prev().prev().text();
						location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage}+"&viewName=adminQnaView";
					} else {
						if(${sessionScope.loginUser != null}){
							var g_pwd = $(this).prev().text();
							
							var g_id = $(this).prev().prev().text();
							
							if(g_pwd == ""){
								location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage};
							} else {
								$('#modal').attr("style","display:block");
								$('#modal_input_btn').click(function(){
									var pwd = $('#g_pwdInput').val();
									console.log(pwd);
									if(g_pwd == pwd){
										location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage};
									} else {
										$('.modal_text1').text("");
										$('.modal_text2').text("");
										$('.modal_text1').text("틀린 비밀번호입니다.");
										$('.modal_text2').text("다시 입력해주세요.");
									}
								});
							$('#g_pwdInput').val("");
							}
						} else {
							alert('회원만 조회가능합니다.');
						}
					}
				});
			}
			
			$('#modal_close_btn').click(function(){
				$('#g_pwdInput').val("");
				$('.modal_text1').text("");
				$('.modal_text2').text("");
				$('.modal_text1').text("비밀글입니다.");
				$('.modal_text2').text("비밀번호를 입력해주세요.");
				$('#modal').attr("style","display:none");
			});
		});
		
		
		function getReplyList(){
			var g_ref = document.getElementsByName("gId");
			var array = [];
			for(var i in g_ref){
				array.push(Number(g_ref[i].innerText));
			}
			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: "rCount.ge",
				data: {g_ref:array},
				dataType: "json",
				success: function(data) {
					var subject = $("#subject");
					for(var i in data){
						for(var j = 0; j < Object.keys(data).length; j++){
							var g_id = $('#g_id'+j).text();
							
							var rWrapBefore = $('.rWrap.Before.'+j);
							var rWrapAfter = $('.rWrap.After.'+j);
							var rCount = $('#rCount'+j);
							if(i == g_id && data[i] > 0){
								rWrapBefore.css("visibility", "visible");
								rWrapAfter.css("visibility", "visible");
								rCount.text(data[i]);
							} else if(i == g_id && data[i] <= 0){
								rWrapBefore.css("visibility", "hidden");
								rWrapAfter.css("visibility", "hidden");
							}
						}
					} 
				}, error: function(){
					console.log('안됨');
				}
			});
		}
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>