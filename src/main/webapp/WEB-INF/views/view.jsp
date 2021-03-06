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
<link rel="stylesheet" href="resources/css/view.css" />
</head>
<style>
p img{
	width: 100% !important;
	margin: 30px 0 30px 0;
}
</style>
</head> 
<body>
	<jsp:include page="header.jsp" />

	<div class="wrap">
		<div class="content-wrap">
			<div class="content-div">
			<h1 class="title_p">${vo.evbbs_title }</h1>
			<p class="date">${fn:replace(fn:substring(vo.evbbs_write_date, 0, 10), '-','.') }</p>
			
				<div>${vo.evbbs_content }</div>
				<div class="writer-div">
					<p>작성자</p>
					<p class="writer-p">${vo.evbbs_writer }</p>
				</div>

				<div class="advice-contents">
					<div class="contents">
						<div class="recommend">
							<a>추천 컨텐츠</a>
						</div>
						<div class="contents">
							<div class="new-img-container">
								<c:set var="filename" value="${rvo.evbbs_file_name }" />
								<c:choose>
									<c:when test="${filename eq null }">
										<a href="/view?evbbs_idx=${rvo.evbbs_idx }"> <img
											class="new-img" alt="" src="resources/img/default_img.jpg" />
										</a>
									</c:when>
									<c:when test="${filename ne null }">
										<a href="/view?evbbs_idx=${rvo.evbbs_idx }"> <img
											class="new-img" alt=""
											src="resources/bbs_upload/${filename }" />
										</a>
									</c:when>
								</c:choose>
							</div>
							<div class="skip-p">
								<a class="title font " href="/view?evbbs_idx=${rvo.evbbs_idx }">
									${rvo.evbbs_title } </a>
							</div>
						</div>
					</div>

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