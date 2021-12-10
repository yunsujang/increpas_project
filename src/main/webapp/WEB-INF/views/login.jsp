<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 </title>

<link rel="stylesheet" href="resources/style.css" type="text/css">
<link rel="stylesheet" href="resources/css/header/header.css" type="text/css">
<link rel="stylesheet" href="resources/css/footer/footer.css" type="text/css">
<style type="text/css">

body{
	font-family : 'nanumgothic';
	font-size :13px;
	color:#222;
	margin:0;
	padding:0;
	background-color: #f5f5f5;
}

.container{
	background-color: #f5f5f5;
	height:auto;
	min-height: 565px; 
	margin: 250px 0 0 0;
	
}

.login{
	width:390px;
	margin: 200px 0 0 0;
	/* Center layout */
	position:absolute;
	top:-25%;
	left:50%;
	transform:translate(-50%, 50%);
	
}
.loginh{
	text-align: center;
	margin-bottom: 30px;
	color :#64c9c3; 
	font-size: 45px;
}


.login-type{
	text-align: center;
}

.login-type h1 {
	 font-size :44px;
	 text-align:  center;
}

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

a.box { 
	margin-top:20px;
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
	text-decoration: none;
	
}

a.box:hover {
	background-color: #fff;
	color: #222;
}
a.box0{
	background-color: #64c9c3; 
	color : #fff;
	text-align: center;
}
a.box1{
	background-color:#eac745; 
	color : brown;
	text-align: center;
}
a.box2{
	background-color:#8ec75a; 
	color : #fff;
	text-align: center;
}

a.box3{
	background-color : #cb5d5e; 
	color : #fff;
	text-align: center;

}





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
			
			<form class="loginbox" action="login" method="post">
					<input type="text" name="evu_id" id="evu_id" placeholder="아이디를 입력하세요">
					<br>
					<input type="password" name="evu_pw" id="evu_pw" placeholder="비밀번호를 입력하세요 ">	
				
			 
			<input class="box box0" onclick="login(this.form)"  id="btn" type="button" value="evca 로그인 " 	>
			</form>
		
			<a class="box box1" href="https://kauth.kakao.com/oauth/authorize?client_id=a5b66323922803723c655f41824d1a38&redirect_uri=http://localhost:9090/kakao/login&response_type=code" >
			  카카오 로그인 </a>	
			<a class="box box2" href=""> 네이버 로그인 </a>			
			<a class="box box3" href="/reg" >회원가입</a>	
		
		</div>
	

	</div>
	<jsp:include page="footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
/* $(function(){
	//아이디가 btn인 요소가 클릭할 때
	$("#btn").bind("click",function(){
		alert("hi");
		//사용자가 입력한 아이디 및 비밀번호를 가져온다.
		var id = $("#evu_id").val();
		alert(id);
		var pw = $("#evu_pw").val();
		
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
		//현재 문서에서 가장 첫번째 폼을 서버경로를 변경한다.
		//document.forms[0].action = "Ex3_Login";
		//document.forms[0].submit();//서버로 보낸다.
		
		
	});
}); */

function login(frm){
	var id = $("#evu_id").val();
	var pw = $("#evu_pw").val();
	
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
	
	frm.submit();
}

</script>

</body>
</html>