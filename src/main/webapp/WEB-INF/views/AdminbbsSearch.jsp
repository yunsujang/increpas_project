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
<link rel="stylesheet" href="resources/css/admincategory.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);


#evbbs {
	width: 70%;
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

	#content_title{
		color : #708090;
		margin-top: 50px;
		font-family: 'Nanum Gothic';
		
	}	
	
#content{
	margin-top: 30px;
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


</style>
</head>
<body>
	<div id="wrap">

	<jsp:include page="Adminheader.jsp" />
	<div id="evbbs">
				

		<table summary="????????? ?????? ??????">
		<h1 id="content_title">"${searchValue }"??? ?????? ?????? ??????</h1>
			<thead>
				<tr class="headtitle">
					<th class="no">??????</th>
					<th class="category">????????????</th>
					<th class="title">??????</th>
					<th class="writer">??????</th>
					<th class="reg">????????????</th>
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
				
		<!--??????-->
		
				<div id="content">
					<form action="admin.search" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>						
						<input type="text" id="searchValue" name="searchValue"  class="c_search" placeholder="????????? ???????????????"/>
						<input type="button" id="searchbtn" value="??????" class="c_search" 
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
				alert("???????????? ???????????????.");
				$("#searchValue").focus();
				return false;//?????? ??????
			}
			frm.submit();  //?????????
		}

	</script>
	
	<script type="text/javascript">
	
</script>
</body>
</html>