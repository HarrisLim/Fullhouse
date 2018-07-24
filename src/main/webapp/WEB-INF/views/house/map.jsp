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
    <div class="sidebar" data-color="blue"  style="width:480px;height:calc(100% - 150px);right:0;">
<!--      
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
        	  〉
        </a>
        <a href="#" class="simple-text logo-normal">
                 검색 결과 0 개
        </a>
      </div>
		<!--       슬라이드바 상단 -->
      <div class="sidebar-wrapper" style="height:100%;">
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>주소</th>
				<th>위도</th>
				<th>경도</th>
				<th>날짜</th>
			</tr>
      	<c:forEach var="dto" items="${list}">
      		<tr>
      			<td>${dto.build_no}</td>
      			<td>${dto.address}</td>
      			<td>${dto.lat}</td>
      			<td>${dto.lng}</td>
				<td>${dto.bu_rdate}</td>      	
      		</tr>
      	</c:forEach>
      	</table>
   
         
      </div>
<!--       <div style="height:50px;background-color:red;" ><a class="simple-text logo-normal" style="color:black">dd</a></div> -->
		<div id="page" style="height:150px;width:100%;background-color:red;">  
      		<!-- 5. paging view -->
			<ul class="pagination">
				<c:if test="${page.pageStartNum ne 1}">
					<!--맨 첫페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${page.pageCnt+1},${page.pageCnt});'>&laquo;</a></li>
					<!--이전 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${page.pageStartNum},${page.pageCnt});'>&lsaquo;</a></li>
				</c:if>
			
				<!--페이지번호 -->
				<c:forEach var='i' begin="${page.pageStartNum}" end="${page.pageLastNum}" step="1">
					<li class='pageIndex${i}' ><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
				</c:forEach>
			
				<c:if test="${page.lastChk}">
					<!--다음 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageNext(${page.pageStartNum},${page.total},${page.listCnt},${page.pageCnt});'>&rsaquo;</a></li>
					<!--마지막 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageLast(${page.pageStartNum},${page.total},${page.listCnt},${page.pageCnt});'>&raquo;</a></li>
				</c:if>
			</ul>
			<form action="./mapList.do" method="post" id='frmPaging'>
				<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
			<input type='hidden' name='index' id='index' value='${page.index}'>
			<input type='hidden' name='pageStartNum' id='pageStartNum' value='${page.pageStartNum}'>
			<input type='hidden' name='listCnt' id='listCnt' value='${page.listCnt}'>	
			</form>
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
              	<a class="dropdown-header">매물종류</a>
              	<div class="dropdown-divider"></div>
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
	        
            <li class="nav-item dropdown" id="drop_deposit_begin" >
              <a class="nav-link dropdown-toggle" href="#" id="deposit" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1em">보증금</a>
             <ul class="dropdown-menu multi-column columns-2">
              <div class="row">
              	  
	              <input type="text" class="form-control" placeholder="0만원 부터" id="begin_text" value="" style="width:100px;hight:15px;margin-left:20px;font-size:1em;font-weight: bold;" />&nbsp; ~ &nbsp;
	              <input type="text" class="form-control" placeholder="0만원 까지" id="end_text" value="" style="width:100px;hight:15px;font-size:1em;font-weight: bold;"/>
	              
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
                  <input type="text" class="form-control" placeholder="0만원 부터" id="begin_rent_text" value="" style="width:100px;hight:15px;margin-left:20px;font-size:1em;font-weight: bold;" />&nbsp; ~ &nbsp;
	              <input type="text" class="form-control" placeholder="0만원 까지" id="end_rent_text" value="" style="width:100px;hight:15px;font-size:1em;font-weight: bold;"/>
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
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option1" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;주차가능</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option2" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;반려동물</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option3" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;단기임대</a></li>
				  <div class="dropdown-divider"></div>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option4" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;5평 이하</a></li> 
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option5" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;5~10평</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option6" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;10평 이상</a></li>
				  <div class="dropdown-divider"></div>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option7" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;반지층</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option8" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;저층(1~3층)</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option9" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;중층(4~6층)</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option10" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;고층(7~19층)</a></li>
				  <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option11" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;초고층(20층 ~)</a></li>
				   <li style="margin-bottom:5px"><a href="#" class="option_ckeck" data-value="option12" tabIndex="-1" style="color:black;font-size:1em;margin:5px;"><input type="checkbox"/>&nbsp;옥탑</a></li>
				  
				</ul>
            </li>
          </ul>
         </div>
      </nav>
      	

    <!-- third-panel -->    
	</div>
	<div class="fourth-panel" id="map"></div>
		
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
