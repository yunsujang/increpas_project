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
	.newContents {
		width: 100%;
		height: auto;
		min-height:auto;
		float: left;
		padding: 20px 0 20px 0;
	}
	
	.contents {
	border-radius: 5px;
	width: 30%;
	float: left;
	height: auto;
	min-height:auto;
	margin: 5px 20px 100px 20px;
}

.h5 {
	padding: 0px;
	margin: 5px 0px;
}

.title {
	font-weight: bold;
	font-size: 19px;
	color: black;
	text-decoration: none;
}

.content {
	font-size: 15px;
}

.writer {
	font-size: 10px;
}

.new-img-container {
	width: 100%;
	height: 260px;
}

.new-img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
}

.a-lastUpdate{
	padding: 0 0 0 25px;
	font-size: 10px;
	color: gray;
	font-weight: bold;
}

.a-six{
	font-size: 12px;
	color: gray;
	text-decoration: none;
	padding: 0 0 0 25px;
	font-weight: bold;
}

.header_banner{
	border: 1px solid black;
	text-align: center;
	width: auto;
	height: 190px;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="wrap">
		
		<div class="header_banner">
			<a>배너</a>
		</div>
		
		<div class="newContents">
		<a class="a-lastUpdate">LAST UPDATE</a></br>
			<c:forEach items="${last_ar }" var="vo">
				<div>
					<div class="contents">
						<div class="new-img-container">
							<a href="/view?evbbs_idx=${vo.evbbs_idx }"><img
								class="new-img" alt="" src="resources/img/default_img.jpg" /></a>
						</div>
							<a class="title font"
								href="/view?evbbs_idx=${vo.evbbs_idx }">${vo.evbbs_title }</a>
						<div>
							<p class="content font">${vo.evbbs_content }</p>
							<a class="writer font">작성자 : ${vo.evbbs_writer }</a>
						</div>
					</div>
				</div>
				</c:forEach>
		</div>
	</div>
	<a id="MOVE_TOP_BTN" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#006699" class="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
  <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0z"/>
</svg></a>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	 $(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 500) {
	                $('#MOVE_TOP_BTN').fadeIn();
	            } else {
	                $('#MOVE_TOP_BTN').fadeOut();
	            }
	        });
	        
	        $("#MOVE_TOP_BTN").click(function() {
	            $('html, body').animate({
	                scrollTop : 0
	            },  400);
	            return false;
	        });
	    });
	</script>
</body>
</html>
