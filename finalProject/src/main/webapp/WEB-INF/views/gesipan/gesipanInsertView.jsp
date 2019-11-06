<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#insertField {
	background: white;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="my-panel" style="height:1000px;">
		<div class="col-md-10 col-md-offset-1"  style="margin: 0; width: 100%;">
			<div class="contact-wrap" style="height:100%;">
				<form style="height: 100%;" action="#" id="insertForm" method="post" enctype="multipart/form-data">
					<div class="container">
						<div class="row content" style="background:whitesmoke;">
							<span id="titlespan" style="font-weight:bold">게시글작성</span>&nbsp;
							<span id="titlespan" class="locked" style="visibility:hidden; font-size:12px;">문의사항 게시글은 비밀글 설정이 가능합니다  [비밀글 설정]</span><input class="locked" type="checkbox" name="locked" style="visibility:hidden"/>
							<script>
							</script>
							<div class="category" style="float:right;">
								<label for="category">카테고리설정</label>
								<select id="category">
									<option value="Community">커뮤니티</option>
									<option value="Selling">삽니다</option>
									<option value="QNA">문의사항</option>
								</select><br>
							</div>
							<br><br>
							<div class="row form-group">
								<div class="col-md-6 padding-bottom">
									<label for="fname">게시글 제목</label> 
									<input type="text" id="fname" name="g_title"
										class="form-control" placeholder="게시글 제목을 입력하세요." required>
								</div>
								<div class="col-md-6 padding-bottom">
									<label for="fname">작성자</label> 
									<input type="text" id="fname"
										class="form-control" name="g_writer" <%-- value="${session.user_id}"  --%> readonly>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="message">게시글 내용</label>
									<c:import url="/WEB-INF/views/common/toolbar.jsp" />
									<div id="insertField" contenteditable="true"
										style="width: 100%; min-height: 400px; border: 1px solid whitesmoke;">
									</div>
								</div>
							</div>
							<div class="form-group text-center">
								<input type="button" value="게시글 작성하기" onclick="submit();" class="btn btn-primary">
							</div>
							<input type="hidden" id="contentInput" name="g_content">
						</div>
					</div>
				</form>
				
				<form id="imgAjax" method="post" enctype="multipart/form-data">
					<ul id="ImgInputs" style="display: none;">
						<li><input type='file' name='trImgFile' id='trImgFile'
							accept="image/*" onchange="TintsetImg(this);" /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			var cateVal = '${category}';
			$('#category').val(cateVal).prop("selected", true);
			
			$('#category').change(function(){
				
				if($('#category').val() == 'QNA'){
					$('.locked').css('visibility','visible');
				} else {
					$('.locked').css('visibility','hidden');
				}
			});
		});
		
		function submit() {
			$('#contentInput').val(document.getElementById('insertField').innerHTML);
			console.log($('#contentInput').val());
			console.log($('#locked').val());
			$('#insertForm').submit();
		}
	
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>