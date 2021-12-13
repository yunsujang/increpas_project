<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<link rel="stylesheet" href="resources/css/main/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#stock_title{
		width: 100%;
		height: 10px;
		margin: 255px 0 0 0;
	}
	
	#title{
		height: 150px;
		width: 100%;
		text-align: center;
		
	}
	
	#title p{
	font-size: 40px;
	width: 100%;
	text-align: center;
	}
	
   table{
      width: 1200px;
      border-collapse: collapse;
      width: 80%;
   	 margin: 150px auto;
	}

      
   }
   table th{
      text-align: center;
	  padding: 4px 10px;
   }
   table td{
	   text-align: center;
		padding: 4px 10px;
		border-bottom: 1px solid silver;
		height: 30px;
   }
  
   table tbody tr{
      
      text-align: center;
   }
   
   table tbody tr a{
      text-decoration: none;
      color: black;
   }
</style> 
</head>
<body>
	${sb }
	<!-- header영역 -->
	<jsp:include page="header.jsp" />
	<div>
		<div id="stock_title">
			<div id="title">
				<p>전기차 주식 목록</p>
			</div>
		</div>
		<article style="margin: 0 0 300px 0;">
	<!-- 종목명 | 현재가 | 전일대비 | 등락율 | 고가 | 저가 | 거래량 | 거래대금  -->	
		<table>
		
			<colgroup>
				<col width="*"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="150px"/>
			</colgroup>
			<thead>
				<tr>
					<th>종목명</th>
					<th>현재가</th>
					<th>전일대비</th>
					<th>등락율</th>
					<th>고가</th>
					<th>저가</th>
					<th>거래량</th>
					<th>거래대금</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="/">${svo1.name }</a></td>
					<td>${svo1.nowPrice }</td>
					<c:set value="${fn:substring(svo1.vsyesterday,0,2)}" var="updown"/>
					<c:if test="${fn:startsWith(updown,'상승') }">
						<td>↑${fn:substring(svo1.vsyesterday,2,5) } </td>
					</c:if>
					<c:if test="${fn:startsWith(updown,'하락') }">
						<td>↓${fn:substring(svo1.vsyesterday,2,5) } </td>
					</c:if >
					<c:set value="${fn:substring(svo1.dungRakrate,0,3) }" var="plus"/>
					<c:if test="${fn:startsWith(plus,'플러스') }">
						<td>+${fn:substring(svo1.dungRakrate,3,7) }%</td>
					</c:if>
					<c:set value="${fn:substring(svo1.dungRakrate,0,4) }" var="minus"/>
					<c:if test="${fn:startsWith(minus,'마이너스') }" >
						<td>-${fn:substring(svo1.dungRakrate,4,8) }%</td>
					</c:if>
					
					
					<td>${svo1.highPrice }</td>
					<td>${svo1.lowPrice }</td>
					<td>${svo1.georaeryang }</td>
					<td>${svo1.tradingValue }</td>
				</tr>
				
				<tr>
					<td><a href="/">${svo2.name }</a></td>
					<td>${svo2.nowPrice }</td>
					<c:set value="${fn:substring(svo2.vsyesterday,0,2)}" var="updown"/>
					<c:if test="${fn:startsWith(updown,'상승') }">
						<td>↑${fn:substring(svo2.vsyesterday,2,8) } </td>
					</c:if>
					<c:if test="${fn:startsWith(updown,'하락') }">
						<td>↓${fn:substring(svo2.vsyesterday,2,8) } </td>
					</c:if>
					<c:set value="${fn:substring(svo2.dungRakrate,0,3) }" var="plus"/>
					<c:if test="${fn:startsWith(plus,'플러스') }">
						<td>+${fn:substring(svo2.dungRakrate,3,7) }%</td>
					</c:if>
					<c:set value="${fn:substring(svo2.dungRakrate,0,4) }" var="minus"/>
					<c:if test="${fn:startsWith(minus,'마이너스') }" >
						<td>-${fn:substring(svo2.dungRakrate,4,8) }%</td>
					</c:if>
					<td>${svo2.highPrice }</td>
					<td>${svo2.lowPrice }</td>
					<td>${svo2.georaeryang }</td>
					<td>${svo2.tradingValue }</td>
				</tr>
			</tbody>
		
		</table>
	</article>
	<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>