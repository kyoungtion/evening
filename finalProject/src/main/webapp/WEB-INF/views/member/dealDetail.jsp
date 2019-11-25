<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.update {font-size:10px !important; padding:5px !important;}
#cancel{text-align:center !important;}
.my-panel{display:flex;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="my-panel" >
		<!-- <div style="width: 100%; text-align: center !important; padding: 10px;">
			<ul class="my-tabs1">
				<li class="my-tab"><button class="btn"
						onclick="location.href='myinfo.me'">내 정보 보기</button></li>
				<li class="my-tab"><button class="btn"
						onclick="location.href='favorites.me'">관심상품목록</button></li>
				<li class="my-tab"><button class="btn active"
						onclick="location.href='dealDetail.me'">거래내역</button></li>
				<li class="my-tab"><button class="btn"
						onclick="location.href='mypost.me'">내가 쓴 글</button></li>
			</ul>
		</div> -->
			<ul class="my-tabs">
				<li class="my-tab"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab active"><a href="dealDetail.me">거래내역</a></li>
				<li class="my-tab"><a href="mypost.me?category=Community">내가 쓴 글</a></li>
				<li class="my-tab"><a href="message.sr">쪽지함</a></li>
			</ul>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%; padding: 0;">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link current" data-tab="tab-1">입찰중인 상품</li>
						<li class="tab-link" data-tab="tab-2">결제완료내역</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="contact-wrap" style="margin:0 !important;">

							<div class="row content" style="height: 620px;">
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
											<th scope="col">상품 이름</th>
											<th scope="col">현재 입찰가</th>
											<th scope="col">내 입찰가</th>
											<th scope="col" id="cancel">&nbsp;입찰취소</th>
										</tr>
									</thead>
									<tbody>
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>324</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td>8,000</td>
											<td id="cancel"><button onclick="deleteAuc();"
													class="btn btn-danger update">취소</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;">
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

					</div>
					<script>
						function deleteAuc() {
							
							if(confirm("입찰 취소하시겠습니까? 취소하시면 패널티가 부여되며, 등급이 하락될 수 있습니다.")){
								
							};
							
							/* var url = "updateAucView.me";
							var name = "입찰내역 수정";

							var option = "width=620px, height=450px, top=100, left=200, resizable=0, location=0, scrollbars=0, tollbars=0, status=0";
							window.open(url, name, option); */
						}
					</script>
					<div id="tab-2" class="tab-content">
						<div class="contact-wrap"  style="margin:0 !important;">
							<div class="row content" style="height: 620px;">
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
											<th scope="col">상품 이름</th>
											<th scope="col">상품 가격</th>
											<th scope="col" class="displaynone">내 입찰가</th>
											<th scope="col"  id="cancel">&nbsp;상세보기</th>
										</tr>
									</thead>
									<tbody>
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>324</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td class="displaynone">8,000</td>
											<td  id="cancel"><button onclick="updateAuc();"
													class="btn btn-info update">보기</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;">
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
					</div>

				</div>

			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>