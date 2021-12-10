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
	margin-top: 50px;
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
	border:1px solid #ececec;
	padding: 4px 10px;
}

#bbs table td {
	text-align: center;
	padding: 4px 10px;
	border-bottom: 1px solid silver;
	height: 30px;
}


#content{
	margin-top: 20px;
	text-align: left;
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

#searchValue{
	width: 200px;
   	height: 20px;
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

#newbtn{
    height: 31px;
    border-radius: 3px;
    border: 1px solid gray;
    background-color: #85C4B9;
    color: white;
    font-weight: bold;
    cursor: pointer;
}
.headtitle{background:#85c4b9; font-size: 15px; color: white;}
.no {width: 10%}
.title {width: 40%}
.bbscnt {width: 20%}
.update{width: 15%}
.delete{width: 15%}

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

#makeDialog {
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
.listclick{
	cursor: pointer;
}


</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />
	<p class="category-management-p">게시판 관리</p>
	<div id="bbs">
		<p class="totalList">총 ${totalCount }건</p>
		
		
		<div class="bbs-in-div">
			<button class="btns create-category-btn" 
			id="makeBtn" onclick="makes()">게시판 생성</button>
			<button class="btns recovery-category-btn" onclick="recovery()">게시판 복구</button>
	</div>		
			<!--검색-->		
		<div id="content">	
			<form>						
				<input type="text" id="searchValue" name="searchValue"  class="c_search"/>
				<input type="button" id="searchbtn" value="검색" class="c_search" 
				onclick="search()"/>
			</form>
		</div>
		
		<!-- 게시판 생성버튼 눌렀을때 -->
		<form id="makeForm" name="makeForm" method="post">
		<div id="makeDialog" title="게시판 생성하기">
		<p style="font-size: 13px;">생성할 게시판명을 입력해주세요.</p>
		

		<input type="text" id="makeName" name="makeName" value="${vo.evcategory_name }">
		
		<button type="button" id="newbtn" style="margin-left: 5px;" onclick="newBoard()">생성</button>
		</div>
		</form>
		
		<table summary="게시판 목록">
			<thead>
				<tr class="headtitle">
					<th class="no">번호</th>
					<th class="title">게시판명</th>
					<th class="bbscnt">게시물수</th>
					<th class="update">수정</th>
					<th class="delete">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cvo }" var="vo" varStatus="st">
					<tr>
							<td>${st.index+1 }</td>
						<%-- 게시판명 클릭 부분 --%>
						<td  style="cursor:pointer" onclick="location.href='admin.bbsList2?category_idx=${vo.evcategory_idx}'">
						<label class="listclick" id="categoryName_${vo.evcategory_idx}">${vo.evcategory_name}</label>
						
						</td>
						
						<td>${fn:length(vo.b_list ) }</td>
						
						<td><button class="btn" id="updateBtn" onclick="updates('${vo.evcategory_idx}')">수정</button></td>
						<td><button class="btn" id="deleteBtn${vo.evcategory_idx }"
								onclick="deletes('${vo.evcategory_idx}')">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 수정버튼 눌렀을때 -->
		<form id="changeForm" name="changeForm" method="post">
		<div class="paging-div">${pageCode }</div>
		<div id="updateDialog" title="게시판 수정하기">
		<p style="font-size: 13px;">수정할 게시판명을 입력해주세요.</p>
		<input type="hidden" id="changeIdx" name="changeIdx" value=""/>
		<input type="text" id="changeName" name="changeName" value="">
		
		<button type="button" id="changebtn" onclick="changeBoard()" style="margin-left: 5px;">변경</button>
		</div>
		</form>
		
		</div>

	<script type="text/javascript">
		function search() {
			alert("a");
		}
		function deletes(data) {
			var data = data;
			
				var checkBtn = $("#deleteBtn"+data);

				var tr = checkBtn.parent().parent();
				var td = tr.children();

				var name = td.eq(1).text().trim();
				var result = confirm(name+"을(를) 삭제하시겠습니까?");
				if (result) {
					deleteCategory(name);
				} else {
					alert("취소하셨습니다.");
				}
			
		}
		

		function deleteCategory(name) {
			var frm = new FormData();
 
			//보내고자하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
			frm.append("name", name);

			$.ajax({
				url : "deleteCategory",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json", //서버로부터 받을 데이터 형식

			}).done(function(data) {
				alert(data.deleteName + "이 삭제 되었습니다.");
				location.href = "admin.category";
			}).fail(function(err) {

			});
		}

		function updates(idx) {
			var checkBtn = $("#updateBtn" + idx);

			
			var modcategoryName = $('#categoryName_' + idx).text();

			$('#changeIdx').val(idx);
			$('#changeName').val(modcategoryName);
			$("#updateDialog").dialog();
		}

		function changeBoard() {

			//게시판 idx와 수정한 게시판명 가져오기
			var changeIdx = $('#changeIdx').val();
			var changeName = $('#changeName').val().trim();

			if(changeName.length <= 0){
				alert("수정된 게시판명을 입력하세요.");
				document.forms[0];
				return;
			}
			
			//확인
			console.log(changeIdx);
			console.log(changeName);

			//json형태로 담기
			var param = {
				"changeIdx" : changeIdx,
				"changeName" : changeName
			}

			//보내버려
			$.ajax({
				url : "updateCategory",
				data : JSON.stringify(param), //datajson형
				type : "post",
				contentType : "application/json; charset=UTF-8", //json으로 보내는것 명시
				processData : false,
				cache : false,
				dataType : "json", //서버로부터 받을 데이터 형식

			}).done(function(data) {
				

				alert(data.msg);
				location.href = "admin.category";

			}).fail(function(err) {
				//실패
				alert("게시판명 수정 실패");
			});


		}

		// 받은이름으로 비동기식 수정 진행한후 수정잘됬다고 띄움
		function updateCategory(name) {
			var frm = new FormData();

			//보내고자하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
			frm.append("name", name);

			$.ajax({
				url : "updateCategory",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json", 

			}).done(function(data) {
				alert(data.updateName + "이 변경 되었습니다.");
				location.href = "admin.category";
			}).fail(function(err) {

			});
		}
		//게시판 복구부분
		function recovery() {
			location.href="admin.CategoryRecovery";
		}
		
		
		//게시판 생성부분
		function makes(name){
			$("#makeDialog").dialog();
	
		}

		function newBoard() {
			

			
			var makeName = $('#makeName').val().trim();;
			
			if(makeName.length <= 0){
				alert("게시판명을 입력하세요.");
				document.forms[0].makeName.focus();
				return;
			}
			//확인
			console.log(makeName);

			//json형태로 담기
			var frm4 = new FormData();
			
			frm4.append("makeName",makeName);


			//보내버려
			$.ajax({
				url : "makeCategory",
				data : frm4,
				type : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json", //서버로부터 받을 데이터 형식

			}).done(function(data) {
				
				location.href = "admin.category";
				alert(data.makeName);
				

			}).fail(function(err) {
				//실패
				alert("게시판명 생성 실패");
			});
		}
	</script>
</body>
</html>
