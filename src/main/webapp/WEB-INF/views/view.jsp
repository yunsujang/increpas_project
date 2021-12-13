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
	width: 90%;
	height: 100%;
	min-height: 100%;
	margin: 250px auto 0 auto;
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
	float: left;
	width: 50%;
}

.next-page {
	float: right;
	width: 50%;
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
	color: black;
	text-decoration: none;
}

.new-img {
	width: 300px;
	height: 200px;
}

.advice-contents {
	text-align: center;
	width: 50%;
	margin: 0 auto;
}

.contents {
	width: 810px;
	height: 500px;
	display: inline;
}

.recommend {
	text-align: center;
	margin: 10px
}

.recommend a{
	font-size: 15px;
	font-weight: bold;
}

.pre-view{
	width: auto;
	height: 80px;
	min-height: auto;
}

.content-div{
	style="text-align: left;"
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="wrap">
		<div class="content-wrap">
			
				<h1 class="title_p">${vo.evbbs_title }</h1>
				<p class="date">${fn:replace(fn:substring(vo.evbbs_write_date, 0, 10), '-','.') }</p>
				<div class="content-div">
				<div>${vo.evbbs_content }</div>
				<div class="writer-div">
					<p>작성자</p>
					<p class="writer-p">${vo.evbbs_writer }</p>
				</div>
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
		<div class="pre-view">
			<div class="pre-page go-page">
				<p>이전글</p>
				<a href="/view?evbbs_idx=${prevo.evbbs_idx }">${prevo.evbbs_title }</a>
			</div>

			<div class="next-page go-page">
				<p>다음글</p>
				<a href="/view?evbbs_idx=${nextvo.evbbs_idx }"">${nextvo.evbbs_title }</a>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>