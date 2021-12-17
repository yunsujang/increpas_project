<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title> evca 회원가입</title>
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
                        <input type="text" name="evu_email" id="evu_email" class="int" maxlength="100" placeholder="이메일을 입력하세요" oninput="emailcheck()">
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
				</form>
            </div> 
        </div> 
	<jsp:include page="footer.jsp"/>
<script src="resources/js/reg.js">
</script>
    </body>
</html>
