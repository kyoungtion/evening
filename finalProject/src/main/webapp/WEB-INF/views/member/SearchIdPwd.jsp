<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   

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
  width: 700px;
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .containerSe .half {
  float: left;
  width: 100%;
  height: 100%;
  padding: 58px 40px 0;
}
body .containerSe .half.bg {
  
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
body .containerSe .tabs .tab.active a, body .containerSe .tabs .tab:hover a {
  color: #263238;
}
body .containerSe .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .containerSe .content form {
  position: relative;
  height: 287px;
}
body .containerSe .content label:first-of-type, body .containerSe .content input:first-of-type, body .containerSe .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .containerSe .content label:nth-of-type(2), body .containerSe .content input:nth-of-type(2), body .containerSe .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .containerSe .content label:nth-of-type(3), body .containerSe .content input:nth-of-type(3), body .containerSe .content .more:nth-of-type(3) {
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
body .containerSe .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .containerSe .content .checkbox + label:before {
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
body .containerSe .content .checkbox:checked + label:before {
  content: "✓";
}
body .containerSe .content .submit-wrap {
  position: absolute;
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

@import url(https://fonts.googleapis.com/css?family=BenchNine:700);
.snip1535 {
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
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: white;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: white;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #c47135;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}









</style>
</head>
<body>

<c:import url="/WEB-INF/views/common/header.jsp" />

<section class="containerSe">
          <article class="half">
                 <h1>SEARCH ID & PASSWORD</h1>
                 <div class="tabs">
                        <span class="tab signin active"><a href="#signin">Search ID</a></span>
                        <span class="tab signup"><a href="#signup">Search PassWord</a></span>
                 </div>
                 <div class="content">
                        <div class="signin-cont cont">
                               <form action="searchId.me" method="post" enctype="multipart/form-data">
                                      <input type="text" name="user_name" id="user_name" class="inpt" required="required" placeholder="Your Name">
                                      <label for="email">Your Name</label>
                                      <input type="text" name="phone" id="phone" class="inpt" required="required" placeholder="Your Phone">
                                      <label for="Phone">Your Phone</label>
                                            
                                 <div id="searchIdDiv"></div>
                              <%--<c:import url="/WEB-INF/views/member/modal.jsp" /> --%>                                            
                              
                              
                                      <div class="submit-wrap">
                                             <button type="button" value="Sign in" class="snip1535" id="searchId"> 조회 </button>
                                             <a href="home.do" class="more">index</a>
                                      </div>
                               </form>
                             
                        </div>
                        <div class="signup-cont cont" name="Search password">
                                            <form action="searchPwd.me" method="post" enctype="multipart/form-data">
                                      <input type="text" name="user_id" id="user_id" class="inpt" required="required" placeholder="Your id">
                                      <label for="user_id">Your id</label>
                                            <input type="email" name="user_email" id="user_email" class="inpt" required="required" placeholder="Your email">
                                      <label for="user_email">Your email</label>
                                      
                                      <div class="submit-wrap">
                                             <button type="button" value="Sign up" class="snip1535" id="searchPwd"> 조회</button>
                                             <a href="home.do" class="more">index</a>
                                      </div>
                               </form>
                     </div>
                     
                     
                     
                 </div>

            <script>
           // ID 찾기 Ajax 부분 
               $('#searchId').on('click',function(){
                  
                  var user_Name = $('#user_name').val();
                  var Phone = $('#phone').val();
                  
                  $.ajax({
                     url : "searchId.me",
                     type : "POST",
                     data :{'user_name':user_Name, 'phone':Phone},
                     success : function(data){
                        console.log(data);
                        if(data == ''){
                           $('#searchIdDiv').text('아이디를 찾을 수 없습니다.');   
                        } else{
                           $('#searchIdDiv').text(user_Name + '님의 아이디는 ' + data + '입니다.');   
                        }
                     },
                     error : function(request,status,errorData){
                     alert("error code : " + request.status + "\n"
                           + "message : " + request.responseText + "\n"
                           + "error : " + errorData);
                     }
                  });
                  
               });
            </script>     
                 
                       
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          </article>
          <div class="half bg">

          </div>
   </section>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
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
$('.containerSe .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>