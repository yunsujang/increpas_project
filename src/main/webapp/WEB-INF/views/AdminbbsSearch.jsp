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
<title>Insert title here</title>
<style type="text/css">


#evbbs {
	width: 80%;
	margin: auto;
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
	width: 5%
}

.title {
	width: 40%
}

.type {
	width: 15%;
}

.category {
	width: 15%;
}

.writer{
	width: 15%;
}

.reg{
	width: 10%;
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


.btns{
	border: none;
	background-color: #85c4b9;
}

.totalList {
	font-size: 16px;
	font-weight: bold;
	margin: 50px 0 0 0;
}

.font{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<div id="wrap">
	<div id="evbbs">
	<jsp:include page="Adminheader.jsp" />

				

		<table summary="게시글 검색 결과">
		<h1 id="content_title">"${searchValue }"에 대한 검색 결과</h1>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="category">게시판</th>
					<th class="title">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
				</tr>
			</thead>

			<tbody>
			
			
				<c:forEach var="vo" items="${search_ar }" varStatus="st">
					<tr class="data-tr">
						<td>${totalCount -((nowPage-1)*blockList+st.index)}</td>
					
							
						<td>${vo.evcategory_idx }</td>
						<td><a class="title font " 
						href="/admin.view?evbbs_idx=${vo.evbbs_idx }">
						${vo.evbbs_title }</a></td>
						
						<td>${vo.evbbs_writer }</td>
						
						<td>${fn:substring(fn:replace(vo.evbbs_write_date,'-','.'),0,10 ) }</td>
					</tr>
				</c:forEach>
				
		<!--검색-->
		
				<div id="content">
					<form action="admin.search" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>						
						<input type="text" id="searchValue" name="searchValue"  class="c_search"/>
						<input type="button" id="searchbtn" value="검색" class="c_search" 
						onclick="search(this.form)"/>
					</form>
				</div>
			</tbody>
		</table>
		</div>			
		</div>			
		<div class="bbsListFoot">${pageCode }</div>




		<script>
		function search(frm){
			if($("#searchValue").val().trim() <=0){
				alert("검색어를 입력하세요.");
				$("#searchValue").focus();
				return false;//수행 중단
			}
			frm.submit();  //보내기
		}

	</script>
	
	<script type="text/javascript">
	
</script>
</body>
</html>