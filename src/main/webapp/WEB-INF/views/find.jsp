<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/header/header.css">
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/find.css">
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<div class="middle-wrap">
			<div class="tab">
				<ul class="tabnav">
					<li><a href="#tab01">아이디 찾기</a></li>
					<li><a href="#tab02">비밀번호 재설정</a></li>
				</ul>
				<div class="tabcontent">
					<div id="tab01">
						<div class="contents">
							<p class="head_p">이름과 이메일을 통해 아이디를 찾을 수 있습니다.</p>
							<div id="content">
								<!-- NAME -->
								<div class="name-div">
									<h3 class="join_title">
										<label>이름</label>
									</h3>
									<span class="box int_name"> <input type="text"
										name="find_Id_name" id="find_Id_name" class="int" maxlength="20"
										placeholder="이름을 입력하세요" >
									</span>
									<p style="font-size: 12px"></p>
								</div>

								<!-- EMAIL -->
								<div class="email-div">
									<h3 class="join_title">
										<label>본인확인 이메일</label>
									</h3>
									<span class="box int_email"> <input type="text"
										name="find_Id_email" id="find_Id_email" class="int" maxlength="100"
										placeholder="이메일을 입력하세요">
										<button class="CertBtn" type="button" onclick="findIdCert()">인증번호
											발송</button>
									</span>
									<p style="font-size: 12px"></p>
								</div>

								<!-- EMAIL OK-->
								<div class="id_emailok-div" style="display: none;">
									<h3 class="join_title">
										<label>이메일 인증확인</label>
									</h3>
									<span class="box int_email"> <input type="text"
										name="id_email_ok" id="id_email_ok" class="int" maxlength="100"
										placeholder="인증번호를 입력하세요">
										<button class="CertBtn" type="button" onclick="certok1()">인증번호
											확인</button>
									</span>
								</div>

								<button class="box findBtn" type="button" onclick="findIdCheck()">아이디
									찾기</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	 <input type="hidden" id="goodemail" value="1"/>
     <input type="hidden" id="emailnum" value="1"/>
	<jsp:include page="footer.jsp" />

	<script type="text/javascript">
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
				input_tab += "<button onclick='returns()' type='button' class='returns'>아이디 찾기</button>";
				$(".contents").html(input_tab);
			}).fail(function(err) {
				alert(err);
				alert("에러낫다 삐용삐용");
				
			})
			
		}
		
		function gologin() {
			location.href="/login";
		}
		
		function returns() {
			location.href="/find";
		}
	</script>
	<a style="background-color: "></a>
</body>
</html>


