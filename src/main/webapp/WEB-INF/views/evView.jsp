<%@page import="mybatis.vo.CommentVO"%>
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
	
	
	
	#wrap {
		margin: 190px 0px 171px 0px;
		height: 700px;
		height: auto;
	}
	
	#viewtable {
        display: inline-block;
        text-align: left;
     }
	
	
	#bbs{
		margin: auto;
    	text-align: center;
	}

	#bbs table {
	    width:1000px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:15px;
	    border-left: hidden;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	    border-left : hidden;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid #a1a1a182;
        border-right: hidden;
	    padding:4px 10px;
	}
	
	#viewh1{
		color: gray;
	    font-family: monospace;
	    margin-top: 70px;
	    text-align: center;
	}
	
	#ansform{
		width: 1000px;
    	margin: auto;
   		text-align: left;
	}
	
	#viewContent{
		height: 200px;
	}
	
	#viewSubject{
		font-weight: bold;
	    font-family: monospace;
	    font-size: 20px;
	}
	
	#ansbtn{
		width: 80px;
		background-color: #85c4b9;
		color:white;
		border-radius: 3px;
		cursor: pointer;
		margin: 3px 6px;
    	height: 29px;
    	font-weight: bold;
    	float: right;
	}
	
	#comment_div{
		text-align: center;
		margin: auto;
   	 	width: 1000px;
   	 	text-align: left;	
	}
	
	#ansdiv{
		margin-top: 20px;
		text-align: center;
		
	}
	#ansname{
		margin: 10px;
   		height: 20px;
   		border-radius: 3px;
	}
	
	#anscontent{
		width: 970px;
   	 	padding: 10px;
   	 	box-shadow: 0 1px 6px rgb(32 33 36 / 28%);
   	 	border-radius: 5px;
	}
	
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
	
	
	.viewbtn{
		background-color: #85c4b9;
		color:white;
		border-radius: 3px;
		cursor: pointer;
		float: right;
		margin: 3px 6px;
		width: 55px;
		font-weight: bold;
    	height: 29px;
	}
		
}
	
	
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrap">
<c:if test="${vo ne null }">
	<div id="bbs">
		
	<form method="post" id="viewtable">
		<table summary="게시판 보기" >
			<h1 id="viewh1">커뮤니티</h1>
			<tbody >
				<tr>
					<p style="text-align: right; color: gray;">                            
					<c:set var="evbbs_write_date" value="${vo.evbbs_write_date }"></c:set>
							${fn:substring(write_date,0,16)} 조회 : ${vo.evbbs_hit}</p>
					<td id="viewSubject">제목 : ${vo.evbbs_title} <!-- 올린날짜 -->
					</td>
					
				</tr>
				<c:if test="${vo.evbbs_file_name != null}">
				<tr>
					
					<td>첨부파일 : <a href="javascript: down('${vo.evbbs_file_name}')">
						${vo.evbbs_file_name}
					</a></td>
				</tr>
				</c:if>
				<tr>
					
					<td>작성자 : ${vo.evbbs_writer}</td>
				</tr>
				<tr>
				
					<td id="viewContent"><p style="font-weight: bold;">
						내용 :</p> ${vo.evbbs_content}
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="border-left: hidden;">
						<input type="button" class="viewbtn" value="수정" onclick="edit()"/>
						<input type="button" class="viewbtn" value="삭제" onclick="del()"/>
						<input type="button" class="viewbtn" value="목록"
						 onclick="location.href='list.ev'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	
	<div id="ansdiv">
	
		<h1 style="color: gray; font-family: monospace;">댓글</h1>
			<p style="color: #9d9a9a; font-weight: bold;">권리침해, 욕설 및 특정 대상을 비하하는 
			내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다.</p>	
			
		<form id="ansform" method="post" action="ans_write.ev">
			<a style="font-weight: bold;">이름:</a><input id="ansname" type="text" name="evcomment_writer"/><br/>
			<a style="font-weight: bold;">내용:</a><textarea id="anscontent" rows="4" cols="85" name="evcomment_content"></textarea><br/>
			<%-- 원글을 의미하는 원글의 기본키 --%>
			<input type="hidden" name="evbbs_idx" value="${vo.evbbs_idx}">
			<input type="hidden" name="cPage" value="${cPage}"><%-- edit.jsp에서 
						댓글을 저장한 후 다시 view.jsp로 돌아올 때 필요하다. --%>
			<input type="hidden" name="ip" value="${evbbs_ip}">
			<input type="button" id="ansbtn" value="저장" onclick="ansSaveBtn(this.form)"/> 
		</form><p/>
			<br/>
		
		
	</div>
	
	<hr/>
	<div id="comment_div">
		<c:forEach var="cvo" items="${vo.comment_list }">
			<div >
					이름 : ${cvo.evcomment_writer} &nbsp;&nbsp;<br/>
				날짜 :<c:set var="evcomment_write_date" value="${cvo.evcomment_write_date }"></c:set>
					${fn:substring(evcomment_write_date,0,16)}<br/><br/>
				내용 : ${cvo.evcomment_content }
			</div>
			<hr/>
		</c:forEach>
	</div>
	
	
	<form name="frm" method="post" ><!-- frm 보내는 내용  -->
		<input type="hidden" name="cPage" value="${param.cPage }">
		<input type="hidden" name="evbbs_idx" value="${vo.evbbs_idx }">
		<input type="hidden" name="evcategory_idx" value="${vo.evcategory_idx }"/>
		<input type="hidden" name="f_name" />
	</form>
	<script>
		function edit(){
		
			document.frm.action = "edit.ev";
			document.frm.submit();
		}
	
		function goList(){
			
			document.frm.action = "list.ev";
			document.frm.submit();
		}
		
		function del(){
			
			if(confirm("삭제하시겠습니까?")){
				document.frm.action = "delete.ev";
				document.frm.submit();
			}
		}
		
		function down(fname){
			//alert(fname);
			location.href="FileDownload?dir=bbs_upload&filename="+fname;
				
			} 
		
		function ansSaveBtn() {
			//댓글 유효성검사
			if($("#ansname").val().trim() <=0){
				alert("내용을 입력하세요.");
				$("#ansname").focus();
				return ;//수행 중단
			}
			
			
			if($("#anscontent").val().trim() <=0){
				alert("내용을 입력하세요.");
				$("#anscontent").focus();
				return ;//수행 중단
			}
			
			document.frm.action="ans_write.ev";
			document.forms[2].submit();
			
		}
	
		
		
	</script>
</c:if>
<c:if test="${vo eq null }">
	<script>
		location.href="list.ev";
	</script>
</c:if>
	
	</div>
	<jsp:include page="footer.jsp" />
	
</body>
</html>







