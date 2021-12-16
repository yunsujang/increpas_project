<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	min-height: auto;
	float: left;
	padding: 20px 0 20px 0;
}

.contents {
	border-radius: 5px;
	width: 30.6%;
	float: left;
	height: auto;
	min-height: auto;
	margin: 5px 20px 100px 20px;
}

.h5 {
	padding: 0px;
	margin: 5px 0px;
}

.title {
	font-weight: bold;
	font-size: 16px;
	color: black;
	text-decoration: none;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.content {
	font-size: 15px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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

.a-lastUpdate {
	padding: 0 0 0 25px;
	font-size: 10px;
	color: gray;
	font-weight: bold;
}

.a-six {
	font-size: 12px;
	color: gray;
	text-decoration: none;
	padding: 0 0 0 25px;
	font-weight: bold;
}

.header_banner {
	text-align: center;
	width: auto;
	height: 200px;
}

.header_banner article{
	margin:auto;
	text-align:center;
	width: 300px;
	height: 100%;
}

.articles {
	margin: 0 0 0 37px;
}

.skip-p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin: 0;
	height: 40px;
	font-size: 13px;
    color: gray;
}
#a_view{
	float: right;
	margin-right: 40px;
	text-decoration: none;
}


</style>
</head>
<body>
	${sb }
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<div class="header_banner">
			<article>
				<a href="evMap"><img style="width: 100%"; height="70%"  alt="" src="resources/img/banner.png"></a>
				
			</article>
		</div>

		<div class="newContents">
			<a class="home-a a-lastUpdate">LAST UPDATE</a></br>
			<c:forEach items="${last_ar }" var="vo">
				<div>
					<div class="contents">
						<div class="new-img-container">
							<c:set var="filename" value="${vo.evbbs_file_name }" />
							<c:choose>
								<c:when test="${filename eq null }">
									<a href="/view?evbbs_idx=${vo.evbbs_idx }"> <img
										class="new-img" alt="" src="resources/img/default_img.jpg" />
									</a>
								</c:when>
								<c:when test="${filename ne null }">
									<a href="/view?evbbs_idx=${vo.evbbs_idx }"> <img
										class="new-img" alt="" src="resources/bbs_upload/${filename }" />
									</a>
								</c:when>
							</c:choose>
						</div>
						<div class="skip-p">
							<a class="title font " href="/view?evbbs_idx=${vo.evbbs_idx }">
							${vo.evbbs_title }
							</a>
						</div>
							<c:set value="${vo.evbbs_content }" var="content"/>
										<p class="skip-p">${content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</p>
							<a class="writer font"> 작성자 : ${vo.evbbs_writer }</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="category_bbs">
			<c:forEach items="${categoryName_ar }" var="vo">
				<c:if test="${fn:length(vo.b_list) > 0 }">
					<div class="newContents">
						<div>
							<a class="a-lastUpdate">${vo.evcategory_name }</a>
							<a id="a_view" class="a-lastUpdate" href="category?evcategory_idx=${vo.evcategory_idx}">${vo.evcategory_name} 더보기</a>
						</div>
						<c:forEach items="${vo.b_list }" var="bvo">
							<div class="contents">
								<div class="new-img-container">
									<c:set var="filename" value="${bvo.evbbs_file_name }" />
									<c:choose>
										<c:when test="${filename eq null }">
											<a href="/view?evbbs_idx=${bvo.evbbs_idx }"> <img
												class="new-img" alt="" src="resources/img/default_img.jpg" />
											</a>
										</c:when>
										<c:when test="${filename ne null }">
											<a href="/view?evbbs_idx=${bvo.evbbs_idx }"> <img
												class="new-img" alt=""
												src="resources/bbs_upload/${filename }" />
											</a>
										</c:when>
									</c:choose>
								</div>
								<div class="skip-p">
									<a class="title font " href="/view?evbbs_idx=${bvo.evbbs_idx }">
							${bvo.evbbs_title }
							</a>
								</div>
									<c:set value="${bvo.evbbs_content }" var="content"/>
										<p class="skip-p">${content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</p>
									<a class="writer font">작성자 : ${bvo.evbbs_writer }</a>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<a id="MOVE_TOP_BTN" href="#"><svg
			xmlns="http://www.w3.org/2000/svg" width="32" height="32"
			fill="#006699" class="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
  <path
				d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0z" />
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
				}, 400);
				return false;
			});
		});
	</script>
</body>
</html>
