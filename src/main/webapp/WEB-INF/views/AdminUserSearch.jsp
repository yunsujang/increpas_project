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
<link rel="stylesheet" href="resources/css/adminusersearch.css">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<div id="wrap">

	<jsp:include page="Adminheader.jsp" />
	<div id="evbbs">
				

		<table summary="검색 결과">
		<h1 id="content_title">
		<b>"${searchValue }"에 대한</b>
		<b style="color:#85c4b9;">일반 회원</b>
		<b> 검색 결과</b>
		</h1>
			
			
			
			<thead>
				<tr class="headtitle">
					<th class="no">번호</th>
					<th class="id">아이디</th>
					<th class="name">이름</th>
					<th class="email">이메일</th>
					<th class="phone">연락처</th>
					<th class="who">등급</th>
					<th class="status">탈퇴 여부</th>
					<th class="delete">강제 탈퇴</th>
				</tr>
			</thead>

			<tbody>
			
			
				<c:forEach var="vo" items="${search_ar }" varStatus="st">
					<tr class="data-tr">
						<td>${totalCount -((nowPage-1)*blockList+st.index)}</td>
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
				
		<!--검색-->
		
				<div id="content">
					<form action="admin.usersearch" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>						
						<input type="text" id="searchValue" name="searchValue"  class="c_search" placeholder="아이디를 입력하세요"/>
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
				alert("아이디를 입력하세요.");
				$("#searchValue").focus();
				return false;//수행 중단
			}
			frm.submit();  //보내기
		}

	</script>
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
	
	
</script>
</body>
</html>