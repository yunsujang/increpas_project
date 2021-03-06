<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<style type="text/css">
.bi {
	padding: 0;
	margin: 0;
}

.bi:hover {
	cursor: pointer;
}

.ui-widget-header {
	background-color: #64c9c3;
	color: white;
}

#dialog {
	display: none;
	z-index: 999;
}

#user-padding {
	margin: 100px;
}

.logout {
	cursor: pointer;
}

#headersearchbtn {
	margin-left: 5px;
	background-color: #64c9c3;
	border: 1px solid gray;
	font-weight: bold;
	height: 31px;
	border-radius: 3px;
	color: white;
}

#headersearchbtn:hover {
	cursor: pointer;
}

header{
	z-index: 100;
}
</style>
</head>
<body>
	<header>
		<div class="logo-div">
			<a href="/"><img alt="" src="resources/img/evca_logo.png"
				class="logo-img" /></a>

		</div>

		<div class="menu-div" id="topBar">
			<div>
				<ul class="menu_ul">
					<li><a href="/">Home</a></li>
					<c:forEach items="${categoryName_ar }" var="nvo">
						<li><a href="/category?evcategory_idx=${nvo.evcategory_idx }">${nvo.evcategory_name }</a></li>
					</c:forEach>
					<li><a href="/evMap">충전소검색 </a></li>
					<li><a href="/list.ev">ev 소통해요 </a></li>
					<li><a href="/evStock">ev주식</a></li>
					<div class="user-div">
						<div class="user-padding"></div>
						<a onclick="searchDialog()"><svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
           <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
         </svg></a>

						<c:if test="${mvo eq null }">
							<a href="/login">로그인</a>
							<a href="/reg">회원가입</a>
						</c:if>

						<c:if test="${mvo ne null }">
							<a>${mvo.evu_name }님</a>
							<a href="mypage">마이페이지</a>
							<a onclick="logout('${sessionScope.grade}')" class="logout">로그아웃</a>
						</c:if>
					</div>
				</ul>

			</div>
		</div>
		<div id="fixNextTag"></div>
		<div id="dialog" title="검색">
			<form action="/search" method="get">
				<p style="font-size: 13px; font-weight: bold;">검색할 단어를 입력해주세요.</p>
				<input type="text" id="searchValue" name="searchValue" />
				<button type="button" id="headersearchbtn" onclick="search(this.form)"
					style="margin-left: 5px;">검색</button>
			</form>
		</div>
	</header>

	<!-- 스크립트 -->
	<script type="text/javascript">
         $(document).ready(function(){

            var topBar = $("#topBar").offset();

            $(window).scroll(function(){
               
               var docScrollY = $(document).scrollTop()
               var barThis = $("#topBar")
               var fixNext = $("#fixNextTag")
			   var userdiv = $(".user-div");
               
               if( docScrollY > topBar.top ) {
                  barThis.addClass("top_bar_fix");
                  fixNext.addClass("pd_top_80");
                  userdiv.css("top","20px");
                  
               }else{
                  barThis.removeClass("top_bar_fix");
                  fixNext.removeClass("pd_top_80");
                  userdiv.css("top","150px");
                }

            });

         })
         
         function searchDialog() {
             $("#dialog").dialog({
            	 position: { my: "center top", at: "center bottom", of: ".menu_ul" },
             });
         }
         
         //검색버튼눌렀을때
         function search(frm) {
        	 if($('#searchValue').val().trim().length <= 0){
         	    alert("검색하실 단어를 입력하세요.");
         	   $('#searchValue').val("");
         	  $('#searchValue').focus();
         		 return;
         	 }
        	 
        	 //폼경로지정 
        	frm.submit();       	
         }
         
         function logout(grade){
        	if(grade == "0"){
	            if (confirm("로그아웃 하시겠습니까?") == true){
	               realLogout();
	            }else{
	               return false;
	            }
        	}else if(grade == "1"){
        		 if (confirm("로그아웃 하시겠습니까?") == true){
  	              location.href="https://kauth.kakao.com/oauth/logout?client_id=87f46e151bc8f23f219057b08bd06a82&logout_redirect_uri=http://localhost:9090/kakao/logout";
  	            }else{
  	               return false;
  	            }
        	}else if(grade == "2"){
        		if (confirm("로그아웃 하시겠습니까?") == true){
    	              location.href="naverlogout";
    	            }else{
    	               return false;
    	            }
        	}
         }
         
         function realLogout() {
            $.ajax({
               url:"logout",
               type:"post",
               dataType: "json",   
            }).done(function(data) {
               alert("로그아웃 되었습니다.");
               location.reload(true);
            }).fail(function(err) {
               
            })
         }
      
      </script>
</body>
</html>
