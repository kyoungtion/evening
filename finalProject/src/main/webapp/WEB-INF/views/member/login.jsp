<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport"
    content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

  <!-- 카카오 로그인 관련  -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  <!--구글 로그인 관련  -->
  <script src="https://ajax.googleleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="colors.js"></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta name="google-signin-client_id"
    content="771961646010-vn99g36mbkraddshtf6brr57s94n7ivg.apps.googleusercontent.com">

 <!-- 도로명 주소 관련   -->	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script language="javascript">

	  <script>
	    function onSignIn(googleUser) {
	      var profile = googleUser.getBasicProfile();
	      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	      console.log('Name: ' + profile.getName());
	      console.log('Image URL: ' + profile.getImageUrl());
	      console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	    }
	    
	    
  	function goPopup(){
  	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
  	    var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
  	    
  		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
  	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
  	}
  	
  	/** API 서비스 제공항목 확대 (2017.02) **/
  	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
  							, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
  		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
  		document.form.user_address.value = roadFullAddr;
  		document.form.zipNo.value = zipNo;
  	}

  </script>
  <style rel="stylesheet">
    @charset "UTF-8";
    @import url(https://fonts.googleapis.com/css?family=Lato:400,700);

    * {
      -moz-box-sizing: border-box;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
    }

    body {
      font-family: 'Lato', sans-serif;
      background-color: #f8f8f8;
    }

    body .container {
      position: relative;
      overflow: hidden;
      width: 700px;
      height: 800px;
      margin: 80px auto 0;
      background-color: #ffffff;
      -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
      -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
      box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
    }

    body .container .half {
      float: left;
      width: 50%;
      height: 100%;
      padding: 58px 40px 0;
    }

    body .container .half.bg {

      float: right;
      width: 50%;
      height: 100%;
      padding: 58px 40px 0;

    }

    body .container h1 {
      font-size: 18px;
      font-weight: 700;
      margin-bottom: 23px;
      text-align: center;
      text-indent: 6px;
      letter-spacing: 7px;
      text-transform: uppercase;
      color: #263238;
    }

    body .container .tabs {
      width: 100%;
      margin-bottom: 29px;
      border-bottom: 1px solid #d9d9d9;
    }

    body .container .tabs .tab {
      display: inline-block;
      margin-bottom: -1px;
      padding: 20px 15px 10px;
      cursor: pointer;
      letter-spacing: 0;
      border-bottom: 1px solid #d9d9d9;
      -moz-user-select: -moz-none;
      -ms-user-select: none;
      -webkit-user-select: none;
      user-select: none;
      transition: all 0.1s ease-in-out;
    }

    body .container .tabs .tab a {
      font-size: 11px;
      text-decoration: none;
      text-transform: uppercase;
      color: #d9d9d9;
      transition: all 0.1s ease-in-out;
    }

    body .container .tabs .tab.active a,
    body .container .tabs .tab:hover a {
      color: #263238;
    }

    body .container .tabs .tab.active {
      border-bottom: 1px solid #263238;
    }

    body .container .content form {
      position: relative;
      height: 287px;
    }

    body .container .content label:first-of-type,
    body .container .content input:first-of-type,
    body .container .content .more:first-of-type {
      -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
      -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
      animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
    }

    body .container .content label:nth-of-type(2),
    body .container .content input:nth-of-type(2),
    body .container .content .more:nth-of-type(2) {
      -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
      -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
      animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
    }

    body .container .content label:nth-of-type(3),
    body .container .content input:nth-of-type(3),
    body .container .content .more:nth-of-type(3) {
      -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
      -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
      animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
    }

    body .container .content label {
      font-size: 12px;
      color: #263238;
      -moz-user-select: -moz-none;
      -ms-user-select: none;
      -webkit-user-select: none;
      user-select: none;
    }

    body .container .content label:not([for='remember']) {
      display: none;
    }

    body .container .content input.inpt {
      font-size: 14px;
      display: block;
      width: 100%;
      height: 42px;
      margin-bottom: 12px;
      padding: 16px 13px;
      color: #999999;
      border: 1px solid #d9d9d9;
      background: transparent;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
    }

    /* body .container .content input.inpt2 {
      font-size: 14px;
      display: block;
      width: 70%;
      height: 42px;
      margin-bottom: 12px;
      padding: 16px 13px;
      color: #999999;
      border: 1px solid #d9d9d9;
      background: transparent;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
    }

    body .container .content input.inpt3 {
      font-size: 14px;
      display: block;
      width: 30%;
      height: 42px;
      margin-bottom: 12px;
      padding: 16px 13px;
      color: #999999;
      border: 1px solid #d9d9d9;
      background: transparent;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
    } */

    body .container .content input.inpt::-webkit-input-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .container .content input.inpt:-moz-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .container .content input.inpt::-moz-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .container .content input.inpt:-ms-input-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .container .content input.inpt:focus {
      border-color: #999999;
    }

    body .container .content input.submit {
      font-size: 12px;
      line-height: 42px;
      display: block;
      width: 100%;
      height: 42px;
      cursor: pointer;
      vertical-align: middle;
      letter-spacing: 2px;
      text-transform: uppercase;
      color: #263238;
      border: 1px solid #263238;
      background: transparent;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
    }

    body .container .content input.submit:hover {
      background-color: #263238;
      color: #ffffff;
      -moz-transition: all 0.2s;
      -o-transition: all 0.2s;
      -webkit-transition: all 0.2s;
      transition: all 0.2s;
    }

    body .container .content input:focus {
      outline: none;
    }

    body .container .content .checkbox {
      margin-top: 4px;
      overflow: hidden;
      clip: rect(0 0 0 0);
      width: 0;
      height: 0;
      margin: 17px -1px;
      padding: 0;
      border: 0;
    }

    body .container .content .checkbox+label {
      vertical-align: middle;
      display: inline-block;
      width: 50%;
    }

    body .container .content .checkbox+label:before {
      content: "\A";
      color: #999999;
      font-family: Verdana;
      font-weight: bold;
      font-size: 8px;
      line-height: 10px;
      text-align: center;
      display: inline-block;
      vertical-align: middle;
      position: relative;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
      background: transparent;
      border: 1px solid #d9d9d9;
      width: 11px;
      height: 11px;
      margin: -2px 8px 0 0;
    }

    body .container .content .checkbox:checked+label:before {
      content: "✓";
    }

    body .container .content .submit-wrap {
      position: relative;
      bottom: 0;
      width: 100%;
    }

    body .container .content .submit-wrap a {
      font-size: 12px;
      display: block;
      margin-top: 20px;
      text-align: center;
      text-decoration: none;
      color: #999999;
    }

    body .container .content .submit-wrap a:hover {
      text-decoration: underline;
    }

    body .container .content .signup-cont {
      display: none;
    }

    @keyframes slideIn {
      0% {
        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
        opacity: 0;
        margin-left: -320px;
      }

      100% {
        filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
        opacity: 1;
        margin-left: 0px;
      }
    }

    @-webkit-keyframes slideIn {
      0% {
        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
        opacity: 0;
        margin-left: -320px;
      }

      100% {
        filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
        opacity: 1;
        margin-left: 0px;
      }
    }

    .credits {
      display: block;
      position: absolute;
      right: 0;
      bottom: 0;
      color: #999999;
      font-size: 14px;
      margin: 0 10px 10px 0;
    }

    .credits a {
      filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
      opacity: 0.8;
      color: inherit;
      font-weight: 700;
      text-decoration: none;
    }
  </style>
</head>

<body>

 <c:import url="/WEB-INF/views/common/header.jsp" />

	
  <section class="container">
    
    <form action="login.me" method="POST" id="loginForm">
    <!-- 일반회원 로그인 및 회원 가입 틀.  -->
    <article class="half">
      <h1>Evening</h1>
      <div class="tabs">
        <span class="tab signin active"><a href="#signin">Sign in</a></span>
        <span class="tab signup"><a href="#signup">Sign up</a></span>
      </div>
      <div class="content">
        <div class="signin-cont cont">
          <form action="#" method="post" enctype="multipart/form-data">
            <input type="ID" name="user_id" id="ID" class="inpt" required="required" placeholder="Your id">
            <label for="ID">Your id</label>
            
            <input type="password" name="user_pwd" id="password" class="inpt" required="required"
              placeholder="Your password">
            <label for="password">Your Password</label>
            
            <input type="checkbox" id="remember" class="checkbox" checked>
            <label for="remember">Remember me</label>

            <div class="submit-wrap">
              <input type="submit" value="Sign in" class="submit">
              <a href="#" class="more">Forgot your id & password?</a>
            </div>
          </form>
        </div>
        </form>
        
        <form action="ebinsert.me" method="POST" id="ebinsert.me">
        <div class="signup-cont cont">
          <form action="#" method="post" enctype="multipart/form-data">

            <input type="ID" name="user_id" id="ID" class="inpt" required="required" placeholder="Your id">
            <label for="ID">Your id</label>
            <span class="guide ok"> 이 아이디는 사용 가능합니다.</span>
            <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
            <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">

            <input type="name" name="user_name" id="name" class="inpt" required="required" placeholder="Your name">
            <label for="name">Your name</label>

			<input type="nickname" name="nickname" id="nickname" class="inpt" required="required" placeholder="Your nickname">
            <label for="nickname">Your nickname</label>
            
            <input type="email" name="user_email" id="email" class="inpt" required="required" placeholder="Your email">
            <label for="email">Your email</label>

            <input type="password" name="user_pwd" id="password" class="inpt" required="required"
              placeholder="Your password">
            <label for="password">Your password</label>

            <input type="Confirm Password" name="Confirm Password" id="Confirm Password" class="inpt"
              required="Confirm Password" placeholder="Confirm Password">
            <label for="Confirm Password">Confirm password</label>

            <input type="registration" name="user_residentNumber" id="registration" class="inpt" required="registration"
              placeholder="Resident registration number">
            <label for="registration">Resident registration number</label>

            <input type="Address" name="user_address" id="Address" class="inpt" required="required" placeholder="Address" onclick="goPopup();">
            <label for="Address">Address</label>
            
            <!-- 도로명 주소입력 (우편번호,상세주소1,2 구분 없이 user_address 에 한번에 입력  -->
            <!-- user_address 라벨 클릭시 도로명 주소 검색창 나오기. -->
            
            
            

            <input type="Phone" name="user_phone" id="Phone" class="inpt" required="required" placeholder="Phone">
            <label for="Phone">Phone</label>
            <!-- <input type="Confirm Phone" name="Confirm Phone" id="Confirm Phone" class="inpt3" required="required" placeholder="Confirm"> -->



            	<div class="submit-wrap">
             	   <input type="submit" value="Sign up" class="submit">
             	   <a href="#" class="more">Evening</a>
            	</div>
          </form>
        </div>
      </div>
    </article>
    </form>

    <!-- 우측 카카오 로그인 및 구글 로그인 화면 만들기 -->
    <div class="half bg">

      <br><br><br><br><br><br><br><br>

      <div class="g-signin2" data-onsuccess="onSignIn"></div>

      <br>




      <a id="kakao-login-btn"></a>
      <a href="http://developers.kakao.com/logout"></a>
      <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('f64ed07cd2c0fe7ce2b8eb13280efeda');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function (authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function (err) {
            alert(JSON.stringify(err));
          }
        });
                      //]]>
      </script>








    </div>
  </section>



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript">
    $('.tabs .tab').click(function () {
      if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
      }
      if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
      }
    });
    $('.container .bg').mousemove(function (e) {
      var amountMovedX = (e.pageX * -1 / 30);
      var amountMovedY = (e.pageY * -1 / 9);
      $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
    });
  </script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>

</html>