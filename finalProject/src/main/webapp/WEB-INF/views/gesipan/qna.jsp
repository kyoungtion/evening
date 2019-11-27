<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 거래, 경매는 이브닝 : 커뮤니티</title>
<style>
#qnaBody td {
	padding: 5px;
	border-bottom: 1px solid whitesmoke;
}

#modal {
	width: 100%;
	height: 100%;
	z-index: 1;
	vertical-align: middle;
	display: none;
	position: absolute;
	top: 300px;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: auto;
	height: 10px;
	line-height: 0em;
	margin: auto;
	font-size:10px;
}

#modal .modal_content {
	width: 300px;
	height: 150px;
	margin: auto;
	background: #fff;
	padding-top: 20px;
	border:0;
	font-size: 13px;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>
</head>
<body onload="getReplyList();">
	<c:import url="/WEB-INF/views/common/header.jsp" />
		<c:set var="cate" value="QNA"/>
	<div class="my-panel gesipan" style="height:1200px;">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap" style="height:1000px;">
				<form style="height: 100%;">
					<div class="container">

						<!-- 자주 묻는 질문 -->
						<div class="faqContainer">
							<div class="panel-group" id="accordion">
								<span id="titlespan1">자주 묻는 질문</span>&nbsp;<i class="fas fa-search"></i>
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse1"><!--  <i class="fas fa-check"></i> --> 제품에 하자가
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
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse2"> <!-- <i class="fas fa-check"></i> --> 등급이
												내려갔어요. 왜 내려 간 것인가요?
											</a>
										</h4>
									</div>
									<div id="collapse2" class="panel-collapse collapse">
										<div class="panel-body">입찰 취소, 거래 취소 등을 하면서 패널티를 받으면 등급이
											내려갈 수 있습니다.</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse3"> <!-- <i class="fas fa-check"></i> --> 입찰중간에는
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
								<c:if test="${ !empty sessionScope.loginUser }">
								<button class="btn btn-default" type="button"
									style="font-size: 10px;"
									onclick="location.href='gesipanInsertView.ge?g_category=${cate}'">글쓰기</button>
								</c:if>
								<c:if test="${ empty sessionScope.loginUser }">
									<br>
								</c:if>
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
										<c:if test="${ g.g_type == 'N' }">
											<tr style="background-color: #FFFFFF; color: #333333; font-weight:bold;">
												<td>&nbsp;<i class="fas fa-thumbtack"></i></td>
												<td id="g_id${st.index }" class="hidden g_id" name="gId">${ g.g_id }</td>
												<td class="displaynone" id="g_pwd">${ g.g_pwd }</td>
												<td class="subject" id="subject${st.index }"><span class="gTitle">${ g.g_title }</span>
												<c:if test="${fn:contains(g.g_content, '<img src')}">
													
													<i class="fas fa-image"></i>
												</c:if> <%-- rCount 추가 나중에 --%> <span
												class="rWrap Before ${st.index}">[</span><span><font
													id="rCount${st.index}"></font></span><span
												class="rWrap After ${st.index}">]</span></td>
												<td>${ g.nickname }</td>
												<td>${ g.g_enroll_date }</td>
												<td>${ g.g_count }</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach var="g" items="${list}" varStatus="st">
										<c:if test="${ g.g_type != 'N' }">
											<tr style="background-color: #FFFFFF; color: #333333;">
												<td id="g_id${st.index }" class="g_id" name="gId">${ g.g_id }</td>
												<td class="displaynone" id="g_pwd">${ g.g_pwd }</td>
												<td class="subject" id="subject${st.index }">
												<c:if test="${ g.g_order eq 1 }">
													<i class="fas fa-angle-right"></i>
												</c:if>
												<c:if test="${ g.locked eq 'Y' }">
													<i class="fas fa-lock"></i>
												</c:if>
												<span class="gTitle">${ g.g_title }</span>
												<c:if test="${fn:contains(g.g_content, '<img src')}">
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
										</c:if>
									</c:forEach>
									
									
								</tbody>
							</table>
						</div>
						<div id="modal">
							<div class="modal_content" style="text-align: center">
								<font class="modal_text1">비밀글입니다.</font><br> 
								<font class="modal_text2">비밀번호를 입력해주세요.</font><br>
								<input type="text" id="g_pwdInput" style="height:20px;"><br><br>
								<button type="button" id="modal_input_btn"
									class="btn btn-round btn-warning">입력</button>
								<button type="button" id="modal_close_btn"
									class="btn btn-round btn-danger">닫기</button>
							</div>
							<div class="modal_layer"></div>
						</div>
						<br>
						<div class="row" >
							<div class="col-md-5" style="text-align: center; left:30%; width: 350px;">
							<!-- <div class="col-md-5" id="searchbox"> -->
								<select id="searchfor" name="searchfor">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
								</select>
								<input id="searchText" name="searchText" type="search"/>
								<input type="hidden" id="category" value="${ cate }">
								<button type="button" id="searchBtn" style="background:none; border:0;"><i class="fas fa-search"></i>
								</button>
								
								
							<!-- </div> -->
								<ul class="pagination">
									<!-- 이전 페이지 -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a>&laquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="gList.ge">
											<c:param name="page" value="${ pi.currentPage - 1 } "/>
											<c:param name="category" value="${ cate }"/>
										</c:url>
										<li><a href="${ before }">«</a></li>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>									
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="gList.ge">
												<c:param name="page" value="${ p } "/>
												<c:param name="category" value="${ cate }"/>
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									<!-- 다음 -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">»</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="gList.ge">
											<c:param name="page" value="${ pi.currentPage + 1 } "/>
											<c:param name="category" value="${ cate }"/>
										</c:url>
										<li><a href="${ after }">»</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	
	<script>
		// 게시글 상세정보 조회
		$(function(){
			var index = ${fn:length(list)};
			var cate = '${cate}';
			for(var i = 0; i < index; i++){
				if('${sessionScope.loginUser.user_id}' == 'admin'){
					$('#subject'+i).click(function(){
						var g_id = $(this).prev().prev().text();
						location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage}+"&g_category="+cate;
					});
				} else {
					$('#subject'+i).click(function(){
						if(${sessionScope.loginUser != null}){
							var g_pwd = $(this).prev().text();
							
							var g_id = $(this).prev().prev().text();
							
							if(g_pwd == ""){
								location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage}+"&g_category="+cate;
							} else {
								$('#modal').attr("style","display:block");
								$('#modal_input_btn').click(function(){
									var pwd = $('#g_pwdInput').val();
									console.log(pwd);
									if(g_pwd == pwd){
										location.href = "gDetail.ge?g_id="+g_id+"&page="+${pi.currentPage}+"&g_category="+cate;
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
					});
				}
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