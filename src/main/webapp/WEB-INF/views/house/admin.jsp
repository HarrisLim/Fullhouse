<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
  <head>
	  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
  <link rel="apple-touch-icon" sizes="76x76" href="../kanu/main/로고.png">
  <link rel="icon" type="image/png" href="../kanu/main/로고.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Admin : FullHouse
  </title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../kanu/css/admin_slidebar.css">
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <!-- paging.js -->
  	<script type="text/javascript" src="../kanu/js/paging.js"></script>
    <script>
	 // 토큰 생성
	    var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    $(function() {
	        $(document).ajaxSend(function(e, xhr, options) {
	        	console.log("dd");
	            xhr.setRequestHeader(header, token);
	        });
	    });

	    
		var arr = ["year", "month", "week", "day"];
		
   		function chnageTitlt(x){
   			$("#dropdownMenuButton").text($(x).text());
   			for(var i=0; i<arr.length; i++){
				if(arr[i]===x.id)
		   			$("."+x.id).css("display", "");
		   		else
		   			$("."+arr[i]).css("display", "none");
   			}
   		}

    	function makeActive(idx, no){
    		var a=1, b=4;
    		if(no===1) a=6, b=7;
    		for(var i=a; i<=b; i++){
    			if(i===idx) {
    				$("#btn"+i).addClass("active");
    				continue;
    			}
    			$("#btn"+i).removeClass("active");
    		}
    	}
    	
    	function getFormatDate(date){
    		var year = date.getFullYear();                                 //yyyy
    		var month = (1 + date.getMonth());                     //M
    		month = month >= 10 ? month : '0' + month;     // month 두자리로 저장
    		var day = date.getDate();                                        //d
    		day = day >= 10 ? day : '0' + day;                            //day 두자리로 저장
    		return  year + '.' + month + '.' + day;
    	}
    	
    	function getQnestionList(type) {
    		$.ajax({
    			dataType : "json",
	  	        type: 'POST',
	  	        data: {"done": type},
	  	        url: 'selectqna.do',
	  	        success: function(responseData) {
					var qnaListSize = Object.keys(responseData.qnaList).length;
					var html='';
					if(qnaListSize===0){
						html+='<tr>';
						html+='<td>';
						html+='질문이 없습니다.';
						html+='</tr>';
						html+='</td>';
					}
					for(var i=0; i<qnaListSize; i++){
						var date = new Date(responseData.qnaList[qnaListSize-1-i].qna_rdate);
      					html+='<tr>';
     					html+='<td style="text-align:center">'+(qnaListSize-i)+'</td>';
   						html+='<td style="text-align:center;width:724px">'+responseData.qnaList[qnaListSize-1-i].subject+'</td>';
						html+='<td style="text-align:center">';
						html+=''+getFormatDate(date)+'';
						html+='<br>';
						html+='<div class="btn-group" role="group">';
						if(type===0)
							html+='<button class="btn btn-sm btn-outline-dark" onclick="showContent($(this).parents().prev().prev()[0].childNodes[0].nodeValue)">답변</button>';	
						else
							html+='<button class="btn btn-sm btn-outline-dark" onclick="showContent($(this).parents().prev().prev()[0].childNodes[0].nodeValue)">내용 확인</button>';
						html+='</div>';
						html+='</td>';
						html+='</tr>';
						html+='<tr class="questionBody">';
						html+='<td></td>';
						html+='<td>';
						if(type===0){
							html+='<div id="content'+(qnaListSize-i)+'" style="display:none">';
							html+='<br><strong> - 질문 내용 - </strong>';
							html+='<textarea rows="10" class="form-control" style="margin:20px" resize="none" readonly>'+responseData.qnaList[qnaListSize-1-i].content+'</textarea>';
							html+='<br><strong> - 답변 - </strong>';
							html+='<textarea id="reply" style="background-color:rgba(200,200,240,0.1);margin:20px; height:100px" class="form-control"></textarea>';
							html+='</div>';
							html+='</td>';
							html+='<td>';
							html+='<div id="replyBtn'+(qnaListSize-i)+'" style="display:none">';
							html+='<button class="btn btn-sm btn-outline-primary" style="margin:0px 0px -368px 30px">답변 완료</button>';
							html+='</div>';
							html+='</td>';
						}else {
							html+='<div id="content'+(qnaListSize-i)+'" style="display:none">';
							html+='<br><strong> - 질문 내용 - </strong>';
							html+='<textarea rows="10" class="form-control" style="margin:20px" resize="none" readonly>'+responseData.qnaList[qnaListSize-1-i].content+'</textarea>';
							html+='<br><strong> - 답변 내용 - </strong>';
							html+='<textarea id="reply" style="background-color:rgba(200,200,240,0.1);margin:20px; height:100px" class="form-control" readonly>'+responseData.qnaList[qnaListSize-1-i].reply+'</textarea>';
							html+='</div>';
							html+='</td>';
							html+='<td>';
							html+='</div>';
							html+='</td>';
						}
						html+='</tr>';
					}
					
					$("#questionTBody").empty().append(html);
	  	        },error:function(request,status,error){
  	  	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 	  	       }
    		});
    	}

		function showContent(i){
			$("#content"+i).slideToggle();
			$("#replyBtn"+i).slideToggle();
		}
		
		function doneReply(qna_no, reply){
    		$.ajax({
    			dataType : "json",
	  	        type: 'POST',
	  	        data: {"qna_no": qna_no, "reply": reply},
	  	        url: 'updateqna.do',
	  	        success: function(responseData) {
	  	        	if(responseData===1) alert("답변이 작성되었습니다. 자동으로 [답변완료]처리가 됩니다.");
	  	        	getQnestionList(0);
	  	        },error:function(request,status,error){
  	  	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 	  	       }
    		});
			
		}
		
		

    	function deleteBuild(x, state, value, clickedState){
    		console.log("state: "+ state+", value: "+ value+", clickedState: "+ clickedState);
    		if(confirm("정말로 삭제하시겠습니까? 복구할 수 없습니다.")){
    			var build_no = $(x).parents().prev().val();
        		
    	    	$.ajax({
    	  	        type: 'POST',
    	  	        data: {"build_no" : build_no},
    	  	        url: 'deletebuild.do',
    	  	        success: function(json) {
    	  	       		if(json===1) alert("삭제되었습니다.");
    	  	       		search(state, value, clickedState);
//     	  	       		location.reload();
    	  	        },error:function(request,status,error){
    	  	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	  	       }
    	  	    });
    		}else
    			return;
    	}
    	function makeTable(response, i, html, clickedState){
    		if(response.buildList[i].buildState === clickedState || clickedState===0){
    			html = '';
//     			console.log("i: "+ i);
//     			console.log("clickedState: "+ clickedState+", "+response.buildList[i].buildState);
    			html+='<tr>';
				html+='<td style="width:100px;font-size:15px">';
				html+='<a href="room.do?buildNo='+response.buildList[i].build_no+'" target="_self">No. '+response.buildList[i].build_no+'</a><br>';
				if(clickedState===-1 || clickedState===0){ // 전체 
					switch(response.buildList[i].buildState){
  						case 1: html+='<strong>[광고진행]</strong><br>'; break;
  						case 2: html+='<strong>[광고종료]</strong><br>'; break;
  						case 3: html+='<strong>[거래완료]</strong><br>'; break;
  						case 4: html+='<strong>[검수반려]</strong><br>'; break;
					}
				}else if(clickedState===1){ // 광고진행 
					html+='<strong>[광고진행]</strong><br>';
				}else if(clickedState===2){ // 광고종료 
					html+='<strong>[광고종료]</strong><br>';
				}else if(clickedState===3){ // 거래완료 
					html+='<strong>[거래완료]</strong><br>';
				}else if(clickedState===4){ // 검수반려 
					html+='<strong>[검수반려]</strong><br>';
				}
   				html+='</td>';
   				html+='<td>';
				html+='<img src="'+response.buildList[i].picPath+'" class="img-thumbnail" style="width:230px;height:150px">';
				html+='</td>';
				html+='<td style="font-size:15px">';
					html+=''+response.buildList[i].proType+'';
					if(response.mapList[Object.keys(response.mapList)[i]] [0].monthly!==0){
						html+=' 월세 '+response.mapList[Object.keys(response.mapList)[i]][0].monthly+' / '+response.mapList[Object.keys(response.mapList)[i]][0].deposit;
					}else if(response.mapList[Object.keys(response.mapList)[i]][0].monthly===0 && response.mapList[Object.keys(response.mapList)[i]][0].lease!==0){
						html+=' 전세 '+response.mapList[Object.keys(response.mapList)[i]][0].lease;
					}else if(response.mapList[Object.keys(response.mapList)[i]][0].monthly===0 && response.mapList[Object.keys(response.mapList)[i]][0].lease===0 && response.mapList[Object.keys(response.mapList)[i]][0].salePrice!==0){
						html+=' 매매 '+response.mapList[Object.keys(response.mapList)[i]][0].salePrice;
					}
				html+='<br>';
				html+=''+response.buildList[i].roomTitle+'';
				html+='</td>';
				html+='<td>';
				html+='<textarea style="border-radius:5px" rows="5" cols="40" placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30" readonly>'+response.buildList[i].privateMemo+'</textarea>';
				html+='</td>'
				html+='<td style="font-size:15px">';
				html+='<p style="text-align:left;margin-left:10px">업로드: '+response.buildList[i].bu_rdate+'<br>';
				html+='조회수: '+response.buildList[i].view_count +'<br>';
				html+='</p>';
				html+='<input type="hidden" value="'+response.buildList[i].build_no+'">';
				html+='<div class="btn-group" role="group">';
				html+='<button style="width:150px"class="btn btn-sm btn-outline-dark" onclick="deleteBuild(this, document.getElementById(\'selectedState\').value, document.getElementById(\'searching\').value, document.getElementById(\'nowState\').value)">삭제</button>';
				html+='</div>';
				html+='</td>';
   				html+='</tr>';
   	    		return html;
    		}
    	}
    	function search(state, value, clickedState, index, pageStartNum){
    		console.log("commo1n");
    		// buildingNo이 공백이면 ""으로 인식해서 numberException발생, 그래서 buildingTitle로 변환해줘야한다. (검색어 없이 다른 탭을 클릭했을 때 오류수정)
    		var hot = state; // buildno or title or memo
    		var nowType = $("#nowType").val(); // 현재 로그인 타입 
    		if(hot==="buildingNo" && value==="") hot = "buildingTitle";

    		if(state===undefined) state="buildingNo";
    		if(value===undefined) value="";
    		
			clickedState = parseInt(clickedState);
    		arr={};
    		arr.hot = hot;
    		arr.value = value;
    		arr.index = index;
    		arr.clickedState = clickedState;
    		arr.pageStartNum = pageStartNum;
    		arr = JSON.stringify(arr);
    		console.log("in search() :" +state+", "+value+", "+clickedState+", "+index+", "+pageStartNum);
    		
    		
    		$.ajax({
    			contentType : "application/json",
    			type: "POST",
    			data: arr,
    			dataType : "json",
    			url: 'searchbuild.do',
    			success: function(response){
					var buildListSize = Object.keys(response.buildList).length;
// 					alert("1: "+ Object.keys(response.buildList).length);

    				for(var i=0; i<buildListSize; i++){
//     					alert("1.5: "+ Object.keys(response.mapList)[i]);
						for(var j=0; j<response.mapList[Object.keys(response.mapList)[i]].length;j++){ // -> 현재 mapList의 length;
// 	        				alert("3: "+ response.mapList[Object.keys(response.mapList)[i]][j].monthly); // 현재 mpaList의 원소를 가져올 수 있다. 
						}
    				}
					var clickedStateName='';
    				switch(clickedState){
						case 0: clickedStateName='[전체]'; break;
						case 1: clickedStateName='[광고 진행]'; break;
						case 2: clickedStateName='[광고 종료]'; break;
						case 3: clickedStateName='[거래 완료]'; break;
						case 4: clickedStateName='[검수 반려]'; break;
					}
    				var html = '';
    				
    				html+='<p style="float:right;font-size:17px;margin:5px 20px 5px 0px ">검색된 '+clickedStateName+' 매물: '+response.count+'</p>';
    				html += '<table class="table talbe-hover align-items-center"  style="margin-bottom:0px" id="T0">';
	       				html+='<tbody>';
		       				if(nowType!=="mem" && nowType!=="staff"){
		       					html+='<tr>';
       							html+='<td rowspan="5" style="text-align:center;font-size:25px">';
   	   							html+='로그인 후 이용할 수 있습니다.';
	       						html+='</td>';
	       						html+='</tr>';
		       				}else if(Object.keys(response.buildList).length===0){
		       					html+='<tr>';
	       							html+='<td rowspan="5" style="text-align:center;font-size:25px">';
	    	   							html+='등록된 매물이 없습니다.';
		       						html+='</td>';
		       					html+='</tr>';
	       					}else{
		       					for(var i=0; i<buildListSize; i++){
		       						html+=makeTable(response, i, html, clickedState);
		       					}
	       					}
			       		html+='</tbody>';
			       	html+='</table>';
			       	html+='<hr style="margin-top:0px">';
			       	if(value==="") value=0; // 검색 후 지운다음에 전체검색을 하려고할 때, value에 ""가 들어가서 select가 안되던 현상 해결. 
			       	var paging = "";
					//<!-- 5. paging view -->
					//paging +="<div id='page' style='height:45px;width:480px;bottom:calc(-100% + 60px);float:right;position:relative;'> "; 
					paging +="<div id='pageLoad'>";
					paging +="<ul class='pagination' style='justify-content:center;margin-top:5px;'>";
					//<!-- 이전 페이지 이동 -->
					paging +="<li class='page-item'><a class='page-link' onclick='pagePre("+response.pagingVo.index+","+response.pagingVo.pageStartNum+","+response.pagingVo.total+","+response.pagingVo.listCnt+","+response.pagingVo.pageCnt+", 1, "+clickedState+", \""+value+"\", \""+state+"\");'>&lsaquo;</a></li>";
					//<!--페이지번호 -->
					for(var i=response.pagingVo.pageStartNum; i<=response.pagingVo.pageLastNum; i++){
						paging+="<li class='pageIndex"+i+"' id='idx"+i+"'><a class='page-link' onclick='pageIndex("+(i-1)+","+i+","+response.pagingVo.total+","+response.pagingVo.listCnt+","+response.pagingVo.pageCnt+", 1, "+clickedState+", \""+value+"\", \""+state+"\");'>"+i+"</a></li>";
					}
					//<!--다음 페이지 이동 -->
					paging+="<li class='page-item'><a class='page-link' onclick='pageNext("+response.pagingVo.index+","+response.pagingVo.pageStartNum+","+response.pagingVo.total+","+response.pagingVo.listCnt+","+response.pagingVo.pageCnt+", 1, "+clickedState+", \""+value+"\", \""+state+"\");'>&rsaquo;</a></li>";
					paging+="</ul>";
					paging+="</div>";

					var idxP = response.pagingVo.index+1;
		       		$("#manageBuildingP").empty().append(html);
		       	 	// 전체 크기 중 해당 탭안의 매물개수만큼 undefined가 생기는 현상을 어케잡는지 모르겠어서, 정규식으로 제거.
		       		var regex = /.*undefined/g;
		       		$("#manageBuildingP").html($("#manageBuildingP").html().replace(regex, ''));
		       		$("#manageBuildingP").append(paging);
					$(".pageIndex"+idxP).addClass("page-item active");
    			}
    		});
    	}
    </script>
  </head>
  <body>
	<div id="navContainer" style="z-index:-1">
 		<%@include file="nav.jsp" %>
 	</div>
	<div class="nav-side-menu left" id="myLeft">
	    <div class="brand">
	    	<a class="" href="../house/main.do" style="color:white">
	    		<img src="../kanu/main/로고.png" class="avatar avatar-sm bg-#00000000" style="background-color:transparent"><strong>Full House</strong> Station4
	    	</a>
    	</div>
	    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
	  
	        <div class="menu-list">
	            <ul id="menu-content" class="menu-content collapse out">
	                <li id="firstBtn" class="active">
	                  <a href="#">
	                  	<img src="../kanu/images/chart.png" style="margin:6px"> <span style="font-size:13px">매물현황</span>
	                  </a>
	                </li>
	                <li id="secondBtn">
	                  <a href="#">
	                  	<img src="../kanu/images/box.png" style="margin:6px"> <span style="font-size:13px">매물관리</span>
	                  </a>
	                </li>
	                <li id="thirdBtn">
	                  <a href="#">
	                  	<img src="../kanu/images/money.png" style="margin:6px"> <span style="font-size:13px">매출현황</span>
	                  </a>
	                </li>
	                <li id="fourthBtn">
	                  <a href="#">
	                  	<img src="../kanu/images/qna.png" style="margin:6px"> <span style="font-size:13px">Q&A관리</span>
	                  </a>
	                </li>
	            </ul>
	     </div>
	</div>
    <main class="main right" id="first">
    <!-- 매물현황 -->
    <!-- 매물 종류 (원형그래프) -->
    <!-- 1:전세 2:반전세 3:월세 -->
    <c:forEach items="${buildGMap.buildPie }" var="buildPie" varStatus="loop">
    	<input type="hidden" id="buildPie${loop.count }" value="${buildPie }">
    </c:forEach>
    
    <!-- 일일 매물 등록 건수 (바그래프) -->
    <!-- 1:월 2:화 3:수 4:목 5:금 6:토 7:일 -->
    <c:forEach items="${buildGMap.buildBar }" var="buildBar" varStatus="loop">
    	<input type="hidden" id="buildBar${loop.count }" value="${buildBar}">
    </c:forEach>
    
    <!-- 행정구역별 등록 현환 (선그래프) -->
    <!-- 1:서울특별시 2:경기도 3:인천광역시 4:강원도 5:충청남도 6:충청북도 7:대전광역시 8:세종특별자치시 9:전라북도 10:전라남도 -->
    <!-- 11:광주광역시 12:경상남도 13:경상북도 14:대구광역시 15:부산광역시 16:울산광역시 17:제주특별자치도 -->
    <c:forEach items="${buildGMap.buildLine }" var="buildLine" varStatus="loop">
	    <c:forEach items="${ buildLine}" var="line" varStatus="l">
		    <input type="hidden" id="buildLine${loop.count }${ l.count }" value="${line }"> <!-- 서울특별시 -->
		        <!-- 라인 월별 -->
		    <input type="hidden" id="buildLineMonth${loop.count }${ l.count }" value="${line*5000 }"> <!-- 서울특별시 -->
    	</c:forEach>
    </c:forEach>
    
	<!-- 매출현황 -->
	<!-- 바 연도별 -->
    <c:forEach items="${buildGMap.buildBarYear }" var="buildBarYear" varStatus="loop">
    	<input type="hidden" id="buildBarYear${loop.count }" value="${buildBarYear*5000}">
    </c:forEach>
	<!-- 바 월별 -->
    <c:forEach items="${buildGMap.buildBarMonth }" var="buildBarMonth" varStatus="loop">
    	<input type="hidden" id="buildBarMonth${loop.count }" value="${buildBarMonth*5000}">
    </c:forEach>
	<!-- 바 일별 -->
    <c:forEach items="${buildGMap.buildBarDay }" var="buildBarDay" varStatus="loop">
    	<input type="hidden" id="buildBarDay${loop.count }" value="${buildBarDay*5000}">
    </c:forEach>
	<!-- 라인 연도별 -->
    <c:forEach items="${buildGMap.buildLineYear }" var="buildLineYear" varStatus="loop">
	    <c:forEach items="${ buildLineYear}" var="line" varStatus="l">
		    <input type="hidden" id="buildLineYear${loop.count }${ l.count }" value="${line*5000}"> <!-- 서울특별시 -->
    	</c:forEach>
    </c:forEach>
	<!-- 라인 일별 -->
    <c:forEach items="${buildGMap.buildLineDay }" var="buildLineDay" varStatus="loop">
	    <c:forEach items="${ buildLineDay}" var="line" varStatus="l">
		    <input type="hidden" id="buildLineDay${loop.count }${ l.count }" value="${line*5000}"> <!-- 서울특별시 -->
    	</c:forEach>
    </c:forEach>
    
    <section class="slice">
      <div class="container">
        <h3 class="heading h3">매물현황</h3>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">매물 종류</h5>
            <div class="card border-0 chartWrapper">
              <canvas id="pieChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">일일 매물 등록 건수</h5>
            <div class="card border-0 chartWrapper">
              <canvas id="barChart" class="chart"></canvas>
            </div>
          </div>
        </div>
        <h5 class="card-title" style="background-color:rgba(200,200,240,0.5); padding:10px; margin:20px 0 20px 0">행정구역별 등록 현황</h5>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">수도권</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="centerChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">강원도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gangwondoChart" class="chart"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">충청도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="chungcheongdoChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">전라도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jolladoChart" class="chart"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">경상도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gyeongsangdoChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">제주특별자치도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jejudoChart" class="chart"></canvas>
            </div>
          </div>
        </div>
      </div>
    </section>	
    </main>
    
    <main class="main right" id="second" style="display:none">
    <section class="slice">
      <div class="container">
        <h3 class="heading h3">매물관리</h3>
	    <p style="float:left;font-size:20px;margin:5px 20px 5px 0px ">총 등록된 매물: ${count }</p>
		<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
	        <button id="btn1" type="button" onclick="makeActive(1);" class="btn btn-outline-dark active" style="width:100%">전체</button>
	        <button id="btn2" type="button" onclick="makeActive(2);" class="btn btn-outline-dark" style="width:100%">광고진행</button>
	        <button id="btn3" type="button" onclick="makeActive(3);" class="btn btn-outline-dark" style="width:100%">광고종료</button>
	        <button id="btn4" type="button" onclick="makeActive(4);" class="btn btn-outline-dark" style="width:100%">거래완료</button>
	      	</div>
	       	<input type="hidden" value="${type }" id="nowType">
	       	<div id="manageBuildingP">
	      		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
	      			<tbody>
	      			<c:if test="${empty buildList}">
       					<tr>
       						<td rowspan="5" style="text-align:center;font-size:25px">
       							등록된 매물이 없습니다. 
       						</td>
       					</tr> 
       				</c:if>
	      			<c:forEach items="${buildList }" var="build">
	      				<tr>
	      					<td style="width:100px;font-size:15px">
	      					<a href="room.do?buildNo=${build.build_no }" target="_self">No. ${build.build_no }</a><br>
	       						<c:choose>
	       							<c:when test="${build.buildState eq 1 }">
	       								<strong>[광고진행]</strong><br>
	       							</c:when>
	       							<c:when test="${build.buildState eq 2 }">
	       								<strong>[광고종료]</strong><br>
	       							</c:when>
	       							<c:when test="${build.buildState eq 3 }">
	       								<strong>[거래완료]</strong><br>
	       							</c:when>
	       							<c:when test="${build.buildState eq 4 }">
	       								<strong>[검수반려]</strong><br>
	       							</c:when>
	       						</c:choose>
	       					</td>
	       					<td>
	       						<img src="${build.picPath }" class="img-thumbnail" style="width:230px;height:150px">
	       					</td>
		       					<td style="font-size:15px">
		       						${build.proType }
		       						<c:choose>
										<c:when test="${mapList.get(build).get(0).monthly ne 0}">
											월세 ${mapList.get(build).get(0).monthly} / ${mapList.get(build).get(0).deposit}
										</c:when> 
										<c:when test="${mapList.get(build).get(0).monthly eq 0 && mapList.get(build).get(0).lease ne 0}">
											전세 ${mapList.get(build).get(0).lease}
										</c:when>    						
										<c:when test="${mapList.get(build).get(0).monthly eq 0 && mapList.get(build).get(0).lease eq 0 && mapList.get(build).get(0).salePrice ne 0}">
											매매 ${mapList.get(build).get(0).salePrice}
										</c:when>
		       						</c:choose>    						
       								<br>
		       						${build.roomTitle }
		       					</td>
		       					<td>
		       						<textarea style="border-radius:5px" rows="5" cols="40" placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30" readonly>${build.privateMemo }</textarea>
		       					</td>
		       					<td style="font-size:15px">
		       						<p style="text-align:left;margin-left:10px">업로드: ${build.bu_rdate }<br>
		       						조회수: ${build.view_count }<br>
									</p>
									<input type="hidden" value="${build.build_no }">
									<div class="btn-group" role="group">
										<button style="width:160px" class="btn btn-sm btn-outline-dark" onclick="deleteBuild(this, $('#selectedState').val(), document.getElementById('searching').value, $('#nowState').val())">삭제</button>
									</div>
		       					</td>
		       				</tr>
	       				</c:forEach>
	      			</tbody>
	      		</table>
      			<hr style="margin-top:0px">
	       		<div id="page">  
					<div id="pageLoad">
		      		<!-- 5. paging view -->
					<ul class="pagination" style="justify-content:center;margin-top:5px;">
				
					<!-- 이전 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${page.index}, ${page.pageStartNum}, ${page.total},${page.listCnt},${page.pageCnt}, 1, 0);'>&lsaquo;</a></li>
				
					<!--페이지번호 -->
					<c:forEach var='i' begin="${page.pageStartNum}" end="${page.pageLastNum}" step="1">
						<li class='pageIndex${i}' id='idx${i}'><a class="page-link" onclick='pageIndex(${i-1}, ${i}, ${page.total}, ${page.listCnt}, ${page.pageCnt}, 1, 0);'>${i}</a></li>
					</c:forEach>
				
					<!--다음 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageNext(${page.index}, ${page.pageStartNum}, ${page.total},${page.listCnt},${page.pageCnt}, 1, 0);'>&rsaquo;</a></li>
					</ul>
		
					<form action="sub('index')" method="post" id='frmPaging'>
						<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
					<input type='hidden' name='index' id='index' value='${page.index}'>
					<input type='hidden' name='pageStartNum' id='pageStartNum' value='${page.pageStartNum}'>
					<input type='hidden' name='listCnt' id='listCnt' value='${page.listCnt}'>	
					</form>
					</div>
				</div>
	      	</div>
      	</div>
    </section>	
    </main>
    
    <main class="main right" id="third" style="display:none">
    <section class="slice">
      <div class="container">
        <h3 class="heading h3">매출현황</h3>
        <div class="dropdown" style="float:right;top:-50px">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		  	월 단위
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" href="#" id="year" onclick="chnageTitlt(this)">년 단위</a>
		    <a class="dropdown-item" href="#" id="month" onclick="chnageTitlt(this)">월 단위</a>
		    <a class="dropdown-item" href="#" id="day" onclick="chnageTitlt(this)">일 단위</a>
		  </div>
		</div>
        <h5 class="card-title" style="background-color:rgba(200,200,240,0.5); padding:10px; margin:20px 0 20px 0">총 매출 현황</h5>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-12" style="margin-bottom:30px">
            <div class="card border-0 chartWrapper">
              <canvas id="yearBarChart" class="chart year"></canvas>
              <canvas id="monthBarChart" class="chart month"></canvas>
              <canvas id="dayBarChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
        <h5 class="card-title" style="background-color:rgba(200,200,240,0.5); padding:10px; margin:20px 0 20px 0">행정구역별 매출 현황</h5>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">수도권</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="centerYearSalesChart" class="chart year"></canvas>
  				<canvas id="centerMonthSalesChart" class="chart month"></canvas>
  				<canvas id="centerDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">강원도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gangwondoYearSalesChart" class="chart year"></canvas>
  				<canvas id="gangwondoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="gangwondoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">충청도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="chungcheongdoYearSalesChart" class="chart year"></canvas>
  				<canvas id="chungcheongdoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="chungcheongdoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">전라도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jolladoYearSalesChart" class="chart year"></canvas>
  				<canvas id="jolladoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="jolladoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">경상도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gyeongsangdoYearSalesChart" class="chart year"></canvas>
  				<canvas id="gyeongsangdoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="gyeongsangdoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">제주특별자치도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jejudoYearSalesChart" class="chart year"></canvas>
  				<canvas id="jejudoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="jejudoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
      </div>
    </section>
    </main>
    
    <main class="main right" id="fourth" style="display:none">
    <section class="slice">
      <div class="container">
        <h3 class="heading h3">Q&A관리</h3>
		<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
	        <button id="btn6" onclick="makeActive(6, 1); getQnestionList(0)" type="button" class="btn btn-outline-dark active" style="width:100%">대기중인 질문</button>
	        <button id="btn7" onclick="makeActive(7, 1); getQnestionList(1)" type="button" class="btn btn-outline-dark" style="width:100%">완료된 질문</button>
	      	</div>
	      	<div>
	      		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
	      			<tbody id="questionTBody">
	      			<c:choose>
		      			<c:when test="${empty qnaList }">
		      				<tr>
		      					<td>
		      						질문이 없습니다.
		      					</td>
		      				</tr>
		      			</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="0" end="${fn:length(qnaList)-1}" step="1">
			      				<tr>
			      					<td style="text-align:center">${(fn:length(qnaList))-i}</td>
			      					<td style="text-align:center;width:724px">
				      					${qnaList[(fn:length(qnaList)-1)-i].subject }
			      					</td>
			      					<td style="text-align:center">
				      					<fmt:formatDate value="${qnaList[(fn:length(qnaList)-1)-i].qna_rdate }" pattern="yyyy.MM.dd"/>
				      					<br>
										<div class="btn-group" role="group">
											<button class="btn btn-sm btn-outline-dark" onclick="showContent($(this).parents().prev().prev()[0].childNodes[0].nodeValue)">답변</button>
										</div>
			      					</td>
			      				</tr>
								<tr class="questionBody">
									<td></td>
									<td>
										<div id="content${(fn:length(qnaList))-i}" style="display:none">
											<br><strong> - 질문 내용 - </strong> 
											<textarea rows="10" class="form-control" style="margin:20px" resize="none" readonly>${qnaList[(fn:length(qnaList)-1)-i].content }</textarea>
											<br><strong> - 답변 - </strong>
											<textarea id="reply" style="background-color:rgba(200,200,240,0.1);margin:20px; height:100px" class="form-control"></textarea>
										</div>
									</td>
									<td>
										<div id="replyBtn${(fn:length(qnaList))-i}" style="display:none">
											<button class="btn btn-sm btn-outline-primary" style="margin:0px 0px -368px 30px" onclick="doneReply(${qnaList[(fn:length(qnaList)-1)-i].qna_no}, $(this).parents().parents().prev().children().children()[5].value)">답변 완료</button>
										</div>
									</td>
								</tr>
			      			</c:forEach>
		      			</c:otherwise>
	      			</c:choose>
	      			</tbody>
	      		</table>
	      		<hr style="margin-top:0px">
	      	</div>
      	</div>
    </section>	
    </main>
    
    <script src="../kanu/js/adminchart.js"></script>
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