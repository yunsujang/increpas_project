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
	
	body{
	 background-color: white;
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
	    color: silver;
	    font-family: monospace;
	    margin-top: -72px;
	    text-align: center;
	    font-size: 40px
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
	    border: none;
	    background-color: #f9f9f9;
	}
	
	#anscontent{
		width: 970px;
   	 	padding: 10px;
   	 	box-shadow: 0 1px 6px rgb(32 33 36 / 28%);
   	 	border-radius: 5px;
	}
	
	#commDel{
		 float: right;
		 width: 18px;
		 height: 28px;
		 border: none;
	}
	#commDate{
		margin-left: 5px;
	    color: #848484;
	    font-size: 11px;
	    font-weight: normal;
	    letter-spacing: 0;
	    font-family: tahoma;
	}
	
	.commExit{
		font-size : 10px;
		background: url(/resources/img/EXIT.png) no-repeat;
	}	
	.commExit:hover{
		cursor: pointer;
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
	
	.commP{
		font-weight: bold;
	}
		
	
		
}
	
	
</style>

</head>
<body>
	<jsp:include page="Adminheader.jsp"></jsp:include>
	<div id="wrap">
<c:if test="${vo ne null }">
	<div id="bbs">
		
	<form method="post" id="viewtable">
		<table summary="게시판 보기" >
			<h1 id="viewh1">유저 게시물</h1>
			<tbody >
				<tr>
					<p style="text-align: right; color: gray;">                            
					<c:set var="evcbbs_write_date" value="${vo.evcbbs_write_date }"></c:set>
							${fn:substring(write_date,0,16)} 조회 : ${vo.evcbbs_hit}</p>
					<td id="viewSubject">제목 : ${vo.evcbbs_title} <!-- 올린날짜 -->
					</td>
					
				</tr>
				<c:if test="${vo.evcbbs_file_name != null}">
				<tr>
					
					<td>첨부파일 : <a href="javascript: down('${vo.evcbbs_file_name}')">
						${vo.evcbbs_file_name}
					</a></td>
				</tr>
				</c:if>
				<tr>
					
					<td>작성자 : ${vo.evcbbs_writer}</td>
				</tr>
				<tr>
				
					<td id="viewContent"><p style="font-weight: bold;">
						내용 :</p> ${vo.evcbbs_content}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-left: hidden;">
						<input type="button" class="viewbtn" value="삭제" onclick="del()"/>
					
					
						<input type="button" class="viewbtn" value="목록"
						 onclick="location.href='admin.list.ev'"/>
					</td>
				</tr>
			</tbody>
		</table>
			<input id="evcbbs_writer" value="${vo.evcbbs_writer}" type="hidden"/>
			<input id="evu_name" value="${mvo.evu_name }" type="hidden"/>
	</form>
	</div>
	
	<div id="ansdiv">
	
		<h1 style="color: gray; font-family: monospace;">댓글</h1>
			<p style="color: #9d9a9a; font-weight: bold;">권리침해, 욕설 및 특정 대상을 비하하는 
			내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다.</p>	
			
		<form id="ansform" method="post" action="admin.ans_write.ev">
			
			<%-- 원글을 의미하는 원글의 기본키 --%>
			<input type="hidden" name="evcbbs_idx" value="${vo.evcbbs_idx}">
			<input type="hidden" name="cPage" value="${cPage}"><%-- evEdit.jsp에서 
						댓글을 저장한 후 다시 view.jsp로 돌아올 때 필요하다. --%>
			<input type="hidden" name="ip" value="${evcbbs_ip}">
			<input type="hidden" name="evccomment_idx" value="${evccomment_idx}">
			<input type="hidden" name="evu_idx" value="${evu_idx}">
			<c:if test="${fn:length(vo.comment_list)>=0}">
			<p id="comment_l">전체 댓글 <a style="color: red;">${fn:length(vo.comment_list)}</a>개 <!-- 댓글 수  -->
			</p></c:if>
		</form><p/>
		<br/>
	</div>
	
	<hr/>
		<div id="comment_div">
	
			<c:forEach var="cvo" items="${vo.comment_list }">
				<div >
						<a class="commP">이름</a> : ${cvo.evccomment_writer}
					<a id="commDate" ><c:set var="evccomment_write_date" value="${cvo.evccomment_write_date }"></c:set>
						(${fn:substring(evccomment_write_date,0,16)})
					<input type="hidden" id="evccomment_idx"  value="${cvo.evccomment_idx}" >
				
						<input class="commExit"type="button" id="commDel" value="" onclick="commdel(${cvo.evccomment_idx})">
				
						<br/>
						<br/>
					</a>
					<a class="commP">내용</a> :<br/> ${cvo.evccomment_content }
					
				</div>
				<hr/>
			</c:forEach>
		</div>
	
	<form name="frm" method="post" ><!-- frm 보내는 내용  -->
		<input type="hidden" name="cPage" value="${param.cPage }">
		<input type="hidden" name="evcbbs_idx" value="${vo.evcbbs_idx }">
		<input type="hidden" name="f_name" />
		
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>

	
		function goList(){
			
			document.frm.action = "admin.list.ev";
			document.frm.submit();
		}
		
		function del(){
				if(confirm("삭제하시겠습니까?")){
				document.frm.action = "admin.delete.ev";
				document.frm.submit();
				
				}
		
		}
		
		function down(fname){
			//alert(fname);
			location.href="FileDownload?dir=bbs_upload&filename="+fname;
				
			} 
	 	
	
	
		
		function commdel(idx) {
			
				if(confirm("삭제하시겠습니까?")){
					var frm = new FormData();
					frm.append("idx",idx);
				
					$.ajax({
			            url : "admin.commDel.ev",
			            data : frm,
			            type : "post",
			            contentType : false,
			            processData : false,
			            cache : false,
			            dataType : "json", 

			         }).done(function(data) {
			           
			            if(data.code > 0)
			            	 alert("삭제되었습니다.");
			            location.reload(true);
			         }).fail(function(err) {
						alert("실패")
			         });
			      }
				}
			
		
	</script>
</c:if>
<c:if test="${vo eq null }">
	<script>
		location.href="admin.list.ev";
	</script>
</c:if>
	
	</div>
	
	
</body>
</html>







