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
	margin-top: 50px;
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
	border:1px solid #ececec;
	padding: 4px 10px;
}

#evbbs table td {
	text-align: center;
	padding: 4px 10px;
	border-bottom: 1px solid silver;
	height: 30px;
}

.headtitle{background:#85c4b9; font-size: 15px; color: white;}
.title {width: 35%}
.no {width: 10%}
.category {width: 15%}
.writer{width: 25%}
.reg{width: 15%}

.odd {background: #85c4b9}

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

.tab { 
	float: left;
	width: 100%; 
	height: 100%;
	margin: 80px 0 0 0;
 }

.tabnav {
	font-size: 0;
	width: 97.5%;
	border-bottom: 1px solid #ddd;
	margin: 50px 0 0 0;
}

.tabnav li {
	display: inline-block;
	height: 46px;
	text-align: center;
	border-right: 1px solid #ddd;
}


.AdminCategoryBbs {
	position: relative;
	display: block;
	background-color: #f8f8f8;
	color: black;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
}

.tabnav li a:hover{
	background: #fff;
	color: #7ea21e;
}

.tabcontent {
	height: 100%;
	border-top: none;
	margin: 50px 0;
}
.btns{
	width: 75px;
    height: 26px;
    border-radius: 3px;
    border: 1px solid gray;
    background-color: #85c4b9;
    color: white;
    font-weight: bold;
    cursor: pointer;
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
#content{
	margin-top: 20px;
}
.c_search{
	border: 3px solid #85c4b9;
    font-family: monospace;
}
#searchbtn{
	width: 50px;
    height: 26px;
    border-radius: 3px;
    border: 1px solid gray;
    background-color: #85c4b9;
    color: white;
    font-weight: bold;
    cursor: pointer;
}
#type{
	width: 150px;
  		height: 25px;
}
#searchValue{
	width: 200px;
   	height: 20px;
}
 
.AdmintotalBbs{
	position: relative;
	display: block;
	background-color: #fff;
	color: #7ea21e;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
}
</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />
	<div class="tab">
		<ul class="tabnav">
			<li ><a class="AdmintotalBbs" href="">전체 게시물</a></li>
			<c:forEach items="${categoryName_ar }" var="vo" varStatus="st">
				<li><a class="AdminCategoryBbs"href='admin.bbsList2?category_idx=${vo.evcategory_idx }'>${vo.evcategory_name }</a></li>
			</c:forEach>
		</ul>
		<div>
			<div id="evbbs">
			<p class="totalList">총 ${totalCount }건</p>
		<div class="bbs-in-div">
			<input type="button" class="btns" value="글쓰기"
				onclick="javascript:location.href='admin.bbsWrite'" />
	
				
		</div>
		<table summary="게시목록">
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
						<td><a class="title font " href="/admin.view?evbbs_idx=${vo.evbbs_idx }&cPage=${cPage}">${vo.evbbs_title }</a></td>
						<td>${vo.evbbs_writer }</td>
						<td>${fn:substring(fn:replace(vo.evbbs_write_date,'-','.'),0,10 ) }</td>
					</tr>
				</c:forEach>
				
				<!--검색-->
		
				<div id="content">
					<form action="admin.search" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>						
						<input type="text" id="searchValue" name="searchValue"  class="c_search" placeholder="제목을 입력하세요"/>
						<input type="button" id="searchbtn" value="검색" class="c_search" 
						onclick="search(this.form)"/>
					</form>
				</div>
			</tbody>
		</table>
		<div class="bbsListFoot">${pageCode }</div>
	</div>
		</div>
	</div>
	
	<!--tab-->
	<script>
		function search(frm){
			if($("#searchValue").val().trim() <=0){
				alert("제목을 입력하세요.");
				$("#searchValue").focus();
				return false;//수행 중단
			}
			frm.submit();  //보내기
		}

	</script>
	<script type="text/javascript">
		$(function() {
			
		})
</script>
</body>
</html>