function login(){
	var frm2 = new FormData();
	var id = $("#evu_id").val();
	var pw = $("#evu_pw").val();
	frm2.append("evu_id",id);
	frm2.append("evu_pw",pw);
	$.ajax({
		  url: "login",
	         data: frm2,
	         type: "post",
	         contentType: false,
	         processData: false,
	         cache: false,
	         dataType: "json",
	}).done(function(data) {
		if(data.m == 1){
			if(id.trim().length <= 0){
				alert("아이디를 입력하세요");
				$("#evu_id").val(""); //청소
				$("#evu_id").focus();
				return;
			}
			if(pw.trim().length <= 0){
				alert("비밀번호를 입력하세요");
				$("#evu_pw").val(""); //청소
				$("#evu_pw").focus();
				return;
			}
			
			alert("아이디 또는 비밀번호가 틀립니다.");
			return;
		}
		if(data.m == 2){
			alert("해당하는 정보가 없습니다.");
			return;
		}
		
		if(data.m == 3){
			alert("탈퇴한 회원입니다.");
			return;
		}
		
		if(data.m == 0){
			alert("로그인 되었습니다.");
			location.href="/";
		}
	}).fail(function() {
		
	})
	
	frm.submit();
}