<%@page import="mybatis.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evca 커뮤니티| </title>		
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<link rel="stylesheet" href="resources/css/main/main.css">	
<link rel="stylesheet" href="resources/css/evlist.css">


<style type="text/css">

</style>
</head>
	
<body>
	${sb }
	<jsp:include page="header.jsp"></jsp:include>
	<input type="hidden" 	id="sessionId" value="${session }" />
	<div id="wrap">
	<div id="bbs">
		<table summary="게시판 목록">
			<h1 id="content_title">커뮤니티</h1>
			<thead>	
				<colgroup>
					<col width="10%"></col>
					<col width="50%"></col>
					<col width="10%"></col>
					<col width="20%"></col>
					<col width="*%"></col>
				</colgroup>
				<tr>
					<td colspan="5">
					</td>				
				</tr>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">작성자</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tfoot>
                      <tr>
                          <td id="pageing_center" colspan="4">
                              ${pageCode }
                          </td>
						  <td>
							<input id="writeBtn" type="button" value="글쓰기"
			onclick="btnWrite()"/>
			
			
			
						  </td>
                      </tr>
                  </tfoot>
			<tbody>
				<c:forEach var="vo" items="${ar}" varStatus="st"> 
				
					<tr>
						<td> <%--순차적인 번호를 만들어서 표현하자! --%>
							${rowTotal-((nowPage-1)*blockList+st.index)}
						</td>
						<td  style="text-align: left" >
							<a href="view.ev?evcbbs_idx=${vo.evcbbs_idx}&cPage=${nowPage}"
								id="c_pont">
						<c:if test="${fn:contains(vo.evcbbs_content,'<img') eq false}">
							<img id="talkImg" alt="" src="/resources/img/talk.png" style="width: 17px;" >
                    	 </c:if>		
						<c:if test="${fn:contains(vo.evcbbs_content,'<img')}">
                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
					  			<path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
					  			<path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
							</svg>
                    	 </c:if>
								${vo.evcbbs_title }
					
								<!-- 길이를 구하는함수인데 구할걸 안에다 넣어주면 된다. -->
								<c:if test="${fn:length(vo.comment_list)>0}">
								<a id="commPont">[${fn:length(vo.comment_list)}]</a> <!-- 댓글 수  -->
								</c:if>
							</a>
						</td>
						<td>${vo.evcbbs_writer }</td> <!-- 글쓴이 -->
						<td>
						<c:set var="evcbbs_write_date" value="${vo.evcbbs_write_date }"></c:set>
							${fn:substring(evcbbs_write_date,0,16)} <!-- 올린날짜 -->
							
						</td>
						<td>${vo.evcbbs_hit}</td>
					</tr>
				</c:forEach>
				
				<div id="content">
					<form action="search.ev" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>
						<select id="searchType" name="searchType" class="c_search">
							<option>전체</option>
						</select>
						<input type="text" id="bbsSearchValue" name="searchValue"  class="c_search"/>
						<input type="button" id="searchbtn" value="" class="c_search" onclick="BbsSearch(this.form)"/>
					</form>
					
				</div>
				</tbody>
			</table>
		</div>	
	</div>
	
	<script>
		function BbsSearch(frm){
			if($("#bbsSearchValue").val().trim() <=0){
				alert("내용을 입력하세요.");
				$("#bbsSearchValue").focus();
				return false;//수행 중단
			}
			frm.submit();  //보내기
		}
		
		function btnWrite(){
			if($("#sessionId").val()!=null){
				location.href='write.ev'
			}else{
				alert("세션없음");
			}
			
		}
	</script>	
		
		
	<jsp:include page="footer.jsp" />
</body>
</html>






