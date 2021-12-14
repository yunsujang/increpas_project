<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.service_link{
		text-decoration: none;
	}

	.notice_about li a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<footer>
 		<div class="footer">
			
			<div id="in_footer">
				<div id="tags">
					<div class="h5">
						<h5 id="service_h5">서비스</h5>
						<ul>
							<c:forEach items="${categoryName_ar }" var="vo">
								<li>
										<a class="service_link" href="/category?evcategory_idx=${vo.evcategory_idx }" >${vo.evcategory_name }</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="h5">
					<h5>About Us</h5>
					</div>
					<div class="all_li">
					<ul>
						<li>CUSTOMER CENTER </li>
						<li>T.1588-0000</li>
						<li>E.admin@naver.com </li>
						<li>주소 : 서울특별시 OO구 OO길 16 OOO</li>
						<li>대표자 마루치 , 이도</li>
						<li>Copyright © 인크레파스(주)</li>
					</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>