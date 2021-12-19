<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/header/header.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/footer/footer.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/member_list.css" 	
	type="text/css">
<meta charset="UTF-8">
<title>회원 정보</title>



</head>
<body>

<jsp:include page="header.jsp" />	


    <div id="wrapper">
		<div id="header">
			<h1 > 회원정보 조회 </h1>
			<h2> 회원님의 이름, 이메일 ,전화번호를 조회하실 수 있습니다.</h2>
		</div>
		 <div id="content">
			<form method="post">
		 		<div class="id-div">
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="userId" id="userId" class="int" value="${evo.evu_id}"  readonly="readonly">
                    </span>
                    <p style="font-size: 12px"></p>
                </div>
		
		 
                <!-- NAME -->
                <div class="name-div">
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="userName" id="userName" class="int"value="${evo.evu_name}"readonly="readonly">
                    </span>
                      <p style="font-size: 12px"></p>
                </div>
		
		  <!-- EMAIL -->
                <div class="email-div">
                    <h3 class="join_title"><label for="email">이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" name="userEmail" id="userEmail" class="int"value="${evo.evu_email}"readonly="readonly">
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
                
		   <!-- MOBILE -->
                <div class="phone-div">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="text"name="userPhone" id="userPhone" class="int" value="${evo.evu_phone}"readonly="readonly">
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
		
		 <!--  BTN-->
                <div class="btn_area">
                    <button type="button" onclick ="updateUser()" id="btnUpdate" >
                        <span>회원정보 수정</span>
                    </button>	
                    <button type="button" onclick="deleteDialog()" id="btnDelete" >
                        <span>회원정보 삭제</span>
                    </button>	
                </div>
 		</form>
 		</div>
	</div>
	
	<div id="userdeletedialog">
		<label>비밀번호 입력</label>
		<input type="password" id="usedpwd" name="usedpwd"/>
		<button type="button" onclick="deletecheck()">삭제</button>
	</div>

	<jsp:include page="footer.jsp" />
	
	<script type="text/javascript">
		function updateUser(){
			location.href = "userModify";
		}
	
	
		function deleteDialog() {
			  $("#userdeletedialog").dialog();
			
		}
		
		function deletecheck() {
			var usedpwd = $("#usedpwd").val().trim();
			
			if(usedpwd.length <= 0){
				alert("비밀번호를 입력하세요.");
				$("#usedpwd").val("");
				$("#usedpwd").focus();
				return;
			}
			$.ajax({
				data:{"usedpwd":usedpwd},
				url:"deletecheck",
				dataType:"json",
				type:"post",
			
			}).done(function(data) {
				if(data.code == "1"){
					alert("비밀번호가 일치하지 않습니다.");
				}else if(data.code =="0"){
					if (confirm("탈퇴하시겠습니까?") == true){
	    	              realDelete();
	    	            }else{
	    	               return false;
	    	            }
				}
				
			}).fail(function(err) {
				alert("fail");
			})
			
			
			
			
		}
		
		function realDelete() {
			$.ajax({
				url:"userDelete",
				dataType:"json",
				type:"post",
			}).done(function(data) {
				alert(data.code);
				location.href="/";
			}).fail(function(err) {
				alert("fail");
			})
		}
	
		
		
		</script>
	
	

</body>
</html>