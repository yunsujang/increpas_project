
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta charset="UTF-8">

<style type="text/css">
#evbbs {
	width: 80%;
	margin: 100px auto;
	min-width: 900px;
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

#makeDialog{
	display: none;
}

#newbtn{
	height: 31px;
    border-radius: 3px;
    border: 1px solid gray;
    background-color: #85C4B9;
    color: white;
    font-weight: bold;
    cursor: pointer;
    margin-left: 5px;
}

.bbs-in-div {
    text-align: right;
    margin-bottom: 20px;
}

.btns {
    width: 120px;
    height: 35px;
    border-radius: 3px;
    border: 1px solid gray;
    background-color: #85c4b9;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.ui-widget-content {
    margin-top: -7px;
}

.ui-widget-header {
   
    background: #85c4b9;
    color: #ffffff;
   
}
.headtitle{background:#85c4b9; font-size: 15px; color: white;}

.no {width: 5%}
.id {width: 10%}
.pw {width: 10%}
.name{width: 10%}
.email{width: 15%}
.phone{width: 20%}
.status{width: 10%}
.who{width: 10%}
.delete{width: 10%}

.odd {background: #85c4b9}

.font{
	text-decoration: none;
	color: black;
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


.totalList {
	font-size: 16px;
	font-weight: bold;
}

.paging-div {
	margin: 100px 0 0 0;
}
.bbsListFoot {
	margin: 50px 0 0 0;
}
.management-p {
	text-align: center;
	font-size: 40px;
	color: #708090;
}
.btn{
	width: 50px;
    height: 26px;
    border-radius: 3px;
    border: 1px solid gray;
    background-color: #85c4b9;
    color: white;
    font-weight: bold;
    cursor: pointer;
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

</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />

			<p class="management-p">탈퇴 회원 목록</p>
		
		
			<div id="evbbs">
			<p class="deletedtotalCount">총 ${deletedtotalCount }건</p>
		
   

	
		<table summary="게시글 목록">
			<thead>
				<tr class="headtitle">
					<th class="no">번호</th>
					<th class="id">아이디</th>
					<th class="name">이름</th>
					<th class="email">이메일</th>
					<th class="phone">연락처</th>
					<th class="who">등급</th>
					<th class="status">탈퇴 여부</th>
					<th class="recovery">탈퇴 복구</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st">
					<tr class="data-tr">
						<td>${deletedtotalCount -((nowPage-1)*blockList+st.index)}</td>
						<td>${vo.evu_id }</td>
						<td>${vo.evu_name }</td>
						<td>${vo.evu_email }</td>
						<td>${vo.evu_phone }</td>
						<td><c:if test="${vo.evu_who eq '0'}">
							<a>관리자</a></c:if>
							<c:if test="${vo.evu_who ne '0'}">
							<a>회원</a>
						</c:if></td>
						<td><c:if test="${vo.evu_status eq '0'}">
							<a>N</a></c:if>
							<c:if test="${vo.evu_status ne '0'}">
							<a>Y</a>
						</c:if></td>
						<td><input class="btn" type="button" name="recovery" id="recovery" value="복구"
					onclick="recovery('${vo.evu_idx}')" /></td>	
					</tr>
				</c:forEach>
				
				<!--검색-->
		
				<div id="content">
					<form action="admin.deletedusersearch" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>						
						<input type="text" id="searchValue" name="searchValue"  class="c_search" placeholder="아이디를 입력하세요"/>
						<input type="button" id="searchbtn" value="검색" class="c_search" 
						onclick="search(this.form)"/>
					</form>
				</div>
				
				
			</tbody>
		</table>
		<div class="bbsListFoot">${pageCode }
		</div>
	</div>
		<script>
		function search(frm){
			if($("#searchValue").val().trim() <=0){
				alert("아이디를 입력하세요.");
				$("#searchValue").focus();
				return false;//수행 중단
			}
			frm.submit();  //보내기
		}

	</script>
	<script type="text/javascript">
		//회원 복구 기능
		function recovery(evu_idx) {
		
			var result = confirm("탈퇴회원을 복구 하시겠습니까?");
			if (result) {
				alert("복구 되었습니다.");
				location.href="/admin.recoveryUser?evu_idx="+evu_idx;
			} else {
				alert("취소하셨습니다.");
			}
			
		}
	</script>

</body>
</html>