<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<link rel="stylesheet" href="resources/css/adminedit.css">
<style type="text/css">

</style>

</head>
<body>
	<jsp:include page="Adminheader.jsp"/>
	<div id="bbs">
		<form action="admin.edit" method="post" 
		encType="multipart/form-data">
		

		
		<input type="hidden" name="evbbs_idx" value="${vo.evbbs_idx}"/>
		<input type="hidden" name="cPage" value="${param.cPage}"/>
		
		
			<!-- 첨부파일이 있으면 꼭 넣어줘야한다. -->
			<table summary="게시판 수정">
				<tbody>

					<tr>
						<th>제목</th>
						<td><input type="text" name="evbbs_title" id= "evbbs_title" 
						size="210" placeholder="제목을 입력하세요" value="${vo.evbbs_title }"/></td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>${sessionScope.mvo.evu_name }</td>
					</tr>

					<tr>
						<th>내용</th>
						<td><textarea name="evbbs_content" id="evbbs_content"
								cols="50" rows="8" >${vo.evbbs_content }</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file" accept="image/*" onchange="fileCheck(this)"/>
						<c:if test="${vo.evbbs_file_name ne null }">
							(${vo.evbbs_file_name })
						</c:if>
						</td>
					</tr>

					<tr>
						<td class="button-td" colspan="2"><input type="button" 
						value="수정" onclick="sendData()" /> 
						<input type="button" value="목록"
							onclick="javascript:location.href='admin.bbsList'" /></td>
					</tr>
				</tbody>
			</table>
	
			<input type="hidden" id ="evbbs_writer" name="evbbs_writer" value="${sessionScope.name }"/>
		</form>
	</div>
	<script src="resources/css/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
	
	
	
		
	$(function(){
		$("#evbbs_content").summernote({
			height: 500,
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
		$("#evbbs_content").summernote("lineHeight",.7);
	});
	
	function sendImage(file, editor){
		var frm = new FormData();
		
		//보내고자 하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
		frm.append("s_file", file);
	 	
		//비동기식 통신
		$.ajax({
			url: "saveImg.inc",
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
		var title = $("#evbbs_title").val().trim();
		
		if(title.length <= 0){
			alert("제목을 입력하세요.");
			document.forms[0].title.focus();
			return;//수행 중단
		}
		if($("#evbbs_content").val().trim().length <= 0){
			alert("내용을 입력하세요.");
			
			document.forms[0].writer.focus();
			return;//수행 중단
		}
		
		var result = confirm("게시물을 수정 하시겠습니까?");
		if (result) {
			document.forms[0].submit();
			alert("수정이 완료되었습니다.");
		} else {
			alert("취소하셨습니다.");
		}
	
		
		
	}
	
	function fileCheck(obj){
		if(!/\.(jpeg|jpg|png|gif|bmp)$/i.test(obj.value)){ 

	        alert('이미지 파일만 업로드 가능합니다.'); 
	        obj.value = ''; 
	        obj.focus(); 
		}
	}
	
</script>
</body>
</html>


