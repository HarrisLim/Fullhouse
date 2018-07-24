<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Full House
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css" rel="stylesheet" />
  
  <link href="../assets/css/now-ui-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <!-- daum map api -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=clusterer,services"></script>
  <!-- 4. Javascript -->
  <script type="text/javascript" src="../kanu/js/paging.js"></script>

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
              <a class="navbar-brand" href="#" style="font-size: 1em">최근 본 방</a>
              
            </li>
          </ul>
         </div>
      </nav>
       <!-- 찜한 방 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="navbar-brand" href="#" style="font-size: 1em">찜한 방</a>
              
            </li>
          </ul>
         </div>
      </nav>
       <!-- 연락한 방 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="navbar-brand" href="#" style="font-size: 1em">연락한 방</a>
   
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
  <script src="../kanu/js/map.js"></script>



  <script>
    $(document).ready(function() {
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