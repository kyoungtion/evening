<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Oops!</title>



</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="my-panel" style="height: 1000px;">
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 100%;">
			<div class="contact-wrap" style="height: 100%;">

				<div class="container">
					<div class="row content" style="background: whitesmoke; text-align:center;">

						
						<h4>${ message }</h4>
						<h5>" ${ requestScope['javax.servlet.error.status_code'] } "</h5>
						<h6>${ requestScope['javax.servlet.error.exception_type'] }</h6>
						<h6>${ requestScope['javax.servlet.error.message'] }</h6>
						<h6>${ requestScope['javax.servlet.error.request_uri'] }</h6>
						<button class="btn btn-default" onclick="location.href='home.do'">시작페이지로 돌아가기</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript" async=""
		src="https://www.google-analytics.com/analytics.js"></script>
	<script async=""
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"
		type="text/javascript"></script>
	<script type="text/javascript">
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>
</body>
</html>