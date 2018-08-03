////////////////////////////////  지 도 시 작 ///////////////////////////////////////////////////////////////


    // 이전 페이지 index
       function pagePreCluster(index, pageStartNum, total, listCnt, pageCnt, east, west, north, south) {
       	var totalPageCnt = Math.ceil(total / listCnt);
       	index -= 1;
       	pageStartNum -= 1;
       	if(pageStartNum <= 1){
       		pageStartNum = 1;
       	}
       	if(index <= 0){
       		console.log("이전페이지클릭 totalPageCnt: "+totalPageCnt+", index: "+index);
       		index = 0;
       	}
       	$("#pageStartNum").val(pageStartNum);
       	$("#index").val(index);

       	ajaxListCluster(index, pageStartNum, east, west, north, south);

       }

       // 다음 페이지 index
       function pageNextCluster(index, pageStartNum, total, listCnt, pageCnt, east, west, north, south) {
       	var totalPageCnt = Math.ceil(total / listCnt); 
       	var max = Math.ceil(totalPageCnt / pageCnt); 
//       	if (max * pageCnt > index + pageCnt) {
       		//console.log("다음페이지클릭: max*pageCnt:"+max*pageCnt+", index+pageCnt: "+index+pageCnt+", totalPageCnt: "+totalPageCnt+", max: "+max+", index:"+index);
       	index += 1;
       	pageStartNum += 1;
       	if(pageStartNum > totalPageCnt - pageCnt){
       		pageStartNum = totalPageCnt - pageCnt+1;
       	}
       	if(index >= totalPageCnt-1){
       		console.log("다음페이지클릭 totalPageCnt: "+totalPageCnt+", index: "+index);
       		index = totalPageCnt-1;
       	}
       	if(pageStartNum <= 0){
       		pageStartNum = 1;
       	}
       	console.log("다음페이지클릭 pageCnt보다 인덱스 커질때 pageStartNum: "+pageStartNum+", index: "+index);
       	$("#pageStartNum").val(pageStartNum);
       	$("#index").val(index);
       	ajaxListCluster(index, pageStartNum, east, west, north, south);
       }
       
    // index 리스트 처리
       function pageIndexCluster(index, pageStartNum, total, listCnt, pageCnt, east, west, north, south) {
       	var totalPageCnt = Math.ceil(total / listCnt);
       	console.log("pageIndex메서드1 pageStarNum: "+pageStartNum+", totalPageCnt: "+totalPageCnt);
       	
       	if(pageStartNum > totalPageCnt - pageCnt){
       		pageStartNum = totalPageCnt - pageCnt+1;
       	}
       	if(pageStartNum <= 0){
       		pageStartNum = 1;
       	}
       	$("#pageStartNum").val(pageStartNum);
       	$("#index").val(index);
       	console.log("숫자 페이지 클릭 pageStartNum: "+pageStartNum+", index: "+index);
       	ajaxListCluster(index, pageStartNum, east, west, north, south);
       }


       function ajaxListCluster(index, pageStartNum, east, west, north, south){
       	$.ajax({
       		url : "clickClusterer.do",
       		type : "post",
       		//data : {"index" : pageStartNum-1, "pageStartNum" : $("#pageStartNum").val(), "listCnt" : $("#listCnt").val()},
       		data : {"index" : index, "pageStartNum" : pageStartNum, "listCnt" : $("#listCnt").val(), east : east, west : west, north : north, south : south},
       		success : function(responseData){
       			
       			//console.log("인입"+responseData);
       			var data = responseData;
       			//console.log("인입2"+data);
       			var html = "";
       			html += "<table class='table table-bordered'>";
       			html += "<br/>";
       			html += "<tr>";
       			html += "<th><center>번호</center></th>";
       			html += "<th><center>주소</center></th>";
       			html += "<th><center>위도</center></th>";
       			html += "<th><center>경도</center></th>";
       			html += "<th><center>날짜</center></th>";
       			html += "</tr>";
       			if(data.length != 0){
       				for(var i=0; i<data.list.length; i++){
       					html +="<tr>";
       					html +="<td>"+data.list[i].build_no+"</td>";
       					html +="<td>"+data.list[i].address+"</td>";
       					html +="<td>"+data.list[i].lat+"</td>";
       					html +="<td>"+data.list[i].lng+"</td>";
       					html +="<td>"+data.list[i].bu_rdate+"</td>";
       					html +="</tr>";
       				}
       				html += "</table>";
       			}
       			var text = "";
       			///////////////
             		//5. paging view
       			html += "<div id='page' style='height:100px;width:100%;background-color:red;position:absolute;bottom:0;'>";
       			html += "<ul class='pagination' style='justify-content:center'>";
       			//이전 페이지 이동
       			//text += "<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.pageStartNum+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
       			html += "<li class='page-item'><a class='page-link' onclick='pagePreCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&lsaquo;</a></li>";
       				//페이지번호
       				for(var i=data.pagingVo.pageStartNum; i<=data.pagingVo.pageLastNum; i++){
       					html += "<li class='pageIndex"+i+"'><a class='page-link' onclick='pageIndexCluster("+(i-1)+","+i+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>"+i+"</a></li>";
       				}
       				//<!--다음 페이지 이동 -->
       				html += "<li class='page-item'><a class='page-link' onclick='pageNextCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&rsaquo;</a></li>";
       				html += "</ul>";
       				html += "</div>";
       				$("#sidebar").empty().append(html);
       				$(".pageIndex"+(data.pagingVo.index+1)).addClass("page-item active");
       		}
       	});
       }
       
       
       

