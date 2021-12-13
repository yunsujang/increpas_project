<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<title>JSP 게시판 웹 사이트</title>

<style type="text/css">
#back{
    width: 25%;
    margin: auto;
    margin-top: 100px;
	} 
	/*
#evu_id{
	width: 49%;
    transform: translate(50%, -30%);
    border: 1px solid #85c4b9;
    padding: 5px 1px 1px 0px;
}
#evu_pw{
	width: 49%;
    transform: translate(50%, -18%);
    border: 1px solid #85c4b9;
    padding: 3px 1px 1px 0px;
}*/

.loginbox input[type ="text"], .loginbox input[type="password"]{
	display: block;
	color:gray;
	border:1px solid lightgray;
	text-align: center;
	border-radius: 2px;
	font-size: 16px;
	padding : 13px 0;
	margin-bottom: 20px;
	height: 20px;
	font-family:blod;
	width:390px;
	margin: auto;
}

#btn{
	display: block;
	color:gray;
	border:1px solid lightgray;
	text-align: center;
	border-radius: 2px;
	font-size: 16px;
	padding : 20px 0;
	height: 20px;
	font-family:blod;
	width:390px;
	margin: auto;
	margin-top: 19px;
	line-height: 0px;
	font-color: black;
}
#back>h3 {
    text-align: center;
    height: 50px;
    min-width: 100%;
    font-size: 30px;
    width: 400px;
}

</style>

</head>
<body>
	
	<input type="hidden" value="${sessionScope.mvo.evu_who }" id="who"/>
	<input type="hidden" value="${sessionScope.mvo.evu_name }" id="adminName"/>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div>
				<div id="back">
					<h3>관리자 로그인</h3>
					<div class="loginbox" >
						<input type="text" class="form-control" placeholder="아이디" name="evu_id" id="evu_id" maxlength="10">
						<br>						
						<input type="password" class="form-control" placeholder="비밀번호" name="evu_pw" id="evu_pw" maxlength="10">						
					</div>
					<button type="button" id="btn" 
					style="background:#85c4b9" 
					onclick="godata(this.form)">로그인</button>
				</div>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script type="text/javascript">
		$(function() {
			var who = $("#who").val();
			var adminName = $("#adminName").val();
			if(who == "1"){
				
				alert("관리자만 입장이 가능합니다.");
				location.href="/";
			}
			
			else if(who == "0"){
				alert(adminName+" 관리자님 반갑습니다.");
				location.href = "/admin.main"
				
			}
			
			
		});
		
		function godata(frm) {
			var id = $("#evu_id").val().trim();
			var pw = $("#evu_pw").val().trim();
			
			if(id.length <= 0){
				alert("아이디를 입력하십시오");
				$("#evu_id").val("");
				$("#evu_id").focus();
				return;
			}
			
			if(pw.length <= 0){
				alert("비밀번호를 입력하십시오");
				$("#evu_pw").val("");
				$("#evu_pw").focus();
				return;
			}
			var frm = new FormData();
			frm.append("evu_id",id);
			frm.append("evu_pw",pw);
			
			//비동기식 통신
			$.ajax({
				url: "admin",
				data: frm,
				type: "post",
				contentType: false,
				processData: false,
				cache: false,
				dataType: "json", // 서버로부터 받을 데이터 형식
			}).done(function(data){
				alert(data.str);
				if(data.cnt == 0){
					location.href="admin.main";
				}
				
			}).fail(function(err){
				//서버에서 오류가 발생 시
			});
		}
	</script>
</body>
</html>