<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/footer/footer.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<link rel="stylesheet" href="resources/css/main/main.css">
<title>evca 전기차 충전소 위치 및 분표도</title>
<style type="text/css">
#wrap {
	margin: 190px 0px 171px 0px;
	height: 1212px;
	background-color: #f9f9f9;
}
 
#mdiv {
	margin: -4px;
	height: 50px;
	width: 100%;
	border: none background: #ffffff;
	margin-top: -180px;
}

#mapbtn {
	font-size: 20px;
	width: 100%;
	padding: 13px;
	border: 0px;
	background: #f9f9f9;
	font-weight: bold;
	font-family: monospace;
	color: gray;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, sans-serif;
	font-size: 15px;
	font-family: monospace;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgb(133 196 185/ 54%);
	z-index: 1;
	border-radius: 10px;
	width: 300px;
	font-size: 15px;
	font-weight: bold;
}

#searchButton {
	font-weight: bold;
	font-family: monospace;
}

#keyword {
	font-size: 15px;
}

#map_title {
	margin: auto;
	padding: 0px;
	width: 100%;
	height: 400px;
	text-align: center;
	line-height: 20;
	color: gray;
}
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	<div>
		<div id="map_title">
			<h1>전기 차 충전소</h1>
		</div>

		<div id="wrap">
			<div id="mdiv">
				<!-- <input id="searchMap"  placeholder="지역명 / 충전소 검색"> -->
				<button id="mapbtn" type="button">지도 마커표시에 마우스를 올리면 상세정보가
					나옵니다.</button>
			</div>

			<!-- Map -->
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 530px; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" id="keyword" size="15"
									placeholder="지역/주소 검색">
								<button id="searchButton" type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>

				</div>
			</div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=81acff9f40fb4029e83b4194122f60af&libraries=services,clusterer"></script>
			<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	    level: 10 // 지도의 확대 레벨
	};  
	
	var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
	var arr = new Array();
	<c:forEach var="vo" items="${list}">
	arr.push({
			statNm : "${vo.statNm}" //장소명
			,addr : "${vo.addr}" //주소명
			,lat : "${vo.lat}" //위도
			,lng : "${vo.lng}" //경도
			,busiCall : "${vo.busiCall}"
			,useTime : "${vo.useTime}"
		});
	</c:forEach>

	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 10 // 클러스터 할 최소 지도 레벨 
	});
	
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	
		var markers = $(arr).map(function(i, value) { //value = 들어올 값
	       return new kakao.maps.Marker({
	           position : new kakao.maps.LatLng(value.lat, value.lng)//x위도,y경도
	       		,title : "충전소 위치 : "+value.addr+"/"+value.statNm+"/"+
	       					value.useTime+"("+
	       							"연락처"+value.busiCall+")"
	       });
	   });
		clusterer.addMarkers(markers);
		
	 // 마커 클러스터러에 클릭이벤트를 등록합니다
	 // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	 // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
 	kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
     
     var level = map.getLevel()-1; //마커 클러스터 클릭시 1level 확대
     // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
     map.setLevel(level, {anchor: cluster.getCenter()});
 	});	
 	var ps = new kakao.maps.services.Places(); 
	 
 	//키워드 검색 함수
 	//searchPlaces();
 
 	function searchPlaces() {

 	    var keyword = document.getElementById('keyword').value;

 	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
 	        alert('지역or장소를 입력해주세요!');
 	        return false;
 	    }

 	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
 	    ps.keywordSearch(keyword, placesSearchCB); 
 	}

 
 	function placesSearchCB(data, status, pagination) {
 	    if (status === kakao.maps.services.Status.OK) {

 	        // 정상적으로 검색이 완료됐으면
 	        // 검색 목록과 마커를 표출합니다
 	        displayPlaces(data);

 	        // 페이지 번호를 표출합니다
 	        displayPagination(pagination);

 	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

 	        alert('검색 결과가 존재하지 않습니다.');
 	        return;

 	    }
 	}
 	// 검색 결과 목록과 마커를 표출하는 함수입니다
 	function displayPlaces(places) {
 	    bounds = new kakao.maps.LatLngBounds();

 	    for ( var i=0; i<places.length; i++ ) {

 	       
 	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x)
 	  
 	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
 	        // LatLngBounds 객체에 좌표를 추가합니다
 	        bounds.extend(placePosition);
 	    }
 	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
 	    map.setBounds(bounds);
 	}
	
 // 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	

	

	
</script>
			<!--차트 -->
			<jsp:include page="chart.jsp" />
		</div>
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>


















