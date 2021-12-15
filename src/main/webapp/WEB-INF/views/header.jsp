<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/header/header.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<style type="text/css">
   .bi{
      padding: 0;
      margin: 0;
   }   
   
   .bi:hover{
      cursor: pointer;
   }
   
   
   .ui-widget-header{
      background-color: #85c4b9;
      color:white;
   } 

   #dialog{
      display: none;
      z-index: 999;
   }

   #user-padding{
      margin: 100px;
   }
   
   .logout{
      cursor: pointer;
   }
   
/* 햄버거 */

.menu {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  max-width: 0;
  transition: 0.5s ease;
  z-index: 1;
  background-color: #eee;
}

.burger-icon {
  cursor: pointer;
  display: inline-block;
  position: absolute;
  z-index: 2;
  padding: 8px 0;
  top: 4px;
  left: 4px;
  user-select: none;
  width: auto;
  margin: 0;
}

.burger-icon .burger-sticks {
  background: #333;
  display: block;
  height: 2px;
  position: relative;
  transition: background .2s ease-out;
  width: 18px;
}

.burger-icon .burger-sticks:before,
.burger-icon .burger-sticks:after {
  background: #333;
  content: '';
  display: block;
  height: 100%;
  position: absolute;
  transition: all .2s ease-out;
  width: 100%;
}

.burger-icon .burger-sticks:before {
  top: 5px;
}

.burger-icon .burger-sticks:after {
  top: -5px;
}

.burger-check {
  display: none;
}

.burger-check:checked~.menu {
  max-width: 200px;
}

.burger-check:checked~.burger-icon .burger-sticks {
  background: transparent;
}

.burger-check:checked~.burger-icon .burger-sticks:before {
  transform: rotate(-45deg);
}

.burger-check:checked~.burger-icon .burger-sticks:after {
  transform: rotate(45deg);
}

.burger-check:checked~.burger-icon:not(.steps) .burger-sticks:before,
.burger-check:checked~.burger-icon:not(.steps) .burger-sticks:after {
  top: 0;
}
</style>
</head>
<body>
<!--  
	<input class="burger-check" type="checkbox" id="burger-check" /><label class="burger-icon" for="burger-check"><span class="burger-sticks"></span></label>
<div class="menu">
  <div style="width: 500px; text-align: center;">
  </div>
</div>
-->

   <header>
      <div class="logo-div">
         <a href="/"><img alt="" src="resources/img/evca_logo.png"
            class="logo-img" /></a>
            
      </div>
	<input class="burger-check" type="checkbox" id="burger-check" /><label class="burger-icon" for="burger-check"><span class="burger-sticks"></span></label>
	
	
      <div class="menu-div" id="topBar">
     
         <ul class="menu_ul">
            <li><a href="/">Home</a></li>
            <c:forEach items="${categoryName_ar }" var="nvo">
               <li><a href="/category?evcategory_idx=${nvo.evcategory_idx }">${nvo.evcategory_name }</a></li>
            </c:forEach>
            <li><a href="/evMap">충전소검색 </a></li>
            <li><a href="/list.ev">ev 소통해요 </a></li>
            <li><a href="/evStock">ev주식</a></li>
            </ul>
        
		    </div>
			
            
            <div class="user-div">
            
            <div class="user-padding">
            
            </div>
               <a onclick="searchDialog()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
           <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
         </svg></a>
            
               <c:if test="${mvo eq null }">
                  <a href="/login">로그인</a>
                  <a href="/reg">회원가입</a>
               </c:if>
               
               <c:if test="${mvo ne null }">
               <a>${mvo.evu_name }님</a>
                  <a>마이페이지</a>
                  <a onclick="logout()" class="logout">로그아웃</a>
               </c:if>
            </div>
          
            
         </div>
      </div>
      <div id="fixNextTag"></div>
      <div id="dialog" title="검색">
         <form action="/search" method="get">
            <p style="font-size: 13px;">검색할 단어를 입력해주세요.</p>
            <input type="text" id="searchValue" name="searchValue"/>
            <button id="searchbtn" onclick="search(this.form)" style="margin-left: 5px;">검색</button>
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
         
         function search(frm) {
            frm.submit();
         }
         
         function logout(){
            if (confirm("로그아웃 하시겠습니까?") == true){
               realLogout();
            }else{
               return false;
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
