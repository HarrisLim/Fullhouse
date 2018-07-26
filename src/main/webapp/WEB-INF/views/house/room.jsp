<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>매물</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    <link href="../kanu/slidephotos/ninja-slider.css" rel="stylesheet" type="text/css" />
    <script src="../kanu/slidephotos/ninja-slider.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function(){
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

				$("#floatMenu").stop().animate({
					"top" : newPosition
				}, 500);

			}).scroll();
			
			if(${option.getAircon()} == 1){
				var exAricon = document.getElementById('aircon');
				exAricon.src="../kanu/options/aircon_color.png";
			}
			
			if(${option.getWashing()} == 1){
				var exAricon = document.getElementById('washing');
				exAricon.src="../kanu/options/washing_color.png";
			}

			if(${option.getBed()} == 1){
				var exAricon = document.getElementById('bed');
				exAricon.src="../kanu/options/bed_color.png";
			}

			if(${option.getDesk()} == 1){
				var exAricon = document.getElementById('desk');
				exAricon.src="../kanu/options/desk_color.png";
			}

			if(${option.getCloset()} == 1){
				var exAricon = document.getElementById('closet');
				exAricon.src="../kanu/options/closet_color.png";
			}
			if(${option.getTv()} == 1){
				var exAricon = document.getElementById('tv');
				exAricon.src="../kanu/options/tv_color.png";
			}
			if(${option.getShoerack()} == 1){
				var exAricon = document.getElementById('shoerack');
				exAricon.src="../kanu/options/shoerack_color.png";
			}
			if(${option.getFridge()} == 1){
				var exAricon = document.getElementById('fridge');
				exAricon.src="../kanu/options/fridge_color.png";
			}
			if(${option.getGasstove()} == 1){
				var exAricon = document.getElementById('gasstove');
				exAricon.src="../kanu/options/gasstove_color.png";
			}
			if(${option.getInduction()} == 1){
				var exAricon = document.getElementById('induction');
				exAricon.src="../kanu/options/induction_color.png";
			}
			if(${option.getMicrowave()} == 1){
				var exAricon = document.getElementById('microwave');
				exAricon.src="../kanu/options/microwave_color.png";
			}
			if(${option.getDoorlock()} == 1){
				var exAricon = document.getElementById('doorlock');
				exAricon.src="../kanu/options/doorlock_color.png";
			}
			if(${option.getBidet()} == 1){
				var exAricon = document.getElementById('bidet');
				exAricon.src="../kanu/options/bidet_color.png";
			}



		});
		
		$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
		
		
		
		
	
	
	</script>    
    <style>
    	
    	#floatMenu {
			position: absolute;
			width: 220px;
			height: auto;
			right: 40px;
			top: 100px;
			background-color: rgba(200,200,240,0.1);
			color: black;
			text-align:center;
			padding:10px;
			z-index:1;
		}
		

		.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap {position:relative;width:100%;height:350px;}
		#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
		#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
		#category li.on {background: #eee;}
		#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
		#category li:last-child{margin-right:0;border-right:0;}
		#category li span {display: block;margin:0 auto 3px;width:33px;height: 35px;}
/* 		#category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;} */

		#category li .bg_cafe {background:url(../kanu/images/cafe_black.png) no-repeat;}
		#category li .bg_mart {background:url(../kanu/images/mart_black.png) no-repeat;}
		#category li .bg_kindergarten {background:url(../kanu/images/kindergarten_black.png) no-repeat;}
		#category li .bg_school {background:url(../kanu/images/school_black.png) no-repeat;}
		#category li .bg_hospital {background:url(../kanu/images/hospital_black.png) no-repeat;}
		#category li .bg_store {background:url(../kanu/images/store_black.png) no-repeat;}
		#category li .bg_subway {background:url(../kanu/images/subway_black.png) no-repeat;}

		#category li.on .bg_cafe {background:url(../kanu/images/cafe_color.png) no-repeat;}
		#category li.on .bg_mart {background:url(../kanu/images/mart_color.png) no-repeat;}
		#category li.on .bg_kindergarten {background:url(../kanu/images/kindergarten_color.png) no-repeat;}
		#category li.on .bg_school {background:url(../kanu/images/school_color.png) no-repeat;}
		#category li.on .bg_hospital {background:url(../kanu/images/hospital_color.png) no-repeat;}
		#category li.on .bg_store {background:url(../kanu/images/store_color.png) no-repeat;}
		#category li.on .bg_subway {background:url(../kanu/images/subway_color.png) no-repeat;}
		
		
