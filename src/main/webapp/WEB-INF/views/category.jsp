<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="resources/css/footer/footer.css" />
<link rel="stylesheet" href="resources/css/header/header.css" />
<link rel="stylesheet" href="resources/css/main/main.css" />
</head>
<style>
body {
	margin: 0 auto;
	padding: 0 auto;
	background-color: #f9f9f9;
}

.wrap {
	width: 100%;
	height: 100%;
	min-height:100%;
	background-color: #f9f9f9;
	margin: 0 0px 0px 0px;
}

.header-line {
	padding: 0px 20px;
	margin: 15px 10px;
	margin-top: 15px;
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

.contents {
	border-radius: 5px;
	width: 30.7%;
	float: left;
	height: 380px;
	margin: 30px 20px;
}

.h5 {
	padding: 0px;
	margin: 5px 0px;
}

.title {
	font-weight: bold;
	font-size: 19px;
}

.content {
	font-size: 15px;
}

.writer {
	font-size: 10px;
}

.font {
	text-decoration: none;
	color: black;
}

.here {
	text-align: center;
	padding: 40px 0 0 0;
}

.here a {
	font-size: 40px;
	font-weight: bold;
	margin-top: 50px;
}

.on-top {
	border: 1px solid black;
	border-radius: 5px;
	width: 30px;
	height: 30px;
	display: inline-block;
	position: absolute;
	right: 0;
	bottom: 0;
}

#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}

#MOVE_TOP_BTN img{
	border-radius:10px;
}

/* paging */

.paging {
	list-style: none;
	margin: 0 auto;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.paging li {
	float: left;
	border-radius: 15px;
	margin-left: 8px;
}

.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid silver;
	color: #2f313e;
	font-weight: bold;
	text-decoration: none;
	border-radius: 15px;
	color: silver;
}

.paging li a:hover {
	background: #85c4b9;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #85c4b9;
	background: #85c4b9;
	color: white;
	font-weight: bold;
}

.category {
	text-align: center;
	margin: 30px 0;
}

.category a {
	padding: 0px 20px;
	text-decoration: none;
	border: none;
	background-color: #efefef;
	color: black;

	
}

.paging-div{
	position: relative;
    width: 100%;
    height: auto;
    bottom: 0;
    left: 0;
    display: inline-block;
    text-align: center;
}	
</style>
<body>
	<jsp:include page="header.jsp" />
	<div class="wrap">
	<article>
		<div class="here">
			<a>${nowCategory.evcategory_name }</a>
		</div>
		<div class="category">
			<c:set var="big_name" value="${nowCategory.evcategory_name }" />

			<c:forEach items="${categoryName_ar }" var="vo">
				<c:if test="${vo.evcategory_name ne big_name}">
					<a href="/category?evcategory_idx=${vo.evcategory_idx }">${vo.evcategory_name }</a>
				</c:if>
			</c:forEach>

		</div>

		<div class="header-line">
			<div id="contents_wrap">
				<c:forEach items="${paging_ar }" var="vo">
					<div class="contents">
						<div class="new-img-container">
							<a href="/view?evbbs_idx=${vo.evbbs_idx }&cPage=${nowPage }"><img
								class="new-img" alt="" src="resources/img/default_img.jpg" /></a>
						</div>
						<h6 class="h5">
							<a class="title font"
								href="/view?evbbs_idx=${vo.evbbs_idx }&cPage=${nowPage }">${vo.evbbs_title }</a>
						</h6>
						<div>
							<p class="content font">${vo.evbbs_content }</p>
							<a class="writer font">작성자 : ${vo.evbbs_writer }</a>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>

		<a id="MOVE_TOP_BTN" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#33CCFF" class="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
  <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0z"/>
</svg></a>
	<div class="paging-div">${pageCode }</div>
	</article>
	</div>

	
	<jsp:include page="footer.jsp" />
</body>

<script>
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
			}, 400);
			return false;
		});
	});
</script>

</html>