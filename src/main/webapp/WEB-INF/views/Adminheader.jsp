<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*가로메뉴형*/

html, body{
	margin: 0 auto;
	padding: 0 auto;
	height:100%;
}

#menu {
	height: 50px;
	background:  #85c4b9;
}

.main1 {
	width: 600px;
	height: 100%;
	margin: 0 auto;
}

.main1>li {
	float: left;
	width: 33%;
	line-height: 50px;
	text-align: center;
	position: relative;
	list-style: none;

	
}

.main1>li a{
	text-decoration: none;
	color: white;
}

.main1>li:hover .main2 {
	left: 0;
}

.main1>li a {
	display: block;
}

.main1>li a:hover {
	background: #6c9e95;
	color: #fff;
	font-weight: bold;
}

.main2 {
	position: absolute;
	top: 50px;
	left: -9999px;
	background: #ccc;
	width: 100%;
	padding: 0;
	list-style: none;
}

.main2>li {
	position: relative;
}

.main2>li:hover .main3 {
	left: 100%;
}

.main2>li a, .main3>li a {
}

.main3 {
	position: absolute;
	top: 0;
	background: #6BD089;
	width: 80%;
	left: -9999px;


}

.main3>li a:hover {
	background: #085820;
	color: #fff;
}
</style>
</head>
<body>
	<div id="menu">

		<ul class="main1">
			<li><a href="admin.main">홈으로</a>


			<li><a href="#">게시판관리</a>

				<ul class="main2">

					<li><a href="admin.category">게시판</a></li>

					<li><a href="admin.bbsList">게시물</a></li>
 


				</ul></li>

			<li><a href="#">유저관리</a>

				<ul class="main2">

					<li><a href="#">소메뉴1</a>

						<ul class="main3">

							<li><a href="#">2단소메뉴7</a></li>

							<li><a href="#">2단소메뉴8</a></li>

							<li><a href="#">2단소메뉴9</a></li>

						</ul></li>

					<li><a href="#">소메뉴2</a>

						<ul class="main3">

							<li><a href="#">2단소메뉴10</a></li>

							<li><a href="#">2단소메뉴11</a></li>

							<li><a href="#">2단소메뉴12</a></li>

						</ul></li>

					<li><a href="#">소메뉴3</a>

						<ul class="main3">

							<li><a href="#">2단소메뉴13</a></li>

							<li><a href="#">2단소메뉴14</a></li>

							<li><a href="#">2단소메뉴15</a></li>

						</ul></li>

				</ul></li>
		</ul>
	</div>




</body>
</html>