/**
 * 
 */

////////////////////////////////  지 도 시 작 ///////////////////////////////////////////////////////////////


$('document').ready(function(){
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
		if(scrollTop <= 1450){
			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 300);
		}

	}).scroll();
//	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
//    mapOption = {
//        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
//        level: 5 // 지도의 확대 레벨
//    };  
//
//	// 지도를 생성합니다    
//	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	var imgSrc = "../kanu/images/custom_marker.png",
		imageSize = new daum.maps.Size(122, 122),
		imageOption = {offset: new daum.maps.Point(61, 61)};
	
	var customMarkerImage = new daum.maps.MarkerImage(imgSrc, imageSize, imageOption);
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.570707, 126.984611), // 지도의 중심좌표
	        level: 5, // 지도의 확대 레벨
	        maxLevel: 8
	    };

	var map = new daum.maps.Map(mapContainer, mapOption),
	    customOverlay = new daum.maps.CustomOverlay({}),
	    infowindow = new daum.maps.InfoWindow({removable: true});
	
 // 주소로 좌표를 검색합니다
	var addr = '경기 성남시 분당구 판교로227번길 6';
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addressSearch(addr, function(result, status) {
        // 정상적으로 검색이 완료됐으면 
         if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
            // 결과값으로 받은 위치를 마커로 표시합니다
            var customMarker = new daum.maps.Marker({
            	position: coords,
            	image: customMarkerImage
            });
            customMarker.setMap(map);
//            var marker10 = new daum.maps.Marker({
//                map: map,
//                position: coords
//            });
           //clusterer.addMarker(marker10); //매물 등록시 하나씩 입력받은 값을 좌표로 변경하여 클러스터에 추가함
           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
        } 
    });    

    
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    markers1 = [],
	    markers2 = [],
	    markers3 = [],
	    markers4 = [],
	    markers5 = [],
	    markers6 = [],
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	 


	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
		//console.log("이벤트 핸들러 등록: "+type);
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
//	     커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	    //ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	    	console.log("장소검색 성공");
	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
	    	console.log("장소검색 실패");
	    } else if (status === daum.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	    	console.log("장소검색 에러");
	    }
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');
	    
	    if(order == 0){
	    	for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                daum.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
		    }
	    }
	    
	    if(order == 1){
		    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker1 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker1, place) {
	                daum.maps.event.addListener(marker1, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker1, places[i]);
		    }
	    }
	    
	    if(order == 2){
		    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker2 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker2, place) {
	                daum.maps.event.addListener(marker2, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker2, places[i]);
		    }
	    }
	    
	    if(order == 3){
		    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker3 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker3, place) {
	                daum.maps.event.addListener(marker3, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker3, places[i]);
		    }
	    }
	    
	    if(order == 4){
		    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker4 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker4, place) {
	                daum.maps.event.addListener(marker4, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker4, places[i]);
		    }
	    }
	    
	    if(order == 5){
		    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker5 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);
	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker5, place) {
	                daum.maps.event.addListener(marker5, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker5, places[i]);
		    }
	    }
	    
	    if(order == 6){
	    	console.log("order6");
		    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker6 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

		    	//console.log("marker6: " + marker6);
	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker6, place) {
	                daum.maps.event.addListener(marker6, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker6, places[i]);
		    }
	    }
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
		if(order == 0){
			var imageSrc = '../kanu/images/mart_color.png',
	        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
		    return marker;
		}
		if(order == 1){
			var imageSrc = '../kanu/images/kindergarten_color.png',
	        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker1 = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
		    marker1.setMap(map); // 지도 위에 마커를 표출합니다
		    markers1.push(marker1);  // 배열에 생성된 마커를 추가합니다
	
		    return marker1;
		}
		if(order == 2){
			var imageSrc = '../kanu/images/school_color.png',
	        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker2 = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
		    marker2.setMap(map); // 지도 위에 마커를 표출합니다
		    markers2.push(marker2);  // 배열에 생성된 마커를 추가합니다
	
		    return marker2;
		}
		if(order == 3){
			var imageSrc = '../kanu/images/hospital_color.png',
	        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker3 = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
		    marker3.setMap(map); // 지도 위에 마커를 표출합니다
		    markers3.push(marker3);  // 배열에 생성된 마커를 추가합니다
	
		    return marker3;
		}
		if(order == 4){
			var imageSrc = '../kanu/images/cafe_color.png',
	        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker4 = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
		    marker4.setMap(map); // 지도 위에 마커를 표출합니다
		    markers4.push(marker4);  // 배열에 생성된 마커를 추가합니다
	
		    return marker4;
		}
		if(order == 5){
		    var imageSrc = '../kanu/images/store_color.png',
		        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker5 = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
	
		    marker5.setMap(map); // 지도 위에 마커를 표출합니다
		    markers5.push(marker5);  // 배열에 생성된 마커를 추가합니다
	
		    return marker5;
		}
		if(order == 6){
			 var imageSrc = '../kanu/images/subway_color.png',
		        imageSize = new daum.maps.Size(32, 36),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(32, 36), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(7, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker6 = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
	
		    marker6.setMap(map); // 지도 위에 마커를 표출합니다
		    markers6.push(marker6);  // 배열에 생성된 마커를 추가합니다
		    //console.log("markers6:"+markers6.length);
		    return marker6;
		}
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker(id) {
		if(id === 'MT1'){
		    for ( var i = 0; i < markers.length; i++ ) {
		         markers[i].setMap(null);
		    }   
		    markers = [];
		}
		if(id === 'PS3'){
		    for ( var i = 0; i < markers1.length; i++ ) {
		         markers1[i].setMap(null);
		    }   
		    markers1 = [];
		}
		if(id === 'SC4'){
		    for ( var i = 0; i < markers2.length; i++ ) {
		         markers2[i].setMap(null);
		    }   
		    markers2 = [];
		}
		if(id === 'HP8'){
		    for ( var i = 0; i < markers3.length; i++ ) {
		         markers3[i].setMap(null);
		    }
		    markers3 = [];
		}
		if(id === 'CE7'){
		    for ( var i = 0; i < markers4.length; i++ ) {
		         markers4[i].setMap(null);
		    }   
		    markers4 = [];
		}
		if(id === 'CS2'){
		    for ( var i = 0; i < markers5.length; i++ ) {
		         markers5[i].setMap(null);
		    }   
		    markers5 = [];
		}
		if(id === 'SW8'){
		    for ( var i = 0; i < markers6.length; i++ ) {
		    	markers6[i].setMap(null);
		    	//console.log("마커6지우기"+markers6.length);
		    }   
		    markers6 = [];
		}
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
		var id = this.id,
	        className = this.className;
	    //placeOverlay.setMap(null);
	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass(this);
		    removeMarker(id);
	    } else {
	        currCategory = id;
	        
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}

	/////////// 크게 의미없음 이미지 클릭 스타일 적용 하는 함수
	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    if(el.className === 'on'){
	    	console.log("el 클래스네임 on일때: "+el.className);
	    	el.className = '';
	    }else{
	    	console.log("el 클래스네임 없을때: "+el.className);
	    	el.className = 'on';
	    }
	}
	
	///////////////////////////////////////////////////////////
	/////////////////////  옵    션   /////////////////////////////
	

	
	
	
	
});


	