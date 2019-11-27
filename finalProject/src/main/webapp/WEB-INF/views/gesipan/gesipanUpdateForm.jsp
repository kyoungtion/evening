<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 거래, 경매는 이브닝</title>
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
			<div class="contact-wrap" style="height:100%; background:whitesmoke!important">
				<form style="height: 100%;" action="gUpdate.ge" id="insertForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="page" value="${ page }">
					<input type="hidden" name="g_id" value="${ g.g_id }">
					<c:if test="${ !empty viewName  }">
						<input type="hidden" name="viewName" value="${ viewName }">
					</c:if>
					<div class="container">
						<div class="row content" style="background:whitesmoke;">
							<span id="titlespan1" style="font-weight:bold">게시글 수정</span>&nbsp;
							<span id="titlespan1" class="locked" style="visibility:hidden; font-size:12px;">문의사항 게시글은 비밀글 설정이 가능합니다  [비밀글 설정] </span><input class="locked" id="lockedCheck" type="checkbox" style="visibility:hidden;">
							<input type="number" id="g_pwd" name="g_pwd" class="locked" style="visibility:hidden; height:18px;">
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
									<font class="displaynone" id="gtext">${ g.g_title }</font>
									<input type="text" id="fname" name="g_title"
										class="form-control" placeholder="게시글 제목을 입력하세요." required>
								</div>
								<div class="col-md-6 padding-bottom">
									<label for="fname">작성자</label> 
									<input type="text" id="fname"
										class="form-control" name="g_writer" value="${ g.g_writer }"  readonly>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label for="message">게시글 내용</label>
									<c:import url="/WEB-INF/views/common/toolbar.jsp" />
									<div id="insertField" contenteditable="true"
										style="width: 100%; min-height: 400px; border: 1px solid whitesmoke;">
										${ g.g_content }
									</div>
								</div>
							</div>
							<div class="form-group text-center">
								<input type="button" value="게시글 수정완료" onclick="updateGesipan();" class="btn btn-primary">
							</div>
							<input type="hidden" id="contentInput" name="g_content">
							<input type="hidden" id="g_category" name="g_category">
							<c:if test="${g.locked eq 'Y' }">
								<input type="hidden" id="locked" name="locked" value="Y">
							</c:if>
							<c:if test="${g.locked eq 'N' }">
								<input type="hidden" id="locked" name="locked" value="N">
							</c:if>
							<c:if test="${!empty g.g_pwd }">
								<input type="hidden" id="g_pwd_value" value="${ g.g_pwd }">
							</c:if>
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
			var cateVal = '${g.g_category}';
			$('#category').val(cateVal).prop("selected", true);
			
			$('#g_category').val(cateVal);
			
			if($('#category').val() == 'QNA'){
				$('.locked').css('visibility','visible');
				
			} else if($('#category').val() != 'QNA'){
				$('.locked').css('visibility','hidden');
				
			}
			console.log($('#g_category').val());
			
			$('#category').change(function(){
				
				if($('#category').val() == 'QNA'){
					$('.locked').css('visibility','visible');
				} else {
					$('.locked').css('visibility','hidden');
				}
				$('#g_category').val($('#category').val());
				console.log($('#g_category').val());
			});
			
			//잠금인 경우
			if('${g.locked}' == 'Y'){
				$('#lockedCheck').prop('checked', true);
			} else {
				$('#lockedCheck').prop('checked', false);
			}
			
			// 비번 있는 경우
			if('${g.g_pwd}' != ""){
				$('#g_pwd').val('${g.g_pwd}');
			} else {
				$('#g_pwd').val($('#g_pwd_value').val());
			}
			
			$('#lockedCheck').change(function(){
				if($('#lockedCheck').is(':checked') != true){
					$('#locked').val('N');
					$('#g_pwd').val("");
					$('#g_pwd').removeAttr('required');
					console.log($('#g_pwd').prop('required'));	
				} else if($('#lockedCheck').is(':checked') == true) {
					$('#locked').val('Y');
					$('#g_pwd').prop("required", true);
					console.log($('#g_pwd').prop('required'));	
				}
			});
			
		});
		
		
		function updateGesipan() {
			if($('#lockedCheck').prop('checked') == true && $('#g_pwd').val() == ""){
				alert('비밀번호를 입력해주세요.');				
			} else if($('#lockedCheck').prop('checked') == false && $('#g_pwd').val() != ""){
				alert('비밀글 설정이 체크되어 있지 않습니다.');
			} else {
				$('#contentInput').val(document.getElementById("insertField").innerHTML);
				$('#insertForm').submit();
			}
			
		}
		
		$(function(){
			var gtext = $('#gtext').html().replace(/<(\/span|span)([^>]*)>/gi,"");
			$('#fname').val(gtext);
		})
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>