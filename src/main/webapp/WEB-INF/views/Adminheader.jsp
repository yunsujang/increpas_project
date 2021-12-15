<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/adminheader.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
   <div id="menu">
   
   
      <ul class="main1">
      <li>
         <li><a id="userhome" href="/">유저홈</a></li>
         </li>
         <li><a href="admin.main">홈으로</a></li>
         

            

         <li><a>관리자</a>

         
            <ul class="main2">

            <li><a href="admin.category">게시판관리</a></li>

            <li><a href="admin.bbsList">관리자게시물</a></li>
            
            </ul></li>
         <li><a>유저</a>
            
            <ul class="main2">
               
               <li><a href="admin.list.ev">유저게시물</a></li>
               <li><a>유저관리</a> 
               <ul class="main3">
                  <li><a href="admin.user">일반회원</a></li>
                  <li><a href="admin.deleteduser">탈퇴회원</a></li>
               </ul><li>
                  
            
                        
            </ul>
         </li>   
         <li>
         
         <c:if test="${mvo ne null }">
         <a id="adminlogout" onclick="adminlogout()">로그아웃</a>
         </c:if>   
         
      </ul>
   </div>
   
<script>

      function adminlogout(){   
         
         if (confirm("로그아웃 하시겠습니까?") == true){
            realLogout();
         }else{
            return false;
         }
         
      }   
      
      function realLogout() {
         $.ajax({
            url:"adminlogout",
            type:"post",
            dataType: "json",   
         }).done(function(data) {
            alert("로그아웃 되었습니다.");
            location.href = "admin";
         }).fail(function(err) {
            
         })
      }
   
</script>

</body>
</html>