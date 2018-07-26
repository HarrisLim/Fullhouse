<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커 클러스터러 사용하기</title>
    <center>
			<a href="./compulsionInjection.do?count=50"><h2>50개추가</h2> </a>
			<a href="./compulsionInjection.do?count=100"><h2>100개추가</h2> </a>
		</center>
    
</head>
<body>

<div id="map" style="width:800px;height:500px;"></div></br>

<!-- <form method="post" action="join.do" name="jj"> -->
	<input type="text" id="addr" name="addr" size="90px"/> &nbsp;&nbsp;<input type="submit" value="주소 전송" name="sub" id="sub"/>
<!-- </form> -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=clusterer,services"></script>
<script type="text/javascript" language="javascript" src="http://code.jquery.com/jquery-1.3.1.min.js"></script>
<script>
$('document').ready(function (){
    var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 10 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 1 // 클러스터 할 최소 지도 레벨 
    });
  	//alert("1: "+clusterer);
//     $.get("chicken.json")
   
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    
    
    $.get("/board/chicken.json", function(data) {
    	var position = JSON.parse(data);
        var markers = $(position.positions).map(function(i, position) {
            return new daum.maps.Marker({
                position : new daum.maps.LatLng(position.lat, position.lng)         	
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });
    
 // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();
 
 // 주소로 좌표를 검색합니다
 	
 	$(document).ready(function(){
 		$("#sub").click(function(){
 			var addr = $("#addr").val();
	 		 geocoder.addressSearch(addr, function(result, status) {
	
	 	        // 정상적으로 검색이 완료됐으면 
	 	         if (status === daum.maps.services.Status.OK) {
	
	 	            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	 	            // 결과값으로 받은 위치를 마커로 표시합니다
	 	            var marker = new daum.maps.Marker({
	 	                map: map,
	 	                position: coords
	 	            });
	 	           clusterer.addMarker(marker); //매물 등록시 하나씩 입력받은 값을 좌표로 변경하여 클러스터에 추가함
	 		 	           
	 	           $.ajax({
	 	        	   url : "join.do",
	 	        	   type : "post",
	 	        	   data : {latLng : coords}
	 	           });
	
// 	 	            // 인포윈도우로 장소에 대한 설명을 표시합니다
// 	 	            var infowindow = new daum.maps.InfoWindow({
// 	 	                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
// 	 	            });
// 	 	            infowindow.open(map, marker);
	
	 	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	 	            map.setCenter(coords);
	 	        } 
	 	    });    
 		});
 	});
   
 	geocoder.coord2Address();
}); 	   
</script>
</body>
</html>