/* 		#category li .bank {background-position: -10px 0;} */
/* 		#category li .mart {background-position: -10px -36px;} */
/* 		#category li .pharmacy {background-position: -10px -72px;} */
/* 		#category li .oil {background-position: -10px -108px;} */
/* 		#category li .cafe {background-position: -10px -144px;} */
/* 		#category li .store {background-position: -10px -180px;} */
/* 		#category li .subway {background-position: -10px -180px;} */
		
		.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
		.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
		.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
		.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
		.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.placeinfo .tel {color:#0f7833;}
		.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

    </style>
  </head>
  <body>
    <%@ include file ="nav.jsp" %>
    <main class="main">
	<div id="floatMenu">
		<br><br> 
   		<strong>오피스텔 월세 1000/70만원</strong><br>
   		[브릿지타워]깔끔한 인테리어<br>
   		경기도 성남시 분당구 삼평동<br>
	    <span style='background-color:rgba(150,150,150,0.3)'>#주차</span>&nbsp;&nbsp;<span style='background-color:rgba(150,150,150,0.3)'>#반려동물</span><br>
	    <hr>
	    <button class='btn btn-outline-tertiary'>찜</button>&nbsp;&nbsp;&nbsp;<button class='btn btn-outline-tertiary'>신고</button>
	    <hr>
	    <strong>리치공인중개사무소</strong><br>
	    대표: 권홍배<br><br>
	    [담당자] 권홍배 대표 (대표공인중개사)<br>
	    서울특별시 강서구 화곡동 773-1, 리치공인중개사사무소<br>
	    대표번호 02-2644-2727<br>
	    중개등록번호<br>92400000-01-05251<br><br>
	    <button class='btn btn-primary' data-toggle="modal" data-target="#requestcalling">연락 요청하기</button>
	</div>
	<div class="modal fade" id="requestcalling" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">연락 요청하기<br>[오피스텔 월세 1000/70만원] (여기 데이터 동적으로 넣어. 현재 보고있는 페이지 )</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<input placeholder="&nbsp;연락처를 남겨주시면, 매물정보 확인 후 연락드립니다." style="width:100%;height:40px">
	        <button type="button" class="btn btn-primary" style="float:right;margin:10px">연락 요청</button>
	      </div>
	    </div>
	  </div>
	</div>
	<section class="slice slice-lg" name="buildinginfo"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">매물</h2>
					<div id="ninja-slider">
				        <div class="slider-inner">
				            <ul>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/a.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/b.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/c.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/d.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/a.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/b.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/c.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/d.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/a.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/b.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/c.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/d.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/a.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/b.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/c.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/d.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/a.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/b.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/c.jpg"></a></li>
				                <li><a class="ns-img" href="../kanu/slidephotos/images/d.jpg"></a></li>
				            </ul>
				        </div>
				    </div>
			       	<div style="margin-top:40px">
					<h2 class="h3 mb-4">매물 정보</h2>
			       		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
			       			<tbody>
			       				<tr>
			       					<td width="25%">
			       						보증금 / 월세 / 매매가
			       					</td>
			       					<td width="25%">
			       						<strong>500/45</strong> 
			       					</td>
			       					<td width="25%">
			       						방 종류
			       					</td>
			       					<td width="25%">
			       						원룸
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						해당 층 / 건물 층
			       					</td>
			       					<td width="25%">
			       						<strong>2층 / 4층</strong> 
			       					</td>
			       					<td width="25%">
			       						전용 / 공급면적
			       					</td>
			       					<td width="25%">
			       						19.8m2 / 19.8m2
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						관리비
			       					</td>
			       					<td width="25%">
			       						<strong>4만원</strong> 
			       					</td>
			       					<td width="25%">
			       						관리비포함항목
			       					</td>
			       					<td width="25%">
			       						기타, 청소비
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						난방 종류
			       					</td>
			       					<td width="25%">
			       						<strong>개별난방</strong> 
			       					</td>
			       					<td width="25%">
			       						입주가능일
			       					</td>
			       					<td width="25%">
			       						즉시 입주 
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						주차
			       					</td>
			       					<td width="25%">
			       						<strong>가능</strong> 
			       					</td>
			       					<td width="25%">
			       						반려동물
			       					</td>
			       					<td width="25%">
			       						가능
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						엘리베이터
			       					</td>
			       					<td width="25%" colspan="3">
			       						<strong>있음</strong> 
			       					</td>
			       				</tr>
			       			</tbody>
			       		</table>
			       		<hr style="margin-top:0px">
			       	</div>
				</div>
			</div>
		</div>
	</section>
	<section class="" name="option"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h3 mb-4">&nbsp;옵션 </h2>
        			<div style="margin:15px">
						<img id="aircon" src="../kanu/options/aircon_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="washing" src="../kanu/options/washing_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="bed" src="../kanu/options/bed_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="desk" src="../kanu/options/desk_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="closet" src="../kanu/options/closet_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="tv" src="../kanu/options/tv_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="shoerack" src="../kanu/options/shoerack_black.png" width="70px">&nbsp;&nbsp;&nbsp;<br/> 
						<img id="fridge" src="../kanu/options/fridge_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="gasstove" src="../kanu/options/gasstove_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="induction" src="../kanu/options/induction_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="microwave" src="../kanu/options/microwave_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="doorlock" src="../kanu/options/doorlock_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						<img id="bidet" src="../kanu/options/bidet_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						
					</div>
			       		<hr style="margin-top:0px">
				</div>
			</div>
		</div>
	</section>
	<section class="" name="detailinfo"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h3 mb-4">상세설명</h2>
					<div style="margin:15px">
						권정열과 윤철종은 처음에 '해령(海靈)'이라는 밴드로 음악활동을 시작했다.<br><br><br>
						 해령은 2004년 쌈지 사운드 페스티벌 숨은 고수에 선정되기도 하였으나 구성원들의 군입대로 해체되었다.<br><br><br>
						 오랜 세월이 지나 두 남자가 다시 음악을 시작하기로 마음먹은 것이 십센치의 시작이다.<br><br><br>
						 2010년 벅스 뮤직어워드 인디 부문에서 2위를 차지했으며[2], '유희열의 라디오 천국' 선정 '올해의 신인', 엠넷아시아뮤직어워드 '올해의 발견' 등에 선정되기도 했다.<br><br><br>
						 2011년 2월 12일 정규앨범 1집 발매 기념 콘서트를 열었다.[3]<br><br><br>
					</div>
			       	<hr>
				</div>
			</div>
		</div>
	</section>
	<section class="" name="detailinfo" style="margin-bottom:70px"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h3 mb-4">위치 및 주변 편의시설</h2>
				
					<div class="map_wrap" style="height:700px">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;margin:15px"></div>
						    <ul id="category">
						        <li id="MT1" data-order="0"> 
						            <span class="bg_mart"></span>
						            마트
						        </li>       
						        <li id="PS3" data-order="1"> 
						            <span class="bg_kindergarten"></span>
						            유치원
						        </li>  
						        <li id="SC4" data-order="2"> 
						            <span class="bg_school"></span>
						            학교
						        </li>  
						        <li id="HP8" data-order="3"> 
						            <span class="bg_hospital"></span>
						            병원
						        </li>  
						        <li id="CE7" data-order="4"> 
						            <span class="bg_cafe"></span>
						            카페
						        </li>  
						        <li id="CS2" data-order="5"> 
						            <span class="bg_store"></span>
						            편의점
						        </li>
  						        <li id="SW8" data-order="6"> 
						            <span class="bg_subway"></span>
						            지하철
						        </li>       
						    </ul>
						</div>

			</div>
		</div>
	</section>
    </main>
    <%@ include file="footer.jsp" %>
    <!-- Core -->
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/popper/popper.min.js"></script>
    <script src="../assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- FontAwesome 5 -->
    <script src="../assets/vendor/fontawesome/js/fontawesome-all.min.js" defer></script>
    <!-- Page plugins -->
    <script src="../assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="../assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
    <script src="../assets/vendor/input-mask/input-mask.min.js"></script>
    <script src="../assets/vendor/nouislider/js/nouislider.min.js"></script>
    <script src="../assets/vendor/textarea-autosize/textarea-autosize.min.js"></script>
    <!-- Theme JS -->
    <script src="../assets/js/theme.js"></script>
    <!-- daum map api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=clusterer,services"></script>
    <!-- 4. Javascript -->
    <script type="text/javascript" src="../kanu/js/room.js"></script>
  </body>
</html>