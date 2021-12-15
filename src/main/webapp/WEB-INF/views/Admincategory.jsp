<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/admincategory.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>

   <jsp:include page="Adminheader.jsp" />
   <p class="category-management-p">게시판 관리</p>
   <div id="bbs">
      <p class="totalList">총 ${totalCount }건</p>
      
      
      <div class="bbs-in-div">
         <button class="btns create-category-btn" 
         id="makeBtn" onclick="makes()">게시판 생성</button>
         <button class="btns recovery-category-btn" onclick="recovery()">게시판 복구</button>
   </div>       
      <!-- 게시판 생성버튼 눌렀을때 -->
      <form id="makeForm" name="makeForm" method="post">
      <div id="makeDialog" title="게시판 생성하기">
      <p style="font-size: 13px; font-weight: bold;">생성할 게시판명을 입력해주세요.</p>
      

      <input type="text" id="makeName" name="makeName">
      
      <button type="button" id="newbtn" onclick="newBoard()">생성</button>
      </div>
      </form>
      
      <table summary="게시판 목록">
         <thead>
            <tr class="headtitle">
               <th class="no">번호</th>
               <th class="title">게시판명</th>
               <th class="bbscnt">게시물수</th>
               <th class="update">수정</th>
               <th class="delete">삭제</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${cvo }" var="vo" varStatus="st">
               <tr>
                     <td>${st.index+1 }</td>
                  <%-- 게시판명 클릭 부분 --%>
                  <td  style="cursor:pointer" onclick="location.href='admin.bbsList2?category_idx=${vo.evcategory_idx}'">
                  <label class="listclick" id="categoryName_${vo.evcategory_idx}">${vo.evcategory_name}</label>
                  
                  </td>
                  
                  <td>${fn:length(vo.b_list ) }</td>
                  
                  <td><button class="btn" id="updateBtn" onclick="updates('${vo.evcategory_idx}')">수정</button></td>
                  <td><button class="btn" id="deleteBtn${vo.evcategory_idx }"
                        onclick="deletes('${vo.evcategory_idx}')">삭제</button></td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <!-- 수정버튼 눌렀을때 -->
      <form id="changeForm" name="changeForm" method="post">
      <div class="paging-div">${pageCode }</div>
      <div id="updateDialog" title="게시판 수정하기">
      <p style="font-size: 13px; font-weight: bold;">수정할 게시판명을 입력해주세요.</p>
      <input type="hidden" id="changeIdx" name="changeIdx" value=""/>
      <input type="text" id="changeName" name="changeName" value="">
      
      <button type="button" id="changebtn" onclick="changeBoard()" style="margin-left: 5px;">변경</button>
      </div>
      </form>
      
      </div>

   <script type="text/javascript">
      function deletes(data) {
         var data = data;
         
            var checkBtn = $("#deleteBtn"+data);

            var tr = checkBtn.parent().parent();
            var td = tr.children();

            var name = td.eq(1).text().trim();
            var result = confirm(name+"을(를) 삭제하시겠습니까?");
            if (result) {
               deleteCategory(name);
            } else {
               alert("취소하셨습니다.");
            }
         
      }
      

      function deleteCategory(name) {
         var frm = new FormData();
 
         //보내고자하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
         frm.append("name", name);

         $.ajax({
            url : "deleteCategory",
            data : frm,
            type : "post",
            contentType : false,
            processData : false,
            cache : false,
            dataType : "json", //서버로부터 받을 데이터 형식

         }).done(function(data) {
            alert(data.deleteName + "이 삭제 되었습니다.");
            location.href = "admin.category";
         }).fail(function(err) {

         });
      }

      function updates(idx) {
         var checkBtn = $("#updateBtn" + idx);

         
         var modcategoryName = $('#categoryName_' + idx).text();

         $('#changeIdx').val(idx);
         $('#changeName').val(modcategoryName);
         $("#updateDialog").dialog();
      }

      function changeBoard() {

         //게시판 idx와 수정한 게시판명 가져오기
         var changeIdx = $('#changeIdx').val();
         var changeName = $('#changeName').val().trim();

         if(changeName.length <= 0){
            alert("수정할 게시판명을 입력하세요.");
            document.forms[0];
            return;
         }
         
         //확인
         console.log(changeIdx);
         console.log(changeName);

         //json형태로 담기
         var param = {
            "changeIdx" : changeIdx,
            "changeName" : changeName
         }

         $.ajax({
            url : "updateCategory",
            data : JSON.stringify(param), //datajson형
            type : "post",
            contentType : "application/json; charset=UTF-8", //json으로 보내는것 명시
            processData : false,
            cache : false,
            dataType : "json", //서버로부터 받을 데이터 형식

         }).done(function(data) {
            

            alert(data.msg);
            location.href = "admin.category";

         }).fail(function(err) {
            //실패
            alert("게시판명 수정 실패");
         });

      }
      // 받은이름으로 비동기식 수정 진행한후 수정잘됬다고 띄움
      function updateCategory(name) {
         var frm = new FormData();

         //보내고자하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
         frm.append("name", name);

         $.ajax({
            url : "updateCategory",
            data : frm,
            type : "post",
            contentType : false,
            processData : false,
            cache : false,
            dataType : "json", 

         }).done(function(data) {
            alert(data.updateName + "이 변경 되었습니다.");
            location.href = "admin.category";
         }).fail(function(err) {

         });
      }
      //게시판 복구부분
      function recovery() {
         location.href="admin.CategoryRecovery";
      }
      
      
      //게시판 생성부분
      function makes(){
         $("#makeDialog").dialog();
   
      }

      function newBoard() {
         

         
         var makeName = $('#makeName').val().trim();;
         
         if(makeName.length <= 0){
            alert("생성할 게시판명을 입력해주세요.");
            document.forms[0];
            return;
         }
         //확인
         console.log(makeName);

         //json형태로 담기
         var frm4 = new FormData();
         
         frm4.append("makeName",makeName);

         //보내버려
         $.ajax({
            url : "makeCategory",
            data : frm4,
            type : "post",
            contentType : false,
            processData : false,
            cache : false,
            dataType : "json", //서버로부터 받을 데이터 형식

         }).done(function(data) {
            
            location.href = "admin.category";
            alert(data.makeName);
            

         }).fail(function(err) {
            //실패
            alert("게시판명 생성 실패");
         });
      }
   </script>

</body>
</html>