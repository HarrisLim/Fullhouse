////////////////////////////////  지 도 시 작 ///////////////////////////////////////////////////////////////
	var latLngArray = {};
	var markers = [];
	var marker;
	var position;
	var imgSrc = "../kanu/images/animat-diamond-color.gif",
		imageSize = new daum.maps.Size(70, 70),
		imageOption = {offset: new daum.maps.Point(35, 35)};
	
	var customMarkerImage = new daum.maps.MarkerImage(imgSrc, imageSize, imageOption);
	
	var imgSrc1 = "../kanu/images/staticMarker1.png",
	imageSize1 = new daum.maps.Size(40, 50),
	imageOption1 = {offset: new daum.maps.Point(20, 25)};

	var customMarkerImage1 = new daum.maps.MarkerImage(imgSrc1, imageSize1, imageOption1);

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.570707, 126.984611), // 지도의 중심좌표
	        level: 8, // 지도의 확대 레벨
	        maxLevel: 12,

	    };

	var map = new daum.maps.Map(mapContainer, mapOption),
	    customOverlay = new daum.maps.CustomOverlay({}),
	    infowindow = new daum.maps.InfoWindow({removable: true});
	
	var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 1, // 클러스터 할 최소 지도 레벨 
        gridSize: 180, //클러스터의 격자 크기
        minClusterSize : 1500
	});
	

	
   //////////지도 정보 가져오기 ///////////////////// 
	var center = map.getCenter();
	var level = map.getLevel();
	var bounds = map.getBounds();
	var swLatLng = bounds.getSouthWest();
	$("#swLatLng").val(swLatLng);
    $("#west").val(swLatLng.getLng());
    $("#south").val(swLatLng.getLat());

	var neLatLng = bounds.getNorthEast();
	$("#neLatLng").val(neLatLng);
    $("#east").val(neLatLng.getLng());
    $("#north").val(neLatLng.getLat());

	var size = 80;
	
	 
$('document').ready(function(){	
    $(document).ajaxSend(function(e, xhr, options) {
    	console.log("ajaxSend 인입");
        xhr.setRequestHeader(header, token);

    });
	
    
 // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();
 
 // 주소로 좌표를 검색합니다
 		$("#serch_now").click(function(){
 			var addr = $("#serch_addr").val();
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

 	/////////////////////////////////////////////// 지 도 끝 /////////////////////////////////////////////////////////////////////////////
 	//begin_text & end_text click event 
 
	//////////////////////관심목록 등록////////////////////////
	
	//매물 마우스 오버
	function changebgc(c){
		$(c).mouseover(function(){
			$(c).css('background-color', '#D2E5FF');
			//e6e6e6
		});
	}

	//매물 마우스 아웃
	$(".itemList").mouseout(function(){
		$('.itemList').css('background-color', '#00ff0000');
		//e6e6e6
	});
	
	 //document ready 이후 맵 마커 생성 (관심목록 클릭시)
	 $('document').ready(mkClusterer(0));

//document . ready 끝	
});	

//좋아요 하트 버튼 동작
function heart(that){
	if($(that).children().children().attr('class').includes("o")){
		$(that).children().children().removeClass().addClass("fa fa-heart fa-2x");
	}else {
		$(that).children().children().removeClass().addClass("fa fa-heart-o fa-2x");
	}
	var build_no = $(that).next().find( '[name = build_no]');
	var seq = build_no.val();
	console.log("build_no: "+seq);
	$.ajax({
		url : "heart.do",
		type : "POST",
		data : {"seq" : seq}
	});
}

//하트 마우스 오버
function heartMouseOver(that){
	$(that).css('color', 'red');
}

//하트 마우스 아웃
function heartMouseOut(that){
	$(that).css("color", "gray");
}

//매물 마우스 오버시 백컬러 변경
var customMarker;

function getterLatLng(that){
//	$(that).one("mouseover", function(){
		$(that).css('background-color', '#D2E5FF');
		var lng = $(that).find( '[name="lng"]' );
		var lat = $(that).find( '[name="lat"]' );
		var targetLng = lng.val()*1;
		var targetLat = lat.val()*1;
		//console.log("targetLng2: "+targetLng+"targetLat: "+targetLat);
		var coords = new daum.maps.LatLng(targetLat, targetLng);
	    customMarker = new daum.maps.Marker({
	    	position: coords,
	    	image: customMarkerImage
	    });
	    customMarker.setMap(map);
	    map.setCenter(coords);
//	});
}


//매물 마우스 아웃 백컬러 변경
function buildMouseOut(that){
//	$(that).one("mouseout", function(){
		//console.log("매물 마우스아웃");
		customMarker.setMap(null);
		$(that).css('background-color', '#00ff0000');
//	});
}

//관심목록 - 찜한방 클릭시
$("#heartRoom").click(function(){
	console.log("찜한방 클릭 인입");
	$("#flag").val(1);
	var email = "1234@gmail.com";
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
   } 
	mkClusterer(1);
	console.log("찜한방 클릭시 마크클러스터 나오고 난뒤");
	$.ajax({
		url : "heartRoom.do",
		type : "POST",
		data : {email : email},
		success : function (responseData){
			var data = responseData;
			$("#total").val(data.page.total);
			$("#pageCnt").val(data.page.pageCnt);
			$("#listCnt").val(data.page.listCnt);
			console.log("찜목록 success: 페이징정보 total: "+$("#total").val()+", listCnt: "+ $("#listCnt").val()+", pageCnt: "+$("#pageCnt").val());
			pageIndex(0, 1, $("#total").val(), $("#listCnt").val(), $("#pageCnt").val());
		}
	});
});

//관심목록 - 최근 본방 클릭시
$("#recentRoom").click(function(){
	console.log("최근 본 방 클릭 인입");
	$("#flag").val(2);
	var email = "1234@gmail.com";
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
   } 
	mkClusterer(0);
	$.ajax({
		url : "recentRoom.do",
		type : "POST",
		data : {email : email},
		success : function (responseData){
			var data = responseData;
			$("#total").val(data.page.total);
			$("#pageCnt").val(data.page.pageCnt);
			$("#listCnt").val(data.page.listCnt);
			console.log("최근본방 목록 success: 페이징정보 total: "+$("#total").val()+", listCnt: "+ $("#listCnt").val()+", pageCnt: "+$("#pageCnt").val());
			pageIndex(0, 1, $("#total").val(), $("#listCnt").val(), $("#pageCnt").val());
		}
	});
});

// 토큰 생성
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

function mkClusterer(flag){

	 latLngArray["north"] = $("#north").val();
	 latLngArray["south"] = $("#south").val();
	 latLngArray["east"] = $("#east").val();
	 latLngArray["west"] = $("#west").val();
	 latLngArray["pageStartNum"] = $("#pageStartNum").val()*1;
	 latLngArray["index"] =	$("#index").val()*1;
	 latLngArray["flag"] = flag;
	 var jsonLatLng = JSON.stringify(latLngArray);
	 $.ajax({
	 	contentType : "application/json",
   	url : "mapMarker.do",
   	type : "post",
   	dataType : "json",
   	data : jsonLatLng,
	 	success : function(responseData){
		   position = responseData;
    
		    for(var i=0; i<position.positions.length; i++){
		    	//console.log("position2 포문: "+position.positions[i].lat+", i: "+i);
		    	var coords = new daum.maps.LatLng(position.positions[i].lat, position.positions[i].lng);
		    	marker = new daum.maps.Marker({
			    	position: coords,
			    	image: customMarkerImage1
		    	});
		    	marker.setMap(map);		    	
		    	markers.push(marker);
		    }
		},error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
	 });
}
