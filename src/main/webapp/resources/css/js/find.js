
		$(function() {
			$('.tabcontent > div').hide();
			$("#goodemail").val(1);
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
		
		
		function findIdCert() {
			var find_Id_email = $("#find_Id_email").val().trim();

			if(find_Id_email.length <= 0){
				alert("이메일을 입력해주세요.");
				$("#find_Id_email").val("");
				$("#find_Id_email").focus();
				$("#goodemail").val(1);
				return;
			}else{
				if(!email_check(find_Id_email)){
					alert("이메일 형식에 맞게 입력해주십시오.");
					$("#goodemail").val(1);
					return;
				}
				else{
					alert("인증번호가 발송되었습니다.");
					$(".id_emailok-div").css('display','block');
					var frm = new FormData();
					frm.append("email",find_Id_email);
					$.ajax({
						 url: "sendMail",
				         data: frm,
				         type: "post",
				         contentType: false,
				         processData: false,
				         cache: false,
				         dataType: "json",
						
					}).done(function(data) {
						var enums = data.rnum;
						
						$("#emailnum").val(data.rnum);
					}).fail(function(err) {
						
					})
					
				}
			}
			
		} 
		
		function certok1(){
			var emailnum = $("#emailnum").val();
			var usercert = $("#id_email_ok").val();
			if(emailnum == usercert){
				alert("이메일 인증에 성공하였습니다.");
				$("#goodemail").val(0);
			}else{
				alert("이메일 인증에 실패하였습니다.");
				$("#id_email_ok").val("");
				$("#id_email_ok").focus();
			}
		}
		
		
		function findIdCheck() {
			var name = $("#find_Id_name").val().trim();
			var email = $("#find_Id_email").val().trim();
			var ok = $("#goodemail").val();

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
			if(ok == "1"){
				alert("이메일 인증을 확인하세요");
				return;
			}
			
			findId(name,email);
				
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
				$(".findContents").html(input_tab);
				$(".findContents").css("display","block");
				$(".findContents").css("margin","120px 0");
			}).fail(function(err) {
				alert(err);
				alert("에러낫다 삐용삐용");
				
			})
			
		}
		
		function gologin() {
			location.href="/login";
		}
		
		function returns() {
			$("#content").css("display","block");
			$(".head_p").css("display","block");
			$(".contents").css("margin","0");
			$(".find_p").css("display","none");
			$(".findContents").css("display","none");
			$(".id_emailok-div").css("display","none");
			$("#find_Id_email").val("");
			$("#find_Id_name").val("");
			$("#find_Id_name").focus();
			$("#goodemail").val(1);
		}
