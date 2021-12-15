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
<link rel="stylesheet" href="resources/css/evview.css">

<style type="text/css">
	
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
					<c:if test="${mvo eq null }">	
						<input type="hidden" class="viewbtn" value="수정" onclick="edit()"/>
					</c:if>	
					<c:if test="${mvo.evu_idx eq vo.evu_idx }">	
						<input type="button" class="viewbtn" value="수정" onclick="edit()"/>
					</c:if>
					
					<c:if test="${mvo eq null }">		
						<input type="hidden" class="viewbtn" value="삭제" onclick="del()"/>
					</c:if>
					<c:if test="${mvo.evu_idx eq vo.evu_idx }">		
						<input type="button" class="viewbtn" value="삭제" onclick="del()"/>
					</c:if>
						<input type="button" class="viewbtn" value="목록"
						 onclick="location.href='list.ev'"/>
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
			
		<form id="ansform" method="post" action="ans_write.ev">
			<a style="font-weight: bold;">이름:</a><input id="ansname" type="text" name="evccomment_writer" 
					value="${mvo.evu_name }" readonly="readonly"  /><br/>
			<c:if test="${mvo eq null }">	
			<a style="font-weight: bold;">내용:</a><textarea id="anscontent" rows="4" cols="85" name="evccomment_content" 
							placeholder="로그인 후 이용가능합니다."	readonly="readonly" style="background-color: #efefef;"></textarea><br/>
			</c:if>
			<c:if test="${mvo ne null }">	
			<a style="font-weight: bold;">내용:</a><textarea id="anscontent" rows="4" cols="85" name="evccomment_content" ></textarea><br/>
			</c:if>	
			<%-- 원글을 의미하는 원글의 기본키 --%>
			<input type="hidden" name="evcbbs_idx" value="${vo.evcbbs_idx}">
			<input type="hidden" name="cPage" value="${cPage}"><%-- evEdit.jsp에서 
						댓글을 저장한 후 다시 view.jsp로 돌아올 때 필요하다. --%>
			<input type="hidden" name="ip" value="${evcbbs_ip}">
			<input type="hidden" name="evccomment_idx" value="${evccomment_idx}">
			<input type="hidden" name="evu_idx" value="${evu_idx}">
			<input type="button" id="ansbtn" value="저장" onclick="ansSaveBtn(this.form)"/> 
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
						<c:if test="${mvo eq null }">	
						<input type="hidden" id="commDel" value="" onclick="commdel(${cvo.evccomment_idx})">
						</c:if>
						<c:if test="${mvo.evu_idx eq cvo.evu_idx }">	
						<input class="commExit"type="button" id="commDel" value="" onclick="commdel(${cvo.evccomment_idx})">
					</c:if>
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
	
		
		function commdel(idx) {
			
				if(confirm("삭제하시겠습니까?")){
					var frm = new FormData();
					frm.append("idx",idx);
				
					$.ajax({
			            url : "commDel.ev",
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
		location.href="list.ev";
	</script>
</c:if>
	
	</div>
	<jsp:include page="footer.jsp" />
	
</body>
</html>







