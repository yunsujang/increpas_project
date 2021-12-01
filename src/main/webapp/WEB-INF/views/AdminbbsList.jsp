<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#evbbs {
	width: 80%;
	margin: 150px auto;
}

#evbbs table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

#evbbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#evbbs table th {
	text-align: center;
	padding: 4px 10px;
}

#evbbs table td {
	text-align: center;
	padding: 4px 10px;
	border-bottom: 1px solid silver;
	height: 30px;
}

.no {
	width: 10%
}

.title {
	width: 40%
}

.type {
	width: 20%
}

.update {
	width: 15%
}

.delete {
	width: 15%
}

.odd {
	background: silver
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

.bbs-in-div {
	text-align: right;
	margin-bottom: 20px;
}

.btns {
	border: none;
	background-color: #85c4b9;
}

.btns:hover {
	cursor: pointer;
}

.totalList {
	font-size: 16px;
	font-weight: bold;
}

.paging-div {
	margin: 100px 0 0 0;
}

.category-management-p {
	text-align: center;
	font-size: 40px;
	color: silver;
}

.create-category-btn {
	margin: 0 0 30px 0;
}

.bbsListFoot {
	margin: 50px 0 0 0;
}
</style>
</head>
<body>

	<jsp:include page="Adminheader.jsp" />
	<div id="evbbs">
		<div class="bbs-in-div">
			<input type="button" value="글쓰기"
				onclick="javascript:location.href='admin.bbsWrite'" />
		</div>
		<table summary="게시글 목록">
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="vo" items="${ar }">
					<tr class="data-tr">
						<td>${vo.evbbs_idx }</td>
						<td>${vo.evbbs_title }</td>
						<td>${vo.evbbs_writer }</td>
						<td>${fn:substring(fn:replace(vo.evbbs_write_date,'-','.'),0,10 ) }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="bbsListFoot">${pageCode }</div>
	</div>

</body>
</html>