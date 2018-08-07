<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커 클러스터러 사용하기</title>
    <center>
			<br/><br/><br/><a id="requestLatLng" href="#">30,000개 추가 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="ajaxRespon" href="#">전송 </a><br/><br/><br/><br/>
<!-- 			<a id="ajaxRespon" href="#"><h2>100개추가</h2> </a> -->
			<input type="hidden" id="hidden" />
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
    
    $("#map").mouseup(function(){
    	
        	console.log("12");
    	    // 지도의 현재 중심좌표를 얻어옵니다 
    	    var center = map.getCenter(); 
    	    
    	    // 지도의 현재 레벨을 얻어옵니다
    	    var level = map.getLevel();
    	    
    	    // 지도타입을 얻어옵니다
    	    var mapTypeId = map.getMapTypeId(); 
    	    
    	    // 지도의 현재 영역을 얻어옵니다 
    	    var bounds = map.getBounds();
    	    
    	    // 영역의 남서쪽 좌표를 얻어옵니다 
    	    var swLatLng = bounds.getSouthWest(); 
    	    
    	    // 영역의 북동쪽 좌표를 얻어옵니다 
    	    var neLatLng = bounds.getNorthEast(); 
    	    
    	    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
    	    var boundsStr = bounds.toString();
    	    
    	    
    	    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
    	    message += '경도 ' + center.getLng() + ' 이고 <br>';
    	    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
    	    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
    	    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
    	    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
    	    
    	    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
    	    console.log(message);

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
    
    
//     $.get("/board/chicken.json", function(data) {
//     	var position = JSON.parse(data);
//         var markers = $(position.positions).map(function(i, position) {
//             return new daum.maps.Marker({
//                 position : new daum.maps.LatLng(position.lat, position.lng)         	
//             });
//         });

//         // 클러스터러에 마커들을 추가합니다
//         clusterer.addMarkers(markers);
//     });
    
 // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();
 
 // 주소로 좌표를 검색합니다
 	
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
 	
 	/////////// 랜덤하게 생성된 좌표 정보를 배열에 저장한다. /////////////
	arrayLatLng = [];
 	arrayAddress = [];
 	goLatLng = [];
 	var tex = "서울시 은평구 역촌동 58-16";
 	var tee = "location";
 	var y = 0;
	$("#requestLatLng").click(function(){
		
		$.ajax({
			url : "compulsionInjection.do",
			type : "post",
			data : {count : 100},
			success : function(responseData){
				var data = JSON.parse(responseData);
				//console.log("인입: "+data.randomLat.length);
				function searchDetailAddrFromCoords(arrayLatLng, callback) {
                	//console.log("2 : "+ i);
			 	    // 좌표로 법정동 상세 주소 정보를 요청합니다
			 	   geocoder.coord2Address(arrayLatLng.getLng(), arrayLatLng.getLat(), callback);
			 	}
				//////////////////
				
				
				for(i in data.randomLat){
					
                	//console.log("i : "+ i);
					//console.log("lat: "+data.randomLat[i]);
					arrayLatLng [i] = new daum.maps.LatLng(data.randomLat[i], data.randomLng[i]);
					//console.log("latlng: "+ arrayLatLng[i]);
					//console.log("i: "+arrayLatLng[i].getLng()+", "+arrayLatLng[i].getLat());
					//goLatLng [i] = "lat: "+arrayLatLng[i].getLat()+", lng: "+arrayLatLng[i].getLng();

					searchDetailAddrFromCoords(arrayLatLng[i], function(result, status) {
						for(var i in result){
// 							console.log("i : "+ i+", result: "+ result[i]);
							for(var j in result[i]){
// 								console.log("j : "+ j+", result: "+ result[i][j]);
								for(var x in result[i][j]){
// 									console.log("x : "+ x+", result: "+ result[i][j].address_name);
// 									arrayAddress.push(result[i][j][x]);
								}
							}
						}
						if(result[0] !== undefined){
 							console.log("good: "+ result[0].address.address_name); // 됐어요 종석이형 !!!!! ^^
							addressToLat(result[0].address.address_name);
							//console.log("good: "+ result[0].address.address_name);
				
							
						}	
							

				    });


				}
				
			}
		});
		
	});
//////////////////////////////// 주소로 좌표 변환 ///////////////////////
	function addressToLat(address){
		 geocoder.addressSearch(address, function(result, status) {
			 arrayAddress.push(address);
			 //console.log("tex: "+address);
			 // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		    	 goLatLng.push(new daum.maps.LatLng(result[0].y, result[0].x));
		    	 //console.log("배열 goLatLng: "+goLatLng.length);
		     }else{
		    	 console.log("좌표변환 실패"+i);
		     }
		 });
		 
	}
	


	$('#ajaxRespon').click(function (){
		console.log("resultInjection 인입 arrayAddress.length: "+arrayAddress.length+", goLatLng.length: "+goLatLng.length);
   		for(i in arrayAddress){
   			//console.log("address["+arrayLatLng[i]+"]: "+arrayAddress[i]);
   			console.log("address["+i+"]: "+arrayAddress[i]+", 좌표["+i+"]: "+goLatLng[i]);
   		}
	    $.ajax({
	       	url : "resultInjection.do",
	       	type : "post",
	       	data : {jsonText : arrayAddress, jsonInt : goLatLng},
	       	success : function(){

	       		//console.log("resultInjection 인입 ");
	       		arrayAddress=[];
	       		goLatLng=[];
	       	},
	       	error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	});
	
	

	
	


}); 	   
</script>
</body>
</html>