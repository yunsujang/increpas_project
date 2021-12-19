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
						<div class="find_Id_Contents"></div>
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
					
					<div id="tab02">
						<div class="find_Pw_Contents"></div>
						<div class="pwcontents">
							<p class="pwhead_p">아이디와 이메일을 통해 비밀번호를 재설정 할 수 있습니다.</p>
							<div id="pwcontent">
								<!-- NAME -->
								<div class="name-div">
									<h3 class="join_title">
										<label>아이디</label>
									</h3>
									<span class="box int_name"> <input type="text"
										name="find_Pw_id" id="find_Pw_id" class="int" maxlength="20"
										placeholder="아이디를 입력하세요" >
									</span>
									<p style="font-size: 12px"></p>
								</div>

								<!-- EMAIL -->
								<div class="email-div">
									<h3 class="join_title">
										<label>본인확인 이메일</label>
									</h3>
									<span class="box int_email"> <input type="text"
										name="find_Pw_email" id="find_Pw_email" class="int" maxlength="100"
										placeholder="이메일을 입력하세요">
										<button class="CertBtn" type="button" onclick="findPwCert()">인증번호
											발송</button>
									</span>
									<p style="font-size: 12px"></p>
								</div>

								<!-- EMAIL OK-->
								<div class="pw_emailok-div" style="display: none;">
									<h3 class="join_title">
										<label>이메일 인증확인</label>
									</h3>
									<span class="box int_email"> <input type="text"
										name="pw_email_ok" id="pw_email_ok" class="int" maxlength="100"
										placeholder="인증번호를 입력하세요">
										<button class="CertBtn" type="button" onclick="certok2()">인증번호
											확인</button>
									</span>
								</div>
								
								<button class="box findBtn" type="button" onclick="findPwCheck()">비밀번호 재설정</button>
								<input type="hidden" id="r_id">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />

	<script type="text/javascript" src="resources/js/find.js">
	
	</script>
</body>
</html>


