
	//아이디 관련 유효성 검사
	function isId(asValue) {
	var regExp =  /^[a-z]+[a-z0-9]{6,20}$/g;
	return regExp.test(asValue);
	}

	function idcheck() {
		var id = $("#evu_id").val();
		$("#evu_id").val(id.replace(/\s/gi,""));
		$.ajax({
			  	 url: "idcheck",
		         data: {"id":id},
		         type: "post",
		         dataType: "json",
				
		}).done(function(data) {
			if(!isId(id)){
				$(".id-div p").text("영문자 또는 숫자를 포함하여 7~20자이어야 합니다.");
				$(".id-div p").css('color','black');
				return;
			}
			
			if(data.code == '0'){
				$(".id-div p").text("사용가능한 아이디입니다.");
				$(".id-div p").css('color','green');
				return;
			}
			
			if(data.code == "1"){
				$(".id-div p").text("이미 사용중인 아이디입니다.");
				$(".id-div p").css('color','red');
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
			return;
		}
		
		if(isPw(pw)){
			$(".pw-div p").text("사용 가능한 비밀번호입니다.");
			$(".pw-div p").css('color','green');
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
			return;
		}
	}
	
	//이메일 유효성 검사
	function email_check(email) {
	
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		return reg.test(email);
	
	}
	
	function emailcheck() {
		var email = $("#evu_email").val();
		$("#evu_email").val(email.replace(/\s/gi,""));
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
			else{
				alert("인증번호가 발송되었습니다.");
				$(".email-div p").css('display','none');
				$(".emailok-div").css('display','block');
				$.ajax({
					 url: "sendMail",
			         data: {"email":email},
			         type: "post",
				})
			}
		}
		
	} 
	
	function certok(){
		$.ajax({
			 url: "getcode",
	         type: "post",
	         contentType: false,
	         processData: false,
	         cache: false,
	         dataType: "json",
			
		}).done(function(data) {
			var usercert = $("#email_ok").val();
			if(data.code == usercert){
				alert("이메일 인증에 성공하였습니다.");
				$.ajax({
					 url: "setSuccess",
			         type: "post",
				})
			}else{
				alert("이메일 인증에 실패하였습니다.");
				$("#email_ok").focus();
			}
		}).fail(function(err) {
			
		})
		
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
			return;
		}
		
		if(isPhoneNumber(phone)){
			$(".phone-div p").css('display','none');
			return;
		}
	}
	
	// 회원가입 유효성 검사
	function reg(frm) {
		
		// 유효성 검사를 위한 변수들 값 가져오기
		var id = $("#evu_id").val();
		var pw = $("#evu_pw").val();
		var name = $("#evu_name").val();
		var email = $("#evu_email").val();
		var phone = $("#evu_phone").val();
		
		// 아이디 검사
		if( $("#evu_id").val().trim() == ""){
			alert("아이디를 입력하세요.");
			return;
		}
		
		if(!isId(id)){
			alert("아이디는 영문자 또는 숫자를 포함하여 7~20자이어야 합니다.");
			return;
		}
		
		$.ajax({
			  url: "idcheck",
		         data: {"id" : id},
		         type: "post",
		         dataType: "json",
				
		}).done(function(data) {
			if(data.code == "1"){
				alert("이미 사용중인 아이디입니다.");
				return;
			}
			
			// 비밀번호 검사
			if( $("#evu_pw").val().trim() == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			if(!isPw(pw)){
				alert("비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여야 합니다.");
				return;
			}
			
			//이름 검사
			if( $("#evu_name").val().trim() == ""){
				alert("이름을 입력하세요.");
				return;
			}
			
			if(!isCorrect(name)){
				alert("정확한 이름을 입력해 주세요");
				return;
			}
			
			//이메일 검사
			if( $("#evu_email").val().trim() == ""){
				alert("이메일을 입력하세요.");
				return;
			}
			
			if(!email_check(email)){
				alert("정확한 이메일을 입력해 주세요");
				return;
			}
			
			if($("#email_ok").val().trim() == ""){
				alert("이메일 인증번호를 입력하세요.");
				return;
			}
			
			$.ajax({
				url: "getSuccess",
		        type: "post",
		        dataType:"json",
			}).done(function(data) {
				if(data.code == "1"){
					alert("이메일 인증을 확인하세요.");
					return;
				}
					if( $("#evu_phone").val().trim() == ""){
						alert("전화번호를 입력하세요.");
						return;
					}
				
					//전화번호 검사
					if(!isPhoneNumber(phone)){
						alert("전화번호 형식에 맞게 입력해주세요.");
						return;
					}
					
					$.ajax({
						url: "finish",
				        type: "post",
					}).done(function() {
						alert("회원가입 되었습니다.");
						frm.submit();
					})
								
			}).fail(function(err) {
				alert(err);
				alert("에러났다 삐용삐용!");
			})
			
		}).fail(function(err) {
			alert(err);
			alert("에러났다 삐용삐용!");
		})
		
	}
	
	
	