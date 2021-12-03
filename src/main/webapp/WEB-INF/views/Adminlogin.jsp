<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="background: lightgoldenrodyellow;padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center; height:50px;">관리자 로그인</h3>
					<div class="form-group" >
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">						
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">						
					</div>
					<button type="button" id="btn" 
					style="background:#85c4b9" 
					onclick="javascript:location.href='admin.main'">로그인</button>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
</html>