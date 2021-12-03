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


<style type="text/css">

	*{margin: 0; }	
	
	#wrap {
		margin: 190px 0px 171px 0px;
		height: 700px;
		height: auto;
	}
	#bbs{
		width: 100%;
    	text-align: center;
		
	}
	
	#bbs table {
	    width:1050px;
	    height: 50px;
	    margin-top: 35px;
	    margin-left:10px;
	    border-collapse:collapse;
	    font-size:14px;
	    margin: auto;
	    text-align: center;
	   
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table td:hover{
		background-color: #ececec;
	}
	
	#bbs table th,#bbs table td {
	    text-align:center;
	    border:1px solid #ececec;
	    padding:4px 10px;
	    /*이 두녀석 추가*/
	    border-right: none;
    	border-left: none;
    	
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:25%}
	.hit {width:10%}
	.title{background:#85c4b9}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	    width: 200px; /* 정렬하려는 요소의 넓이를 반드시 지정 */
	    margin: 0 auto;

	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:3px;
	    
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid white;
	    color:#2f313e;
	    font-weight:bold;
	    text-decoration: none;
	    border-radius: 12px;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	    border-radius: 13px;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	    border-radius: 15px;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid gray;
	    background:#85c4b9;
	    color:white;
	    font-weight:bold;
	    border-radius: 15px;
	}
	
	#c_pont{
		text-decoration : none;
		
	}
	#c_pont :hover{
		color:red;	
	}
	#writeBtn{
		border: 1px solid #9f9393;
	    background-color: #85c4b9;
	    color: white;
	    font-weight:bold;
	    border-radius: 3px;
	    width: 70px;
    	height: 32px;
    	cursor: pointer;
	}
	
	#content_title{
		color : gray;
		margin-top: 300px;
		font-family: monospace;
		
	}	
	
	#content{
		margin: 50px;
	}
	.c_search{
		border: 3px solid #85c4b9;
	    font-family: monospace;
	}
	#searchbtn{
		width: 50px;
	    height: 26px;
	    border-radius: 3px;
	    border: 1px solid gray;
	    background-color: #85c4b9;
	    color: white;
	    font-weight: bold;
	    cursor: pointer;
	}
	#searchType{
		width: 80px;
   		height: 25px;
	}
	#bbsSearchValue{
		width: 160px;
    	height: 20px;
	}
	
	
</style>
</head>
	
<body>
	<jsp:include page="header.jsp"></jsp:include>
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
			onclick="javascript:location.href='write.ev'"/>
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
						
							<a href="view.ev?evbbs_idx=${vo.evbbs_idx}&cPage=${nowPage}"
								id="c_pont">
								${vo.evbbs_title }
								<!-- 길이를 구하는함수인데 구할걸 안에다 넣어주면 된다. -->
								<c:if test="${fn:length(vo.comment_list)>0}">
								[${fn:length(vo.comment_list)}] <!-- 댓글 수  -->
								</c:if>
							</a>
						</td>
						<td>${vo.evbbs_writer }</td> <!-- 글쓴이 -->
						<td>
						<c:set var="evbbs_write_date" value="${vo.evbbs_write_date }"></c:set>
							${fn:substring(evbbs_write_date,0,16)} <!-- 올린날짜 -->
							
						</td>
						<td>${vo.evbbs_hit}</td>
					</tr>
				</c:forEach>
				
				<div id="content">
					<form action="search.ev" method="post">
						<input type="hidden" name="type" value="search" class="c_search"/>
						<select id="searchType" name="searchType" class="c_search">
							<option>전체</option>
						</select>
						<input type="text" id="bbsSearchValue" name="searchValue"  class="c_search"/>
						<input type="button" id="searchbtn" value="검색" class="c_search" onclick="BbsSearch(this.form)"/>
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
	</script>	
		
		
	<jsp:include page="footer.jsp" />
</body>
</html>






