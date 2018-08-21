<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
<!--   여기부터     -->
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  
  <link rel="apple-touch-icon" sizes="76x76" href="../kanu/main/로고.png">
  <link rel="icon" type="image/png" href="../kanu/main/로고.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Full House
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<!--   <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css" rel="stylesheet" />
  
  <link href="../assets/css/now-ui-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <!-- daum map api -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=clusterer,services"></script>
  


</head>

<body class="">
  <div class="wrapper ">
   <%@ include file="mapTop.jsp" %>
	
	<div class="third-panel">
	<!-- 	바운스 (지도영역)에서 가지고온 좌표 값 저장 -->
	<input type="hidden" value="" id="center" name="center" />
	<input type="hidden" value="" id="level" name="level" />
	<input type="hidden" value="" id="bounds" name="bounds" />
	<input type="hidden" value="" id="swLatLng" name="swLatLng" />
	<input type="hidden" value="" id="neLatLng" name="neLatLng" />
	<!-- 	바운스 (지도영역)에서 가지고온 좌표 값 에서 위도 경도 분리 저장 -->
	<input type="hidden" value="" id="swLatLng_getLng" name="swLatLng_getLng" />
	<input type="hidden" value="" id="swLatLng_getLat" name="swLatLng_getLat" />
	<input type="hidden" value="" id="neLatLng_getLng" name="neLatLng_getLng" />
	<input type="hidden" value="" id="neLatLng_getLat" name="neLatLng_getLat" />
	<!-- 	클러스터 에서 가지고온 좌표 값 저장 -->
	<input type="hidden" value="" id="east" name="east" />
	<input type="hidden" value="" id="west" name="west" />
	<input type="hidden" value="" id="south" name="south" />
	<input type="hidden" value="" id="north" name="north" />
	<!-- 	추가정보 저장      -->
	<input type="hidden" value="" id="parking" name="parking" />
	<input type="hidden" value="" id="animal" name="animal" />
	<input type="hidden" value="" id="startFloor" name="startFloor" />
	<input type="hidden" value="" id="endFloor" name="endFloor" />
	<input type="hidden" value="" id="startArea" name="startArea" />
	<input type="hidden" value="" id="endArea" name="endArea" />
	<!--  세션 정보 저장   -->
	<input type="hidden" value="${sessionScope.mem.mem_phone}" id="phone" />
	<input type="hidden" value="${sessionScope.mem.mem_name}" id="name" />
	<input type="hidden" value="${sessionScope.mem.mem_email}" id="email" />
	<!-- flag = 0 방검색 페이지에서 json 처리 위한 구분자 -->
	<input type="hidden" value="0" id="flag" name="flag" />
	
	  <!-- 매물 종류 드롭 다운 목록 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="kind_of_sale" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="font-size: 1em">매물종류</a>
              <div class="dropdown-menu " aria-labelledby="navbar_1_dropdown_1">
              	<a class="dropdown-header">매물종류</a>
              	<div class="dropdown-divider"></div>
              	<a class="dropdown-item" id="all_rent" href="#">전체</a>
				<a class="dropdown-item" id="month_rent" href="#">월세</a>
                <a class="dropdown-item" id="engage_or_rent" href="#">전세or월세</a>
                <a class="dropdown-item" id="engage" href="#">전세</a>
                <a class="dropdown-item" id="sale" href="#">매매</a>
              </div>
            </li>
          </ul>
         </div>
      </nav>
       <!-- 거래 종류 드롭 다운 목록 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="kind_of_trade" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">거래종류</a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar_1_dropdown_1">
                <a class="dropdown-header">거래종류</a>
              	<div class="dropdown-divider"></div>
                <a class="dropdown-item" id="all" href="#">전체</a>
                <a class="dropdown-item" id="estate_agent" href="#">중개</a>
                <a class="dropdown-item" id="direct_deal" href="#">직거래</a>
              </div>
            </li>
          </ul>
         </div>
      </nav>
       <!-- 방 종류 드롭 다운 목록 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="kind_of_room" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">방 종류</a>
              <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
                <a class="dropdown-header">방 종류</a>
              	<div class="dropdown-divider"></div>
              	<a class="dropdown-item" id="room_count_all" href="#">전체</a>
                <a class="dropdown-item" id="room_count_1" href="#">원룸</a>
                <a class="dropdown-item" id="room_count_15" href="#">1.5룸</a>
                <a class="dropdown-item" id="room_count_2" href="#">투룸</a>
                <a class="dropdown-item" id="room_count_3" href="#">쓰리룸</a>
                <a class="dropdown-item" id="room_count_office" href="#">오피스텔</a>
                <a class="dropdown-item" id="room_count_appart" href="#">아파트</a>
              </div>
            </li>
          </ul>
         </div>
      </nav>
       <!-- 보증금 범위 선택 드롭 다운 목록 -->   
       

	   <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
	        
            <li class="nav-item dropdown" id="drop_deposit_begin" >
              <a class="nav-link dropdown-toggle" href="#" id="deposit" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">보증금</a>
             <ul class="dropdown-menu multi-column columns-2">
              <div class="row">
              	  
	              <input type="text" class="form-control" placeholder="0" id="begin_text" value="0" style="width:80px;hight:15px;margin-left:20px;font-size:0.9em;font-weight: bold;text-align:right;" onkeyup="beginKeyUp()" onkeydown="onlyNumber(this)"/>&nbsp;<span style="margin-top:4px">만 ~</span> &nbsp;
	              <input type="text" class="form-control" placeholder="999999" id="end_text" value="999999" style="width:80px;hight:15px;font-size:0.9em;font-weight: bold;text-align:right;" onkeyup="endKeyUp()" onkeydown="onlyNumber(this)" />&nbsp;<span style="margin-top:4px">만 </span>
	              
               	<div class="col-sm-13" style="margin-left:20px">
 					<ul class="multi-column-dropdown">
 					<li><a class="dropdown-item" id="begin_0" href="#">0 만원</a></li>
	                <li><a class="dropdown-item" id="begin_500" href="#">500 만원</a></li>
	                <li><a class="dropdown-item" id="begin_1000" href="#">1000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_2000" href="#">2000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_3000" href="#">3000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_4000" href="#">4000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_5000" href="#">5000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_6000" href="#">6000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_7000" href="#">7000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_8000" href="#">8000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_9000" href="#">9000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_10000" href="#">10000 만원</a></li>
	                <li><a class="dropdown-item" id="begin_unlimited" href="#">무제한</a></li>
	 			    </ul>
                </div>
           
                <div class="col-sm-13" style="margin-left:25px">
      				<ul class="multi-column-dropdown">
	                <li><a class="dropdown-item" id="end_0" href="##">0 만원</a></li>
	                <li><a class="dropdown-item" id="end_500" href="##">500 만원</a></li>
	                <li><a class="dropdown-item" id="end_1000" href="##">1000 만원</a></li>
	                <li><a class="dropdown-item" id="end_2000" href="##">2000 만원</a></li>
	                <li><a class="dropdown-item" id="end_3000" href="##">3000 만원</a></li>
	                <li><a class="dropdown-item" id="end_4000" href="##">4000 만원</a></li>
	                <li><a class="dropdown-item" id="end_5000" href="##">5000 만원</a></li>
	                <li><a class="dropdown-item" id="end_6000" href="##">6000 만원</a></li>
	                <li><a class="dropdown-item" id="end_7000" href="##">7000 만원</a></li>
	                <li><a class="dropdown-item" id="end_8000" href="##">8000 만원</a></li>
	                <li><a class="dropdown-item" id="end_9000" href="##">9000 만원</a></li>
	                <li><a class="dropdown-item" id="end_10000" href="##">10000 만원</a></li>
	                <li><a class="dropdown-item" id="end_unlimited" href="##">무제한</a></li>
	     			</ul>
	              </div>
	              </div>
	              </ul>
	              </li>
	              </ul>
	       </div>
      </nav>
       <!-- 월세 범위 선택 드롭 다운 목록 -->
       <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
	        
            <li class="nav-item dropdown" id="drop_rent_month" >
              <a class="nav-link dropdown-toggle" href="#" id="rent_month" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">월세</a>
             <ul class="dropdown-menu multi-column columns-2">
              <div class="row">
                  <input type="text" class="form-control" placeholder="0" id="begin_rent_text" value="0" style="width:80px;hight:15px;margin-left:20px;font-size:0.9em;font-weight: bold;text-align:right;" onkeyup="beginRentKeyUp()" onkeydown="onlyNumber(this)"/>&nbsp;<span style="margin-top:4px">만 ~</span> &nbsp;
	              <input type="text" class="form-control" placeholder="99999" id="end_rent_text" value="9999" style="width:80px;hight:15px;font-size:0.9em;font-weight: bold;text-align:right;" onkeyup="endRentKeyUp()" onkeydown="onlyRentNumber(this)" />&nbsp;<span style="margin-top:4px">만 </span>

	              <div class="dropdown-divider"></div>
	           	<div class="col-sm-13" style="margin-left:20px">
 					<ul class="multi-column-dropdown">
 					<li><a class="dropdown-item" id="begin_rent_0" href="#">0 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_10" href="#">10 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_20" href="#">20 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_30" href="#">30 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_40" href="#">40 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_50" href="#">50 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_60" href="#">60 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_70" href="#">70 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_80" href="#">80 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_90" href="#">90 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_100" href="#">100 만원</a></li>
	                <li><a class="dropdown-item" id="begin_rent_unlimited" href="#">무제한</a></li>
	 			    </ul>
                </div>
           
                <div class="col-sm-13" style="margin-left:25px">
      				<ul class="multi-column-dropdown">
  					<li><a class="dropdown-item" id="end_rent_0" href="#">0 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_10" href="#">10 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_20" href="#">20 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_30" href="#">30 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_40" href="#">40 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_50" href="#">50 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_60" href="#">60 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_70" href="#">70 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_80" href="#">80 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_90" href="#">90 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_100" href="#">100 만원</a></li>
	                <li><a class="dropdown-item" id="end_rent_unlimited" href="#">무제한</a></li>
	 			    </ul>
                </div>
	           </div>
	          </ul>
	        </li>
	       </ul>
	     </div>
      </nav>   
		 
       <!-- 추가 옵션 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbar_main_dropdown_6" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">추가옵션</a>
                <ul class="dropdown-menu" id="option_ckeck">
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="parking" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="parking" />&nbsp;주차가능</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="animal" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="animal" />&nbsp;반려동물</a></li>
				  <div class="dropdown-divider"></div>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck1" data-value="under5" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="under5" name="group"/>&nbsp;5평 이하</a></li> 
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck1" data-value="under10" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="under10" name="group"/>&nbsp;5~10평</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck1" data-value="over10" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="over10" name="group"/>&nbsp;10평 이상</a></li>
				  <div class="dropdown-divider"></div>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck2" data-value="groundFloor" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="groundFloor" name="group1"/>&nbsp;반지층</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck2" data-value="BottomFloor" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="BottomFloor" name="group1"/>&nbsp;저층(1~3층)</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck2" data-value="middleFloor" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="middleFloor" name="group1"/>&nbsp;중층(4~6층)</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck2" data-value="heightFloor" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="heightFloor" name="group1"/>&nbsp;고층(7~19층)</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck2" data-value="topFloor" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="topFloor" name="group1"/>&nbsp;초고층(20층 ~)</a></li>
				   <li style="margin-bottom:5px"><a href="#" class="option_ckeck2" data-value="topRoom" tabIndex="-1" style="color:black;font-size:1em;margin:5px;" ><input type="checkbox" class="topRoom" name="group1"/>&nbsp;옥탑</a></li>
				  
				</ul>
            </li>
          </ul>
         </div>
      </nav>
      	

    <!-- third-panel -->    
	</div>
	
	<%@ include file="mapView.jsp" %>
		
	<!--  메인판넬    -->    
	  </div> 
  </div>

     
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/now-ui-dashboard.min.js?v=1.1.0" type="text/javascript"></script>
  <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
      <!-- map 스크립트  파일 모음 -->
    <!-- 4. Javascript -->
  <script type="text/javascript" src="../kanu/js/paging.js"></script>    
  <script src="../kanu/js/map.js"></script>
  

	



  <script>
    $(document).ready(function() {
    	
    	// 여기는 맥에서 지도 맞추려고 해본 것 
    	var x = (window.window.outerWidth - 500)+"px";
		var y = (window.window.outerHeight - 500)+"px";
// 		alert(window.window.outerHeight);
// 		$(".fourth-panel").css("bottom", 0);
// 		$(".fourth-panel").css("width", x);
// 		$(".fourth-panel").css("height", y);
// 		alert(x+ ' (11window.window.outerHeight - 145)+"px"');


      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();
      

      
    });


   
  </script>

</body>
	<style>
	.area {
	    position: absolute;
	    background: rgba(0,0,0,0);
	    border: 1px solid #888;
	    border-radius: 3px;
	    font-size: 12px;
	    top: -5px;
	    left: 15px;
	    padding:2px;
	}
	
	.info {
	    font-size: 12px;
	    padding: 5px;
	}
	.info .title {
	    font-weight: bold;
	}
	</style> 

</html>
