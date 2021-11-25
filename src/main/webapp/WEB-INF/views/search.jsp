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
<title>검색결과</title>
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
	height: 1900px;
	background-color: #f9f9f9;
	margin: 190px 0px 1px 0px;
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
	font-size: 21px;
}

.content {
	font-size: 16px;
}

.writer {
	font-size: 10px;
}

.font {
	padding: 0 0 0 10px;
	text-decoration: none;
	color: black;
}

.here {
	text-align: center;
	padding: 40px 0 0 0;
}

.here a:first-child {
	font-size: 40px;
	font-weight: bold;
	margin-top: 50px;
}

.here a:last-child {
	font-size: 25px;
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

a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}

/* paging */
.pageCode {
	width: 100%;
	height: 160px;
	padding: 0px;
	margin: 0px;
	background-color: #f9f9f9;
	text-align: center;
}

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
</style>
<body>
	<jsp:include page="header.jsp" />
	<div class="wrap">

		<div class="here">
			<a>'${searchValue }'에 대한 검색결과 </a></br>
			<a>${totalCount }건</a>
		</div>

		<div class="header-line">
			<div id="contents_wrap">
				<c:forEach items="${search_ar }" var="vo">
					<div class="contents">
						<div class="new-img-container">
							<a href="/view?evbbs_idx=${vo.evbbs_idx }&cPage=${nowPage }"><img
								class="new-img" alt="" src="resources/img/default_img.jpg" /></a>
						</div>
						<h6 class="h5">
							<a class="title font"
								href="/view?evbbs_title=${vo.evbbs_idx }&cPage=${nowPage }">${vo.evbbs_title }</a>
						</h6>
						<div>
							<p class="content font">${vo.evbbs_content }</p>
							<a class="writer font">작성자 : ${vo.evbbs_writer }</a>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>

		<a id="MOVE_TOP_BTN" href="#"><img alt=""
			src="/resources/img/top.png" /></a>

	</div>

	<div class="pageCode">${pageCode }</div>
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