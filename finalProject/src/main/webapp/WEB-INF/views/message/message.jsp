<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 거래, 경매는 이브닝</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css" />




<style type="text/css">
#hs {
	text-align: center;
}

@media (max-width: 700px){
	button {
	font-size : 10px;}
}

#down {
	visibility: hidden;
}

.product-list {
	width:100%;
	bakcground: white;
}

.product-entry .product-img{
	height: 200px !important;
}


.tab-content, .tab-content.current, .tab-content.contact-wrap, .tab-content.current .contact-wrap {background:white !important;}
.tab-content.current input[type=text], .tab-content.current input[type=email], .tab-content.current input[type=tel]
{background: whitesmoke !important;padding:10px !important; height:40px !important;}
.buttons input {font-size:12px;}
input:focus {background-color: white !important; border:1px solid lightgray !important;}
.my-tabs li.active{background: white !important;}
.my-panel{display:flex;}
#seller {
	border-radius: 150px;
	width:300px;
	height:300px;
	color:black;
	/* background: #f2d7c6; */
	/* background: whitesmoke; */
	text-align:center;
	margin:auto;
}

.seller {
	background: white !important;
	width: 300px !important;	
	color: black !important;
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
				<li class="my-tab active"><a href="message.sr">쪽지함</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1" id="tabs"
			style="margin: 0; width: 80%; padding: 0;">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link" data-tab="tab-1"><a href="#tab-1">받은쪽지함</a></li>
						<li class="tab-link" data-tab="tab-2"><a href="#tab-2">보낸쪽지함</a></li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="container">
							<button
								onclick="window.open('write.sr', '글쓰기', 'top=10, left=10, width=555, height=670, status=no, menubar=no, toolbar=no, resizable=no');"
								class="btn btn-primary ">글쓰기</button>

							<div id="hs" class="row content" style="height: 650px;">
							<form action="delete.sr">
							<div style="height: 650px;">
								<table border="1" summary="" class="content-table" id="rtable">
									<colgroup id=""
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 100px;">
										<col style="width: 150px;">
										<col style="width: 450px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="">
											<th id="hs" scope="col">번호</th>
											<th id="hs" scope="col">보낸사람</th>
											<th id="hs" scope="col">제목</th>
											<th id="hs" scope="col">받은날짜</th>
											<th id="hs" scope="col">선택</th>

										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(rlist) > 0}">

												<c:forEach items="${rlist}" var="list" varStatus="status">
													<c:if test="${list.m_CLICKED eq 'N'}">
														<tr style="background-color: #FFFFFF; color: #333333;"
															class="rMessage" id="${list.m_NO}">
													</c:if>
													<c:if test="${list.m_CLICKED eq 'Y'}">
														<tr style="background-color: #FFFFFF; color: gray;"
															class="rMessage" id="${list.m_NO}">
													</c:if>
														<td><c:out value="${status.count}" /></td>
														<td><c:out value="${list.m_SEND}" /></td>
														<td><c:out value="${list.m_TITLE}" /></td>
														<td><c:out value="${list.m_ENROLL_DATE}" /></td>
														<td><input type="checkbox" name="delete" value="${list.m_NO}"/>
														</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="3">받은 메일이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>

									</tbody>
								</table>
								</div>
								<input type="submit" value="삭제"/>

								</form>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;"></div>
							</div>

						</div>

					</div>
					<script>
						
					</script>
					<div id="tab-2" class="tab-content">
						<div class="container">

							<div id="hs" class="row content" style="height: 600px;">
								<div style="height: 650px;">
								<table border="1" summary="" class="content-table" id="stable">
									<colgroup id=""
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 100px;">
										<col style="width: 150px;">
										<col style="width: 450px;">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="">
											<th id="hs" scope="col">번호</th>
											<th id="hs" scope="col">받는사람</th>
											<th id="hs" scope="col">제목</th>
											<th id="hs" scope="col">보낸날짜</th>
										
										</tr>
									</thead>
									<tbody>

										<c:choose>
											<c:when test="${fn:length(slist) > 0}">
												<c:forEach items="${slist}" var="list" varStatus="status">
													<c:if test="${list.m_CLICKED eq 'N'}">
														<tr style="background-color: #FFFFFF; color: #333333;"
															class="sMessage" id="${list.m_NO}">
													</c:if>
													<c:if test="${list.m_CLICKED eq 'Y'}">
														<tr style="background-color: #FFFFFF; color: gray;"
															class="sMessage" id="${list.m_NO}">
													</c:if>
													<td><c:out value="${status.count}" /></td>
													<td><c:out value="${list.m_RECEIVE}" /></td>
													<td><c:out value="${list.m_TITLE}" /></td>
													<td><c:out value="${list.m_ENROLL_DATE}" /></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="3">보낸 메일이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table> 
								</div>
							</form>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;"></div>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"
		type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			$('#rtable').DataTable({
				"info" : false,
				"order" : [ [ 0, "desc" ] ],
				"stateSave" : true
			});
		});
		$(document).ready(function() {
			$('#stable').DataTable({
				"info" : false,
				"order" : [ [ 0, "desc" ] ],
				"stateSave" : true
			});
		});
		/* 탭 메뉴 새로고침시 고정 스크립트 */
		$(function() {
			$('#tabs').tabs();
			var tabs = $('#tabs').tabs({
				activate : function(event, ui) {
					var active = $('#tabs').tabs('option', 'active');
					$.cookie('activeTabIndex', active);
				}
			});
			var activeTabIndex = $.cookie('activeTabIndex');
			if (activeTabIndex != undefined) {
				tabs.tabs('option', 'active', activeTabIndex);
			}
			/* if (location.hash == "#tab-1"){         
				$('.tabs').find('li').eq(0).addClass('current').siblings().removeClass('current');        
				
			} else if(location.hash == "#tab-2"){         
				$('.tabs').find('li').eq(1).addClass('current').siblings().removeClass('current');         
				
			} else if(location.hash == "#tab-3"){         
				$('.tabs').find('li').eq(2).addClass('current').siblings().removeClass('current');         
			}
			
			$('ul.tabs li').click(function(){
			    $('ul.tabs li').removeClass('current');
			    $(this).addClass('current');
			}); */
		});
		$(document)
				.ready(
						function() {
							$('.rMessage')
									.on(
											'click',
											function() {
												var popUrl = "/evening/rDetail.sr?m_NO="
														+ $(this).attr('id');
												//팝업창에 출력될 페이지 URL 
												var popOption = "top=10, left=10, width=555, height=670, status=no, menubar=no, toolbar=no, resizable=no;";
												//팝업창 옵션(optoin)
												window.open(popUrl, "",
														popOption);
											});
							$('.sMessage')
									.on(
											'click',
											function() {
												var popUrl = "/evening/sDetail.sr?m_NO="
														+ $(this).attr('id');
												//팝업창에 출력될 페이지 URL 
												var popOption = "top=10, left=10, width=555, height=670, status=no, menubar=no, toolbar=no, resizable=no;";
												//팝업창 옵션(optoin)
												window.open(popUrl, "",
														popOption);
											});
						});
	</script>


	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>