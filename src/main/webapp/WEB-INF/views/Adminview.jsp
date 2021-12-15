<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/footer/footer.css" />
<link rel="stylesheet" href="resources/css/header/header.css" />
<link rel="stylesheet" href="resources/css/adminview.css">
</head>
<style>

</style>
</head>
<body>

	<jsp:include page="Adminheader.jsp" />
	<div class="wrap">

		<div class="pre-view">
			<div class="pre-page go-page">
				<input class="btns" type="button" name="edit" id="edit" value="수정"
					onclick="edit('${vo.evbbs_idx}')" />
			</div>

			<div class="next-page go-page">
				<input class="btns" type="button" name="del" id="del" value="삭제"
					onclick="del('${vo.evbbs_idx}')" />
			</div>
		</div>
		<div class="content-wrap">
			<h1 class="title_p">${vo.evbbs_title }</h1>
			<p class="date">${fn:replace(fn:substring(vo.evbbs_write_date, 0, 10), '-','.') }</p>
			<a class="content-p">${vo.evbbs_content }</a>
			<div class="writer-div">
				<p class="writer-p">${vo.evbbs_writer }</p>
			</div>
		</div>

		<div class="advice-contents">
			<div class="contents">
				<a class="title font" href="/admin.view?evbbs_idx=${bvo.evbbs_idx }">${bvo.evbbs_title }</a>
				<div>
					<p class="content font">${bvo.evbbs_content }</p>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		function edit(evbbs_idx) {
			location.href="/admin.edit?evbbs_idx="+evbbs_idx;
		}
		
		function del(evbbs_idx) {
			var result = confirm("게시물을 삭제 하시겠습니까?");
			if (result) {
				alert("삭제가 완료되었습니다.");
				location.href="/admin.del?evbbs_idx="+evbbs_idx;
			} else {
				alert("취소하셨습니다.");
			}
			
		}
	</script>
</body>
</html>