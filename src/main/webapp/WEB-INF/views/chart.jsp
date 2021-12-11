<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
	<style>
	 
		*{margin: 0;}	
			
		#chart_div{
			margin : 0px;
			padding : 0px;
			background-color: #f9f9f9;
			margin-top: 50px;
		}
		
		#chart_area{
			width: 70%;
			height: 600px;
			margin: auto;
			font-size: 20px;
			margin-top: 25px;
			 
		}
		#chartname{
			font-size: 35px;
			line-height: 3.5;
			text-align: center;
			width: 100%;
			height: 50px;
			font-weight: bold;
			color: gray;
			background-color: #f9f9f9;
			font-family: monospace;
			margin-top: 50px;
		}
		#middleback{
			height: 450;
			background-color: #f9f9f9;
		}
		
	</style>
	<header>
	
	</header>
</head>
<body>
		
	<!-- !!!!!!!실행전 파이썬 플라스크 구동해야 함!!!!!-->	
		
		
	<div id="chart_div">
		
			<p id="chartname">전기 차 충전소 분표도</p>
	
		<article id=middleback>
			<div id="chart_area"></div>
		</article>
	</div>
		
	<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>		
		
	<script>
/////////////////////////////////차트///////////////////////////////////////
	//Pyhton - Spring 연결
	$(function () {
		
		
		$.ajax({
			url: "http://127.0.0.1:5000/evChart",
			type: 'post',
			dataType: 'json'
		}).done( function (data) { //데이터를 받으면이쪽으로넘어온다.
			viewChart(data)
		}); //fail은 생략
	});

	function viewChart(json_data) {
		
		am4core.useTheme(am4themes_animated);
	
		var chart = am4core.create("chart_area", am4charts.XYChart);
		
		chart.data = json_data;
		
		//x축 만들기
		var x_Axis = chart.xAxes.push(new am4charts.CategoryAxis());
		x_Axis.dataFields.category = "city";
		
		x_Axis.renderer.labels.template.fontSize = 20;
		
		x_Axis.renderer.minGridDistance = 30;
		
		//y축 만들기
		var y_Axis = chart.yAxes.push(new am4charts.ValueAxis());
		
		//Series 만들기
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.categoryX = "city";
		series.dataFields.valueY = "count";
		
		series.columns.template.tooltipText = "[bold]{valueY}[/]";
		series.columns.template.fill = am4core.color("#85c4b9");
		series.columns.template.fillOpacity = .7;
		series.columns.template.stroke = am4core.color("#ffffff");
	}
	
	</script>	
</body>
</html>