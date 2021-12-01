<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bbs{
	width: 80%;
	margin: 150px  auto;
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
#bbs table th{
	text-align: center;
	padding: 4px 10px;
}

 #bbs table td {
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

.bbs-in-div{
	text-align: right;
	margin-bottom: 20px;
}

.btns{
	border: none;
	background-color: #85c4b9;
}

.btns:hover{
	cursor: pointer;
}

.totalList{
	font-size: 16px;
	font-weight: bold;
}

.paging-div{
	margin: 100px 0 0 0;
}

.category-management-p{
	text-align: center;
	font-size: 40px;
	color: silver;
}

.create-category-btn{
	margin: 0 0 30px 0;
}
</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp"/>
	<p class="category-management-p">게시판 관리</p>
	<div id="bbs">
	<p class="totalList">총 ${totalCount }건</p>
	<div class="bbs-in-div">
		<button class="btns create-category-btn" >게시판 생성</button>
		<button class="btns recovery-category-btn">게시판 복구</button>
		<form>
			<input type="text"/>
			<button class="btns" onclick="search()">검색</button>
		</form>
	</div>
		<table summary="게시판 목록">
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="title">게시판명</th>
					<th class="type">게시판 타입</th>
					<th class="update">수정여부</th>
					<th class="delete">삭제여부</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${cvo }" var="vo">
					<tr>
						<%-- 순차적인 번호를 만들어서 표현하자! --%>
						<td>${vo.evcategory_idx }</td>
						<td>${vo.evcategory_name }</td>
						<td>${vo.evcategory_type }</td>
						<td><button class="btns" id="updateBtn">수정</button></td>
						<td><button class="btns" id="deleteBtn">삭제</button></td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
	<div class="paging-div">${pageCode }</div>
	</div>
	
	<script type="text/javascript">
		function search() {
			alert("a");
		}
		
		$("#deleteBtn").bind("click",function(){
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
			var name = td.eq(1).text();
			var result = confirm(name+"을(를) 삭제하시겠습니까?");
			if(result){
				deleteCategory(name);
			}else{
			    alert("취소하셨습니다.");
			}
		});
		
		function deleteCategory(name) {
			var frm = new FormData();
			
			//보내고자하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
			frm.append("name",name);
			
			$.ajax({
				url:"deleteCategory",
				data:frm,
				type:"post",
				contentType:false,
				processData:false,
				cache: false,
				dataType:"json", //서버로부터 받을 데이터 형식
				
			}).done(function(data) {
				alert(data.deleteName+"이 삭제 되었습니다.");
				location.href="admin.category";
			}).fail(function (err) {
				
			});
		}
	</script>
</body>
</html>
