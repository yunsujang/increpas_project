	$(function() {
			$('.tabcontent > div').hide();
			$('.tabnav a').click(function() {
				$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabnav a').removeClass('active');
				$(this).addClass('active');
				return false;
			}).filter(':eq(0)').click();
		});
		
		//이메일 유효성 검사
		function email_check(email) {
		
			var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			return reg.test(email);
		
		}
		
		//아이디 찾기 이메일 인증
		function findIdCert() {
			var find_Id_name = $("#find_Id_name").val().trim();
			var find_Id_email = $("#find_Id_email").val().trim();
			
			if(find_Id_name.length <= 0){
				alert("이름을 입력해주세요.");
				$("#find_Id_name").val("");
				$("#find_Id_name").focus();
				return;
			}
			
			if(find_Id_email.length <= 0){
				alert("이메일을 입력해주세요.");
				$("#find_Id_email").val("");
				$("#find_Id_email").focus();
				return;
			}else{
				if(!email_check(find_Id_email)){
					alert("이메일 형식에 맞게 입력해주십시오.");
					return;
				}
				else{
					alert("인증번호가 발송되었습니다.");
					$(".id_emailok-div").css('display','block');
					$.ajax({
						 url: "sendMail",
				         data: {"email":find_Id_email},
				         type: "post",
					})
				}
			}
		} 
		
		function certok1(){
			$.ajax({
				 url: "getcode",
		         type: "post",
		         contentType: false,
		         processData: false,
		         cache: false,
		         dataType: "json",
				
			}).done(function(data) {
				var usercert = $("#id_email_ok").val();
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
		
		function findIdCheck() {
			var name = $("#find_Id_name").val().trim();
			var email = $("#find_Id_email").val().trim();

			if (name.length <= 0) {
				alert("이름을 입력하세요.");
				$("#find_Id_name").val("");
				$("#find_Id_name").focus();
				return;
			}
			if (email.length <= 0) {
				alert("이메일을 입력하세요.");
				$("#find_Id_email").val("");
				$("#find_Id_email").focus();
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
				
				findId(name,email);
			}).fail(function(err) {
				
			})
			
		}
		
		function findId(name, email) {
			// 잘 왔는 지 확인
			//alert(name+email);
			// 값이 잘 넘어왔다면 비동기식 통신으로 유효한 값인지 확인하자!
			$.ajax({
				url:"findId",
				type:"post",
				data:{"name":name , "email":email},
		        dataType: "json",
			}).done(function(data) {
				if(data.ok == "1"){
					alert(data.code);
					$("#find_Id_email").val("");
					$("#find_Id_name").val("");
					$("#find_Id_name").focus();
					$("#id_email_ok").val("");
					$(".id_emailok-div").css("display","none");
				}
					
				if(data.ok == "0"){
				var input_tab = "<p class='find_p'>다음정보로 가입된 아이디가 총 ";
				input_tab += data.str[0];
				input_tab += "개 있습니다.</p>";
				
				$("#content").css("display","none");
				$(".head_p").css("display","none");
				$(".contents").css("margin","120px 0");
				for(var i = 0; i< data.code.length; i++){
						input_tab += "<a>아이디 : ";
						input_tab +=data.code[i];
						input_tab +="</a></br>";
				}
				
				input_tab += "<button onclick='gologin()' type='button' class='goLogin'>로그인으로</button>";
				input_tab += "<button onclick='returns()' type='button' class='returns'>이전</button>";
				$(".find_Id_Contents").html(input_tab);
				$(".find_Id_Contents").css("display","block");
				$(".find_Id_Contents").css("margin","120px 0");
				}
				
				$.ajax({
					url: "finish",
			        type: "post",
				})
				
			}).fail(function(err) {
				alert(err);
				alert("에러낫다 삐용삐용");
				
			})
			
		}
		
		function gologin() {
			returns();
			location.href="/login";
		}
		
		function returns() {
			$("#content").css("display","block");
			$(".head_p").css("display","block");
			$(".contents").css("margin","0");
			$(".find_p").css("display","none");
			$(".find_Id_Contents").css("display","none");
			$(".id_emailok-div").css("display","none");
			$("#find_Id_email").val("");
			$("#find_Id_name").val("");
			$("#find_Id_name").focus();
			$("#id_email_ok").val("");
		}
		
		//비밀번호 재설정
		function findPwCert() {
			var find_Pw_id = $("#find_Pw_id").val().trim();
			var find_Pw_email = $("#find_Pw_email").val().trim();

			if(find_Pw_id.length <= 0){
				alert("아이디를 입력해주세요.");
				$("#find_Pw_id").val("");
				$("#find_Pw_id").focus();
				return;
			}
			
			if(find_Pw_email.length <= 0){
				alert("이메일을 입력해주세요.");
				$("#find_Pw_email").val("");
				$("#find_Pw_email").focus();
				return;
			}else{
				if(!email_check(find_Pw_email)){
					alert("이메일 형식에 맞게 입력해주십시오.");
					return;
				}
				else{
					alert("인증번호가 발송되었습니다.");
					$(".pw_emailok-div").css('display','block');
					$.ajax({
						 url: "sendMail",
				         data: {"email":find_Pw_email},
				         type: "post",
					})
				}
			}
			
		} 
		
		function certok2(){
			$.ajax({
				 url: "getcode",
		         type: "post",
		         contentType: false,
		         processData: false,
		         cache: false,
		         dataType: "json",
				
			}).done(function(data) {
				var usercert = $("#pw_email_ok").val();
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
		

		
		function findPwCheck() {
			var id = $("#find_Pw_id").val().trim();
			var email = $("#find_Pw_email").val().trim();

			if (id.length <= 0) {
				alert("아이디를 입력하세요.");
				$("#find_Pw_id").val("");
				$("#find_Pw_id").focus();
				return;
			}
			if (email.length <= 0) {
				alert("이메일을 입력하세요.");
				$("#find_Pw_email").val("");
				$("#find_Pw_email").focus();
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
				findPw(id,email);
			}).fail(function(err) {
				
			})
			
		}
				
		function findPw(id,email) {
			$.ajax({
				url:"findPw",
				data:{"id":id, "email":email},
				type:"post",
				dataType:"json",
				
			}).done(function(data) {
				if(data.cnt == "1"){
					alert("해당하는 정보를 찾을 수 없습니다.");
					$("#find_Pw_id").val("");
					$("#find_Pw_email").val("");
					$(".pw_emailok-div").css("display","none");
					$("#pw_email_ok").val("");
					return;
				}
				$("#r_id").val(id);
				$(".pwcontents").css("display","none");
				var input_tab = "<p class='pwfind_p'>재설정하실 비밀번호를 입력하세요.</p> ";
				input_tab+= "<input type='password' id='ChangePw' name='ChangePw'/></br>"
				input_tab+="<button type='button' class='changeBtn'onclick='Change()'>비밀번호 재설정</button>";
				$("#pwcontent").css("display","none");
				$(".pwhead_p").css("display","none");
				$(".pwcontents").css("margin","120px 0");
				$(".find_Pw_Contents").html(input_tab);
				$(".find_Pw_Contents").css("display","block");
				$(".find_Pw_Contents").css("margin","120px 0");
				$.ajax({
					url: "finish",
			        type: "post",
				})
				
			}).fail(function(err) {
				
			})
			
			
		}
		
		function isPw(asValue) {
			var regExp =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			return regExp.test(asValue);
			}
		
		function Change() {
			var changePw = $("#ChangePw").val().trim();
			var id = $("#r_id").val().trim();
			if(changePw <= 0){
				alert("새로운 비밀번호를 입력하세요.");
				$("#ChangePw").val("");
				$("#ChangePw").focus();
				return;
			}
			
			if(!isPw(changePw)){
				alert("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여야 합니다.");
				$("#ChangePw").val("");
				$("#ChangePw").focus();
				return;
			}
			
			$.ajax({
				url:"changePw",
				data:{"id":id, "pw":changePw},
				type:"post",
				dataType:"json"
			}).done(function(data) {
				if(data.code == "1"){
					alert("뭔가 잘못되었습니다. 메인화면으로 돌아갑니다.");
					location.href="/";
					return;
				}
				if(data.code == "0"){
					var result = confirm("비밀번호 변경이 완료되었습니다. 로그인 화면으로 가시겠습니까?\r\n 취소할 시 홈으로 이동합니다.");
					if(result){
						location.href="/login";
					}
					if(!result){
						location.href="/";
					}
					
				}
				
			}).fail(function(err) {
				alert(err);
				alert("오류다");
			})
		}