$('document').ready(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.570707, 126.984611), // 지도의 중심좌표
	        level: 8, // 지도의 확대 레벨
	        maxLevel: 12
	    };

	var map = new daum.maps.Map(mapContainer, mapOption),
	    customOverlay = new daum.maps.CustomOverlay({}),
	    infowindow = new daum.maps.InfoWindow({removable: true});
	
   //////////지도 정보 가져오기 ///////////////////// 
	var center = map.getCenter();
	var level = map.getLevel();
	var bounds = map.getBounds();
	var swLatLng = bounds.getSouthWest();
	var neLatLng = bounds.getNorthEast();
	var size = 80;
	
	 $("#map").mouseup(function(){
	   //console.log("인포인입");
	    // 지도의 현재 중심좌표를 얻어옵니다 
	    center = map.getCenter(); 
	    $("#center").val(center);
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    level = map.getLevel();
	    $("#level").val(level);
	    
	    // 지도타입을 얻어옵니다
	    var mapTypeId = map.getMapTypeId(); 
	    
	    // 지도의 현재 영역을 얻어옵니다 
	    bounds = map.getBounds();
	    $("#bounds").val(bounds);
	   
	    // 영역의 남서쪽 좌표를 얻어옵니다 
	    swLatLng = bounds.getSouthWest(); 
	    $("#swLatLng").val(swLatLng);
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    neLatLng = bounds.getNorthEast(); 
	    $("#neLatLng").val(neLatLng);
	   
	    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	    var boundsStr = bounds.toString();
	    
	    
	    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
	    message += '경도 ' + center.getLng() + ' 이고 <br>';
	    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
	    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
	    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
	    message += '지도의 현재 역역은 '+bounds+' 입니다<br>';
	    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
	    
	    console.log(message);
	    
	    $.ajax({
	    	url : "mapMarker.do",
	    	type : "post",
	    	data : {centerLat : center.getLat(), centerLng : center.getLng(), 
	    			neLng : neLatLng.getLng(), neLat : neLatLng.getLat(), 
	    			swLng : swLatLng.getLng(), swLat : swLatLng.getLat(),
	    			level : level},
	    	success : function(responseData){
	    		var data = responseData;
	    		console.log("data east: "+data.east+", data west: "+data.west+", data south: "+data.south+", data north: "+data.north);
				var html = "";
				html += "<table class='table table-bordered'>";
				html += "<br/>";
				html += "<tr>";
				html += "<th><center>번호</center></th>";
				html += "<th><center>주소</center></th>";
				html += "<th><center>위도</center></th>";
				html += "<th><center>경도</center></th>";
				html += "<th><center>날짜</center></th>";
				html += "</tr>";
				if(data.length != 0){
					for(var i=0; i<data.list.length; i++){
						html +="<tr>";
						html +="<td>"+data.list[i].build_no+"</td>";
						html +="<td>"+data.list[i].address+"</td>";
						html +="<td>"+data.list[i].lat+"</td>";
						html +="<td>"+data.list[i].lng+"</td>";
						html +="<td>"+data.list[i].bu_rdate+"</td>";
						html +="</tr>";
					}
					html += "</table>";
				}
				var text = "검색결과 "+data.count+" 개";
				///////////////
	      		//5. paging view
				html += "<div id='page' style='height:100px;width:100%;background-color:red;position:absolute;bottom:0;'>";
				html += "<ul class='pagination' style='justify-content:center'>";
				//이전 페이지 이동
				//text += "<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.pageStartNum+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
				html += "<li class='page-item'><a class='page-link' onclick='pagePreCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&lsaquo;</a></li>";
					//페이지번호
					for(var i=data.pagingVo.pageStartNum; i<=data.pagingVo.pageLastNum; i++){
						html += "<li class='pageIndex"+i+"'><a class='page-link' onclick='pageIndexCluster("+(i-1)+","+i+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>"+i+"</a></li>";
					}
					//<!--다음 페이지 이동 -->
					html += "<li class='page-item'><a class='page-link' onclick='pageNextCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&rsaquo;</a></li>";
					html += "</ul>";
					html += "</div>";
					$("#sidebar").empty().append(html);
					$(".pageIndex"+(data.pagingVo.index+1)).addClass("page-item active");
					$("#listCount").empty().append(text);
			}
	    });
	    
	});
	 
	 //클러스터러 생성
	 $('document').ready(function(){
		 console.log("클러스터러 인입");
		 $.ajax({
		    	url : "mapClusterer.do",
		    	type : "post",
		    	data : {count : 500},
			 	success : function(responseData){
				    var position = responseData;
			        var markers = $(position.positions).map(function(i, position) {
			            return new daum.maps.Marker({
			                position : new daum.maps.LatLng(position.lat, position.lng)         	
			            });
			        });
			
				        // 클러스터러에 마커들을 추가합니다
			        	clusterer.clear();
				        clusterer.addMarkers(markers);
				}
		 });
	 });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 1, // 클러스터 할 최소 지도 레벨 
        gridSize: 180, //클러스터의 격자 크기
        minClusterSize : 1,
        calculator: [10, 100, 1000], 
        styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
		        width : '70px', height : '70px',
		        background: 'rgba(51, 204, 255, .8)',
		        borderRadius: '35px',
		        color: '#000',
		        textAlign: 'center',
		        fontSize: '35px',
		        fontWeight: 'bold',
		        lineHeight: '71px'
		    },
		    {
		        width : '78px', height : '78px',
		        background: 'rgba(255, 153, 0, .8)',
		        borderRadius: '39px',
		        color: '#000',
		        textAlign: 'center',
		        fontSize: '38px',
		        fontWeight: 'bold',
		        lineHeight: '79px'
		    },
		    {
		        width : '90px', height : '90px',
		        background: 'rgba(255, 51, 204, .8)',
		        borderRadius: '45px',
		        color: '#000',
		        textAlign: 'center',
		        fontSize: '40px',
		        fontWeight: 'bold',
		        lineHeight: '91px'
		    },
		    {
		        width : '110px', height : '110px',
		        background: 'rgba(255, 80, 80, .8)',
		        borderRadius: '55px',
		        color: '#000',
		        textAlign: 'center',
		        fontSize: '45px',
		        fontWeight: 'bold',
		        lineHeight: '111px'
		        }
		    ]
		});

    var count = 1;
    //마우스 스크롤 조정했을때 이벤트 처리
    daum.maps.event.addListener(map, 'zoom_changed', function() {
    	level = map.getLevel();
    	console.log('zoom changed!:'+level+"clustererGridSize: "+clusterer.getGridSize());
   		zoomOver();

//      if(level == 12)clusterer.setGridSize(120);
//      else if(level <= 10)clusterer.setGridSize(180);

//      console.log('zoom changed!:'+level+"clustererGridSize: "+clusterer.getGridSize());
    });
    
    function zoomOver(){
    	console.log("zoomOver인입");
    	center = map.getCenter(); 
	    $("#center").val(center);
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    level = map.getLevel();
	    $("#level").val(level);
	    
	    // 지도의 현재 영역을 얻어옵니다 
	    bounds = map.getBounds();
	    $("#bounds").val(bounds);
	   
	    // 영역의 남서쪽 좌표를 얻어옵니다 
	    swLatLng = bounds.getSouthWest(); 
	    $("#swLatLng").val(swLatLng);
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    neLatLng = bounds.getNorthEast(); 
	    $("#neLatLng").val(neLatLng);
    	
	    $.ajax({
	    	url : "mapMarker.do",
	    	type : "post",
	    	data : {centerLat : center.getLat(), centerLng : center.getLng(), 
	    			neLng : neLatLng.getLng(), neLat : neLatLng.getLat(), 
	    			swLng : swLatLng.getLng(), swLat : swLatLng.getLat(),
	    			level : level},
	    	success : function(responseData){
	    		var data = responseData;
	    		console.log("data east: "+data.east+", data west: "+data.west+", data south: "+data.south+", data north: "+data.north);
				var html = "";
				html += "<table class='table table-bordered'>";
				html += "<br/>";
				html += "<tr>";
				html += "<th><center>번호</center></th>";
				html += "<th><center>주소</center></th>";
				html += "<th><center>위도</center></th>";
				html += "<th><center>경도</center></th>";
				html += "<th><center>날짜</center></th>";
				html += "</tr>";
				if(data.length != 0){
					for(var i=0; i<data.list.length; i++){
						html +="<tr>";
						html +="<td>"+data.list[i].build_no+"</td>";
						html +="<td>"+data.list[i].address+"</td>";
						html +="<td>"+data.list[i].lat+"</td>";
						html +="<td>"+data.list[i].lng+"</td>";
						html +="<td>"+data.list[i].bu_rdate+"</td>";
						html +="</tr>";
					}
					html += "</table>";
				}
				var text = "검색결과 "+data.count+" 개";
				///////////////
	      		//5. paging view
				html += "<div id='page' style='height:100px;width:100%;background-color:red;position:absolute;bottom:0;'>";
				html += "<ul class='pagination' style='justify-content:center'>";
				//이전 페이지 이동
				//text += "<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.pageStartNum+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
				html += "<li class='page-item'><a class='page-link' onclick='pagePreCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&lsaquo;</a></li>";
					//페이지번호
					for(var i=data.pagingVo.pageStartNum; i<=data.pagingVo.pageLastNum; i++){
						html += "<li class='pageIndex"+i+"'><a class='page-link' onclick='pageIndexCluster("+(i-1)+","+i+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>"+i+"</a></li>";
					}
					//<!--다음 페이지 이동 -->
					html += "<li class='page-item'><a class='page-link' onclick='pageNextCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&rsaquo;</a></li>";
					html += "</ul>";
					html += "</div>";
					$("#sidebar").empty().append(html);
					$(".pageIndex"+(data.pagingVo.index+1)).addClass("page-item active");
					$("#listCount").empty().append(text);
			}
	    });
    }


    
    //클러스터를 클릭 했을때 이벤트 처리
    daum.maps.event.addListener( clusterer, 'clusterclick', function( cluster ) {
    	rectangle.setOptions({fillColor: 'rgba(0,0,0,0)'});
    	rectangle.setOptions({strokeColor: 'rgba(0,0,0,0)'});
        
//    	var dataa = clusterer.getStyles();
//    	for(i in dataa){
//    		console.log("no is " + [i] + ", value is " + dataa[i]);
//    	}
    	
    	var west = cluster.getBounds().da;
    	var south = cluster.getBounds().ka;
    	var east = cluster.getBounds().ia;
    	var north = cluster.getBounds().ja;
    	//console.log("클러스터러 영역:"+west+", "+south+", "+east+", "+north );
	      $.ajax({
	    	url : "clickClusterer.do",
	    	type : "get",
	    	data : {west : west, south : south, east : east, north : north},
	    	success : function(responseData){
	    		var data = responseData;
	    		console.log("data east: "+data.east+", data west: "+data.west+", data south: "+data.south+", data north: "+data.north);
				var html = "";
				html += "<table class='table table-bordered'>";
				html += "<br/>";
				html += "<tr>";
				html += "<th><center>번호</center></th>";
				html += "<th><center>주소</center></th>";
				html += "<th><center>위도</center></th>";
				html += "<th><center>경도</center></th>";
				html += "<th><center>날짜</center></th>";
				html += "</tr>";
				if(data.length != 0){
					for(var i=0; i<data.list.length; i++){
						html +="<tr>";
						html +="<td>"+data.list[i].build_no+"</td>";
						html +="<td>"+data.list[i].address+"</td>";
						html +="<td>"+data.list[i].lat+"</td>";
						html +="<td>"+data.list[i].lng+"</td>";
						html +="<td>"+data.list[i].bu_rdate+"</td>";
						html +="</tr>";
					}
					html += "</table>";
				}
				var text = "검색결과 "+data.count+" 개";
				///////////////
	      		//5. paging view
				html += "<div id='page' style='height:100px;width:100%;background-color:red;position:absolute;bottom:0;'>";
				html += "<ul class='pagination' style='justify-content:center'>";
				//이전 페이지 이동
				//text += "<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.pageStartNum+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
				html += "<li class='page-item'><a class='page-link' onclick='pagePreCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&lsaquo;</a></li>";
				//페이지번호
				for(var i=data.pagingVo.pageStartNum; i<=data.pagingVo.pageLastNum; i++){
					html += "<li class='pageIndex"+i+"'><a class='page-link' onclick='pageIndexCluster("+(i-1)+","+i+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>"+i+"</a></li>";
				}
				//<!--다음 페이지 이동 -->
				html += "<li class='page-item'><a class='page-link' onclick='pageNextCluster("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+","+data.east+","+data.west+","+data.north+","+data.south+");'>&rsaquo;</a></li>";
				html += "</ul>";
				html += "</div>";
				$("#sidebar").empty().append(html);
				$(".pageIndex"+(data.pagingVo.index+1)).addClass("page-item active");
				$("#listCount").empty().append(text);
			}
	    });
   });
    
    var rectangle;
    var west = 0.0;
	var south = 0.0; 
	var east = 0.0;
	var north = 0.0;
	/// 클러스터 마우스 오버 이벤트 핸들러
    daum.maps.event.addListener( clusterer, 'clusterover', function( cluster ) {
    	west = cluster.getBounds().da;
    	south = cluster.getBounds().ka;
    	east = cluster.getBounds().ia;
    	north = cluster.getBounds().ja;
    	console.log("마우스오버이벤트 동서남북 좌표 west:"+west+", south: "+south+", east: "+east+", north: "+north);
    	
    	var sw = new daum.maps.LatLng(south, west), // 사각형 영역의 남서쪽 좌표
        ne = new daum.maps.LatLng(north, east); // 사각형 영역의 북동쪽 좌표
    	var rectangleBounds = new daum.maps.LatLngBounds(sw, ne);
    	rectangle = new daum.maps.Rectangle({
    	    bounds: rectangleBounds, // 그려질 사각형의 영역정보입니다
    	    strokeWeight: 4, // 선의 두께입니다
    	    strokeColor: '#FF3DE5', // 선의 색깔입니다
    	    strokeOpacity: 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    	    strokeStyle: 'shortdashdot', // 선의 스타일입니다
    	    fillColor: '#09f', // 채우기 색깔입니다
    	    fillOpacity: 0.4 // 채우기 불투명도 입니다
    	});
    	if (level < 8) rectangle.setMap(map);
    	

 	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
 	    // 커스텀 오버레이를 지도에서 제거합니다 
 	    daum.maps.event.addListener(rectangle, 'mouseout', function() {
 	    	rectangle.setOptions({fillColor: 'rgba(0,0,0,0)'});
 	    	rectangle.setOptions({strokeColor: 'rgba(0,0,0,0)'});
 	        customOverlay.setMap(null);
 	    }); 

 	    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
// 	    daum.maps.event.addListener(rectangle, 'click', function(mouseEvent) {
// 	        var content = '<div class="info">' + 
// 	                    '   <div class="title">' + level + '</div>' +
// 	                    '   <div class="size">총 면적 : 약 ' + Math.floor(rectangle.getArea()) + ' m<sup>2</sup></area>' +
// 	                    '</div>';
//
// 	        infowindow.setContent(content); 
// 	        infowindow.setPosition(mouseEvent.latLng); 
// 	        infowindow.setMap(map);
// 	    });
   
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
	// 보증금 검색 0원 부터
	$("#begin_0").click(function(){
		if($("#begin_0").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("0원");
		$("#begin_0").css("background-color", "#3B8DE0");
		$("#begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_500").click(function(){
		if($("#begin_500").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("500만원");
		$("#begin_500").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0").addClass("disabled");
		$("#end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_1000").click(function(){
		if($("#begin_1000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("1000만원");
		$("#begin_1000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500").addClass("disabled");
		$("#end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_2000").click(function(){
		if($("#begin_2000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("2000만원");
		$("#begin_2000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000").addClass("disabled");
		$("#end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_3000").click(function(){
		if($("#begin_3000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("3000만원");
		$("#begin_3000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000").addClass("disabled");
		$("#end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_4000").click(function(){
		if($("#begin_4000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("4000만원");
		$("#begin_4000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000").addClass("disabled");
		$("#end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_5000").click(function(){
		if($("#begin_5000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("5000만원");
		$("#begin_5000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000").addClass("disabled");
		$("#end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_6000").click(function(){
		if($("#begin_6000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("6000만원");
		$("#begin_6000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000").addClass("disabled");
		$("#end_6000, #end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_7000").click(function(){
		if($("#begin_7000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("7000만원");
		$("#begin_7000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_8000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000").addClass("disabled");
		$("#end_7000, #end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_8000").click(function(){
		if($("#begin_8000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("8000만원");
		$("#begin_8000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_9000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000").addClass("disabled");
		$("#end_8000, #end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_9000").click(function(){
		if($("#begin_9000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("9000만원");
		$("#begin_9000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_10000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000").addClass("disabled");
		$("#end_9000, #end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_10000").click(function(){
		if($("#begin_10000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("1억");
		$("#begin_10000").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000").addClass("disabled");
		$("#end_10000, #end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#begin_unlimited").click(function(){
		if($("#begin_unlimited").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_text").val("무제한");
		$("#begin_unlimited").css("background-color", "#3B8DE0");
		$("#begin_0 , #begin_500 , #begin_1000 , #begin_2000 , #begin_3000 , #begin_4000 , #begin_5000 , #begin_6000 , #begin_7000 , #begin_8000 , #begin_9000 , #begin_10000").css("background-color", "rgba(0,0,0,0)");
		$("#end_0, #end_500, #end_1000, #end_2000, #end_3000, #end_4000, #end_5000, #end_6000, #end_7000, #end_8000, #end_9000, #end_10000").addClass("disabled");
		$("#end_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	// 보증금 0원 까지
	$("#end_0").click(function(){
		if($("#end_0").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("0원");
		$("#end_0").css("background-color", "#3B8DE0");
		$("#end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_500").click(function(){
		if($("#end_500").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("500만원");
		$("#end_500").css("background-color", "#3B8DE0");
		$("#end_0 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500").removeClass("disabled");
		$("#begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
		
	});
	
	$("#end_1000").click(function(){
		if($("#end_1000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("1000만원");
		$("#end_1000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000").removeClass("disabled");
		$("#begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
		
	});
	
	$("#end_2000").click(function(){
		if($("#end_2000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("2000만원");
		$("#end_2000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000").removeClass("disabled");
		$("#begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_3000").click(function(){
		if($("#end_3000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("3000만원");
		$("#end_3000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000").removeClass("disabled");
		$("#begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_4000").click(function(){
		if($("#end_4000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("4000만원");
		$("#end_4000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000").removeClass("disabled");
		$("#begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_5000").click(function(){
		if($("#end_5000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("5000만원");
		$("#end_5000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000").removeClass("disabled");
		$("#begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_6000").click(function(){
		if($("#end_6000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("6000만원");
		$("#end_6000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_7000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000").removeClass("disabled");
		$("#begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_7000").click(function(){
		if($("#end_7000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("7000만원");
		$("#end_7000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_8000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000").removeClass("disabled");
		$("#begin_8000, #begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_8000").click(function(){
		if($("#end_8000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("8000만원");
		$("#end_8000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_9000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000").removeClass("disabled");
		$("#begin_9000, #begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_9000").click(function(){
		if($("#end_9000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("9000만원");
		$("#end_9000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_10000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000").removeClass("disabled");
		$("#begin_10000, #begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_10000").click(function(){
		if($("#end_10000").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("1억");
		$("#end_10000").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000").removeClass("disabled");
		$("#begin_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	$("#end_unlimited").click(function(){
		if($("#end_unlimited").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_text").val("무제한");
		$("#end_unlimited").css("background-color", "#3B8DE0");
		$("#end_0 , #end_500 , #end_1000 , #end_2000 , #end_3000 , #end_4000 , #end_5000 , #end_6000 , #end_7000 , #end_8000 , #end_9000 , #end_10000").css("background-color", "rgba(0,0,0,0)");
		$("#begin_0, #begin_500, #begin_1000, #begin_2000, #begin_3000, #begin_4000, #begin_5000, #begin_6000, #begin_7000, #begin_8000, #begin_9000, #begin_10000, #begin_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_text").val(), end : $("#end_text").val}
		});
	});
	
	////////////////////////////////////////////////////////////////////////////////

	
	//월세 가격
    // 0 만원 부터
	$("#begin_rent_0").click(function(){
		if($("#begin_rent_0").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("0원");
		$("#begin_rent_0").css("background-color", "#3B8DE0");
		$("#begin_rent_10 , #begin_rent_20 , #begin_rent_30 , #begin_rent_40 , #begin_rent_50 , #begin_rent_60 , #begin_rent_70 , #begin_rent_80 , #begin_rent_90 , #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_10").click(function(){
		if($("#begin_rent_10").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("10만원");
		$("#begin_rent_10").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0").addClass("disabled");
		$("#end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_20").click(function(){
		if($("#begin_rent_20").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("20만원");
		$("#begin_rent_20").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_30, #begin_rent_40, #begin_rent_50 , #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10").addClass("disabled");
		$("#end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_30").click(function(){
		if($("#begin_rent_30").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("30만원");
		$("#begin_rent_30").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20").addClass("disabled");
		$("#end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_40").click(function(){
		if($("#begin_rent_40").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("40만원");
		$("#begin_rent_40").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30").addClass("disabled");
		$("#end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_50").click(function(){
		if($("#begin_rent_50").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("50만원");
		$("#begin_rent_50").css("background-color", "#3B8DE0");
		$("#begin_rent_0 , #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40").addClass("disabled");
		$("#end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_60").click(function(){
		if($("#begin_rent_60").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("60만원");
		$("#begin_rent_60").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50").addClass("disabled");
		$("#end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_70").click(function(){
		if($("#begin_rent_70").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("70만원");
		$("#begin_rent_70").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60").addClass("disabled");
		$("#end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_80").click(function(){
		if($("#begin_rent_80").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("80만원");
		$("#begin_rent_80").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent50, #begin_rent_60, #begin_rent_70, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70").addClass("disabled");
		$("#end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_90").click(function(){
		if($("#begin_rent_90").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("90만원");
		$("#begin_rent_90").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_100, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80").addClass("disabled");
		$("#end_rent_90, #end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_100").click(function(){
		if($("#begin_rent_100").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("100만원");
		$("#begin_rent_100").css("background-color", "#3B8DE0");
		$("#begin_rent_0 , #begin_rent_10 , #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90").addClass("disabled");
		$("#end_rent_100, #end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#begin_rent_unlimited").click(function(){
		if($("#begin_rent_unlimited").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#begin_rent_text").val("무제한");
		$("#begin_rent_unlimited").css("background-color", "#3B8DE0");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100").css("background-color", "rgba(0,0,0,0)");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100").addClass("disabled");
		$("#end_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	// 보증금 0원 까지
	$("#end_rent_0").click(function(){
		if($("#end_rent_0").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("0원");
		$("#end_rent_0").css("background-color", "#3B8DE0");
		$("#end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_10").click(function(){
		if($("#end_rent_10").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("10만원");
		$("#end_rent_10").css("background-color", "#3B8DE0");
		$("#end_rent_0, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10").removeClass("disabled");
		$("#begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
		
	});
	
	$("#end_rent_20").click(function(){
		if($("#end_rent_20").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("20만원");
		$("#end_rent_20").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10 , #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_10, #begin_rent_20").removeClass("disabled");
		$("#begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
		
	});
	
	$("#end_rent_30").click(function(){
		if($("#end_rent_30").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("30만원");
		$("#end_rent_30").css("background-color", "#3B8DE0");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30").removeClass("disabled");
		$("#begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_40").click(function(){
		if($("#end_rent_40").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("40만원");
		$("#end_rent_40").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10 , #end_rent_20, #end_rent_30, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40").removeClass("disabled");
		$("#begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_50").click(function(){
		if($("#end_rent_50").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("50만원");
		$("#end_rent_50").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10 , #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50").removeClass("disabled");
		$("#begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_60").click(function(){
		if($("#end_rent_60").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("60만원");
		$("#end_rent_60").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60").removeClass("disabled");
		$("#begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_70").click(function(){
		if($("#end_rent_70").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("70만원");
		$("#end_rent_70").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10 , #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_80, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70").removeClass("disabled");
		$("#begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_80").click(function(){
		if($("#end_rent_80").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("80만원");
		$("#end_rent_80").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10 , #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_90, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80").removeClass("disabled");
		$("#begin_rent_90, #begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_90").click(function(){
		if($("#end_rent_90").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("90만원");
		$("#end_rent_90").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_100, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90").removeClass("disabled");
		$("#begin_rent_100, #begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_100").click(function(){
		if($("#end_rent_100").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("100만원");
		$("#end_rent_100").css("background-color", "#3B8DE0");
		$("#end_rent_0 , #end_rent_10 , #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_unlimited").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100").removeClass("disabled");
		$("#begin_rent_unlimited").addClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	$("#end_rent_unlimited").click(function(){
		if($("#end_rent_unlimited").attr('class').includes("disabled")){
			//alert("선택할 수 없습니다.");
			return;
		}
		$("#end_rent_text").val("무제한");
		$("#end_rent_unlimited").css("background-color", "#3B8DE0");
		$("#end_rent_0, #end_rent_10, #end_rent_20, #end_rent_30, #end_rent_40, #end_rent_50, #end_rent_60, #end_rent_70, #end_rent_80, #end_rent_90, #end_rent_100").css("background-color", "rgba(0,0,0,0)");
		$("#begin_rent_0, #begin_rent_10, #begin_rent_20, #begin_rent_30, #begin_rent_40, #begin_rent_50, #begin_rent_60, #begin_rent_70, #begin_rent_80, #begin_rent_90, #begin_rent_100, #begin_rent_unlimited").removeClass("disabled");
		$.ajax({
			url : "json.do",
			type : "post",
			data : {begin : $("#begin_rent_text").val(), end : $("#end_rent_text").val}
		});
	});
	
	// 추가 사항 체크 박스 
	var options = [];
	$('.option_ckeck').on( 'click', function( event ) {
	   
	   var $target = $( event.currentTarget ),
	       val = $target.attr( 'data-value' ),
	       $inp = $target.find( 'input' ),
	       idx;
	
	   if ( ( idx = options.indexOf( val ) ) > -1 ) {
	      options.splice( idx, 1 );
	      setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
	   } else {
	      options.push( val );
	      setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
	   }
	
	   $( event.target ).blur();
	      
	   console.log( options );
	   return false;
	});
	
	// 보증금 드랍박스 hide 안되게
	$(function() {
        $('#drop_deposit_begin').on({
        	"click": function(event) {
              if ($(event.target).closest('.dropdown-toggle').length) {
                $(this).data('closable', false);
              } else {
                $(this).data('closable', false);
              }
            },
            "hide.bs.dropdown": function(event) {
              hide = $(this).data('closable');
              $(this).data('closable', true);
              return hide;
            }
        });
    });
	
	// 월세 드랍박스 hide 안되게
	$(function() {
        $('#drop_rent_month').on({
            "click": function(event) {
              if ($(event.target).closest('.dropdown-toggle').length) {
                $(this).data('closable', false);
              } else {
                $(this).data('closable', false);
              }
            },
            "hide.bs.dropdown": function(event) {
              hide = $(this).data('closable');
              $(this).data('closable', true);
              return hide;
            }
        });
    });
	
	
    // 매물 종류
	// 월세
	$("#month_rent").click( function () {
		  var arc = $("#month_rent").text();
		  $("#kind_of_sale").empty().append(arc);
	});
    // 전세or월세
	$("#engage_or_rent").click( function () {
		  var arc = $("#engage_or_rent").text();
		  $("#kind_of_sale").empty().append(arc);
	});
    // 전세
	$("#engage").click( function () {
		  var arc = $("#engage").text();
		  $("#kind_of_sale").empty().append(arc);
	});
    // 매매
	$("#sale").click( function () {
		  var arc = $("#sale").text();
		  $("#kind_of_sale").empty().append(arc);
	});
	
	// 거래 종류
    // 전체
	$("#all").click( function () {
		  var arc = $("#all").text();
		  $("#kind_of_trade").empty().append(arc);
	});
    // 중개
	$("#estate_agent").click( function () {
		  var arc = $("#estate_agent").text();
		  $("#kind_of_trade").empty().append(arc);
	});
    // 직거래
	$("#direct_deal").click( function () {
		  var arc = $("#direct_deal").text();
		  $("#kind_of_trade").empty().append(arc);
	});

	// 방종류
    // 전체
	$("#room_count_all").click( function () {
		  var arc = $("#room_count_all").text();
		  $("#kind_of_room").empty().append(arc);
	});
    // 원룸
	$("#room_count_1").click( function () {
		  var arc = $("#room_count_1").text();
		  $("#kind_of_room").empty().append(arc);
	});
    // 1.5룸
	$("#room_count_1.5").click( function () {
		  var arc = $("#room_count_1.5").text();
		  $("#kind_of_room").empty().append(arc);
	});
    // 투룸
	$("#room_count_2").click( function () {
		  var arc = $("#room_count_2").text();
		  $("#kind_of_room").empty().append(arc);
	});
    // 쓰리룲
	$("#room_count_3").click( function () {
		  var arc = $("#room_count_3").text();
		  $("#kind_of_room").empty().append(arc);
	});
    // 오피스텔
	$("#room_count_office").click( function () {
		  var arc = $("#room_count_office").text();
		  $("#kind_of_room").empty().append(arc);
	});
    // 아파트
	$("#room_count_appart").click( function () {
		  var arc = $("#room_count_appart").text();
		  $("#kind_of_room").empty().append(arc);
	});
	/////////////////////////////////////////////////////////////

	
	// 추가 옵션
    // 주차가능
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 반려동물 가능
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 단기 임대
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 5평 이하
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 5~10평
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 10평 이상
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 반지층
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 저층(1~3층)
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 중층(4~6층)
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 고층(7층~19층)
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 초고층(20층 이상)
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});
    // 옥탑
	$("#dropdown-item_1").click( function () {
		  var arc = $("#dropdown-item_1").text();
		  $("#navbar_main_dropdown_1").empty().append(arc);
	});

});	
	
    