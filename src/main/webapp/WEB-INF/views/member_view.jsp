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
<link rel="stylesheet" href="resources/css/member_view.css" 	
	type="text/css">

<title>회원 정보수정</title>

</head>
<body>
<jsp:include page="header.jsp" />	

    <div id="wrapper">
		<div id="header">
			<h1 > 회원정보 수정 </h1>
			<h2> 회원님의 이름, 이메일 ,전화번호를 수정할수 있습니다.</h2>
		</div>
		 <div id="content">
			<form action="update" method="post">
		 		<div class="id-div">
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="evu_id" id="evu_id" class="int" value="${evo.evu_id}"  readonly="readonly">
                    </span>
                    <p style="font-size: 12px"></p>
                </div>
		
	<%--  
		    <!-- PW -->
                <div class="pw-div">
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="evu_pw" id="evu_pw" class="int" >
                      
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
		--%>
		 
                <!-- NAME -->
                <div class="name-div">
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="evu_name" id="evu_name" class="int"value="${evo.evu_name}" oninput="namecheck()">
                    </span>
                      <p style="font-size: 12px"></p>
                </div>
		
		  <!-- EMAIL -->
                <div class="email-div">
                    <h3 class="join_title"><label for="email">이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" name="evu_email" id="evu_email" class="int"value="${evo.evu_email}" oninput="cert()">
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
                
		   <!-- MOBILE -->
                <div class="phone-div">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="text"name="evu_phone" id="evu_phone" class="int" value="${evo.evu_phone}" oninput="phonecheck()">
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
		
		 <!--  BTN-->
                <div class="btn_area">
                    <button type="button" onclick ="modi(this.form)" id="btnUpdate" >
                        <span>회원정보수정</span>	
                    </button>	
                    <button type="button" onclick="javascript:window.location='/'" id="btnCancel" >
                        <span>취소</span>
                    </button>	
                </div>
                <input type="hidden" value="${evo.evu_idx }">
 		</form>
 		</div>
	</div>
	<jsp:include page="footer.jsp" />



	<script type="text/javascript">

	//이름 유효성 검사
	function isCorrect(asValue) {
	var regExp = /[가-힣]{1,5}$/;
    
	return regExp.test(asValue);
}
	
	function namecheck() {
		var name = $("#evu_name").val();
		$("#evu_name").val(name.replace(/\s/gi,""));

		if(name==""){
			$(".name-div p").css('display','block');
			$(".name-div p").text("이름을 입력해주시기 바랍니다.");
			$(".name-div p").css('color','black');
			return;}
		else{
			if(!isCorrect(name)){
			$(".name-div p").css('display','block');
			$(".name-div p").text("이름을 형식에 맞게 입력해주세요.");
			$(".name-div p").css('color','red');
			return;
			}
		}
		
		if(isCorrect(name)){
			$(".name-div p").css('display','none');
			return;
		}
		
		if( $("#evu_name").val() == ""){
			$(".name-div p").text("");
			return;
		}
	}
	
	
	//이메일 유효성 검사
	function email_check(email) {
	
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		return reg.test(email);
	
	}
	function cert() {
		
		var email = $("#evu_email").val();

		if(email==""){
			$(".email-div p").css('display','block');
			$(".email-div p").text("이메일을 입력해주시기 바랍니다.");
			$(".email-div p").css('color','red');
			return;
		}else{
			if(!email_check(email)){
				$(".email-div p").css('display','block');
				$(".email-div p").text("이메일 형식에 맞게 입력해주십시오.");
				$(".email-div p").css('color','red');
				return;
			}
			$(".email-div p").css('display','none');
				
			}
		}
	
	//전화번호 유효성 검사
	function phonecheck() {
		var phone = $("#evu_phone").val();
		$("#evu_phone").val(phone.replace(/\s/gi,""));
		
		if(phone==""){
			$(".phone-div p").css('display','block');
			$(".phone-div p").text("번호를 입력해주시기 바랍니다.");
			$(".phone-div p").css('color','black');
			return;}
		else{
		if(!isPhoneNumber(phone)){
			$(".phone-div p").css('display','block');
			$(".phone-div p").text("전화번호 형식에 맞게 입력해주세요.");
			$(".phone-div p").css('color','red');
			return;
		}}
		
		if(isPhoneNumber(phone)){
			$(".phone-div p").css('display','none');
			return;
		}
		
		if( $("#evu_phone").val() == ""){
			$(".phone-div p").text("");
			return;
		}
			
	}
	
	function modi() {
		alert("회원정보가 수정되었습니다.");
		document.forms[1].submit();
		}

		</script>
</body>
</html>