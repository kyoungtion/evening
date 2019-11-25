<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet' type='text/css'>
<link href="https://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<style>
/* generic */
 body {
    color: #3F3F3F;
    font-family:'Droid Sans', Tahoma, Arial, Verdana sans-serif;
    font-size:16px;
    background:#3F3F3F;
}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
    display: block;
}
h1 {
    font-family:'Questrial', Verdana, sans-serif;
    text-align:center;
    font-size:40px;
    padding:0;
    margin:0 0 20px 0;
    position:relative;
    color:#8C8C8C;
}
/** have a nice ampersand **/
 h1:after {
    font-size:25px;
    color:#D6CFCB;
    content:'&';
    text-align:center;
    display:block;
    width:100%;
    font-family:'Alice', Verdana, serif;
    text-shadow: 0px 1px 0px #fff;
}
/** create the gradient bottom **/
 h1:before {
    position:absolute;
    bottom:15px;
    content:' ';
    text-align:center;
    display:block;
    height:2px;
    width:100%;
    background: -moz-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(182, 180, 180, 0.7) 42%, rgba(180, 178, 178, 0) 43%, rgba(168, 166, 166, 0) 50%, rgba(180, 178, 178, 0) 57%, rgba(182, 180, 180, 0.7) 58%, rgba(238, 237, 237, 0.3) 90%, rgba(255, 255, 255, 0) 100%);
    /* FF3.6+ */
    background: -webkit-gradient(linear, left top, right top, color-stop(0%, rgba(255, 255, 255, 0)), color-stop(42%, rgba(182, 180, 180, 0.7)), color-stop(43%, rgba(180, 178, 178, 0)), color-stop(50%, rgba(168, 166, 166, 0)), color-stop(57%, rgba(180, 178, 178, 0)), color-stop(58%, rgba(182, 180, 180, 0.7)), color-stop(90%, rgba(238, 237, 237, 0.3)), color-stop(100%, rgba(255, 255, 255, 0)));
    /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(182, 180, 180, 0.7) 42%, rgba(180, 178, 178, 0) 43%, rgba(168, 166, 166, 0) 50%, rgba(180, 178, 178, 0) 57%, rgba(182, 180, 180, 0.7) 58%, rgba(238, 237, 237, 0.3) 90%, rgba(255, 255, 255, 0) 100%);
    /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(182, 180, 180, 0.7) 42%, rgba(180, 178, 178, 0) 43%, rgba(168, 166, 166, 0) 50%, rgba(180, 178, 178, 0) 57%, rgba(182, 180, 180, 0.7) 58%, rgba(238, 237, 237, 0.3) 90%, rgba(255, 255, 255, 0) 100%);
    /* Opera 11.10+ */
    background: -ms-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(182, 180, 180, 0.7) 42%, rgba(180, 178, 178, 0) 43%, rgba(168, 166, 166, 0) 50%, rgba(180, 178, 178, 0) 57%, rgba(182, 180, 180, 0.7) 58%, rgba(238, 237, 237, 0.3) 90%, rgba(255, 255, 255, 0) 100%);
    /* IE10+ */
    background: linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(182, 180, 180, 0.7) 42%, rgba(180, 178, 178, 0) 43%, rgba(168, 166, 166, 0) 50%, rgba(180, 178, 178, 0) 57%, rgba(182, 180, 180, 0.7) 58%, rgba(238, 237, 237, 0.3) 90%, rgba(255, 255, 255, 0) 100%);
    /* W3C */
}
/* Here comes to good stuff : content styling */
 #content {
    position:relative;
    margin:50px auto;
    width:400px;
    min-height:200px;
    z-index:100;
    padding:30px;
    border:1px solid #383838;
    /* My stipped background */
    background: #D1D1D1;
    /* Old browsers */
    background: -moz-repeating-linear-gradient(-45deg, #EFC1CB, #EFC1CB 30px, #F2F2F2 30px, #F2F2F2 40px, #C2E8F5 40px, #C2E8F5 70px, #F2F2F2 70px, #F2F2F2 80px);
    /* FF3.6+ */
    background: -webkit-repeating-linear-gradient(-45deg, #EFC1CB, #EFC1CB 30px, #F2F2F2 30px, #F2F2F2 40px, #C2E8F5 40px, #C2E8F5 70px, #F2F2F2 70px, #F2F2F2 80px);
    /* FF3.6+ */
    background: -o-repeating-linear-gradient(-45deg, #EFC1CB, #EFC1CB 30px, #F2F2F2 30px, #F2F2F2 40px, #C2E8F5 40px, #C2E8F5 70px, #F2F2F2 70px, #F2F2F2 80px);
    /* FF3.6+ */
    background: repeating-linear-gradient(-45deg, #EFC1CB, #EFC1CB 30px, #F2F2F2 30px, #F2F2F2 40px, #C2E8F5 40px, #C2E8F5 70px, #F2F2F2 70px, #F2F2F2 80px);
    /* FF3.6+ */
    /*border-radius*/
    -webkit-border-radius:8px;
    -moz-border-radius:8px;
    border-radius:8px;
    /*box-shadow*/
    -webkit-box-shadow:0px 1px 6px #3F3F3F;
    -moz-box-shadow:0px 1px 6px #3F3F3F;
    box-shadow:0px 1px 6px #3F3F3F;
}
/** my "fake" background that will hover the stripes **/
 #content:after {
    background:#F9F9F9;
    margin:10px;
    position: absolute;
    content :" ";
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    z-index: -1;
    border:1px #E5E5E5 solid;
    /*border-radius*/
    -webkit-border-radius:8px;
    -moz-border-radius:8px;
    border-radius:8px;
}
/*** form styling **/

/** we remove the red glow around required fields since we are already using the red star */
 input:required, textarea:required {
    -moz-box-shadow:none;
    -webkit-box-shadow:none;
    -o-box-shadow:none;
    box-shadow:none;
}
/** inputs and textarea**/
 input:not([type="submit"]), textarea {
    outline:none;
    display:block;
    width:380px;
    padding:4px 8px;
    border:1px dashed #DBDBDB;
    color:#3F3F3F;
    font-family:'Droid Sans', Tahoma, Arial, Verdana sans-serif;
    font-size:14px;
    /*border-radius*/
    -webkit-border-radius:2px;
    -moz-border-radius:2px;
    border-radius:2px;
    /*transition*/
    -webkit-transition:background 0.2s linear, box-shadow 0.6s linear;
    -moz-transition:background 0.2s linear, box-shadow 0.6s linear;
    -o-transition:background 0.2s linear, box-shadow 0.6s linear;
    transition:background 0.2s linear, box-shadow 0.6s linear;
}
input:not([type="submit"]):active, textarea:active, input:not([type="submit"]):focus, textarea:focus {
    background:#F7F7F7;
    border:dashed 1px #969696;
    /*box-shadow*/
    -webkit-box-shadow:2px 2px 7px #E8E8E8 inset;
    -moz-box-shadow:2px 2px 7px #E8E8E8 inset;
    box-shadow:2px 2px 7px #E8E8E8 inset;
}
input:not([type="submit"]) {
    height: 20px;
}
/* placeholder */
 ::-webkit-input-placeholder {
    color:#BABABA;
    font-style:italic;
}
input:-moz-placeholder, textarea:-moz-placeholder {
    color:#BABABA;
    font-style:italic;
}
textarea {
    min-height:150px;
    resize:vertical
}
/** labels**/

/** adding our icon font !! */
 .iconic:before {
    font-size:25px;
    font-family:'Alice', Verdana, serif;
}
.iconic.link:before {
    content:'/';
}
.iconic.quote-alt:before {
    content:"'";
}
.iconic.comment:before {
    content:"q";
}
.iconic.user:before {
    content:"u";
}
.iconic.mail-alt:before {
    content:"M";
}
label {
    color:#7F7E7E;
    -webkit-transition: color 1s ease;
    -moz-transition: color 1s ease;
    transition: color 1s ease;
}
label:hover {
    color:#191919;
}
label:before {
    color:#C1BFBD;
    -webkit-transition: color 1s ease;
    -moz-transition: color 1s ease;
    transition: color 1s ease;
}
label:hover:before {
    color:#969696;
    -webkit-transition: color 1s ease;
    -moz-transition: color 1s ease;
    transition: color 1s ease;
}
p {
    margin-bottom:20px;
}
.indication {
    color:#878787;
    font-size:12px;
    font-style:italic;
    text-align:right;
    padding-right:10px;
}
.required {
    color:#E5224C;
}
/** Styling the send button **/
 input[type=submit] {
    margin-left:235px;
    cursor:pointer;
    background:none;
    border:none;
    font-family:'Alice', serif;
    color:#767676;
    font-size:18px;
    padding:10px 4px;
    border:1px solid #E0E0E0;
    text-shadow: 0px 1px 1px #E8E8E8;
    background: rgb(247, 247, 247);
    background: -moz-linear-gradient(top, rgba(247, 247, 247, 1) 1%, rgba(242, 242, 242, 1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(1%, rgba(247, 247, 247, 1)), color-stop(100%, rgba(242, 242, 242, 1)));
    background: -webkit-linear-gradient(top, rgba(247, 247, 247, 1) 1%, rgba(242, 242, 242, 1) 100%);
    background: -o-linear-gradient(top, rgba(247, 247, 247, 1) 1%, rgba(242, 242, 242, 1) 100%);
    background: -ms-linear-gradient(top, rgba(247, 247, 247, 1) 1%, rgba(242, 242, 242, 1) 100%);
    background: linear-gradient(top, rgba(247, 247, 247, 1) 1%, rgba(242, 242, 242, 1) 100%);
    /*border-radius*/
    -webkit-border-radius:5px;
    -moz-border-radius:5px;
    border-radius:5px;
    /*box-shadow*/
    -webkit-box-shadow:0px 1px 1px #FFF inset, 0 0 0px 5px #EAEAEA;
    -moz-box-shadow:0px 1px 1px #FFF inset, 0 0 0px 5px #EAEAEA;
    box-shadow:0px 1px 1px #FFF inset, 0 0 0px 5px #EAEAEA;
    /*transition*/
    -webkit-transition:all 0.2s linear;
    -moz-transition:all 0.2s linear;
    -o-transition:all 0.2s linear;
    transition:all 0.2s linear;
}
input[type=submit]:hover {
    color:#686868;
    border-color: #CECECE;
    background: rgb(244, 244, 244);
    background: -moz-linear-gradient(top, rgba(244, 244, 244, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(244, 244, 244, 1)), color-stop(100%, rgba(242, 242, 242, 1)));
    background: -webkit-linear-gradient(top, rgba(244, 244, 244, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: -o-linear-gradient(top, rgba(244, 244, 244, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: -ms-linear-gradient(top, rgba(244, 244, 244, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: linear-gradient(top, rgba(244, 244, 244, 1) 0%, rgba(242, 242, 242, 1) 100%);
    /*box-shadow*/
    -webkit-box-shadow:0px 1px 1px #FFF inset, 0 0 0px 5px #E0E0E0;
    -moz-box-shadow:0px 1px 1px #FFF inset, 0 0 0px 5px #E0E0E0;
    box-shadow:0px 1px 1px #FFF inset, 0 0 0px 5px #E0E0E0;
}
input[type=submit]:active, input[type=submit]:focus {
    position:relative;
    top:1px;
    color:#515151;
    background: rgb(234, 234, 234);
    background: -moz-linear-gradient(top, rgba(234, 234, 234, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(234, 234, 234, 1)), color-stop(100%, rgba(242, 242, 242, 1)));
    background: -webkit-linear-gradient(top, rgba(234, 234, 234, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: -o-linear-gradient(top, rgba(234, 234, 234, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: -ms-linear-gradient(top, rgba(234, 234, 234, 1) 0%, rgba(242, 242, 242, 1) 100%);
    background: linear-gradient(top, rgba(234, 234, 234, 1) 0%, rgba(242, 242, 242, 1) 100%);
    /*box-shadow*/
    -webkit-box-shadow:0px -1px 1px #FFF inset, 0 0 0px 5px #E0E0E0;
    -moz-box-shadow:0px -1px 1px #FFF inset, 0 0 0px 5px #E0E0E0;
    box-shadow:0px -1px 1px #FFF inset, 0 0 0px 5px #E0E0E0;
}
</style>
</head>
<body>
<div id="content">
    <h1>상세보기</h1>

    <form action="" method=POST autocomplete="on" id="form">
        <p>
            <label for="username" class="icon-user" id="username"> 받는 사람
               
            </label>
            
        </p>
        <p>
            <label for="title" class="icon-bullhorn"> 제목
            	
            </label>
           
        </p>

        <p>
            <label for="message" class="icon-comment"> 내용
              
            </label>
            <textarea placeholder="내용" required="required" id="subject" name="subject"></textarea>
        </p>
        <p class="indication" style="float: right;">
      
       

    </form>
</div>
<script type="text/javascript">

</script>
</body>
</html>