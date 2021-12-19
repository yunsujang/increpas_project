<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="resources/css/search.css" />
</head>
<style>

</style>
<body> 
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<article class="articles" id="articles">
			<div class="here">
				<a>'${searchValue }'에 대한 검색결과 </a></br> <a>${totalCount }건</a>
			</div>

			<div class="header-line">
				<div id="contents_wrap">
					<c:forEach items="${search_ar }" var="vo">
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
												class="new-img" alt=""
												src="resources/bbs_upload/${filename }" />
											</a>
										</c:when>
									</c:choose>
							</div>
							<h6 class="h5">
								<p class="title font skip-p">
									<a class=" font title"
										href="/view?evbbs_title=${vo.evbbs_idx }&cPage=${nowPage }">${vo.evbbs_title }</a>
								</p>
							</h6>
							<div>
								<c:set value="${vo.evbbs_content }" var="content" />
								<p class="skip-p">${content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</p>
								<p class="writer font">작성자 : ${vo.evbbs_writer }</p>
							</div>
						</div>

					</c:forEach>

				</div>
				<input type="hidden" value="${fn:length(paging_ar) }"
					id="marginHidden" />
			</div>

			<a id="MOVE_TOP_BTN" href="#"><svg
					xmlns="http://www.w3.org/2000/svg" width="32" height="32"
					fill="#006699" class="bi bi-arrow-up-square-fill"
					viewBox="0 0 16 16">
  <path
						d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0z" />
</svg></a>
		</article>
	</div>
	<c:if test="${fn:length(search_ar) > 0}">
		<div class="paging-div">${pageCode }</div>
	</c:if>
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

		var marginHidden = $("#marginHidden").val();
		if (marginHidden == 0)
			$("#articles").css('margin-bottom', '600px');
	});
</script>

</html>