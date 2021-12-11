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
        <style type="text/css">
      
        /* 레이아웃 틀 */
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}


#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
    position: relative;
    height: 90%;
    margin: 220px 0 0 0;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}




/* 입력폼 */


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
    padding-right: 110px;
}



/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #64c9c3;
    font-size: 20px;
    font-weight: 400;
}
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
			<form action="reg" method="post">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="evu_id" id="evu_id" class="int" maxlength="20" placeholder="아이디를 입력하세요" oninput="idcheck()"/>
                    </span>
                </div>

                <!-- PW -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" name="evu_pw" id="evu_pw" class="int" maxlength="20" placeholder="비밀번호를 입력하세요">
                      
                    </span>
                </div>

               
                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="evu_name" id="evu_name" class="int" maxlength="20" placeholder="이름을 입력하세요">
                    </span>
                </div>

    
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" name="evu_email" id="evu_email" class="int" maxlength="100" placeholder="이메일을 입력하세요">
                    </span>
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="number"name="evu_phone" id="evu_phone" class="int" maxlength="16" placeholder="전화번호 입력하세요">
                    </span>
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" onclick ="reg(this.form)" id="btnJoin">
                        <span>가입하기</span>
                    </button>	
                </div>

                
				</form>

            </div> 
			
        </div> 
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">
	function idcheck() {
		var id = $("#evu_id").val().trim();
		console.log(id);
	}

	function reg(frm) {
		frm.submit();
	}
	
	
	
</script>
    </body>
</html>
