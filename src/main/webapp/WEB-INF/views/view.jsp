<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/footer/footer.css" />
<link rel="stylesheet" href="resources/css/header/header.css" />
<link rel="stylesheet" href="resources/css/main/main.css" />
</head>
<style>

body{
		margin: 0 auto;
		padding: 0 auto;
	}

	#view_wrap{
	width: 100%;
	height: 100%;
	min-height:100%;
	background-color: #f9f9f9;
	margin: 190px 0px 1px 0px;
	text-align: center;
	}
	
	.title_p{
		font-size: 50px;
		font-weight: bold;
		padding: 50px 0 0 0;
	}
	
	.writer-div{
		margin: 20px 0 272px 0; 
		
	}
	
	.writer-p{
			
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div id="view_wrap">
	<c:if test="${vo ne null }">
		<p class="title_p">${vo.evbbs_title }</p>
		<a>${vo.evbbs_content }</a><br/>
		<div class="writer-div">
		<p class="writer-p">작성자 : ${vo.evbbs_writer }</p>
		</div>
	</c:if>
	<div>
		
		
	</div>
	</div>

	<jsp:include page="footer.jsp"/>
</body>
</html>