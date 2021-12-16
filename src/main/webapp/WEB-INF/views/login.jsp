<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 </title>
<link rel="stylesheet" href="resources/css/header/header.css" type="text/css">
<link rel="stylesheet" href="resources/css/footer/footer.css" type="text/css">
<link rel="stylesheet" href="resources/css/login.css">
<style type="text/css">
	
</style>
</head>
<body>
	
	<div class="container">
	
		<div class ="inner">
			<img src=""/>
		</div>
		<div>
		<jsp:include page="header.jsp"/>
		</div>
		
		
		<div class= "login">
			<h1 class="loginh"> evca </h1>
			
			<form class="loginbox">
					<input type="text" name="evu_id" id="evu_id" placeholder="아이디를 입력하세요">
					<br>
					<input type="password" name="evu_pw" id="evu_pw" placeholder="비밀번호를 입력하세요 ">	
			 
			<input class="box box0" onclick="login(this.form)"  id="btn" type="button" value="evca 로그인 " >
			</form>
		
			<a class="box box1" href="https://kauth.kakao.com/oauth/authorize?client_id=87f46e151bc8f23f219057b08bd06a82&redirect_uri=http://localhost:9090/kakao/login&response_type=code" >
			  카카오 로그인 </a>
			<a class="box box2" href="/naverLogin.inc"> 네이버 로그인 </a>			
			<a class="box box3" href="/reg" >회원가입</a>	
			<a class= "box box4" href="/find" >아이디/비밀번호 찾기</a>	
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">

function login(){
	var frm2 = new FormData();
	var id = $("#evu_id").val();
	var pw = $("#evu_pw").val();
	frm2.append("evu_id",id);
	frm2.append("evu_pw",pw);
	$.ajax({
		  url: "login",
	         data: frm2,
	         type: "post",
	         contentType: false,
	         processData: false,
	         cache: false,
	         dataType: "json",
	}).done(function(data) {
		if(data.m == 1){
			if(id.trim().length <= 0){
				alert("아이디를 입력하세요");
				$("#evu_id").val(""); //청소
				$("#evu_id").focus();
				return;
			}
			if(pw.trim().length <= 0){
				alert("비밀번호를 입력하세요");
				$("#evu_pw").val(""); //청소
				$("#evu_pw").focus();
				return;
			}
			
			alert("아이디 또는 비밀번호가 틀립니다.");
			return;
		}
		if(data.m == 0){
			alert("로그인 되었습니다.");
			location.href="/";
		}
	}).fail(function() {
		
	})
	
	frm.submit();
}

</script>

</body>
</html>