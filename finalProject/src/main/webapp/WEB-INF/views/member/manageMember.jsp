<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENING : 관리자 메뉴</title>
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
	list-style:none;
}

.my-tabs1 li {
	display:inline;
}

.btn {
	font-size: 12px !important;
	
}

#adminView {
	background: gray;
	color: white;
}

.navbar {
	margin-bottom:0px !important;
	min-height: 0px !important;
}

.nav > li > a {
    position: relative;
    display:inline-block;
    padding: 5px 10px !important;
}

.dropdown-item {
	cursor: pointer;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="my-panel"
		style="width: 100%; height: 1000px;">
		<div style="width: 100%; text-align:center !important; padding: 10px;">		
			<ul class="my-tabs1">
				<li class="my-tab"><button class="btn" id="adminView" onclick="location.href='adminView.ad'">회원 관리</button></li>
				<li class="my-tab"><button class="btn" id="qna" onclick="location.href='qna.ad'">문의글 관리</button></li>
				<!-- <li class="my-tab"><a href="dealDetail.me">거래내역</a></li> -->
				<li class="my-tab"><button class="btn" id="insertNotice" onclick="location.href='insertNoticeView.ad'">공지사항 작성</button></li>
			</ul>
		</div>	
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%; background: whitesmoke;">
			<div class="contact-wrap" style="height: 900px; padding:0;">
				<form style="height: 100%;">
					<div class="container">
						<div class="row content" style="height: 800px;">
							<div class="row content table" style="height: 600px; ">
							<input type="checkbox" id="selectAll"> <label for="selectAll">전체선택</label>
							<script>
								$(function(){
									$('#selectAll').click(function(){
										if($('#selectAll').is(":checked")){
											$("input[name='chk']").prop('checked', true);
										} else {
											$("input[name='chk']").prop('checked', false);
										}
									});
									
									$('#chk').on('click', function(){
										if($('#chk').is(":checked") == false){
											$('#selectAll').attr("checked", false);
										}
									});
								});
							</script>
							<table border="1" summary="" class="content-table">
								<colgroup>
									<col style="width: 2%">
									<col style="width: 6%;">
									<col style="width: 10%;">
									<col style="width: 10%;">
									<col style="width: 12%;">
									<col style="width: 30%;">
									<col style="width: 10%;">
									<col style="width: 10%;">
									<col style="width: 5%;">
								</colgroup>
								<thead>
									<tr style="">
										<th scope="col"><i class="fas fa-check"></i></th>
										<th scope="col">아이디</th>
										<th scope="col">이름(별명)</th>
										<th scope="col">연락처</th>
										<th scope="col">이메일</th>
										<th scope="col">주소</th>
										<th scope="col">가입일</th>
										<th scope="col">등급</th>
										<th scope="col" style="text-align:center;">설정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${list}" varStatus="st">
										<tr style="background-color: #FFFFFF; color: #333333;">
											<td class="displaynone" id="listLength">${fn:length(list)}</td>
											<td><input class="chk" id="chk" name="chk" type="checkbox" value="${ m.user_id }"></td>
											<td id="user_id${st.index}">${ m.user_id }</td>
											<td>${ m.user_name }(${m.nickName })</td>
											<td>${ m.phone }</td>
											<td>${ m.user_email }</td>
											<td>${ m.address }</td>
											<td>${ m.enroll_date }</td>
											<td>${ m.rankCode.rank_name }( ${ m.rankCode.rank_img } )</td>
											<td style="text-align:center;">
												<ul class="nav navbar panel_toolbox">
													<li class="dropdown">
														<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-cog"></i></a>
														<ul class="dropdown-menu" role="menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(-5px, 30px, 0px); top: 0px; left: 0px; will-change: transform;">
															<li><a class="dropdown-item memberLevel" id="memberLevel.${st.index }">등급 조정</a></li>
															<li><a class="dropdown-item memberDelete" id="memberDelete.${st.index }">회원 삭제</a></li>
														</ul>
													</li>
												</ul>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							<div style="width:100%; border-top:1px solid whitesmoke; height:100px; padding-top:10px;">
								<div class="row">
									<div class="col-md-5"
										style="text-align: center; width: 100%;">
			
										<!-- </div> -->
										<ul class="pagination">
											<!-- 이전 -->
											<c:if test="${ pi.currentPage <= 1} ">
												<li class="disabled"><a href="#">«</a></li>
											</c:if>
											<c:if test="${ pi.currentPage > 1 }">
												<c:url var="before" value="adminView.ad">
													<c:param name="page" value="${ pi.currentPage - 1 } " />
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
													<c:url var="pagination" value="adminView.ad">
														<c:param name="page" value="${ p } " />
													</c:url>
													<li><a href="${ pagination }">${ p }</a></li>
												</c:if>
											</c:forEach>
											<!-- 다음 -->
											<c:if test="${ pi.currentPage >= pi.maxPage }">
												<li class="disabled"><a href="#">»</a></li>
											</c:if>
											<c:if test="${ pi.currentPage < pi.maxPage }">
												<c:url var="after" value="adminView.ad">
													<c:param name="page" value="${ pi.currentPage + 1 } " />
												</c:url>
												<li><a href="${ after }">»</a></li>
											</c:if>
										</ul>
									</div>
								</div>
								<div style="text-align:center;">
									<!-- <button class="btn-primary">등급변경</button> -->
									<button class="btn-danger" id="deleteAllMember">선택회원 전체삭제</button>
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
		$(function(){
			$('.memberDelete').on('click', function(){
				var user_id = $(this).attr('id');
				var indexof = user_id.indexOf('.');
				var i = user_id.substring(indexof+1);
				
				user_id = $('#user_id'+i).text();
				
				if(confirm('해당 회원을 삭제하시겠습니까?')){
					location.href="memberDelete.ad?user_id="+user_id;
				}
			});
		});
		$(function(){
			$('.memberLevel').on('click', function(){
				var user_id = $(this).attr('id');
				var indexof = ($(this).attr('id')).indexOf('.');
				var i = user_id.substring(indexof+1);

				user_id = $('#user_id'+i).text();
				
				var url = "memberLevelView.ad?user_id="+user_id;
				var name = "회원등급 조정";

				var option = "width=620px, height=450px, top=100, left=200, resizable=0, location=0, scrollbars=0, tollbars=0, status=0";
				window.open(url, name, option);
			});
		});
		
		$('#deleteAllMember').on('click', function(){
			if(confirm("선택한 회원 모두 삭제하시겠습니까?")){
				
				var ids = "";
				$('input:checkbox:checked').each(function(index){
					if(index != 0){
						ids += "," + $(this).val();
					} else {
						ids += $(this).val();
					}
					
					location.href="deleteAllMember.ad?ids="+ids;
				});
				
				console.log(ids);
			}
		});	
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>