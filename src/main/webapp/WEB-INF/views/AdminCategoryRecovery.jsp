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
<link rel="stylesheet" href="resources/css/admincategoryrecovery.css">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />
	<p class="category-management-p">게시판 복구</p>
	<div id="bbs">
		<p class="totalList">총 ${totalCount }건</p>
		
		<table summary="게시판 목록">
			<thead>
				<tr class="title headtitle">
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
						
						<td><button class="btn" id="recoveryBtn${vo.evcategory_idx }" onclick="recoverys('${vo.evcategory_idx}')">복구</button></td>
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
		var result = confirm(name+"을(를) 복구하시겠습니까?\n(복구시 해당 게시판의 게시물도 전부 복구됩니다.)");
		if (result) {
			recoveryCategory(name);
		} else {
			alert("취소하셨습니다.");
		}
		
		 
		
	}
	
	function recoveryCategory(name) {
		var frm = new FormData();

		//보내고자하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
		frm.append("name", name);

		$.ajax({
			url : "recoveryCategory",
			data : frm,
			type : "post",
			contentType : false,
			processData : false,
			cache : false,
			dataType : "json", //서버로부터 받을 데이터 형식

		}).done(function(data) {
			alert(data.recoveryName + "이(가) 복구 되었습니다.");
			location.href = "admin.category";
		}).fail(function(err) {

		});
	}
	</script>
</body>
</html>
