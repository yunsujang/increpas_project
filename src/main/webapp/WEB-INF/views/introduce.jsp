<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
}

.wrap {
	margin: 300px 0 0 0;
	width: 100%;
	height: 100%;
	padding-bottom: 200px;
	width: 100%;
}

.contents {
	width: 1180px;
	margin: 0 auto;
	overflow: hidden;
	margin-bottom: 100px;
}

#sub_cont .title_cont h2 {
	font-size: 35px;
	font-family: 'NanumGothicBlod';
	line-height: 80px;
}

#sub_cont {
	width: 50%;
	overflow: hidden;
	margin: auto;
}

#cont_body h3, #sub_cont h3, #mem_join_process h3 {
	font-size: 25px;
	background: url(/portal/_images/sub/h3_blit_bar.jpg) no-repeat left
		center;
	color: #232323;
	margin-bottom: 10px;
}

#cont_body dl.dl02_blit dt {
	background: url(/portal/_images/sub/icon_arrow02.png) 0 5px no-repeat;
	padding-left: 20px;
	font-family: 'NanumGothic';
	font-size: 16px;
	line-height: 26px;
	margin-bottom: 4px;
}

.intro_cont .structure_cont {
	position: relative;
	overflow: hidden;
}

.left {
	width: 460px;
	float: left;
}

.intro_cont {
	margin: auto;
	width: 50%;
}

ul>li {
	font-size: 15px;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp" />
		<div class="contents">
			<div id="sub_cont">
				<div id="cont_body">
					<div id="intro_cont">

						<h2>전기차 개요</h2>
						<h3>전기차의 작동원리</h3>
						<dl>
							<dt>전기차는 고전압 배터리에서 전기에너지를 전기모터로 공급하여</dt>
							<dt>구동력을 발생시키는 차량으로, 화석연료를 전혀 사용하지 않는 무공해 차량입니다.</dt>
						</dl>
						<div class="structure_cont">
							<div>
								<img class="new-img" alt="" src="resources/img/evcar_01.jpg" />

							</div>
							<div>
								<ul>
									<li>&nbsp;&nbsp;&nbsp;내연기관차와 달리 엔진이 없이 배터리와 모터만으로 차량 구동</li>
									<li>&nbsp;&nbsp;&nbsp;엔진이 없으므로 대기오염물질과 온실가스를 배출하지 않음</li>
									<li>&nbsp;&nbsp;&nbsp;배터리 용량에 따라 주행가능 거리에 차이가 있음</li>
								</ul>
							</div>
							<h3 class="mt40">전기차 내부구조</h3>
							<div class="left">
								<img alt="" src="resources/img/121_img01.jpg" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>