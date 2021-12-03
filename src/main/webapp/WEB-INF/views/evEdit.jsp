<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>evca 커뮤니티 </title>	
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<link rel="stylesheet" href="resources/css/main/main.css">	
<style type="text/css">

	#wrap{
		margin: 190px 0px 171px 0px;
		height: auto;
	
	}
	
	#bbs table {
	    width:1000px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    margin: auto;
	    text-align: center;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
        margin-top: 50px;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	    
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.writeBtn{
		float: right;
		background-color: #85c4b9;
		color:white;
		border-radius: 3px;
		cursor: pointer;
		margin: 3px 6px;
		width: 55px;
    	height: 29px;
    	font-weight: bold;
	}
	
	#evbbs_title{
		height: 24px;
	}
	
	.no {width:15%}
	.subject {width:30%;}
	.evbbs_writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
	}
	
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrap">
	
	<div id="bbs">
	<form action="edit.ev" method="post" 
	encType="multipart/form-data">
	
		<input type="hidden" name="evbbs_idx" value="${vo.evbbs_idx}"/>
		<input type="hidden" name="cPage" value="${param.cPage}"/>
		
		<table summary="게시판 수정">
			<caption style="color:gray; font-family:monospace;">게시판 수정</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" id="evbbs_title" name="evbbs_title" size="45" 
						value="${vo.evbbs_title}"/></td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td><input class="editwriter" type="text" name="evbbs_writer" size="12" 
						value="${vo.evbbs_writer}" readonly="readonly" style="background-color: #efefef;"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="evbbs_content" id="evbbs_content" cols="50" 
							rows="8">${vo.evbbs_content}</textarea></td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td>
						<input type="file" name="file" style="background-color: aliceblue;"/>
						<c:if test="${vo.evbbs_file_name ne null}">
							(${vo.evbbs_file_name})
						</c:if>
					</td>
				</tr>
				
				<!-- <tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
 				 -->
				<tr>
					<td colspan="2">
						<input class="writeBtn" type="button" value="수정"
						onclick="sendData()"/>
						<input class="writeBtn" type="button" value="뒤로"
						 	   onclick="window.history.back();"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script>
		$(function(){
			$("#evbbs_content").summernote({
				height: 400,
				lang: "ko-KR",
				focus: true, /* 커서를 미리 가져다 놓는다. */
				callbacks:{
					onImageUpload: function(files, editor){
						//이미지가 에디터에 추가될 때마다 수행하는 곳!
						//추가되어 들어온 이미지가 배열로 인식됨!
						for(var i=0; i<files.length; i++)
							sendImage(files[i], editor);//서버로 비동기식 통신으로
											//이미지를 서버로 업로드시킨다.
					}
				}
			});
			$("#evbbs_content").summernote("lineHeight");
		});
		
		function sendImage(file, editor){
			var frm = new FormData();
			
			//보내고자 하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
			frm.append("s_file", file);
			
			//비동기식 통신
			$.ajax({
				url: "saveImg.ev",
				data: frm,
				type: "post",
				contentType: false,
				processData: false,
				cache: false,
				dataType: "json", // 서버로부터 받을 데이터 형식
			}).done(function(data){
				$("#evbbs_content").summernote("editor.insertImage", data.url+"/"+data.fname);
			}).fail(function(err){
				//서버에서 오류가 발생 시
			});
		}
	
		function sendData(){
			if($("#evbbs_title").val().trim() <=0){
				alert("제목을 입력하세요");
				$("#evbbs_title").focus();
				return;//수행 중단
			}
		//if(document.forms[0].pwd.value.trim().length < 0){
		//		alert("비밀번호를 입력하세요");
		//	document.forms[0].pwd.focus();
		//		return;//수행 중단
		//	}
	
			document.forms[1].submit();
		}
</script>
			
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>












