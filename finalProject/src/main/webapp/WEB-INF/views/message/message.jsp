<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#hs {
	text-align: center;
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
		<div class="col-md-10 col-md-offset-1" id="tabs" style="margin: 0; width: 80%; padding: 0;">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link current" data-tab="tab-1"><a href="#tab-1">받은쪽지함</a></li>
						<li class="tab-link" data-tab="tab-2"><a href="#tab-2">보낸쪽지함</a></li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="container">
							<button onclick="window.open('write.sr', '글쓰기', 'top=10, left=10, width=555, height=670, status=no, menubar=no, toolbar=no, resizable=no');" class="btn btn-primary ">글쓰기</button>
							<button onclick="write();" class="btn btn-primary ">삭제</button>
							<div id="hs" class="row content" style="height: 650px;">
								<table border="1" summary="" class="content-table">
									<colgroup id=""
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
										<col style="width: 150px;">
										<col style="width: 450px;">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="">
											<th id="hs" scope="col">번호</th>
											<th id="hs" scope="col">보낸사람</th>
											<th id="hs" scope="col">제목</th>
											<th id="hs" scope="col">받은날짜</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${rlist}" var="list" varStatus="status">
										
											<tr style="background-color: #FFFFFF; color: #333333;">
												<%-- <td><c:out value="${list.M_NO}" /></td>
												<td><c:out value="${list.M_SEND}" /></td>
												<td><c:out value="${list.M_TITLE}" /></td>
												<td><c:out value="${list.M_ENROLL_DATE}" /></td> --%>
												<td><c:out value="${status.count}" /></td>
												<td><c:out value="${list.m_SEND}" /></td>
												<td><c:out value="${list.m_TITLE}" /></td>
												<td><c:out value="${list.m_ENROLL_DATE}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
								<table border="1" summary="" class="content-table">
									<colgroup id=""
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
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
										<c:forEach items="${slist}" var="list" varStatus="status">
											<tr style="background-color: #FFFFFF; color: #333333;" >
											
												
												<td><c:out value="${status.count}" /></td>
												<td><c:out value="${list.m_SEND}" /></td>
												<td><c:out value="${list.m_TITLE}" /></td>
												<td><c:out value="${list.m_ENROLL_DATE}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
	
	<script>
	/* 탭 메뉴 새로고침시 고정 스크립트 */
	$(function(){
		
		$('#tabs').tabs();
		var tabs = $('#tabs').tabs({
			activate: function(event, ui){
				var active = $('#tabs').tabs('option', 'active');
				$.cookie('activeTabIndex', active);
			}
		});
		
		var activeTabIndex = $.cookie('activeTabIndex');
		
		if(activeTabIndex != undefined){
			tabs.tabs('option','active',activeTabIndex);
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
	</script>


	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>