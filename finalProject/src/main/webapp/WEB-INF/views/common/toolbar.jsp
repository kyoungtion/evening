<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/toolbar.css">
  <!-- jQuery -->

  <!-- MiniColors -->
  <script src="resources/js/jquery.minicolors.js"></script>
  <link rel="stylesheet" href="resources/css/jquery.minicolors.css">
  
<!-- header css -->
 

</head>
<body>
<script>
    $(document).ready( function() {

      $('.demo').each( function(){
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time. Again,
        // they're only used for the purposes of this demo.
        //
        $(this).minicolors({
          control: $(this).attr('data-control') || 'hue',
          defaultValue: $(this).attr('data-defaultValue') || '',
          format: $(this).attr('data-format') || 'hex',
          keywords: $(this).attr('data-keywords') || '',
          inline: $(this).attr('data-inline') === 'true',
          letterCase: $(this).attr('data-letterCase') || 'lowercase',
          opacity: $(this).attr('data-opacity'),
          position: $(this).attr('data-position') || 'bottom',
          swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
          change: function(hex, opacity) {
            var log;
            try {
              log = hex ? hex : 'transparent';
              if( opacity ) log += ', ' + opacity;
            } catch(e) {}
          },
          theme: 'default'
        });

      });

    });
  </script>
   <div style="height: 30px; background: lemonchiffon; text-align:center;">

               <ul class="Ttoolbal" style="height: 100%;">
                  <li><button type="button" id="bold" class="fontM" value="bold" title="굵기"
                        style="font-weight: bold;"><i>B</i></button>
                  </li>


                  <li><button type="button" id="italic" class="fontM" value="italic" title="기울기">
                        <i style="font-style: italic; font-weight: bold;">I</i></button></li>

                  <li><button type="button" id="underLine" class="fontM" value="underLine" title="밑줄">
                        <i style="text-decoration-line: underline; font-weight: bold;">U</i></button></li>
                  <li><button type="button" id="strikeThrough" class="fontM" value="strikeThrough" title="가로선 삽입">
                        <i style="text-decoration: line-through;">S</i></button></li>
                  <li class="inFontTag">
                     <button type="button" class="btn-1 fs_btn" title="글꼴"> <i class="btn-1"
                           style="font-weight: bold;">A</i>
                        <div class="btn-1" style="float: right; width: auto;"><span class="clickspan"></span>
                        </div>
                     </button>
                     <div class="btn-1 font-style-bar">
                        <ul class="btn-1 uls" style="padding-left: 10px;">


                           <li><button type="button" class="fontM2" id="fontName" value="돋움 ">
                                 <span style="font-family: 돋움 !important;" title="돋움">돋움</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName" value="굴림 ">
                                 <span style="font-family: 굴림 !important;" title="굴림">굴림</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName" value="궁서 ">
                                 <span style="font-family: 궁서 !important;" title="궁서">궁서</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName" value="바탕 ">
                                 <span style="font-family: 바탕 !important;" title="바탕">바탕</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName" value="맑은 고딕 ">
                                 <span style="font-family: 맑은 고딕 !important;" title="맑은 고딕">맑은 고딕</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName"
                                 value="Arial,Helvetica,sans-serif ">
                                 <span style="font-family: Arial,Helvetica,sans-serif !important;" title="Arial">
                                    Arial</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName"
                                 value="Arial Black,Arial Bold,Gadget,Helvetica,sans-serif">
                                 <span style="font-family: Arial Black,Arial Bold,Gadget,Helvetica,sans-serif !important;"
                                    title="Arial Black">Arial Black</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName" value="Georgia,serif ">
                                 <span style="font-family: Georgia,serif !important;" title="Georgia">Georgia</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName"
                                 value="Tahoma,Geneva,sans-serif ">
                                 <span style="font-family: Tahoma,Geneva,sans-serif !important;" title="Tahoma">Tahoma</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName"
                                 value="'Times New Roman',Times,serif ">
                                 <span style="font-family: 'Times New Roman',Times,serif !important;"
                                    title="Times New Roman">Times New
                                    Roman</span>
                              </button></li>

                           <li><button type="button" class="fontM2" id="fontName"
                                 value="Verdana,Geneva,sans-serif ">
                                 <span style="font-family: Verdana,Geneva,sans-serif !important;"
                                    title="Verdana">Verdana</span>
                              </button></li>
                        </ul>
                     </div>

                  </li>
                  <li class="inSizeTag"><button type="button" class="fsz_btn" title="글자 크기"> <i
                           style="font-weight: bold;">T</i>
                        <div style="float: right; width: auto;"><span class="clickspan"></span></div>
                     </button>
                     <div class="font-size-bar">
                        <ul class="uls" style="text-align: center;">
                           <li><button type="button" id="fontSize" class="fontM2" value="1">
                                 <a title="4px">4px</a>
                              </button></li>
                           <li><button type="button" id="fontSize" class="fontM2" value="2">
                                 <a title="8px">8px</a>
                              </button></li>
                           <li><button type="button" id="fontSize" class="fontM2" value="3">
                                 <a title="10px">10px</a>
                              </button></li>
                           <li><button type="button" id="fontSize" class="fontM2" value="4">
                                 <a title="12px">12px</a>
                              </button></li>
                           <li><button type="button" id="fontSize" class="fontM2" value="5">
                                 <a title="16px">16px</a>
                              </button></li>
                           <li><button type="button" id="fontSize" class="fontM2" value="6">
                                 <a title="20px">20px</a>
                              </button></li>
                           <li><button type="button" id="fontSize" class="fontM2" value="7">
                                 <a title="30px">30px</a>
                              </button></li>
                        </ul>
                     </div>

                  </li>
                  <li>
                     <div style="height: 100%;width: 1px; background: #666;"></div>
                  </li>

                  <li><button type="button" id="removeFormat" class="fontM" title="서식 제거" value="removeFormat">
                        <img src="resources/img/11.png" style="width: 20px;"></button></li>

                  <li class="font-C "><button type="button" id="fontColor" class="ftC" title="글자 색" value="black">
                        <img class="tcimg" src="resources/img/33.png" style="width: 20px;"></button>
                         
                     
                     <div class="fontC">
                        <div id="rgbPicker" class="rgbClick"
                           style="position: absolute; margin: 0; display: block;"></div>
                        <div class="rgbClick" style="position: absolute;  height: 30px;">
                         <input type="text" id="hue-demo" class="demo" data-control="hue" value="#ff6161">
                           <!-- <div class="selectC"
                              style=" width: 100px; height: 30px; background: black; float: left;"></div> -->
                           <button type="button" class="ftc-btn" style=" width: 50px;">변경</button>
                        </div>
                     </div> 
                     
                     <div id="rgbValue" style="float: left; display: none;"></div>
                  </li>



                  <li class="textSort"><button type="button" class="ts_btn" title="정렬"> <img class="ts_img"
                           src="resources/img/center.png" style="width: 20px;">

                     </button>
                     <div class="text-sort-bar">
                        <ul class="uls" style="text-align: center;">
                           <li><button type="button" id="justifyCenter" class="fontM" value="justifyCenter"
                                 title="가운데 정렬">
                                 <img src="resources/img/center.png" style="width: 20px;">
                              </button></li>
                           <li><button type="button" id="justifyLeft" class="fontM" value="justifyLeft"
                                 title="왼쪽 정렬">
                                 <img src="resources/img/left.png" style="width: 20px;">
                              </button></li>
                           <li><button type="button" id="justifyRight" class="fontM" value="justifyRight"
                                 title="오른쪽 정렬">
                                 <img src="resources/img/right.png" style="width: 20px;">
                              </button></li>

                        </ul>
                     </div>

                  </li>

                  <li class="intSort"><button type="button" class="is_btn" title="숫자 리스트"> <img class="is_img"
                           src="resources/img/intSort.png" style="width: 20px;">

                     </button>


                     <div class="int-sort-bar">
                        <ul class="uls" style="text-align: left; padding-left: 10px;">

                           <li><button type="button" id="insertorderedList" class="fontM3" value="default">
                                 <a style="font-family: Verdana,Geneva,sans-serif;" title="기본">기본</a>
                              </button></li>
                           <li><button type="button" id="insertorderedList" class="fontM3" value="lower-alpha">
                                 <a style="font-family: Verdana,Geneva,sans-serif;" title="소문자 알파벳">소문자
                                    알파벳</a>
                              </button></li>
                           <li><button type="button" id="insertorderedList" class="fontM3" value="lower-greek">
                                 <a style="font-family: Verdana,Geneva,sans-serif;" title="소문자 그리스어">소문자
                                    그리스어</a>
                              </button></li>
                           <li><button type="button" id="insertorderedList" class="fontM3" value="lower-roman">
                                 <a style="font-family: Verdana,Geneva,sans-serif;" title="소문자 로마자">소문자
                                    로마자</a>
                              </button></li>
                           <li><button type="button" id="insertorderedList" class="fontM3" value="upper-alpha">
                                 <a style="font-family: Verdana,Geneva,sans-serif;" title="대문자 알파벳">대문자
                                    알파벳</a>
                              </button></li>
                           <li><button type="button" id="insertorderedList" class="fontM3" value="upper-roman">
                                 <a style="font-family: Verdana,Geneva,sans-serif;" title="대문자 로마자">대문자
                                    로마자</a>
                              </button></li>
                        </ul>
                     </div>

                  </li>
                  <li><button type="button" id="insertUnorderedList" class="fontM2" value="insertUnorderedList"
                        title="점 리스트">
                        <img src="resources/img/dotList.png" style="width: 15px;"></button></li>

                  <li><button type="button" id="insertHTML" class="fontM2" value="<hr>" title="가로선 삽입">
                        <img src="resources/img/hr.png" style="width: 15px;"></button></li>
                  <li>
                     <div style="height: 100%;width: 1px; background: #666;"></div>
                  </li>
                  <li><button type="button" id="iimg" class="insertImg" value="insertImage" title="이미지 삽입">
                        <img src="resources/img/img.png" style="width: 20px;"></button></li>

                  <li class="inVideo"><button type="button" id="ivideo" class="insertVideo" value="insertHTML"
                        title="동영상 삽입">
                        <img src="resources/img/video.png" style="width: 20px;"></button>
                     <div class="int-video-bar">

                        <input type="text" id="urlInput" style="width: 100%; height: 30px;" placeholder="동영상 url을 입력해주세요.">
                        <button type="button" id="insertURL" class="fontM4" value="default"
                           style="float: right;">
                           <a style="font-family: Verdana,Geneva,sans-serif;" title="입력">입력</a>
                        </button>
                     </div>
                  </li>
                  <!-- <iframe width="640" height="360" src="https://www.youtube.com/embed/UM8_pjQa9pw?&amp;wmode=opaque" ></iframe> -->

               </ul>

            </div>
               <!-- toolbar-->
   <script src="resources/js/toolbar.js"></script>
    
   
</body>
</html>