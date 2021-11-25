<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/footer/footer.css" />
<link rel="stylesheet" href="resources/css/header/header.css" />
</head>
<style>

body{
	text-align: center;
	}

.title_p {
	font: 24px;
	font-weight: normal;
}

.date {
	font-size: 12px;
}

.wrap {
	width: 50%;
	height: 100%;
	min-height: 100%;
	margin: 250px auto 250px auto;
	text-align: center;
}

.writer-div {
	margin: 100px 0 50px 0;
}

.writer-div p{
	font-size: 13px;
	font-weight: bold;
}


.pre-page {
	margin: 0 0 0 100px;
	float: left;
}

.next-page {
	float: right;
	margin: 0 100px 0 0;
}

.content-wrap {
	text-align:center;
	height: 100%;
	min-height: 100%;
}

.go-page p {
	font-size: 10px;
}

.go-page a {
	font-size: 13px;
	font-weight: bold;
}

.new-img {
	width: 100%;
	height: 500px;
}

.advice-contents {
	text-align: center;
}

.contents {
	width: 810px;
	height: 500px;
	display: inline;
}

.recommend {
	text-align: left;
	margin: 10px
}

.recommend a{
	font-size: 15px;
	font-weight: bold;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="wrap">
		<div class="content-wrap">
			<h1 class="title_p">${vo.evbbs_title }</h1>
			<p class="date">${fn:replace(fn:substring(vo.evbbs_write_date, 0, 10), '-','.') }</p>
			<a class="content-p">${vo.evbbs_content }</a>
			<div class="writer-div">
				<p class="writer-p">${vo.evbbs_writer }</p>
			</div>
		</div>





		<div class="advice-contents">
			<div class="contents">
				<div class="recommend">
					<a>추천 컨텐츠</a>
				</div>
				<div class="new-img-container">
					<a href="/view?evbbs_idx=${bvo.evbbs_idx }"><img
						class="new-img" alt="" src="resources/img/default_img.jpg" /></a>
				</div>
				<a class="title font" href="/view?evbbs_idx=${bvo.evbbs_idx }">${bvo.evbbs_title }</a>
				<div>
					<p class="content font">${bvo.evbbs_content }</p>
				</div>
			</div>
		</div>

		<hr></hr>
		<div>
			<div class="pre-page go-page">
				<p>이전글</p>
				<a>${prevo.evbbs_title }</a>
			</div>

			<div class="next-page go-page">
				<p>다음글</p>
				<a>${nextvo.evbbs_title }</a>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>