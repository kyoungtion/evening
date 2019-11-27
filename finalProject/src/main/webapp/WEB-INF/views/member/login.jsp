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
    
   <!-- 다음 주소 api -->
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   
   <!-- 카카오 로그인 관련  -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 
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

    body .containerSe {
      position: relative;
      overflow: hidden;
      width: 900px;
      height: 1000px;
      margin: 80px auto 0;
      background-color: #ffffff;
      -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
      -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
      box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
    }

    body .containerSe .half {
      float: left;
      width: 50%;
      height: 100%;
      padding: 58px 40px 0;
    }

    body .containerSe .half.bg {

      float: right;
      width: 50%;
      height: 100%;
      padding: 58px 40px 0;

    }

    body .containerSe h1 {
      font-size: 18px;
      font-weight: 700;
      margin-bottom: 23px;
      text-align: center;
      text-indent: 6px;
      letter-spacing: 7px;
      text-transform: uppercase;
      color: #263238;
    }

    body .containerSe .tabs {
      width: 100%;
      margin-bottom: 29px;
      border-bottom: 1px solid #d9d9d9;
    }

    body .containerSe .tabs .tab {
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

    body .containerSe .tabs .tab a {
      font-size: 11px;
      text-decoration: none;
      text-transform: uppercase;
      color: #d9d9d9;
      transition: all 0.1s ease-in-out;
    }

    body .containerSe .tabs .tab.active a,
    body .containerSe .tabs .tab:hover a {
      color: #263238;
    }

    body .containerSe .tabs .tab.active {
      border-bottom: 1px solid #263238;
    }

    body .containerSe .content form {
      position: relative;
      height: 287px;
    }

    body .containerSe .content label:first-of-type,
    body .containerSe .content input:first-of-type,
    body .containerSe .content .more:first-of-type {
      -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
      -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
      animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
    }

    body .containerSe .content label:nth-of-type(2),
    body .containerSe .content input:nth-of-type(2),
    body .containerSe .content .more:nth-of-type(2) {
      -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
      -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
      animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
    }

    body .containerSe .content label:nth-of-type(3),
    body .containerSe .content input:nth-of-type(3),
    body .containerSe .content .more:nth-of-type(3) {
      -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
      -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
      animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
    }

    body .containerSe .content label {
      font-size: 12px;
      color: #263238;
      -moz-user-select: -moz-none;
      -ms-user-select: none;
      -webkit-user-select: none;
      user-select: none;
    }

    body .containerSe .content label:not([for='remember']) {
      display: none;
    }

    body .containerSe .content input.inpt {
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
    
  
    
    #postalCode{float: left;}

     body .containerSe .content input.inpt2 {
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

    body .containerSe .content input.inpt3 {
      font-size: 18px;
      display: block;
      width: 30%;
      height: 42px;
      margin-bottom: 12px;
      padding: 16px ;
      color: #999999;
      border: 1px solid #d9d9d9;
      background: white;
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
      
    } 

    body .containerSe .content input.inpt::-webkit-input-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .containerSe .content input.inpt:-moz-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .containerSe .content input.inpt::-moz-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .containerSe .content input.inpt:-ms-input-placeholder {
      font-size: 14px;
      color: #999999;
      font-family: 'Lato', sans-serif;
    }

    body .containerSe .content input.inpt:focus {
      border-color: #999999;
    }

    body .containerSe .content input.submit {
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

    body .containerSe .content input.submit:hover {
      background-color: #263238;
      color: #ffffff;
      -moz-transition: all 0.2s;
      -o-transition: all 0.2s;
      -webkit-transition: all 0.2s;
      transition: all 0.2s;
    }

    body .containerSe .content input:focus {
      outline: none;
    }

    body .containerSe .content .checkbox {
      margin-top: 4px;
      overflow: hidden;
      clip: rect(0 0 0 0);
      width: 0;
      height: 0;
      margin: 17px -1px;
      padding: 0;
      border: 0;
    }

    body .containerSe .content .checkbox+label {
      vertical-align: middle;
      display: inline-block;
      width: 50%;
    }

    body .containerSe .content .checkbox+label:before {
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

    body .containerSe .content .checkbox:checked+label:before {
      content: "✓";
    }

    body .containerSe .content .submit-wrap {
      position: relative;
      bottom: 0;
      width: 100%;
    }

    body .containerSe .content .submit-wrap a {
      font-size: 12px;
      display: block;
      margin-top: 20px;
      text-align: center;
      text-decoration: none;
      color: #999999;
    }

    body .containerSe .content .submit-wrap a:hover {
      text-decoration: underline;
    }

    body .containerSe .content .signup-cont {
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
     
       span.guide{display:none; font-size:12px; top:12px; right:10px;}
      span.ok{color:green;}
      span.error{color:red;}
    
    
    
    
    
    
  </style>
</head>

<body>

 <c:import url="/WEB-INF/views/common/header.jsp" />

   
  <section class="containerSe">
    
    <!-- 일반회원 로그인-->
    <article class="half">
      <h1>Evening</h1>
      <div class="tabs">
        <span class="tab signin active"><a href="#signin">Sign in</a></span>
        <span class="tab signup"><a href="#signup">Sign up</a></span>
      </div>
      <div class="content">
        <div class="signin-cont cont">
          <form action="login.me" method="post" enctype="multipart/form-data">
            <input type="text" name="user_id" id="user_id" class="inpt" required="required" placeholder="Your id">
            <label for="ID">Your id</label>
            
            <input type="password" name="user_pwd" id="user_pwd" class="inpt" required="required"
              placeholder="Your password">
            <label for="user_pwd">Your Password</label>
            
            <input type="checkbox" id="remember" class="checkbox" checked>
            <label for="remember">Remember me</label>

            <div class="submit-wrap">
              <input type="submit" value="Sign in" class="submit" >
              <a href="search.me" class="more">Forgot your id & password?</a>
            </div>
          </form>
        </div> 
        </div>
        
        
        <!-- 회원가입용   -->
        <div class="content">
        <div class="signup-cont cont">
          <form action="ebinsert.me" method="post" enctype="multipart/form-data">
            <input type="text" name="user_id" id="ID" class="inpt" required="required" placeholder="Your id">
            <label for="ID">Your id</label>
            <span class="guide ok"> 이 아이디는 사용 가능합니다.</span>
            <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
            <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
         
         
            <input type="text" name="user_name" id="name" class="inpt" required="required" placeholder="Your name">
            <label for="name">Your name</label>
          
         <input type="text" name="nickName" id="nickname" class="inpt" required="required" placeholder="Your nickname">
            <label for="nickname">Your nickname</label>
             
            <input type="email" name="user_email" id="email" class="inpt" required="required" placeholder="Your email">
            <label for="email">Your email</label>

            <input type="password" name="user_pwd" id="password" class="inpt" required="required"
              placeholder="Your password">
            <label for="password">Your password</label>
         
            <input type="Password" name="Confirm Password" id="Confirm Password" class="inpt"
              required="required" placeholder="Confirm Password">
            <label for="Confirm Password">Confirm password</label>
         
         
         <!-- 주민등록 번호 ( - ) 포함할껀지 말껀지? ( - ) 포함할꺼면 자동으로 - 입력하게 만들기  -->
            <input type="text" maxlength="14" name="user_residentNumber" id="registration" class="inpt" required="required"
              placeholder="Resident registration number(-포함)" pattern = "\d{6}\-\d{7}" 
                              title = "123456-1234567 형식으로 입력해주세요" >
            <label for="registration">Resident registration number</label>
         
         <!-- 다음 도로명주소 사용해보기  -->
         <input type="text" name="zipcode1"  class="postcodify_postcode5 inpt2" value="" placeholder="Postal Code" id="postalCode">
         <input type="button"  id="address" class="inpt3"  onclick="mapsearch();" value="Search" placeholder="Search">
            <input type="text" name="addr"  class="postcodify_address inpt" required="required" placeholder="Address" >
            
            <input type="text" name="addrDtl"  class="postcodify_extra_info inpt" required="required" placeholder="Address1" >
            <label for="addr">Address</label>
      
            <input type="text" name="phone" id="Phone" class="inpt" required="required" placeholder="Phone">
            <label for="Phone">Phone</label>
            <!-- <input type="Confirm Phone" name="Confirm Phone" id="Confirm Phone" class="inpt3" required="required" placeholder="Confirm"> -->

               <div class="submit-wrap">
                   <input type="submit" value="Sign up" class="submit">
                  
                   <!-- 메인페이지로 돌아가기   -->
                   <a href="index.jsp" class="more">Evening</a>
               </div>
          </form>
        </div>
        </div>
        
        <script>
        <!-- 회원가입시 유효성 검사  -->
        $("#user_id").on("keyup",function(){
           var user_id = $(this).val().trim();
           
           if(user_id.length < 0){
              $(".guide").hide();
              $("#idDuplicatecheck").val(0);
              
              return;
           }
           
           $.ajax({
              url : "dupid.me",
              data : {id: user_id},
              success : function(data){
                 if(data == "true"){
                    $(".guide.error").hide();
                    $(".guide.ok").show();
                    $("#idDuplicatecheck").val(1);
                 }else{
                    $(".guide.ok").hide();
                    $(".guide.error").show();
                    $("#idDuplicatecheck").val(0);
                    
                 }
              }
           });
        });
        
        function validate(){
           if($("#idDiplicateCheck").val() == 0){
              alert("사용가능한 아이디를 입력해주세요.");
              $("#user_id").focus();
           }else{
              $("#insertForm").submit();
           }
        }
        </script>
        
      </article>  
        
        

    <!-- 우측 카카오 로그인 및 구글 로그인 화면 만들기 -->
    <div class="half bg">

     <br><br><br><br><br><br><br><br>


      <br>
      
      <div class="margin-top-20" id="kakao_id_login" style="text-align: center">
       <a href="https://kauth.kakao.com/oauth/authorize?client_id=f84407b67579371cbd836e35e16b6627&redirect_uri=http://localhost:9000/evening/kakaoCallback.me&response_type=code">
         
         <img width="223"
            src="${contextPath }/resources/images/kakao_account_login_btn_medium_narrow.png"/>
         </a> 
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      <!-- <a id="kakao-login-btn"></a>
      <a href="http://developers.kakao.com/logout"></a>
       <a href="https://kauth.kakao.com/oauth/authorize
                  ?client_id=f84407b67579371cbd836e35e16b6627
                  &redirect_uri=http://http:localhost:9000/kakao
                  &response_type=code">
      </a> 
      <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('f64ed07cd2c0fe7ce2b8eb13280efeda');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function (authObj) {
                  
             Kakao.API.request({

                  url: ,

                  success: function(res) {
                    
                        alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

                        alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

                        console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

                        console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

                        console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 

                    // res.properties.nickname으로도 접근 가능 )
 
                        console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

                      }

                    })
          },
          fail: function (err) {
            alert(JSON.stringify(err));
          }
        });
           // ]]> -->
      </script>
      <div id="searchIdDiv"></div>
        

      

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
    $('.containerSe .bg').mousemove(function (e) {
      var amountMovedX = (e.pageX * -1 / 30);
      var amountMovedY = (e.pageY * -1 / 9);
      $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
    });
    

    function mapsearch() {
            new daum.Postcode({
              oncomplete: function(data) {
                $('[name=zipcode1]').val(data.zonecode); // 우편번호 (5자리)
                $('[name=addr]').val(data.address);
                $('[name=addrDtl]').val(data.buildingName);
              }
            }).open();
          }
  </script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>

</html>