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
					<h2 class="h3 mb-4">옵션 (아이콘 찾자. 너무 안어울려 지금 ) </h2>
        			<div style="margin:15px">
						<img src="../kanu/images/frown-regular.svg" width="50px">&nbsp;&nbsp;
						<img src="../kanu/images/grin-stars-regular.svg" width="50px"><br> 
						&nbsp;<strong>에어컨</strong>
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
	<section class="" name="detailinfo"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h3 mb-4">위치 및 주변 편의시설</h2>
					<div style="margin:15px">
					  여기에 지도 넣고, 지도 밑에 편의시설 아이콘 넣자. 
					</div>
			       	<hr>
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
  </body>
</html>