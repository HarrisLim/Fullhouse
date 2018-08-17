<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
   		<strong>${dto.proType}</strong> 
   		<c:choose>
   		<c:when test="${dto.buildType eq 1 && list[0].deposit ne 0 && list[0].deposit ne null}">
   			<strong>월세 ${list[0].deposit}/${list[0].monthly}만원</strong><br>
   		</c:when>
   		<c:when test="${dto.buildType eq 2 && list[0].lease ne 0 && list[0].lease ne null}">
   			<strong>전세 ${list[0].lease}만원</strong><br>
   		</c:when>
   		<c:when test="${dto.buildType eq 3 && list[0].salePrice ne 0 && list[0].salePrice ne null}">
   			<strong>매매  ${list[0].salePrice}만원</strong><br>
   		</c:when>
   		<c:when test="${dto.buildType eq 4}">
   			<strong>월세 ${list[0].deposit}/${list[0].monthly}만원 <br> 전세  ${list[0].lease}</strong><br>
   		</c:when>
   		</c:choose>

   		${dto.roomTitle}<br>
   		${dto.address}<br>
   		<c:if test="${addInfo.parking eq 1}">
	    	<span style='background-color:rgba(150,150,150,0.3)'>#주차</span>&nbsp;&nbsp;
	    </c:if>
   		<c:if test="${addInfo.animal eq 1}">
	    	<span style='background-color:rgba(150,150,150,0.3)'>#반려동물</span><br>
	    </c:if>
	    
	    <hr>
	    <div>
		    <div id="heart_div" style="float:left;">
		    <c:if test="${heartCount eq 0 || heartCount eq null}">
		    	<button class='btn btn-outline-tertiary' id="heart" onClick="heart(this)">찜</button>&nbsp;&nbsp;&nbsp;
	    	</c:if>
		    <c:if test="${heartCount >= 1}">
		    	<button class='btn btn-outline-tertiary' id='heart' onClick='heart(this)' style='background-color:red;' disabled>찜 완료</button>&nbsp;&nbsp;&nbsp;
	    	</c:if>
		    </div>
		    <div id="viewCount_div">
		    <c:if test="${countViewCount < 1}">
		    	<button class='btn btn-outline-tertiary' id="viewCount" onClick="viewCount(this)">신고</button>
	    	</c:if>
		    <c:if test="${countViewCount >= 1}">
		    	<button class='btn btn-outline-tertiary' id="viewCount" onClick="viewCount(this)" disabled>신고</button>
	    	</c:if>
		    </div>
		    <div id="message" style="margin-top:15px;font-size:1em;font-weight:bold;color:red;"> </div>
	    </div>
	     
	    <hr>
	   <c:if test="${estateInfo ne null}">
	   	   <strong>${estateInfo.estate_name}</strong><br>
	   				 대표: ${estateInfo.owner_name}<br><br>
	   				[담당자] ${builderInfo.st_name} (${builderInfo.st_position})<br>
	    </c:if>
        <c:if test="${memDTO ne null}">
	    	[담당자] ${memDTO.mem_name} (직거래 매물)<br>
	    </c:if>
	    <c:if test="${estateInfo ne null}">
		    ${estateInfo.estateaddr}, <br>${estateInfo.estate_name}<br>
		    대표번호${builderInfo.st_phone}<br>
		    중개등록번호<br>${estateInfo.erno}<br><br>
	    </c:if>
   	    <c:if test="${memDTO ne null}">
		  이메일  ${memDTO.mem_email}, <br>
		    연락처 ${memDTO.mem_phone}
	    </c:if>
	    <div id="abx">
     	<c:if test="${requestCount >= 1}">
	    	<button class='btn btn-primary' data-toggle="modal" data-target="#requestcalling" disabled>연락 요청완료!!</button>
    	</c:if>
     	<c:if test="${requestCount eq 0 || requestCount eq null}">
	    	<button class='btn btn-primary' data-toggle="modal" data-target="#requestcalling">연락 요청하기</button>
    	</c:if>
	    </div>
	</div>
	<div class="modal fade" id="requestcalling" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">

	        <h5 class="modal-title" id="exampleModalLabel">연락 요청하기<br>[${dto.proType} 월세 ${list[0].deposit}/${list[0].monthly}만원] </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<input value="&nbsp; ${sessionScope.mem.mem_phone}" style="width:100%;height:40px" readOnly id="mem_phone"/>
	        <button type="button" class="btn btn-primary" style="float:right;margin:10px" id="call_back">연락 요청</button>
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
				            	<c:forEach var="i" begin="0" end="${fn:length(picPath)-1}" step="1">
				                	<li><a class="ns-img" href="${picPath[i]}"></a></li>
				                </c:forEach>
				            </ul>
				        </div>
				    </div>
			       	<div style="margin-top:40px">
					<h2 class="h3 mb-4">매물 정보</h2>
			       		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
			       			<tbody>
			       				<tr>

			       					
			       						<c:forEach var="dto" varStatus="loop" items="${list}">
			       						<c:choose>
			       						<c:when test="${dto.deposit ne null && dto.deposit ne 0}">
			       							<tr>
			    	       					<td width="25%" collspan="2" id="build_type${loop.index}">
					       						보증금 / 월세  </td>
					       					<td width="25%">
			       							<strong>${dto.deposit} / ${dto.monthly}</strong>
			       							</td>
			       							</tr>
			       						</c:when>
			       						<c:when test="${dto.lease ne null && dto.lease ne 0 && (dto.monthly eq 0 || dto.monthly eq null)}">
			       							<tr>
					       					<td width="25%" collspan="2" id="build_type${loop.index}">
					       						전세  </td>
					       					<td width="25%">
			       							<strong>${dto.lease}</strong>
			       							</tr>
			       						</c:when>
			       						<c:when test="${dto.salePrice ne null && dto.salePrice ne 0}">
			       							<tr>
					       					<td width="25%" collspan="2" id="build_type${loop.index}">
					       						매매  </td>
					       					<td width="25%">
			       							<strong>${dto.salePrice}</strong>
			       							</tr>
			       						</c:when>
		       						</c:choose>
		       						</c:forEach> 
			       					</td>
       							</tr>
			       					<tr>
			       					<td width="25%">
			       						방 종류
			       					</td>
			       					
	       					   		<c:choose>
								   		<c:when test="${dto.buildType eq 1}">
								   			<td width="25%">월세</td>
							   			</c:when>
								   		<c:when test="${dto.buildType eq 2}">
								   			<td width="25%">전세</td>
								   		</c:when>
								   		<c:when test="${dto.buildType eq 3}">
								   			<td width="25%">매매</td>
								   		</c:when>
								   		<c:when test="${dto.buildType eq 4}">
								   			<td width="25%">월세or전세</td>
								   		</c:when>
   									</c:choose>

			       					</tr>
			       		
			       				<tr>
			       					<td width="25%">
			       						해당 층 / 건물 층
			       					</td>
			       					<td width="25%">
			       						<strong>${dto.floor}층 / ${dto.wholeFloor}층</strong> 
			       					</td>
			       					<td width="25%">
			       						전용 / 공급면적
			       					</td>
			       					<td width="25%">
			       						<strong>${dto.jArea}m2 / ${dto.gArea}m2</strong>
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						관리비
			       					</td>
			       					<td width="25%">
			       						<strong>${addInfo.costFee}원</strong> 
			       					</td>
			       					<td width="25%">
			       						관리비포함항목
			       					</td>
			       					<td width="25%">
			       						<strong>
											${costList}
			       						</strong> 
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						난방 종류
			       					</td>
			       					<td width="25%">
			       						<strong>
			       						<c:choose>
			       							<c:when test="${addInfo.heat eq 1}">
			       								개별 난방
			       							</c:when>
			       							<c:when test="${addInfo.heat eq 0}">
			       								중앙 난방
			       							</c:when>
			       						</c:choose>
			       						</strong> 
			       					</td>
			       					<td width="25%">
			       						입주가능일
			       					</td>
			       					<td width="25%">
			       						<strong>${movingDate}</strong>
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						주차
			       					</td>
			       					<td width="25%">
		       						<c:choose>
		       							<c:when test="${addInfo.parking eq 1}">
		       								<strong>가능</strong> 
		       							</c:when>
		       							<c:when test="${addInfo.parking eq 0}">
		       								<strong>불가능</strong> 
		       							</c:when>
		       						</c:choose>
			       				
			       					</td>
			       					<td width="25%">
			       						반려동물
			       					</td>
			       					<td width="25%">
		       						<c:choose>
		       							<c:when test="${addInfo.animal eq 1}">
		       								<strong>가능</strong> 
		       							</c:when>
		       							<c:when test="${addInfo.animal eq 0}">
		       								<strong>불가능</strong> 
		       							</c:when>
		       						</c:choose>
			       					</td>
			       				</tr>
			       				<tr>
			       					<td width="25%">
			       						엘리베이터
			       					</td>
			       					<td width="25%" colspan="3">
		       						<c:choose>
		       							<c:when test="${addInfo.elevator eq 1}">
		       								<strong>있음</strong> 
		       							</c:when>
		       							<c:when test="${addInfo.elevator eq 0}">
		       								<strong>없음</strong> 
		       							</c:when>
		       						</c:choose>
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
        			<c:choose>
        				<c:when test="${addInfo.aircon eq 0}">
							<img id="aircon" src="../kanu/options/aircon_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.aircon eq 1}">
							<img id="aircon" src="../kanu/options/aircon_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.washing eq 0}">
							<img id="washing" src="../kanu/options/washing_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.washing eq 1}">
							<img id="washing" src="../kanu/options/washing_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.bed eq 0}">
							<img id="bed" src="../kanu/options/bed_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.bed eq 1}">
							<img id="bed" src="../kanu/options/bed_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.desk eq 0}">
							<img id="desk" src="../kanu/options/desk_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.desk eq 1}">
							<img id="desk" src="../kanu/options/desk_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.closet eq 0}">
							<img id="closet" src="../kanu/options/closet_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.closet eq 1}">
							<img id="closet" src="../kanu/options/closet_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.option_tv eq 0}">
							<img id="tv" src="../kanu/options/tv_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.option_tv eq 1}">
							<img id="tv" src="../kanu/options/tv_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.shoerack eq 0}">
							<img id="shoerack" src="../kanu/options/shoerack_black.png" width="70px">&nbsp;&nbsp;&nbsp;<br/> 
						</c:when>
						<c:when test="${addInfo.shoerack eq 1}">
							<img id="shoerack" src="../kanu/options/shoerack_color.png" width="70px">&nbsp;&nbsp;&nbsp;<br/> 
						</c:when>
					</c:choose>
        			<c:choose>
        				<c:when test="${addInfo.fridge eq 0}">
							<img id="fridge" src="../kanu/options/fridge_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.fridge eq 1}">
							<img id="fridge" src="../kanu/options/fridge_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>	
        			<c:choose>
        				<c:when test="${addInfo.gasstove eq 0}">
							<img id="gasstove" src="../kanu/options/gasstove_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.gasstove eq 1}">
							<img id="gasstove" src="../kanu/options/gasstove_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>		
        			<c:choose>
        				<c:when test="${addInfo.induction eq 0}">
							<img id="induction" src="../kanu/options/induction_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.induction eq 1}">
							<img id="induction" src="../kanu/options/induction_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>		
        			<c:choose>
        				<c:when test="${addInfo.microwave eq 0}">
							<img id="microwave" src="../kanu/options/microwave_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.microwave eq 1}">
							<img id="microwave" src="../kanu/options/microwave_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>	
        			<c:choose>
        				<c:when test="${addInfo.doorlock eq 0}">
							<img id="doorlock" src="../kanu/options/doorlock_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.doorlock eq 1}">
							<img id="doorlock" src="../kanu/options/doorlock_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>	
        			<c:choose>
        				<c:when test="${addInfo.bidet eq 0}">
							<img id="bidet" src="../kanu/options/bidet_black.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:when test="${addInfo.bidet eq 1}">
							<img id="bidet" src="../kanu/options/bidet_color.png" width="70px">&nbsp;&nbsp;&nbsp;
						</c:when>
					</c:choose>		
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
						${dto.explainText}
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
  <input type="hidden" value="${dto.lat}" id=lat />
  <input type="hidden" value="${dto.lng}" id=lng />
  <input type="hidden" value="${dto.address}" id="address" />
  <input type="hidden" value="${dto.build_no}" id="build_no" />
  <input type="hidden" value="${dto.view_count}" id="count_view" />
  <input type="hidden" value="${sessionScope.mem.mem_phone}" id="phone" />
  <input type="hidden" value="${sessionScope.mem.mem_name}" id="name" />
  <input type="hidden" value="${sessionScope.mem.mem_email}" id="email" />
</html>