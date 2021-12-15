<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/adminbbslist2.css">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	
	<jsp:include page="Adminheader.jsp" />
	${sb }
	<div class="tab">
		<ul class="tabnav">
			<li><a href="admin.bbsList">전체 게시물</a></li>
			<c:forEach items="${categoryName_ar }" var="vo">
				<li><a href='admin.bbsList2?category_idx=${vo.evcategory_idx }'>${vo.evcategory_name }</a></li>
			</c:forEach>
		</ul>
		<div>
			<div id="evbbs">
			<p class="totalList">총 ${totalCount }건</p>
		<div class="bbs-in-div">
			<input type="button" class="btns" value="글쓰기"
				onclick="javascript:location.href='admin.bbsWrite'" />
		</div>
		<table summary="게시글 목록">
			<thead>
				<tr class="headtitle">
					<th class="no">번호</th>
					<th class="category">게시판명</th>
					<th class="title">제목</th>
					<th class="writer">이름</th>
					<th class="reg">작성일자</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st">
					<tr class="data-tr">
						<td>${totalCount -((nowPage-1)*blockList+st.index)}</td>
						<td>
							<c:if test="${vo.evcategory_idx ne null}">
							<c:forEach items="${categoryName_ar }" var="ar">
								<c:if test="${vo.evcategory_idx eq ar.evcategory_idx }">
									${ar.evcategory_name }
								</c:if>
							</c:forEach>	
							</c:if>
						</td>
						<td><a class="title font " href="/admin.view?evbbs_idx=${vo.evbbs_idx }">${vo.evbbs_title }</a></td>
						<td>${vo.evbbs_writer }</td>
						<td>${fn:substring(fn:replace(vo.evbbs_write_date,'-','.'),0,10 ) }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="bbsListFoot">${pageCode }</div>
	</div>
		</div>
	</div>
	<!--tab-->

	
	<script type="text/javascript">
	
</script>
</body>
</html>