<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
	<title>�߰� �ŷ� �Խ���</title>
	</head>
	<body>
	
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		
	<div class="colorlib-loader"></div>

	<div id="page">

		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">
						<div class="row row-pb-lg">
						
						<button class="btn btn-primary btn-outline"style="float: right; margin: 0px 50px 0 0px;"
							onclick="location.href='insertF.bo?type=1';">�۾���</button>
						
						<h2><span style="font-size: 50px;">�߰� �ŷ� �Խ���</span></h2>
						
						<!-- ��ǰ ����Ʈ -->
						<c:if test="${ fn:length(alist) > 0 }">
						
							<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
								<div class="col-md-4 text-center">
									<div class="product-entry">
									
										<!-- �̹��� ���� : �̹��� ������ �������Ͻ� ù��° �̸��� ��� -->
										<c:forEach var="j" items="${ af }" begin="0" end="${ fn:length(af) }">
											<c:if test="${ j.SG_ID eq i.SG_ID }">
												<c:forTokens items="${ j.RENAMEFILENAME }" delims="," varStatus="jStatus">
													<c:if test="${ jStatus.first }">
														<c:set var="k" value="${ jStatus.current }" />
													</c:if>
												</c:forTokens>
											</c:if>
										</c:forEach>
										<div class="product-img" style="background-image: url(resources/thumbnail/${ k })">
										
										<!-- ������ ������ ��Ÿ�� ����ǥ�� -->
										<c:remove var="k"/>
										
										<!-- �׽�Ʈ�� ( ��¥ ��� )  -->
											<jsp:useBean id="now" class="java.util.Date"/>
											<fmt:parseDate var="enroll" value="${ i.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
											<fmt:parseDate var="end" value="${ i.SG_END_DATE }" pattern="yyyy-MM-dd"/>
											
											<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
											<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>

												<p class="tag">
													<c:if test="${ ( nowDays - enrollDays ) <= 7 }">
														<span class="new">New</span>
													</c:if>
												</p>

												<div class="cart">
													<p> <!-- ���ƿ� �κ� -->
														<span><a onclick="return false;" id="clickLike${ i.SG_ID }"><i class="" id="clickTest${ i.SG_ID }"></i><span id="likeCount${ i.SG_ID }">${ i.SG_LIKE }</span></a></span>
														<input type="text" id="Check${ i.SG_ID }" value="false" hidden="hidden" >
														<input type="text" id="CountCheck${ i.SG_ID }" value="false" hidden="hidden" >
														<script>
														
														$(function(){
														  $.ajax({
														    url:"selectLikeCheck.bo",
														    data:{
														      user_Id : "${ loginUser.user_id}",
														      sgId : "${ i.SG_ID}"
														    },success: function(data){
														      if(data.result == 1){
														        $('#clickTest${ i.SG_ID }').attr('class','icon-heart3');
														        $('#clickTest${ i.SG_ID }').css('font-size','16px');
														        $('#Check${ i.SG_ID }').val(true);
														        $('#CountCheck${ i.SG_ID }').val(true);
														      }else if(data.result == 0){
														        $('#clickTest${ i.SG_ID }').attr('class','icon-heart2');
														        $('#clickTest${ i.SG_ID }').css('font-size','13px');
														        $('#Check${ i.SG_ID }').val(data.check);
														        $('#CountCheck${ i.SG_ID }').val(false);
														      }
														    }
														  });
														});
														// ���ƿ� �������� �̺�Ʈ
															$('#clickLike${ i.SG_ID }').on('click',function(){
															  var userCheck = "${loginUser.user_id}";
															  
															  if(userCheck.length > 0){
																  $.ajax({
																    url: "selectLike.bo",
																    data: {
																      user_Id : "${ loginUser.user_id }",
																      sgId : "${ i.SG_ID }",
																      likeCheck : $('#Check${ i.SG_ID }').val()
																    },
																    success: function(data){
																      if(data == 1){
																        $('#clickTest${ i.SG_ID }').attr('class','icon-heart3');
																        $('#clickTest${ i.SG_ID }').css('font-size','16px');
																        if( $('#CountCheck${ i.SG_ID}').val() == 'false' ){
																	    	$('#likeCount${ i.SG_ID }').html("${ i.SG_LIKE + 1}");
																        }else{
																        	$('#likeCount${ i.SG_ID }').html("${ i.SG_LIKE}");
																        }
																      }else if(data == 0){
																        $('#clickTest${ i.SG_ID }').attr('class','icon-heart2');
																        $('#clickTest${ i.SG_ID }').css('font-size','13px');
																        if( $('#CountCheck${ i.SG_ID}').val() == 'true' ){
																        	$('#likeCount${ i.SG_ID }').html("${ i.SG_LIKE - 1}");
																        }else{
																	        $('#likeCount${ i.SG_ID }').html("${ i.SG_LIKE }");
																        }
																      }
																    }
																  });
															  }
															});
														</script>
													</p>
												</div>
												
										</div>
										
										<div class="desc">
											<h3><a onclick="oneClick(${i.SG_ID});" style="cursor: pointer;">${ i.SG_BNAME }</a></h3>
											<p class="price">����<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
										</div>
										
									</div>
								</div>
							</c:forEach>
						</c:if>
							
						</div>
						
						<div class="row"> <!-- ������ �̵� ��(����¡ ó��) -->
							<div class="col-md-12">
								<ul class="pagination">
									<!-- ���� ������ -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a>&laquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="secondgoodList.bo">	
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<li><a href="${ before }">&laquo;</a></li>
									</c:if>
									
									<!-- ������ -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="secondgoodList.bo">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									
									<!-- ���� ������ -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">&raquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="secondgoodList.bo">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<li><a href="${ after }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						
					</div>
					
					<div class="col-md-2 col-md-pull-10">
						<div class="sidebar"> <!-- ���̵�� -->
							<div class="side"> <!-- side �ϳ��� �����̵�� ĭ �Ѱ��� �߰��� -->
								<h2>���� ����</h2>
								<div class="fancy-collapse-panel">
			                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			                     
			                     
			                     <c:url var="recentList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="recent"/>
			                     </c:url>
			                     <c:if test="${ modeSet eq 'recent' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ recentList }" style="color: white;">�ֱ� ��ϼ�</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'recent' }">
				                     <div><a href="${ recentList }">�ֱ� ��ϼ�</a></div>
			                     </c:if>
			                     
			                     <c:url var="priceAscList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="priceAsc" />
			                     </c:url>
			                      <c:if test="${ modeSet eq 'priceAsc' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ priceAscList }" style="color: white;">���� ������ ��</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'priceAsc' }">
			                     	<div><a href="${ priceAscList }">���� ������ ��</a></div>
			                     </c:if>
			                     
			                     <c:url var="priceDescList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="priceDesc"/>
			                     </c:url>
			                      <c:if test="${ modeSet eq 'priceDesc' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ priceDescList }" style="color: white;">���� ������ ��</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'priceDesc' }">
			                     	<div><a href="${ priceDescList }">���� ������ ��</a></div>
			                     </c:if>
			                     
			                     <c:url var="CountList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="CountList" />
			                     </c:url>
			                     <c:if test="${ modeSet eq 'CountList' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ CountList }" style="color: white;">��ȸ��</a></div>
			                     </c:if>
			                     
			                     <c:if test="${ modeSet ne 'CountList' }">
			                     	<div><a href="${ CountList }">��ȸ��</a></div>
			                     </c:if>
			                     
			                     <br>
			                     <div style="font: bolder; font-size: 15px;">�� ��ǰ �� : ${ pi.listCount }</div>
			                     
			                  </div>
			               </div>
						</div>

							<div class="side">
							<!-- �ֱٿ� �� ��ǰ�� : ��Ű��� �̿� , �ð����� 5��(�������), ȸ���� ����, ��ȸ���� �̿�Ұ� ��� -->
								<h2>�ֱٿ� �� ����</h2>
								<script>
								$(function(){
								  
								  setTimeout(function(){
								   location.reload(); 
								  },5000);
								  
								});
								</script>
								<%
									Cookie[] cookies = request.getCookies();
								
									for(Cookie co : cookies){
									  if(co.getName().contains("history")){
									    %>
									    <c:forTokens var="coo" items="<%= co.getName() %>" delims="_"  varStatus="Status">
									    	<c:if test="${ coo eq loginUser.user_id }">
									    		<c:set var="coValue" value="<%= co.getValue() %>"/>
									    		<!-- �̹��� ����(�Խ��� ���̺�, �̹������̺�) -->
									    		<c:forEach var="j" items="${ af }" begin="0" end="${ fn:length(af) }">
									    			<c:if test="${ j.SG_ID eq coValue }">
									    				<c:forEach var="i" items="${ allList }" begin="0" end="${ fn:length(allList) }">
															<c:if test="${ j.SG_ID eq i.SG_ID }">										    					
													    		<div>
														    		<c:url var="detailView" value="selectOne.bo">
									                                    <c:param name="sgId" value="${ i.SG_ID }"/>
									                                </c:url>
														    		<img src="/evening/resources/thumbnail/${ j.RENAMEFILENAME }" style="width: 50px; height: 50px;">
														    		<a href="${ detailView }" style="cursor: pointer;"> ${ i.SG_BNAME }</a> 
													    		</div>
												    		<br>
												    		</c:if>
									    				</c:forEach>
									    			</c:if>									    		
												</c:forEach>
									    	</c:if>
									    </c:forTokens>
									    <%
									  }
									}
								%>
							</div>
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function oneClick(sgId){
		location.href='selectOne.bo?sgId='+sgId;
		}
	</script>
		
	<c:import url="/WEB-INF/views/common/footer.jsp"/>

	</body>
</html>

