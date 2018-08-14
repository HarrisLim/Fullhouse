<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>매물관리</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    <!-- paging.js -->
  	<script type="text/javascript" src="../kanu/js/paging.js"></script>
    
    <script>
    	function showStateList(state){
    		for(var i=0; i<5; i++){
    			if(i===state) $("#T"+i).css("display", '');
    			else $("#T"+i).css("display", 'none');
    		}
    	}

    	function updatePrivateMemo(x){
    		var Map = {};
    		var privateMemo = $(x).parents().parents().prev().children().val();
    		var build_no = $(x).parents().prev().val();
    		
    		Map.privateMemo = privateMemo;
    		Map.build_no = build_no;
    		
    		var Maps = JSON.stringify(Map);
	    	$.ajax({
	  	        type: 'POST',
	  	        dataType: 'JSON',
	  	      	contentType:'application/json; charset=utf-8',
	  	        data: Maps,
	  	        url: 'updateprivatememo.do',
	  	        success: function(json) {
	  	       		if(json===1) alert("수정되었습니다.");
	  	        }
	  	    });
    	}
    	function deleteBuild(x){
    		if(confirm("정말로 삭제하시겠습니까? 복구할 수 없습니다.")){
    			var build_no = $(x).parents().prev().val();
        		
    	    	$.ajax({
    	  	        type: 'POST',
    	  	        data: {"build_no" : build_no},
    	  	        url: 'deletebuild.do',
    	  	        success: function(json) {
    	  	       		if(json===1) alert("삭제되었습니다.");
    	  	       		location.reload();
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
				html+='No. '+response.buildList[i].build_no+'<br>';
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
				html+='<img src="../'+response.buildList[i].picPath+'" class="img-thumbnail" style="width:230px;height:150px">';
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
				html+='<textarea rows="5" cols="40" placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30">'+response.buildList[i].privateMemo+'</textarea>';
				html+='</td>';
				html+='<td style="font-size:15px">';
				html+='<p style="text-align:left;margin-left:10px">업로드: '+response.buildList[i].bu_rdate+'<br>';
				html+='조회수: '+response.buildList[i].view_count +'<br>';
				html+='</p>';
				html+='<input type="hidden" value="'+response.buildList[i].build_no+'">';
				html+='<div class="btn-group" role="group">';
				html+='<button class="btn btn-sm btn-outline-dark" onclick="updatePrivateMemo(this)">수정</button>';
				html+='<button class="btn btn-sm btn-outline-dark" onclick="deleteBuild(this)">삭제</button>';
				html+='<button class="btn btn-sm btn-outline-dark" onclick="alert("여기에 5,000원 결제하는 결제시스템 넣자")">광고재등록</button>';
				html+='</div>';
				html+='</td>';
   				html+='</tr>';
   	    		return html;
    		}
    	}
    	function search(state, value, clickedState, index, pageStartNum){
    		
    		// buildingNo이 공백이면 ""으로 인식해서 numberException발생, 그래서 buildingTitle로 변환해줘야한다. (검색어 없이 다른 탭을 클릭했을 때 오류수정)
    		var hot = state; // buildno or title or memo
    		if(hot==="buildingNo" && value==="") hot = "buildingTitle";

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
    				
    				html+='<p style="float:right;font-size:17px;margin:5px 20px 5px 0px ">'+clickedStateName+' 매물: '+response.count+'</p>';
    				html += '<table class="table talbe-hover align-items-center"  style="margin-bottom:0px" id="T0">';
	       				html+='<tbody>';

	       					if(Object.keys(response.buildList).length===0){
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
					
		       		$("#manageBuildingP").empty().append(html);
		       	 	// 전체 크기 중 해당 탭안의 매물개수만큼 undefined가 생기는 현상을 어케잡는지 모르겠어서, 정규식으로 제거.
		       		var regex = /.*undefined/g;
		       		$("#manageBuildingP").html($("#manageBuildingP").html().replace(regex, ''));
		       		$("#manageBuildingP").append(paging);
    			}
    		});
    	}
    	window.onload = function() {
	       	var regex = /^((?!undefined).)*$/g;
	       	$("#manageBuildingP").html().replace(regex, '');
    	}
    </script>
  </head>
  <body>
    <%@ include file ="nav.jsp" %>
    <main class="main">
	<section class="slice" name="intro"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<input type="hidden" id="nowState" value="0">
					<h2 class="h1 mb-4">매물관리</h2>
				    <!-- 로그인된 아이디에 등록한 매물이 없다면, -->
					<p class="lead lh-180">
						일반회원은 1개의 매물만 등록이 가능합니다. -- 일반회원일 때만 보여줘.
					</p><br>
					<!-- 로그인된 아이디에 등록한 매물이 있다면,  -->
					<nav>
					  <div class="nav nav-tabs" id="nav-tab" role="tablist">
					    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">매물관리</a>
					    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">직원관리</a>
					    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">연락 요청</a>
					  </div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
					  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					  <br>
						 <div align="right">
				       		<p style="float:left;font-size:20px;margin:5px 20px 5px 0px ">총 등록된 매물: ${count }</p>
							<select>
							  <option value="buildingNo">매물번호</option>
							  <option value="buildingTitle">제목</option>
							  <option value="buildingMemo">메모</option>
							</select>
							<input placeholder="검색해주세요" style="padding:5px" id="searching" onkeyup="search(document.getElementById('searching').previousSibling.previousSibling.value, this.value, $('#nowState').val())">
							<button type="button" class="btn btn-sm btn-outline-dark">검색</button> 
						</div>
						<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
					        <button type="button" class="btn btn-outline-dark" style="width:100%" onclick="search(document.getElementById('searching').previousSibling.previousSibling.value, document.getElementById('searching').value, 0); $('#nowState').val('0');">전체</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%" onclick="search(document.getElementById('searching').previousSibling.previousSibling.value, document.getElementById('searching').value, 1); $('#nowState').val('1');">광고 진행</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%" onclick="search(document.getElementById('searching').previousSibling.previousSibling.value, document.getElementById('searching').value, 2); $('#nowState').val('2');">광고 종료</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%" onclick="search(document.getElementById('searching').previousSibling.previousSibling.value, document.getElementById('searching').value, 3); $('#nowState').val('3');">거래 완료</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%" onclick="search(document.getElementById('searching').previousSibling.previousSibling.value, document.getElementById('searching').value, 4); $('#nowState').val('4');">검수 반려</button>
				       	</div>
				       	<div id="manageBuildingP">
				       	<p style="float:right;font-size:17px;margin:5px 20px 5px 0px ">[전체] 매물: ${count }</p>
				       		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px" id="T0">
				       			<tbody>
				       				<c:if test="${empty buildList }">
				       					<tr>
				       						<td rowspan="5" style="text-align:center;font-size:25px">
				       							등록된 매물이 없습니다.
				       						</td>
				       					</tr> 
				       				</c:if>
					       			<c:forEach items="${buildList }" var="build">
						       			<tr>
					       					<td style="width:100px;font-size:15px">
					       						No. ${build.build_no }<br>
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
					       						<img src="../${build.picPath }" class="img-thumbnail" style="width:230px;height:150px">
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
					       						<textarea rows="5" cols="40" placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30">${build.privateMemo }</textarea>
					       					</td>
					       					<td style="font-size:15px">
					       						<p style="text-align:left;margin-left:10px">업로드: ${build.bu_rdate }<br>
					       						조회수: ${build.view_count }<br>
												</p>
												<input type="hidden" value="${build.build_no }">
												<div class="btn-group" role="group">
													<button class="btn btn-sm btn-outline-dark" onclick="updatePrivateMemo(this)">수정</button>
													<button class="btn btn-sm btn-outline-dark" onclick="deleteBuild(this)">삭제</button>
													<button class="btn btn-sm btn-outline-dark" onclick="alert('여기에 5,000원 결제하는 결제시스템 넣자 ')">광고재등록</button>
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
						
			       		<div style="height:50px">
							<p class="lead lh-180" style="text-align:left;float:right;font-weight: bold;">
								- 광고중: 내가 등록한 매물이 공개중인 상태<br>
								- 거래완료: 등록한 매물이 거래완료된 상태<br> 
								- 검수반려: 운영원칙 위배 또는 신고로 비공개된 상태<br>
							</p>
						</div>
					  
					  </div>
					  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					  <br>
						  <div class="container">
							  <div class="row">
							  	<div class="col-lg-4" align="center">
								  <div class="card" style="width: 18rem;">
									  <img class="card-img-top" src="../kanu/slidephotos/images/a.jpg">
									  <ul class="list-group list-group-flush">
									    <li class="list-group-item" style="font-size:20px">박종석 (큰형)</li>
									    <li class="list-group-item" style="font-size:15px">bigbro@gmail.com</li>
									    <li class="list-group-item" style="font-size:15px">010-1234-5678</li>
									    <li class="list-group-item" style="font-size:15px">02-1234-5678</li>
									  </ul>
									</div>
								</div>
							  	<div class="col-lg-4" align="center">
								  <div class="card" style="width: 18rem;">
									  <img class="card-img-top" src="../kanu/slidephotos/images/b.jpg">
									  <ul class="list-group list-group-flush">
									    <li class="list-group-item" style="font-size:20px">박승균 (작은형)</li>
									    <li class="list-group-item" style="font-size:15px">smallbro@gmail.com</li>
									    <li class="list-group-item" style="font-size:15px">010-1234-1234</li>
									    <li class="list-group-item" style="font-size:15px">02-1234-1234</li>
									  </ul>
									</div>
								</div><div class="col-lg-4" align="center">
								  <div class="card" style="width: 18rem;">
									  <img class="card-img-top" src="../kanu/slidephotos/images/c.jpg">
									  <ul class="list-group list-group-flush">
									    <li class="list-group-item" style="font-size:20px">임정수 (막내)</li>
									    <li class="list-group-item" style="font-size:15px">youngerbro@gmail.com</li>
									    <li class="list-group-item" style="font-size:15px">010-5678-5678</li>
									    <li class="list-group-item" style="font-size:15px">02-5678-5678</li>
									  </ul>
									</div>
								</div>
							</div>
						</div>
					  </div>
					  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
					  	연락요청이 있을 시에, 위에 연락요청 탭에 숫자 나오게 못하나 ?
					  	<table class="table table-striped">
					  		<thead>
					  			<tr style="text-align:center">
					  				<th>매물제목</th>
					  				<th>이름 </th>
					  				<td>연락처</td>
					  				<td>연락요청일자</td>
					  			</tr>
					  		</thead>
					  		<tbody>
					  			<tr>
					  				<th>매물제목넣자 (링크 걸고)</th>
					  				<th>여기에 이름 넣고 </th>
					  				<td>여기에 번호 넣자</td>
					  				<td>여기에 연락요청일자</td>
					  			</tr>
					  		</tbody>
					  	</table>
					  </div>
					</div>
					
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