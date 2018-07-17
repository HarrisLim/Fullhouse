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
    Now UI Dashboard by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/now-ui-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />

</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="blue"  style="width:480px;right:0">
<!--      
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
          CT
        </a>
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
          Creative Tim
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="./dashboard.html">
              <i class="now-ui-icons design_app"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="./icons.do">
              <i class="now-ui-icons education_atom"></i>
              <p>Icons</p>
            </a>
          </li>
          <li>
            <a href="./map.html">
              <i class="now-ui-icons location_map-big"></i>
              <p>Maps</p>
            </a>
          </li>
          <li>
            <a href="./notifications.do">
              <i class="now-ui-icons ui-1_bell-53"></i>
              <p>Notifications</p>
            </a>
          </li>
          <li>
            <a href="./user.do">
              <i class="now-ui-icons users_single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li>
            <a href="./tables.do">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Table List</p>
            </a>
          </li>
          <li>
            <a href="./typography.do">
              <i class="now-ui-icons text_caps-small"></i>
              <p>Typography</p>
            </a>
          </li>
          <li class="active-pro">
            <a href="./upgrade.do">
              <i class="now-ui-icons arrows-1_cloud-download-93"></i>
              <p>Upgrade to PRO</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    
    <div class="main-panel" style="background-color:navy" >
    
       <!-- Navbar -->
    <div class="sub-panel" >
      <nav class="navbar navbar-expand-lg bg-primary navbar-transparent navbar-absolute" >
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">FullHouse</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
             <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search..." size="50dp">
                  <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
            </form>
            
            <div class="collapse navbar-collapse justify-content-end">
            	<style>
    				#menubar a:hover { font-weight:bold;color:orange; }
				</style>
	            <div id="menubar" class="collapse navbar-collapse justify-content-center">

	            	<div><a class="navbar-brand" href="#pablo" >방검색</a></div>
	            	<div><a class="navbar-brand" href="#pablo">관심목록</a></div>
	            	<div><a class="navbar-brand" href="#pablo">방 등록</a></div>
	            	<div><a class="navbar-brand" href="#pablo">공인중개사 회원가입</a></div>
	            	<div><a class="navbar-brand" href="#pablo">회원가입 및 로그인</a></div>
	            </div>
	            <!--  ul 지구본, 드랍다운 메뉴 등     -->
	         <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons media-2_sound-wave"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons users_single-02"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
              </li>
            </ul>
	          </div>
	        </div>
	      </div>
	    </nav>

	<!-- sub-panel -->  
	</div>
	
	<div class="third-panel">
	  <!-- 매물 종류 드롭 다운 목록 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="kind_of_sale" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="font-size: 1em">매물종류</a>
              <div class="dropdown-menu " aria-labelledby="navbar_1_dropdown_1">
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
              	<a class="dropdown-item" id="room_count_all" href="#">전체</a>
                <a class="dropdown-item" id="room_count_1" href="#">원룸</a>
                <a class="dropdown-item" id="room_count_1.5" href="#">1.5룸</a>
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
            <li class="nav-item dropdown" id="drop_deposit">
              <a class="nav-link dropdown-toggle" href="#" id="deposit" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">보증금</a>
              <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1" style="float:left">
                    <a class="dropdown-item" id="begin_0" href="#">0 만원</a>
	                <a class="dropdown-item" id="begin_500" href="#">500 만원</a>
	                <a class="dropdown-item" id="begin_1000" href="#">1000 만원</a>
	                <a class="dropdown-item" id="begin_2000" href="#">2000 만원</a>
	                <a class="dropdown-item" id="begin_3000" href="#">3000 만원</a>
	                <a class="dropdown-item" id="begin_4000" href="#">4000 만원</a>
	                <a class="dropdown-item" id="begin_5000" href="#">5000 만원</a>
	                <a class="dropdown-item" id="begin_6000" href="#">6000 만원</a>
	                <a class="dropdown-item" id="begin_7000" href="#">7000 만원</a>
	                <a class="dropdown-item" id="begin_8000" href="#">8000 만원</a>
	                <a class="dropdown-item" id="begin_9000" href="#">9000 만원</a>
	                <a class="dropdown-item" id="begin_10000" href="#">10000 만원</a>
	                <a class="dropdown-item" id="begin_unlimited" href="#">무제한</a>
                </div>
                <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1" style="float:left">
	                <a class="dropdown-item" id="end_0" href="#">0 만원</a>
	                <a class="dropdown-item" id="end_500" href="#">500 만원</a>
	                <a class="dropdown-item" id="end_1000" href="#">1000 만원</a>
	                <a class="dropdown-item" id="end_2000" href="#">2000 만원</a>
	                <a class="dropdown-item" id="end_3000" href="#">3000 만원</a>
	                <a class="dropdown-item" id="end_4000" href="#">4000 만원</a>
	                <a class="dropdown-item" id="end_5000" href="#">5000 만원</a>
	                <a class="dropdown-item" id="end_6000" href="#">6000 만원</a>
	                <a class="dropdown-item" id="end_7000" href="#">7000 만원</a>
	                <a class="dropdown-item" id="end_8000" href="#">8000 만원</a>
	                <a class="dropdown-item" id="end_9000" href="#">9000 만원</a>
	                <a class="dropdown-item" id="end_10000" href="#">10000 만원</a>
	                <a class="dropdown-item" id="end_unlimited" href="#">무제한</a>
              </div>
            </li>
          </ul>
         </div>
      </nav>
       <!-- 월세 범위 선택 드롭 다운 목록 -->   
	  <nav class="navbar navbar-expand-lg navbar-transparent" style="float: left">
      	<div class="container">
          <ul class="navbar-nav ml-auto align-items-lg-center" id="drop_rent_month">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="rent_month" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">월세</a>
              <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
	                <a class="dropdown-item" id="end_0" href="#">0 만원</a>
	                <a class="dropdown-item" id="end_500" href="#">500 만원</a>
	                <a class="dropdown-item" id="end_1000" href="#">1000 만원</a>
	                <a class="dropdown-item" id="end_2000" href="#">2000 만원</a>
	                <a class="dropdown-item" id="end_3000" href="#">3000 만원</a>
	                <a class="dropdown-item" id="end_4000" href="#">4000 만원</a>
	                <a class="dropdown-item" id="end_5000" href="#">5000 만원</a>
	                <a class="dropdown-item" id="end_6000" href="#">6000 만원</a>
	                <a class="dropdown-item" id="end_7000" href="#">7000 만원</a>
	                <a class="dropdown-item" id="end_8000" href="#">8000 만원</a>
	                <a class="dropdown-item" id="end_9000" href="#">9000 만원</a>
	                <a class="dropdown-item" id="end_10000" href="#">10000 만원</a>
	                <a class="dropdown-item" id="end_unlimited" href="#">무제한</a>
              </div>
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
              <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
                <a class="dropdown-item" href="../pages/homepage.html">Homepage</a>
                <a class="dropdown-item" href="../pages/about.html">About us</a>
                <a class="dropdown-item" href="../pages/sign-in.html">Sign in</a>
                <a class="dropdown-item" href="../pages/contact.html">Contact</a>
              </div>
            </li>
          </ul>
         </div>
      </nav>


    <!-- third-panel -->    
	</div>	
	<!--  메인판넬    -->    
	  </div> 
  </div>
	            
			



       
      
      
    
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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
	
    $(function() {
        $('#drop_deposit, #drop_rent_month').on({
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
  </script>



</body>

</html>
