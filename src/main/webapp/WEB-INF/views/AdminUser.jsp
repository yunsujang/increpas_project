
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
<link rel="stylesheet" href="resources/css/adminuser.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>일반 회원 목록</title>
<style type="text/css">
	
</style>
</head>
<body>
	<jsp:include page="Adminheader.jsp" />

	<p class="management-p">일반 회원 목록</p>

	<div id="evbbs">

		<!-- 관리자생성 버튼생성 -->
		<div class="bbs-in-div">
			<button class="btns create-admin-btn" id="makeBtn" onclick="makes()">관리자
				생성</button>
		</div>
		<p class="totalList">총 ${totalCount }건</p>


		<!-- 관리자 생성버튼 눌렀을때 -->
		<form id="makeForm" name="makeForm" method="post">
			<div id="makeDialog" title="관리자 생성하기">
				<p>아이디</p>
				<input type="text" id="makeId" name="makeId">
				<p>비밀번호</p>
				<input type="password" id="makePw" name="makePw">
				<p>이름</p>
				<input type="text" id="makeName" name="makeName">


				<button type="button" id="newbtn" onclick="newBoard()">생성</button>
			</div>
		</form>

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
					<th class="delete">강제 탈퇴</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st">
					<tr class="data-tr">
						<td>${totalCount -((nowPage-1)*blockList+st.index)}</td>
						<td>${vo.evu_id }</td>
						<td>${vo.evu_name }</td>
						<td>${vo.evu_email }</td>
						<td>${vo.evu_phone }</td>
						<td><select  style="font-weight: bold;"  onchange="gradeChange('${vo.evu_who }','${vo.evu_idx }')">
								<c:if test="${vo.evu_who eq '0'}">
									<option>관리자</option>
								</c:if>
								<c:if test="${vo.evu_who eq '1'}">
									<option>회원</option>
								</c:if>
								<c:if test="${vo.evu_who eq '0'}">
									<option>회원</option>
								</c:if>
								<c:if test="${vo.evu_who eq '1'}">
									<option>관리자</option>
								</c:if>
						</select></td>
						<td><c:if test="${vo.evu_status eq '0'}">
								<a>N</a>
							</c:if> <c:if test="${vo.evu_status ne '0'}">
								<a>Y</a>
							</c:if></td>
						<td><c:if test="${vo.evu_status eq '0'}">
								<input class="btn" type="button" name="del" id="del" value="탈퇴"
									onclick="del('${vo.evu_idx}')" />
							</c:if> <c:if test="${vo.evu_status ne '0'}">
								<a></a>
							</c:if></td>
					</tr>
				</c:forEach>

				<!--검색-->

				<div id="content">
					<form action="admin.usersearch" method="post">
						<input type="hidden" name="type" value="search" class="c_search" />
						<input type="text" id="searchValue" name="searchValue"
							class="c_search" placeholder="아이디를 입력하세요" /> <input type="button"
							id="searchbtn" value="검색" class="c_search"
							onclick="search(this.form)" />
					</form>
				</div>
			</tbody>
		</table>
		<div class="bbsListFoot">${pageCode }</div>
	</div>

	<script type="text/javascript">
		// 회원 등급 설정
		function gradeChange(who,idx){
			$.ajax({
				url:"gradeChange",
				data:{"who":who,"idx":idx},
				type:"post",
				dataType:"json",
			}).done(function(data) {
				alert(data.code);
				location.reload(true);
			}).fail(function(err) {
				
			})
		}
	
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
		
		
		///관리자 생성 기능
		 function makes(){
         $("#makeDialog").dialog();
   
   	   }

     	 function newBoard() {
         

         var id = $('#makeId').val().trim();
         var pw = $('#makePw').val().trim();
         var name = $('#makeName').val().trim();
         
         
         if(id.length <= 0){
             alert("아이디를 입력해주세요.");
             document.forms[0];
             return;
          }
         
         if(pw.length <= 0){
             alert("비밀번호를 입력해주세요.");
             document.forms[0];
             return;
          }
         
         if(name.length <= 0){
            alert("이름을 입력해주세요.");
            document.forms[0];
            return;
         }
         //확인
         console.log(id);
         console.log(pw);
         console.log(name);

         //json형태로 담기
         var frm = new FormData();
         frm.append("makeId",id);
         frm.append("makePw",pw);
         frm.append("makeName",name);

         //보내버려
         $.ajax({
            url : "AdminMakeUser",
            data : frm,
            type : "post",
            contentType : false,
            processData : false,
            cache : false,
            dataType : "json", //서버로부터 받을 데이터 형식

         }).done(function(data) {
            
            location.href="admin.user";
            alert(data.makeName);
            

         }).fail(function(err) {
            //실패
            alert("관리자 계정 생성 실패");
         });
      }

     	 
	
</script>
</body>
</html>