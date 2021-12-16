<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title> evca 회원가입</title>
        <link rel="stylesheet" href="new_main.css">
         <link rel="stylesheet" href="resources/css/header/header.css" type="text/css">
		<link rel="stylesheet" href="resources/css/footer/footer.css" type="text/css">
		<link rel="stylesheet" href="resources/css/reg.css">
        <style type="text/css">
      
        </style>
        
    </head>
    <body>
    	<jsp:include page="header.jsp"/>
        <!-- header -->
        


        <!-- wrapper -->
        <div id="wrapper">
		<div id="header">
        	<h1> evca 회원가입 </h1>
        </div>
            <!-- content-->
            <div id="content">
			<form action="reg" method="post" autocomplete="off">
                <!-- ID -->
                <div class="id-div">
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="evu_id" id="evu_id" class="int" maxlength="20" placeholder="아이디를 입력하세요" oninput="idcheck()">
                    </span>
                    <p style="font-size: 12px"></p>
                </div>

                <!-- PW -->
                <div class="pw-div">
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="evu_pw" id="evu_pw" class="int" maxlength="20" placeholder="비밀번호를 입력하세요" oninput="pwcheck()">
                      
                    </span>
                     <p style="font-size: 12px"></p>
                </div>

               
                <!-- NAME -->
                <div class="name-div">
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="evu_name" id="evu_name" class="int" maxlength="20" placeholder="이름을 입력하세요" oninput="namecheck()">
                    </span>
                      <p style="font-size: 12px"></p>
                </div>

    
                <!-- EMAIL -->
                <div class="email-div">
                    <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" name="evu_email" id="evu_email" class="int" maxlength="100" placeholder="이메일을 입력하세요">
                        <button class="CertBtn" type="button" onclick="cert()">인증번호 발송</button>
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
                
                  <!-- EMAIL OK-->
                <div class="emailok-div" style="display: none;">
                    <h3 class="join_title"><label>이메일 인증확인</label></h3>
                    <span class="box int_email">
                        <input type="text" name="email_ok" id="email_ok" class="int" maxlength="100" placeholder="인증번호를 입력하세요">
                        <button class="CertBtn" type="button" onclick="certok()">인증번호 확인</button>
                    </span>
                </div>

                <!-- MOBILE -->
                <div class="phone-div">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="text"name="evu_phone" id="evu_phone" class="int" maxlength="16" placeholder="전화번호를 입력하세요(- 없이)" oninput="phonecheck()">
                    </span>
                     <p style="font-size: 12px"></p>
                </div>
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" onclick ="reg(this.form)" id="btnJoin">
                        <span>가입하기</span>
                    </button>	
                </div>
                
                <input type="hidden" id="goodId" value="1"/>
                <input type="hidden" id="goodpw" value="1"/>
                <input type="hidden" id="goodname" value="1"/>
                <input type="hidden" id="goodemail" value="1"/>
                <input type="hidden" id="goodphone" value="1"/>
                <input type="hidden" id="emailnum" value="1"/>
				</form>
            </div> 
        </div> 
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">

	//아이디 관련 유효성 검사
	function isId(asValue) {
	var regExp =  /^[a-z]+[a-z0-9]{6,20}$/g;
	return regExp.test(asValue);
	}

	function idcheck() {
		var frm = new FormData();
		var id = $("#evu_id").val();
		$("#evu_id").val(id.replace(/\s/gi,""));
		frm.append("id",id);
		$.ajax({
			  url: "idcheck",
		         data: frm,
		         type: "post",
		         contentType: false,
		         processData: false,
		         cache: false,
		         dataType: "json",
				
		}).done(function(data) {
			if(!isId(id)){
				$(".id-div p").text("영문자 또는 숫자를 포함하여 7~20자이어야 합니다.");
				$(".id-div p").css('color','black');
				$("#goodId").val(1);
				return;
			}
			
			if(data.code == '0'){
				$(".id-div p").text("사용가능한 아이디입니다.");
				$(".id-div p").css('color','green');
				$("#goodId").val(0);
				return;
			}
			
			if(data.code == "1"){
				$(".id-div p").text("이미 사용중인 아이디입니다.");
				$(".id-div p").css('color','red');
				$("#goodId").val(1);
				return;
			}
			
			if( $("#evu_id").val() == ""){
				$(".id-div p").text("");
				$("#goodId").val(1);
				return;
			}
				
		}).fail(function(err) {
			
		})
	}

	
	//비밀번호 관련 유효성 검사
	
	function isPw(asValue) {
	var regExp =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	return regExp.test(asValue);
	}
	
	function pwcheck() {
		var pw = $("#evu_pw").val();
		$("#evu_pw").val(pw.replace(/\s/gi,""));
		
		if(!isPw(pw)){
			$(".pw-div p").text("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여야 합니다.");
			$(".pw-div p").css('color','red');
			$("#goodpw").val(1);
			return;
		}
		
		if(isPw(pw)){
			$(".pw-div p").text("사용 가능한 비밀번호입니다.");
			$(".pw-div p").css('color','green');
			$("#goodpw").val(0);
			return;
		}
		
		if( $("#evu_pw").val() == ""){
			$(".pw-div p").text("");
			$("#goodpw").val(1);
			return;
		}
			

	}
	
	//이름 유효성 검사
	function isCorrect(asValue) {
	var regExp = /[가-힣]/;
    
	return regExp.test(asValue);
}
	
	function namecheck() {
		var name = $("#evu_name").val();
		$("#evu_name").val(name.replace(/\s/gi,""));
		
		if(!isCorrect(name)){
			$(".name-div p").text("ID/PW 분실 시 가입 정보를 통해 찾을 수 있으므로 정확히 입력해 주시기 바랍니다.");
			$(".name-div p").css('color','black');
			$("#goodname").val(1);
			return;
		}
		
		if(isCorrect(name)){
			$("#goodname").val(0);
			
			return;
		}
		
		if( $("#evu_name").val() == ""){
			$(".name-div p").text("");
			$("#goodname").val(1);
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
			$("#goodemail").val(1);
			return;
		}else{
			if(!email_check(email)){
				$(".email-div p").css('display','block');
				$(".email-div p").text("이메일 형식에 맞게 입력해주십시오.");
				$(".email-div p").css('color','red');
				$("#goodemail").val(1);
				return;
			}
			else{
				alert("인증번호가 발송되었습니다.");
				$(".email-div p").css('display','none');
				$(".emailok-div").css('display','block');
				var frm = new FormData();
				frm.append("email",email);
				$.ajax({
					 url: "sendMail",
			         data: frm,
			         type: "post",
			         contentType: false,
			         processData: false,
			         cache: false,
			         dataType: "json",
					
				}).done(function(data) {
					$("#emailnum").val(data.rnum);
				}).fail(function(err) {
					
				})
				
			}
		}
		
	} 
	
	function certok(){
		var emailnum = $("#emailnum").val();
		var usercert = $("#email_ok").val();
		if(emailnum == usercert){
			alert("이메일 인증에 성공하였습니다.");
			$("#goodemail").val(0);
		}else{
			alert("이메일 인증에 실패하였습니다.");
			$("#email_ok").val("");
			$("#email_ok").focus();
		}
	}
	
	function isPhoneNumber(asValue) {
		var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	 
		return regExp.test(asValue);
	}
	
	//전화번호 유효성 검사
	function phonecheck() {
		var phone = $("#evu_phone").val();
		$("#evu_phone").val(phone.replace(/\s/gi,""));
		
		if(!isPhoneNumber(phone)){
			$(".phone-div p").css('display','block');
			$(".phone-div p").text("전화번호 형식에 맞게 입력해주세요.");
			$(".phone-div p").css('color','red');
			$("#goodphone").val(1);
			return;
		}
		
		if(isPhoneNumber(phone)){
			$(".phone-div p").css('display','none');
			$("#goodphone").val(0);
			return;
		}
		
		if( $("#evu_phone").val() == ""){
			$(".phone-div p").text("");
			$("#evu_phone").val(1);
			return;
		}
			
	}
	
	//회원가입 유효성 검사
	function reg(frm) {
		var goodId = $("#goodId").val();
		var goodpw = $("#goodpw").val();
		var goodname = $("#goodname").val();
		var goodemail = $("#goodemail").val();
		var goodphone = $("#goodphone").val();
	
		if(goodId == 1){
			$("#evu_id").val("");
			$("#evu_id").focus();
			alert("아이디를 확인하십시오.");
			return;
		}
		
		if(goodpw == 1){
			$("#evu_pw").val("");
			$("#evu_pw").focus();
			alert("비밀번호를 확인하십시오.");
			return;
		}
		
		if(goodname == 1){
			$("#evu_name").val("");
			$("#evu_name").focus();
			alert("이름을 확인하십시오.");
			return;
		}
		
		if(goodemail == 1){
			$("#evu_email").focus();
			alert("이메일 인증을 확인하십시오.");
			return;
		}
		
		if(goodphone == 1){
			$("#goodphone").focus();
			alert("휴대폰번호를 확인하십시오.");
			return;
		}
		
		frm.submit();
	}
	
	
</script>
    </body>
</html>
