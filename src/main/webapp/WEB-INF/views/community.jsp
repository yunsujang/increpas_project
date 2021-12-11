<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<link rel="stylesheet" href="resources/css/main/main.css">
<title>Home</title>
<style type="text/css">
#wrap {
	width: 100%;
	height:1800px;
	background-color: #f9f9f9;
	margin: 190px 0px 0px 0px;
}

body{ 
		margin: 0 auto;
		padding: 0 auto;
	}
	 
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="wrap">
		<h1>커뮤니티</h1>
		<hr style="border: 1px solid red;"/>
	
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
