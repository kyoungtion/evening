<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<style type="text/css">
	#tb{margin: auto; width: 700px; border-collapse: collapse;}
	#tb tr td{padding: 5px;}
	#buttonTab{border-left: hidden; border-right: hidden;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	
	<h1 align="center">결제 내역 목록</h1>
	
	<h3 align="center">총 결제 내역 수 : ${ pai.listCount }</h3>
	

</body>
</html>