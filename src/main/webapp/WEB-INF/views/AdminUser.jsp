
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
	color: silver;
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


</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />

			<p class="management-p">전체 유저 목록</p>

	
			<div id="evbbs">
			<p class="totalList">총 ${totalCount }건</p>

		<table summary="게시글 목록">
			<thead>
				<tr class="headtitle">
					<th class="no">번호</th>
					<th class="id">아이디</th>
					<th class="pw">비밀번호</th>
					<th class="name">이름</th>
					<th class="email">이메일</th>
					<th class="phone">연락처</th>
					<th class="who">등급</th>
					<th class="status">탈퇴 여부</th>
					<th class="delete">강제 탈퇴</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st">
					<tr class="data-tr">
						<td>${vo.evu_idx }</td>
						<td>${vo.evu_id }</td>
						<td>${vo.evu_pw }</td>
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
						<td>
						<c:if test="${vo.evu_status eq '0'}">
							<input class="btn" type="button" name="del" id="del" value="탈퇴"
					onclick="del('${vo.evu_idx}')" /></c:if>
						<c:if test="${vo.evu_status ne '0'}">
							<a></a>
						</c:if>
					
					</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="bbsListFoot">${pageCode }
		</div>
	</div>
	


	<script type="text/javascript">
		//회원 탈퇴 기능
		function del(evu_idx) {
		
			var result = confirm("탈퇴하시겠습니까?");
			if (result) {
				alert("강제 탈퇴되었습니다.");
				location.href="/admin.deleteUser?evu_idx="+evu_idx;
			} else {
				alert("취소하셨습니다.");
			}
			
		}
		
		
		//관리자 생성 기능
		

	
</script>
</body>
</html>