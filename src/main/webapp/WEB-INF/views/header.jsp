<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
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
            </ul>
            
   
         </div>
      </div>
      <div id="fixNextTag"></div>
      <div id="dialog" title="검색">
         <form action="/search" method="post">
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

               if( docScrollY > topBar.top ) {
                  barThis.addClass("top_bar_fix");
                  fixNext.addClass("pd_top_80");
               }else{
                  barThis.removeClass("top_bar_fix");
                  fixNext.removeClass("pd_top_80");
                }

            });

         })
         
         function searchDialog() {
             $( "#dialog" ).dialog();
         }
         
         function search(frm) {
            frm.submit();
         }
         
         function logout(){
            if (confirm("정말 삭제하시겠습니까??") == true){
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
