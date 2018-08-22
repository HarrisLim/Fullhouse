<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="../kanu/main/로고.png">
<link rel="icon" type="image/png" href="../kanu/main/로고.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Favorite : FullHouse</title>
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id" content="69570195917-qamvmgijh74iq624fdgdgcttra3u41fq.apps.googleusercontent.com">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
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
  <script src="../assets/js/core/jquery.min.js"></script>
  <!-- daum map api -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=clusterer,services"></script>


</head>

<body class="">
  <div class="wrapper ">
   <%@ include file="mapTop.jsp" %>

		<div class="third-panel">
	  <!-- 최근 본 방 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="navbar-brand" href="#" style="font-size: 1em" id="recentRoom">최근 본 방</a>
              
            </li>
          </ul>
         </div>
      </nav>
       <!-- 찜한 방 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="navbar-brand" href="#" style="font-size: 1em" id="heartRoom">찜한 방</a>
              
            </li>
          </ul>
         </div>
      </nav>
       <!-- 연락한 방 -->   
<!-- 	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left"> -->
<!--       	<div class="container"> -->
<!--           <ul class="navbar-nav ml-auto align-items-lg-center"> -->
<!--             <li class="nav-item dropdown"> -->
<!--               <a class="navbar-brand" href="#" style="font-size: 1em">연락한 방</a> -->
   
<!--           </ul> -->
<!--          </div> -->
<!--       </nav> -->

    <!-- third-panel -->    
	</div>
	
	<%@ include file="mapView.jsp" %>
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
    <!-- flag = 1 최근 검색 페이지에서 json 처리 위한 구분자 -->
    <input type="hidden" value="1" id="flag" name="flag" />
	<!--  메인판넬    -->    
	  </div> 
  </div>
    
  <!--   Core JS Files   -->
 
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
   <script type="text/javascript" src="../kanu/js/paging.js"></script>  
  <!-- map 스크립트  파일 모음 -->
  <script type="text/javascript" src="../kanu/js/myMap.js"></script>


  <script>
     $(document).ready(function() {
 		//Javascript method's body can be found in assets/js/demos.js
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
