<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>JSP 게시판 웹 사이트</title>

<style type="text/css">
#back{
    background: lightgoldenrodyellow;
    border-radius: 10px;
    border: 1px solid #85c4b9;
    width: 25%;
    margin: auto;
    margin-top: 200px;
	} 
#evu_id{
	width: 49%;
    transform: translate(50%, -30%);
    border: 1px solid #85c4b9;
    padding: 5px 1px 1px 0px;
}
#evu_pw{
	width: 49%;
    transform: translate(50%, -18%);
    border: 1px solid #85c4b9;
    padding: 3px 1px 1px 0px;
}
#btn{
	width: 50%;
	transform: translate(50%, 5%);
	margin: -4px 0px 7px 0px;
}

</style>

</head>
<body>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div>
				<form id="back" method="post" action="loginAction.jsp">
					<h3 style="text-align: center; height:50px;">관리자 로그인</h3>
					<div class="form-group" >
						<input type="text" class="form-control" placeholder="아이디" name="evu_id" id="evu_id" maxlength="10">						
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="evu_pw" id="evu_pw" maxlength="10">						
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