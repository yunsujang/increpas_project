<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bbs {
	width: 80%;
	margin: 150px auto;
}

#bbs table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th {
	text-align: center;
	padding: 4px 10px;
}

#bbs table td {
	text-align: center;
	padding: 4px 10px;
	border-bottom: 1px solid silver;
	height: 30px;
}

#changebtn{
	height: 31px;
	border-radius: 3px;
    border: 1px solid gray;
	background-color: #85C4B9;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.no {
	width: 10%
}

.title {
	width: 30%
}

.type {
	width: 20%
}

.bbscnt {
	width: 10%;
}

.recovery {
	width: 10%
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

#updateDialog {
	display: none;
}

.ui-dialog-title {
    float: left;
    margin: 0.1em 0;
    white-space: nowrap;
    width: 90%;
    overflow: hidden;
    text-overflow: ellipsis;
}

.ui-widget-content {
    margin-top: -7px;
}
.ui-widget-header {
	
    background: #85c4b9;
	color: #ffffff;
	
}



</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />
	<p class="category-management-p">게시판 복구</p>
	<div id="bbs">
		<p class="totalList">총 ${totalCount }건</p>
		<div class="bbs-in-div">
			<form>
				<input type="text" />
				<button class="btns" onclick="search()">검색</button>
			</form>
		</div>
		<table summary="게시판 목록">
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="title">게시판명</th>
					<th class="bbscnt">게시물수</th>
					<th class="recovery">복구</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cvo }" var="vo" varStatus="st">
					<tr>
						<td>${st.index+1 }</td>
						<%-- 게시판명 클릭 부분 --%>
						<td>
						<label id="categoryName_${vo.evcategory_idx}">${vo.evcategory_name}</label>
						</td>
						
						<td>${fn:length(vo.b_list ) }</td>
						
						<td><button class="btns" id="recoveryBtn${vo.evcategory_idx }" onclick="recoverys('${vo.evcategory_idx}')">복구</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div class="paging-div">${pageCode }</div>
		</div>

	<script type="text/javascript">
	function recoverys(data) {
		var data = data;
	
		var checkBtn = $("#recoveryBtn"+data);

		var tr = checkBtn.parent().parent();
		var td = tr.children();

		var name = td.eq(1).text().trim();
		var result = confirm(name+"을(를) 복구하시겠습니까?");
		if (result) {
			recoveryCategory(name);
		} else {
			alert("취소하셨습니다.");
		}
		
	}
	</script>
</body>
</html>
