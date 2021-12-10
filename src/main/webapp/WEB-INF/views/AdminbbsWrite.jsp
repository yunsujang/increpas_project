<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="resources/css/js/summernote-lite.js"></script>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<script src="resources/css.js/lang/summernote-ko-KR.js"></script>
<style type="text/css">
#bbs{
	margin: 50px 0 100px auto;
	text-align: center;
}

#bbs table {
	width: 90%;
	height: 600px;
	margin: 0 auto;
	border: 1px solid silver;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th {
	text-align: center;
	border-bottom: 1px solid silver;
	padding: 4px 10px;
	width: 60px;
}

#bbs table td {
	text-align: left;
	border-bottom: 1px solid silver;
	padding: 4px 10px;
}

.category-tr{
	height: 10%;
}


.button-td{
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="Adminheader.jsp"/>
	<div id="bbs">
		<form action="admin.bbsWrite" method="post" encType="multipart/form-data">
			<!-- 첨부파일이 있으면 꼭 넣어줘야한다. -->
			<table summary="게시판 글쓰기">
				<tbody>
					<tr class="category-tr">
						<th>게시판</th>
						<td><select id="select"  onchange="selectEvCategory(this.value)">
								<option>게시판을 선택하세요</option> 
								<c:forEach items="${cvo }" var="vo">
									<option>${vo.evcategory_name }</option>
			 					</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="evbbs_title" id= "evbbs_title" size="210" placeholder="제목을 입력하세요"/></td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>
							<c:if test="${sessionScope.mvo.evu_who eq 1 }">
								${sessionScope.evo.evu_name }
							</c:if>
							
							<c:if test="${sessionScope.mvo.evu_who eq 0 }">
								<a>${sessionScope.mvo.evu_name }</a>
							</c:if>
						</td>
					</tr>

					<tr>
						<th>내용</th>
						<td><textarea name="evbbs_content" id="evbbs_content"
								cols="50" rows="8"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file" accept="image/*" onchange="fileCheck(this)"/></td>
					</tr>

					<tr>
						<td class="button-td" colspan="2"><input type="button" value="보내기" onclick="sendData()" /> <input type="button" value="목록"
							onclick="javascript:location.href='list.inc'" /></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="evcategory_idx" name="evcategory_idx" />
			<input type="hidden" id ="evbbs_writer" name="evbbs_writer" value="${sessionScope.mvo.evu_name }"/>
		</form>
	</div>

	<script type="text/javascript">
	
	
	
		
	$(function(){
		$("#evbbs_content").summernote({
			height: 500,
			leng: "ko-KR",
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
		var content = $("#evbbs_content").val().trim();
		var value = $("#select").val();
		
		if(title.length <= 0){
			alert("제목을 입력하세요.");
			document.forms[0].title.focus();
			return;//수행 중단
		}
		if(content.length <= 0){
			alert("내용을 입력하세요.");
			document.forms[0].writer.focus();
			return;//수행 중단
		}
		
		var value = $("#select").val();
		if(value == "게시판을 선택하세요"){
			alert("게시판을 선택하세요.");
			return;
		}
		
		
		document.forms[0].submit();
	}
	
	function selectEvCategory(category){
		var selectCategory = category;
		var frm2 = new FormData();
		
		frm2.append("selectCategory",selectCategory);
		
		$.ajax({
			url: "getCategoryidx",
			data: frm2,
			type: "post",
			contentType: false,
			processData: false,
			cache: false,
			dataType: "json",
		}).done(function(data) {
			$("#evcategory_idx").val(data.code);
		}).fail(function(err) {
			
		})
	}
	
	function fileCheck(obj){
			alert("이미지가 520*260 사이즈로 조정됩니다.");
		if(!/\.(jpeg|jpg|png|gif|bmp)$/i.test(obj.value)){ 

	        alert('이미지 파일만 업로드 가능합니다.'); 
	        obj.value = ''; 
	        obj.focus(); 
		}
	}
	
</script>
</body>
</html>


