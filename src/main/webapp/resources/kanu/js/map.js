////////////////////////////////  지 도 시 작 ///////////////////////////////////////////////////////////////

	$('document').ready(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.570707, 126.984611), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };

	var map = new daum.maps.Map(mapContainer, mapOption),
	    customOverlay = new daum.maps.CustomOverlay({}),
	    infowindow = new daum.maps.InfoWindow({removable: true});
    
//     var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
//         center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
//         level : 12 // 지도의 확대 레벨 
//     });
    
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
    
    
//    $.get("/station4/chicken.json", function(data) {
//    	var position = JSON.parse(data);
//        var markers = $(position.positions).map(function(i, position) {
//            return new daum.maps.Marker({
//                position : new daum.maps.LatLng(position.lat, position.lng)         	
//            });
//        });
//
//        // 클러스터러에 마커들을 추가합니다
//        clusterer.addMarkers(markers);
//    });
    
 // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();
 
 // 주소로 좌표를 검색합니다
 	
 	$(document).ready(function(){
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
 	});
 
 	var areas = [
 	    {
 	        name : '용산구',
 	        path : [
 	            new daum.maps.LatLng(37.5548768201904, 126.96966524449994),
 	            new daum.maps.LatLng(37.55308718044556, 126.97642899633566),
 	            new daum.maps.LatLng(37.55522076659584, 126.97654602427454),
 	            new daum.maps.LatLng(37.55320655210504, 126.97874667968763),
 	            new daum.maps.LatLng(37.55368689494708, 126.98541456064552),
 	            new daum.maps.LatLng(37.54722934282707, 126.995229135048),
 	            new daum.maps.LatLng(37.549694559809545, 126.99832516302801),
 	            new daum.maps.LatLng(37.550159406110104, 127.00436818301327),
 	            new daum.maps.LatLng(37.54820235864802, 127.0061334023129),
 	            new daum.maps.LatLng(37.546169758665414, 127.00499711608721),
 	            new daum.maps.LatLng(37.54385947805103, 127.00727818360471),
 	            new daum.maps.LatLng(37.54413326436179, 127.00898460651953),
 	            new daum.maps.LatLng(37.539639030116945, 127.00959054834321),
 	            new daum.maps.LatLng(37.537681185520256, 127.01726163044557),
 	            new daum.maps.LatLng(37.53378887274516, 127.01719284893274),
 	            new daum.maps.LatLng(37.52290225898471, 127.00614038053493),
 	            new daum.maps.LatLng(37.51309192794448, 126.99070240960813),
 	            new daum.maps.LatLng(37.50654651085339, 126.98553683648308),
 	            new daum.maps.LatLng(37.50702053393398, 126.97524914998174),
 	            new daum.maps.LatLng(37.51751820477105, 126.94988506562748),
 	            new daum.maps.LatLng(37.52702918583156, 126.94987870367682),
 	            new daum.maps.LatLng(37.534519656862926, 126.94481851935942),
 	            new daum.maps.LatLng(37.537500243531994, 126.95335659960566),
 	            new daum.maps.LatLng(37.54231338779177, 126.95817394011969),
 	            new daum.maps.LatLng(37.54546318600178, 126.95790512689311),
 	            new daum.maps.LatLng(37.548791603525764, 126.96371984820232),
 	            new daum.maps.LatLng(37.55155543391863, 126.96233786542686),
 	            new daum.maps.LatLng(37.5541513366375, 126.9657135934734),
 	            new daum.maps.LatLng(37.55566236579088, 126.9691850696746),
 	            new daum.maps.LatLng(37.5548768201904, 126.96966524449994)
 	        ]
 	    }, {
 	        name : '중구',
 	        path : [
 	            new daum.maps.LatLng(37.544062989758594, 127.00854659142894),
 	            new daum.maps.LatLng(37.54385947805103, 127.00727818360471),
 	            new daum.maps.LatLng(37.546169758665414, 127.00499711608721),
 	            new daum.maps.LatLng(37.54820235864802, 127.0061334023129),
 	            new daum.maps.LatLng(37.550159406110104, 127.00436818301327),
 	            new daum.maps.LatLng(37.549694559809545, 126.99832516302801),
 	            new daum.maps.LatLng(37.54722934282707, 126.995229135048),
 	            new daum.maps.LatLng(37.55368689494708, 126.98541456064552),
 	            new daum.maps.LatLng(37.55320655210504, 126.97874667968763),
 	            new daum.maps.LatLng(37.55522076659584, 126.97654602427454),
 	            new daum.maps.LatLng(37.55308718044556, 126.97642899633566),
 	            new daum.maps.LatLng(37.55487749311664, 126.97240854546743),
 	            new daum.maps.LatLng(37.5548766923893, 126.9691718124876),
 	            new daum.maps.LatLng(37.55566236579088, 126.9691850696746),
 	            new daum.maps.LatLng(37.55155543391863, 126.96233786542686),
 	            new daum.maps.LatLng(37.55498984534305, 126.96173858545431),
 	            new daum.maps.LatLng(37.55695455613004, 126.96343068837372),
 	            new daum.maps.LatLng(37.5590262922649, 126.9616731414449),
 	            new daum.maps.LatLng(37.56197662569172, 126.96946316364357),
 	            new daum.maps.LatLng(37.56582132960869, 126.96669525397355),
 	            new daum.maps.LatLng(37.56824746386509, 126.96909838710842),
 	            new daum.maps.LatLng(37.569485309984174, 126.97637402412326),
 	            new daum.maps.LatLng(37.56810323716611, 126.98905202099309),
 	            new daum.maps.LatLng(37.56961739576364, 127.00225936812329),
 	            new daum.maps.LatLng(37.56966688588187, 127.0152677241078),
 	            new daum.maps.LatLng(37.572022763755164, 127.0223363152772),
 	            new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
 	            new daum.maps.LatLng(37.56973041414113, 127.0234585247501),
 	            new daum.maps.LatLng(37.565200182350495, 127.02358387477513),
 	            new daum.maps.LatLng(37.56505173515675, 127.02678930885806),
 	            new daum.maps.LatLng(37.563390358462826, 127.02652159646888),
 	            new daum.maps.LatLng(37.5607276739534, 127.02339232029838),
 	            new daum.maps.LatLng(37.55779412537163, 127.0228934248264),
 	            new daum.maps.LatLng(37.556850715898484, 127.01807638779917),
 	            new daum.maps.LatLng(37.55264513061776, 127.01620129137214),
 	            new daum.maps.LatLng(37.547466935106435, 127.00931996404753),
 	            new daum.maps.LatLng(37.54502351209897, 127.00815187343248),
 	            new daum.maps.LatLng(37.544062989758594, 127.00854659142894)
 	        ]
 	    }, {
 	        name : '종로구',
 	        path : [
 	            new daum.maps.LatLng(37.631840777111364, 126.9749313865046),
 	            new daum.maps.LatLng(37.632194205253654, 126.97609588529602),
 	            new daum.maps.LatLng(37.629026103322374, 126.97496405167149),
 	            new daum.maps.LatLng(37.6285585388996, 126.97992605309885),
 	            new daum.maps.LatLng(37.626378096236195, 126.97960492198952),
 	            new daum.maps.LatLng(37.6211493968146, 126.98365245774505),
 	            new daum.maps.LatLng(37.6177725051378, 126.9837302191854),
 	            new daum.maps.LatLng(37.613985109550605, 126.98658977758268),
 	            new daum.maps.LatLng(37.611364924201304, 126.98565700183143),
 	            new daum.maps.LatLng(37.60401657024552, 126.98665951539246),
 	            new daum.maps.LatLng(37.60099164566844, 126.97852019816328),
 	            new daum.maps.LatLng(37.59790270809407, 126.97672287261275),
 	            new daum.maps.LatLng(37.59447673441787, 126.98544283754865),
 	            new daum.maps.LatLng(37.59126960661375, 126.98919808879788),
 	            new daum.maps.LatLng(37.592300831997434, 127.0009511248032),
 	            new daum.maps.LatLng(37.58922302426079, 127.00228260552726),
 	            new daum.maps.LatLng(37.586091007146834, 127.00667090686603),
 	            new daum.maps.LatLng(37.58235007703611, 127.00677925856456),
 	            new daum.maps.LatLng(37.58047228501006, 127.00863575242668),
 	            new daum.maps.LatLng(37.58025588757531, 127.01058748333907),
 	            new daum.maps.LatLng(37.582338528091164, 127.01483104096094),
 	            new daum.maps.LatLng(37.581693162424465, 127.01673289259993),
 	            new daum.maps.LatLng(37.57758802896556, 127.01812215416163),
 	            new daum.maps.LatLng(37.5788668917658, 127.02140099081309),
 	            new daum.maps.LatLng(37.578034045208426, 127.02313962015988),
 	            new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
 	            new daum.maps.LatLng(37.56966688588187, 127.0152677241078),
 	            new daum.maps.LatLng(37.56961739576364, 127.00225936812329),
 	            new daum.maps.LatLng(37.5681357695346, 126.99014772014593),
 	            new daum.maps.LatLng(37.569315246023024, 126.9732046364419),
 	            new daum.maps.LatLng(37.56824746386509, 126.96909838710842),
 	            new daum.maps.LatLng(37.56582132960869, 126.96669525397355),
 	            new daum.maps.LatLng(37.57874076105342, 126.95354824618335),
 	            new daum.maps.LatLng(37.581020184166476, 126.95812059678624),
 	            new daum.maps.LatLng(37.59354736740056, 126.95750665936443),
 	            new daum.maps.LatLng(37.595061575856455, 126.9590412421402),
 	            new daum.maps.LatLng(37.59833350100327, 126.9576941779143),
 	            new daum.maps.LatLng(37.59875701675023, 126.95306020161668),
 	            new daum.maps.LatLng(37.602476031211225, 126.95237386792348),
 	            new daum.maps.LatLng(37.60507154496655, 126.95404376087069),
 	            new daum.maps.LatLng(37.60912809443569, 126.95032198271032),
 	            new daum.maps.LatLng(37.615539700280216, 126.95072546923387),
 	            new daum.maps.LatLng(37.62433621196653, 126.94900237336302),
 	            new daum.maps.LatLng(37.62642708817027, 126.95037844036497),
 	            new daum.maps.LatLng(37.629590994617104, 126.95881385457929),
 	            new daum.maps.LatLng(37.629794440379136, 126.96376660599225),
 	            new daum.maps.LatLng(37.632373740990175, 126.97302793692637),
 	            new daum.maps.LatLng(37.631840777111364, 126.9749313865046)
 	        ]
 	    }, {
 	        name : '서대문구',
 	        path : [
 	            new daum.maps.LatLng(37.59851932019209, 126.95347706883003),
 	            new daum.maps.LatLng(37.5992407011344, 126.95499403097206),
 	            new daum.maps.LatLng(37.59833350100327, 126.9576941779143),
 	            new daum.maps.LatLng(37.595061575856455, 126.9590412421402),
 	            new daum.maps.LatLng(37.59354736740056, 126.95750665936443),
 	            new daum.maps.LatLng(37.581020184166476, 126.95812059678624),
 	            new daum.maps.LatLng(37.57874076105342, 126.95354824618335),
 	            new daum.maps.LatLng(37.56197662569172, 126.96946316364357),
 	            new daum.maps.LatLng(37.5575156365052, 126.95991288916548),
 	            new daum.maps.LatLng(37.55654562007193, 126.9413708153468),
 	            new daum.maps.LatLng(37.555098093384, 126.93685861757348),
 	            new daum.maps.LatLng(37.55884751347576, 126.92659242918415),
 	            new daum.maps.LatLng(37.5633319104926, 126.92828128083327),
 	            new daum.maps.LatLng(37.56510367293256, 126.92601582346325),
 	            new daum.maps.LatLng(37.57082994377989, 126.9098094620638),
 	            new daum.maps.LatLng(37.57599550420081, 126.902091747923),
 	            new daum.maps.LatLng(37.587223103650295, 126.91284666446226),
 	            new daum.maps.LatLng(37.58541570520177, 126.91531241017965),
 	            new daum.maps.LatLng(37.585870567159255, 126.91638068573187),
 	            new daum.maps.LatLng(37.583095195853055, 126.9159399866114),
 	            new daum.maps.LatLng(37.583459593417196, 126.92175886498167),
 	            new daum.maps.LatLng(37.587104600730505, 126.92388813813815),
 	            new daum.maps.LatLng(37.588386594820484, 126.92800815682232),
 	            new daum.maps.LatLng(37.59157595859555, 126.92776504133688),
 	            new daum.maps.LatLng(37.59455434247408, 126.93027139545339),
 	            new daum.maps.LatLng(37.59869748704149, 126.94088480070904),
 	            new daum.maps.LatLng(37.60065830191363, 126.9414041615336),
 	            new daum.maps.LatLng(37.60305781086164, 126.93995273804141),
 	            new daum.maps.LatLng(37.610598531321436, 126.95037536795142),
 	            new daum.maps.LatLng(37.6083605525023, 126.95056259057313),
 	            new daum.maps.LatLng(37.60507154496655, 126.95404376087069),
 	            new daum.maps.LatLng(37.602476031211225, 126.95237386792348),
 	            new daum.maps.LatLng(37.59851932019209, 126.95347706883003)
 	        ]
 	    }, {
 	        name : '동대문구',
 	        path : [
 	            new daum.maps.LatLng(37.607062869017085, 127.07111288773496),
 	            new daum.maps.LatLng(37.60107201319839, 127.07287376670605),
 	            new daum.maps.LatLng(37.59724304056685, 127.06949105186925),
 	            new daum.maps.LatLng(37.58953367466315, 127.07030363208528),
 	            new daum.maps.LatLng(37.58651213184981, 127.07264218709383),
 	            new daum.maps.LatLng(37.5849555116177, 127.07216063016078),
 	            new daum.maps.LatLng(37.58026781100598, 127.07619547037923),
 	            new daum.maps.LatLng(37.571869232268774, 127.0782018408153),
 	            new daum.maps.LatLng(37.559961773835425, 127.07239004251258),
 	            new daum.maps.LatLng(37.56231553903832, 127.05876047165025),
 	            new daum.maps.LatLng(37.57038253579033, 127.04794980454399),
 	            new daum.maps.LatLng(37.572878529071055, 127.04263554582458),
 	            new daum.maps.LatLng(37.57302061077518, 127.0381755492195),
 	            new daum.maps.LatLng(37.56978273516453, 127.03099733100001),
 	            new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
 	            new daum.maps.LatLng(37.57838361223621, 127.0232348231103),
 	            new daum.maps.LatLng(37.58268174514337, 127.02953994610249),
 	            new daum.maps.LatLng(37.58894739851823, 127.03553876830637),
 	            new daum.maps.LatLng(37.5911852565689, 127.03621919708065),
 	            new daum.maps.LatLng(37.59126734230753, 127.03875553445558),
 	            new daum.maps.LatLng(37.5956815721534, 127.04062845365279),
 	            new daum.maps.LatLng(37.5969637344377, 127.04302522879048),
 	            new daum.maps.LatLng(37.59617641777492, 127.04734129391157),
 	            new daum.maps.LatLng(37.60117358544485, 127.05101351973708),
 	            new daum.maps.LatLng(37.600149587503246, 127.05209540476308),
 	            new daum.maps.LatLng(37.60132672748398, 127.05508130598699),
 	            new daum.maps.LatLng(37.6010580545608, 127.05917142337097),
 	            new daum.maps.LatLng(37.605121767227374, 127.06219611364686),
 	            new daum.maps.LatLng(37.607062869017085, 127.07111288773496)
 	        ]
 	    }, {
 	        name : '성북구',
 	        path : [
 	            new daum.maps.LatLng(37.63654916557213, 126.98446028560235),
 	            new daum.maps.LatLng(37.631446839436855, 126.99372381657889),
 	            new daum.maps.LatLng(37.626192451322005, 126.99927047335905),
 	            new daum.maps.LatLng(37.62382095469671, 127.00488450145781),
 	            new daum.maps.LatLng(37.624026217174986, 127.00788862747375),
 	            new daum.maps.LatLng(37.6205124078061, 127.00724034082933),
 	            new daum.maps.LatLng(37.61679651952433, 127.01014412786792),
 	            new daum.maps.LatLng(37.61472018601129, 127.01451127202589),
 	            new daum.maps.LatLng(37.614629670135216, 127.01757841621624),
 	            new daum.maps.LatLng(37.61137091590441, 127.02219857751122),
 	            new daum.maps.LatLng(37.612692696824915, 127.02642583551054),
 	            new daum.maps.LatLng(37.612367438936786, 127.03018593770908),
 	            new daum.maps.LatLng(37.60896889076571, 127.0302525167858),
 	            new daum.maps.LatLng(37.61279787695882, 127.03730791358603),
 	            new daum.maps.LatLng(37.62426467261789, 127.04973339977498),
 	            new daum.maps.LatLng(37.61449950127667, 127.06174181124696),
 	            new daum.maps.LatLng(37.61561580859776, 127.06985247014711),
 	            new daum.maps.LatLng(37.61351359068103, 127.07170798866412),
 	            new daum.maps.LatLng(37.60762512162974, 127.07105453180604),
 	            new daum.maps.LatLng(37.605121767227374, 127.06219611364686),
 	            new daum.maps.LatLng(37.6010580545608, 127.05917142337097),
 	            new daum.maps.LatLng(37.60132672748398, 127.05508130598699),
 	            new daum.maps.LatLng(37.600149587503246, 127.05209540476308),
 	            new daum.maps.LatLng(37.60117358544485, 127.05101351973708),
 	            new daum.maps.LatLng(37.59617641777492, 127.04734129391157),
 	            new daum.maps.LatLng(37.59644879095525, 127.04184728392097),
 	            new daum.maps.LatLng(37.59126734230753, 127.03875553445558),
 	            new daum.maps.LatLng(37.5911852565689, 127.03621919708065),
 	            new daum.maps.LatLng(37.58894739851823, 127.03553876830637),
 	            new daum.maps.LatLng(37.58268174514337, 127.02953994610249),
 	            new daum.maps.LatLng(37.57782865303167, 127.02296295333255),
 	            new daum.maps.LatLng(37.57889204835333, 127.02179043639809),
 	            new daum.maps.LatLng(37.57758802896556, 127.01812215416163),
 	            new daum.maps.LatLng(37.581693162424465, 127.01673289259993),
 	            new daum.maps.LatLng(37.582338528091164, 127.01483104096094),
 	            new daum.maps.LatLng(37.58025588757531, 127.01058748333907),
 	            new daum.maps.LatLng(37.58047228501006, 127.00863575242668),
 	            new daum.maps.LatLng(37.58235007703611, 127.00677925856456),
 	            new daum.maps.LatLng(37.586091007146834, 127.00667090686603),
 	            new daum.maps.LatLng(37.58922302426079, 127.00228260552726),
 	            new daum.maps.LatLng(37.592300831997434, 127.0009511248032),
 	            new daum.maps.LatLng(37.59126960661375, 126.98919808879788),
 	            new daum.maps.LatLng(37.59447673441787, 126.98544283754865),
 	            new daum.maps.LatLng(37.59790270809407, 126.97672287261275),
 	            new daum.maps.LatLng(37.60099164566844, 126.97852019816328),
 	            new daum.maps.LatLng(37.60451393107786, 126.98678626394351),
 	            new daum.maps.LatLng(37.611364924201304, 126.98565700183143),
 	            new daum.maps.LatLng(37.613985109550605, 126.98658977758268),
 	            new daum.maps.LatLng(37.6177725051378, 126.9837302191854),
 	            new daum.maps.LatLng(37.6211493968146, 126.98365245774505),
 	            new daum.maps.LatLng(37.626378096236195, 126.97960492198952),
 	            new daum.maps.LatLng(37.6285585388996, 126.97992605309885),
 	            new daum.maps.LatLng(37.62980449548538, 126.97468284124939),
 	            new daum.maps.LatLng(37.633657663246694, 126.97740053878216),
 	            new daum.maps.LatLng(37.63476479485093, 126.98154674721893),
 	            new daum.maps.LatLng(37.63780700422825, 126.9849494717052),
 	            new daum.maps.LatLng(37.63654916557213, 126.98446028560235)
 	        ]
 	    }, {
 	        name : '성동구',
 	        path : [
 	            new daum.maps.LatLng(37.57275246810175, 127.04241813085706),
 	            new daum.maps.LatLng(37.57038253579033, 127.04794980454399),
 	            new daum.maps.LatLng(37.56231553903832, 127.05876047165025),
 	            new daum.maps.LatLng(37.5594131360664, 127.07373408220053),
 	            new daum.maps.LatLng(37.52832388381049, 127.05621773388143),
 	            new daum.maps.LatLng(37.53423885672233, 127.04604398310076),
 	            new daum.maps.LatLng(37.53582328355087, 127.03979942567628),
 	            new daum.maps.LatLng(37.53581367627865, 127.0211714455564),
 	            new daum.maps.LatLng(37.53378887274516, 127.01719284893274),
 	            new daum.maps.LatLng(37.537681185520256, 127.01726163044557),
 	            new daum.maps.LatLng(37.53938672166098, 127.00993448922989),
 	            new daum.maps.LatLng(37.54157804358092, 127.00879872996808),
 	            new daum.maps.LatLng(37.54502351209897, 127.00815187343248),
 	            new daum.maps.LatLng(37.547466935106435, 127.00931996404753),
 	            new daum.maps.LatLng(37.55264513061776, 127.01620129137214),
 	            new daum.maps.LatLng(37.556850715898484, 127.01807638779917),
 	            new daum.maps.LatLng(37.55779412537163, 127.0228934248264),
 	            new daum.maps.LatLng(37.5607276739534, 127.02339232029838),
 	            new daum.maps.LatLng(37.563390358462826, 127.02652159646888),
 	            new daum.maps.LatLng(37.56505173515675, 127.02678930885806),
 	            new daum.maps.LatLng(37.565200182350495, 127.02358387477513),
 	            new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
 	            new daum.maps.LatLng(37.56978273516453, 127.03099733100001),
 	            new daum.maps.LatLng(37.57302061077518, 127.0381755492195),
 	            new daum.maps.LatLng(37.57275246810175, 127.04241813085706)
 	        ]
 	    }, {
 	        name : '마포구',
 	        path : [
 	            new daum.maps.LatLng(37.584651324803644, 126.88883849288884),
 	            new daum.maps.LatLng(37.57082994377989, 126.9098094620638),
 	            new daum.maps.LatLng(37.56510367293256, 126.92601582346325),
 	            new daum.maps.LatLng(37.5633319104926, 126.92828128083327),
 	            new daum.maps.LatLng(37.55884751347576, 126.92659242918415),
 	            new daum.maps.LatLng(37.55675317809392, 126.93190919632814),
 	            new daum.maps.LatLng(37.555098093384, 126.93685861757348),
 	            new daum.maps.LatLng(37.55654562007193, 126.9413708153468),
 	            new daum.maps.LatLng(37.557241466445234, 126.95913438471307),
 	            new daum.maps.LatLng(37.55908394430372, 126.96163689468189),
 	            new daum.maps.LatLng(37.55820141918588, 126.96305432966605),
 	            new daum.maps.LatLng(37.554784413504734, 126.9617251098019),
 	            new daum.maps.LatLng(37.548791603525764, 126.96371984820232),
 	            new daum.maps.LatLng(37.54546318600178, 126.95790512689311),
 	            new daum.maps.LatLng(37.54231338779177, 126.95817394011969),
 	            new daum.maps.LatLng(37.539468942052544, 126.955731506394),
 	            new daum.maps.LatLng(37.536292068277106, 126.95128907260018),
 	            new daum.maps.LatLng(37.53569162926515, 126.94627494388307),
 	            new daum.maps.LatLng(37.53377712226906, 126.94458373402794),
 	            new daum.maps.LatLng(37.54135238063506, 126.93031191951576),
 	            new daum.maps.LatLng(37.539036674424615, 126.9271006565075),
 	            new daum.maps.LatLng(37.54143034750605, 126.9224138272872),
 	            new daum.maps.LatLng(37.54141748538761, 126.90483000187002),
 	            new daum.maps.LatLng(37.548015078285694, 126.89890097452322),
 	            new daum.maps.LatLng(37.56300401736817, 126.86623824787709),
 	            new daum.maps.LatLng(37.57178997971358, 126.85363039091744),
 	            new daum.maps.LatLng(37.57379738998644, 126.85362646212587),
 	            new daum.maps.LatLng(37.57747251471329, 126.864939928088),
 	            new daum.maps.LatLng(37.5781913017327, 126.87625939970273),
 	            new daum.maps.LatLng(37.57977132158497, 126.87767870371688),
 	            new daum.maps.LatLng(37.584440882833654, 126.87653889183002),
 	            new daum.maps.LatLng(37.59079311146897, 126.88205386700724),
 	            new daum.maps.LatLng(37.584651324803644, 126.88883849288884)
 	        ]
 	    }
 	];


 	// 지도에 영역데이터를 폴리곤으로 표시합니다 
 	for (var i = 0, len = areas.length; i < len; i++) {
 	    displayArea(areas[i]);
 	}

 	// 다각형을 생상하고 이벤트를 등록하는 함수입니다
 	function displayArea(area) {

 	    // 다각형을 생성합니다 
 	    var polygon = new daum.maps.Polygon({
 	        map: map, // 다각형을 표시할 지도 객체
 	        path: area.path,
 	        strokeWeight: 2,
 	        strokeColor: 'rgba(0,0,0,0)',
 	        strokeOpacity: 0.8,
 	        fillColor: 'rgba(0,0,0,0)',
 	        fillOpacity: 0.7 
 	    });

 	    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
 	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
 	    daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
 	        polygon.setOptions({fillColor: '#09f'});

 	        customOverlay.setContent('<div class="area">' + area.name + '</div>');
 	        
 	        customOverlay.setPosition(mouseEvent.latLng); 
 	        customOverlay.setMap(map);
 	    });

 	    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
 	    daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
 	        
 	        customOverlay.setPosition(mouseEvent.latLng); 
 	    });

 	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
 	    // 커스텀 오버레이를 지도에서 제거합니다 
 	    daum.maps.event.addListener(polygon, 'mouseout', function() {
 	        polygon.setOptions({fillColor: 'rgba(0,0,0,0)'});
 	        customOverlay.setMap(null);
 	    }); 

 	    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
 	    daum.maps.event.addListener(polygon, 'click', function(mouseEvent) {
 	        var content = '<div class="info">' + 
 	                    '   <div class="title">' + area.name + '</div>' +
 	                    '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>' +
 	                    '</div>';

 	        infowindow.setContent(content); 
 	        infowindow.setPosition(mouseEvent.latLng); 
 	        infowindow.setMap(map);
 	    });
 	}
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
	
    