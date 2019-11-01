<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.deal-container {
	width: 100%;
	height: 85%;
}

.deal-table {
	border: 1px solid #8b8787;
	width: 100%;
}

.deal-table thead th {
	font-size: 11px;
	color: #8b8787;
	height: 35px;
	border-bottom: 1px solid #8b8787;
	text-align: center;
}

.deal-table td {
	height: 20px;
	color: black;
	font-size: 13px;
	padding: 10px;
	border-bottom: 1px dotted #8b8787;
	text-align: center;
}

.deal-table tbody td button {
	font-size: 5px;
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
				<h3 style="font-size: 15px">내 정보 보기</h3>
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link current" data-tab="tab-1">입찰중인 상품</li>
						<li class="tab-link" data-tab="tab-2">결제완료내역</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="deal-container">
							<table class="deal-table">
								<thead>
									<tr>
										<th width="30px">No.</th>
										<th width="300px">상품이름</th>
										<th width="100px">현재 입찰 가</th>
										<th width="100px">내 입찰가</th>
										<th width="80px">입찰 수정</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td><button onclick="updateAuc();" class="btn btn-primary">입찰수정</button></td>
									</tr>
									<tr>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td><button onclick="updateAuc();" class="btn btn-primary">입찰수정</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<script>
						function updateAuc(){
							var url="updateAucView.me";
							var name="입찰내역 수정";
							
							var option="width=620px, height=450px, top=100, left=200, resizable=0, location=0, scrollbars=0, tollbars=0, status=0";
							window.open(url, name, option);
						}
					
					</script>
					<div id="tab-2" class="tab-content">
						<div class="deal-container">
							<table class="deal-table">
								<thead>
									<tr>
										<th width="30px">No.</th>
										<th width="300px">상품 이름</th>
										<th width="100px">상품 가격</th>
										<th width="100px">구입 날짜</th>
										<th width="80px">제품 상세 보기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td>1</td>
										<td><button class="btn btn-info">상세보기</button></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>