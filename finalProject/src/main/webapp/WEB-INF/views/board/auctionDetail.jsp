<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품거래, 경매는 이브닝</title>
   <style>
      /* Insert Css */
      .form-field {
         width: 45%;
         float: left;
         margin: 0 0 0 30px;
      }

      .new {
         font-size: 11px;
         background: #FFC300;
         color: #fff;
         padding: .3em .5em;
         border-radius: 2px;
         margin-right: 5px;
      }

      .sbViewAtag {
         float: right;
         width: 40px;
         height: 50px;
         margin: -5px 5px 0 0;
         line-height: 1;
         font-size: 10px
      }

      .sbViewAtag_img {
         width: 100%;
         height: 30px;
         background: gray;
      }
      
      .row {
         line-height: normal;
      }
   </style>
</head>
<body>
   <c:import url="/WEB-INF/views/common/header.jsp"/>
   
   <div class="evPage" style="height:auto;width: 100%; background: #ffffff;  text-align: center; ">
      <div class="pg" style="width: 90%; height: 550px; display: inline-block; background: #f5f5f5;">
         <br>
         <div class="headLine" style="width:50%; display: inline-block;">
            <h2>${board.SG_BNAME }</h2>
            <p style="border-top: 1px solid gray;">${board.SG_ENROLL_DATE}<br> <span style="color: red; font-size: 20px;">${ board.TAG_NAME }</span> </p>
         </div>
         <div style="height: 300px;width: 100%; background: #f5f5f5;">
            <div style="display: inline-block;">
            <div style="width: 230px; float: left; padding: none;">
               <div style="height: 30px;"></div>
               <div style="width: 200px;height: 200px;background: white;display: inline-block;">
                  <img src="/evening/resources/thumbnail/${at.RENAMEFILENAME}" style="width: 100%; height: 100%;">
               </div>
               <!-- <p>썸네일 이미지</p> -->
            </div>
            <div class="col-md-7" style="float: left;width: 500px;">
               <div class="colorlib-form" style="padding: 0em;">

                  <div class=" row">

                     <br>
                     <div class="col-md-12">
                        <div class="form-group">
                           <label for="companyname">현재 경매가</label>
                           <div class="form-control">
                              <fmt:formatNumber var="price" value="${ board.SG_PRICE }" type="currency"/>
                              <span style="font-size: 20px; text-align: center; color: #ff8400;">${ price }</span>
                           </div>
                        </div>
                        <div class="form-group">
                           <label for="companyname">경매 시작가</label>
                           <div class="form-control">
                              <fmt:formatNumber var="sPrice" value="${ board.SG_SPRICE }" type="currency"/>
                              <span style="font-size: 20px; text-align: center; color: #ff8400;">${ sPrice }</span>
                           </div>
                        </div>
                     </div>

                     <div class="form-group">
                        <div style="float: left; width: 200px;">
                           <label for="companyname">거래 방식</label>
                           <div class="col-md-12">
                              <div class="radio" style="background-color: white;">
                                 <c:if test="${ board.SG_DEAL eq 'DIRECT' }">
                                    <label><input type="radio" name="dealType" checked="checked"><span style="color: #ff8400;">직 거래</span></label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="dealType" disabled="disabled">택배 거래</label>
                                 </c:if>
                                 <c:if test="${ board.SG_DEAL eq 'DELIVERY' }">
                                    <label><input type="radio" name="dealType" disabled="disabled">직 거래</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="dealType" checked="checked"><span style="color: #ff8400;">택배 거래</span></label>
                                 </c:if>
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="radio" style="background-color: white;" >
                                 <c:if test="${ board.SG_DELIVERY eq 'N' }">
                                    <label><input type="radio" name="dealType2" checked="checked"><span style="color: #ff8400;">배송비 포함</span></label>
                                    &nbsp;&nbsp;
                                    <label><input type="radio" name="dealType2" disabled="disabled" >무료 배송</label>
                                 </c:if>
                                 <c:if test="${ board.SG_DELIVERY eq 'Y' }">
                                    <label><input type="radio" name="dealType2" disabled="disabled" >배송비 포함</label>
                                    &nbsp;&nbsp;
                                    <label><input type="radio" name="dealType2" checked="checked"><span style="color: #ff8400;">무료 배송</span></label>
                                 </c:if>
                              </div>
                           </div>
                        </div>
                        <div>
                           <label for="companyname">거래 지역</label>
                           <input type="text" id="towncity" class="form-control" placeholder="Town or City"
                              style="width: 280px;">
                        </div>
                        <br><br>
                        <div style="width: 200px; height: 50px; float: left;">
                        <!-- 입찰버튼 로그인시에만 뜨도록 하기(아직 조건문 안만듬 // 확인용) -->
                        <button class="btn btn-primary btn-outline"style="float: right; margin: 0px 50px 0 0px;">입찰</button>
                           <!-- <span class="new">#New</span><span class="new">#New</span> -->
                        </div>
                        <div style="width: 200px; height: 50px; float: left;">
                           <div class="sbViewAtag"><h3><i class="icon-eye"></i></h3><a>${board.SG_COUNT}</a></div>
                           <div class="sbViewAtag"><h3><i class="icon-heart3"></i></h3><a>1</a> </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         </div>
         <div style=" width: 100%;height: 60px;display: inline-block;">
            <button class="btn btn-primary">구매 </button>
            <button class="btn btn-primary" onclick="location.href='updateForm.ud';" >수정 </button>
         </div>
      </div>
      <div style="width: 90%; height: 500px; display: inline-block; ">
         ${board.SG_INFO }
      </div>
   </div>
   <c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>