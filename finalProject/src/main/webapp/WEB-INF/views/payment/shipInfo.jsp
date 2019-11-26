<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 정보 입력</title>
<!-- 다음 지도 api -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<!-- 결제 api -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>

		<div class="row">
			<div class="col-md-7" style="margin-left: 230px">
					<h2>배송지 정보 입력</h2>
				<form action="pinsert.py" id="pinsert" method="post" class="colorlib-form" style="margin-top:30px; margin-left:auto; width: 650px; height:700px;">
						<div class="row">
					 		<div class="col-md-12">
								<div class="form-group">
									<div class="col-md-6">
										<label for="fname">이름</label>
										<input type="text" value="${ loginUser.user_name }" id="pname" class="form-control" name="P_ID">
										<input type="hidden" value="${ loginUser.nickName }" id="pnickname" class="form-control" name="P_NICKNAME">
									</div>
								</div>
								
					<div class="form-group">
						<div class="col-md-6">
							<label for="addr">주소</label>
		
							<input type="text" id="address2" class="form-control" placeholder=""
							   name="post" style="text-align: left; margin-bottom: 10px;" onclick="mapsearch();">
<!-- 							   
							 <button onclick="postCheck();">클릭</button>
							<script>
								function postCheck(){
									var str = $('#addr').val();
									console.log(str);
								}		
							</script> -->
						
							</div>
							<div class="form-group">
							<div class="col-md-6">
							<input type="text" id="address2" class="form-control" placeholder=""
							name="addr1" style="text-align: left">
							</div>
							 <div class="col-md-6">
											  
							<input type="text" id="address2" class="form-control" placeholder=""
							name="addr2" style="text-align: left">
							</div>
											  
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-6">
							<label for="email">이메일</label>
							<input type="text" id="email" class="form-control" name="P_EMAIL" value="${ loginUser.user_email }" placeholder="">
						</div>
							<div class="col-md-6">
								<label for="Phone">전화 번호</label>
								<input type="text" id="phone" name="P_PHONE" class="form-control" placeholder="">
							</div>
						<div class="form-group">
							<div class="col-md-12">
							<label for="memo">배송시 메모</label>
							<input type="text" id="memo" class="form-control" name="MEMO" placeholder="">
							</div>
							
							<div class="col-md-12">
							<label for="money">상품 이름</label>
							<input type="text" id="gp_id" name="gp_ID" value="${ b.SG_BNAME }" class="form-control" readonly placeholder="">
							</div>
							
							<div class="col-md-12">
							<label for="money">금액</label>
							<input type="text" id="money" name="MONEY" value="${b.SG_PRICE }" class="form-control" readonly placeholder="">
							</div>
						</div>
					</div>
			
				</div>
			</div>
		</form>
	</div>
</div>
			
				<div class="row">
					<div class="col-md-12">
						<button onclick="" class="btn btn-primary" style="float: right; margin-right:130px;" id="check_module">주문</button>
					</div>
				</div>
			
	
<c:import url="/WEB-INF/views/common/footer.jsp"/>



	
</body>
<script>
		function mapsearch() {
        new daum.Postcode({
          oncomplete: function(data) {
            $('[name=post]').val(data.zonecode); // 우편번호 (5자리)
            $('[name=addr1]').val(data.address);
            $('[name=addr2]').val(data.buildingName);
          }
        }).open();
      }
</script>
<script>
// 결제 function		
// 금액 부분은 필수로 기입 해줄 것
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp69358155');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'html5_inicis', // version 1.1.0부터 지원.

/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)'
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
 */
 pay_method: 'card',

/* 'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제 */

merchant_uid: '0111000' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '결제',
//결제창에서 보여질 이름
amount: $('#money').val(),
buyer_email: $('#email').val(),
buyer_name: $('#fname').val(),
buyer_tel: $('#phone').val(),
buyer_addr: $('#addr').val(),
m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
$("#pinsert").submit();
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
document.location.href="index.jsp";
});
});
</script>	
</html>