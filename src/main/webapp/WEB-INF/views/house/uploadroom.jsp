<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>방등록</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
 .custom-file-label::after {
            content: "사진 검색";
        }

.photo {
    position: relative;
    width: 100%;
    max-width: 400px;
}

.photo img {
    width: 100%;
    height: auto;
}

.photo .btn {
    position: absolute;
    top: 15%;
    left: 85%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    background-color: rgba(100, 100, 100, 0.4);
    color: white;
    font-size: 16px;
    padding: 6px 12px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
}

.photo .btn:hover {
    background-color: black;
}
</style>

  </head>
  <body>
    <%@ include file ="nav.jsp" %>
    <main class="main">
	<section class="slice" name="intro">
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">방 등록하기</h2>
					<p class="lead lh-180">
						- 등록한 방 정보는 직거래 매물로 등록됩니다.<br>
						- 방 등록이 완료된 매물은 방 정보와 회원정보(연락처, 메일 등)와 함께 노출됩니다.<br>
						- 거래완료된 매물을 완료처리하지 않은 경우 허위매물 등록으로 이용이 제한될 수 있습니다.<br> 
						- 매물 관리규정에 위배되거나 신고된 매물은 비공개 또는 삭제처리되며 경고 및 제재조치를 받을 수 있습니다.<br> 
						- 부동산 중개사는 직거래 매물을 등록할 수 없으며, 공인중개사 회원 가입 후 이용하시기 바랍니다. <br>
					</p>
				</div>
			</div>
		</div>
	</section>
	
	<form id="formId" name="fileForm" method="post" action="uploaddroomsubmit.do" enctype="multipart/form-data">
	<section class="" name="location">
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">위치정보</h2>
					<table class="table talbe-hover align-items-center" style="margin-bottom:0px">
						<tbody>
							<tr>
								<th scope="row" rowspan="4" style="width:100px;text-align:center">주소</th>
							</tr>
							<tr class="bg-white" scope="row">
								<td colspan="2">도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</td>
								<td rowspan="6" style="width:300px"><div id="map" style="width:300px;height:300px;margin-top:10px;"></div></td>
							</tr>
							<tr>
								<td><input type="text" id="address" name="addr" placeholder="주소검색을 이용해서 주소를 입력해주세요." style="width:380px;background:rgba(200,200,240,0.1);padding:5px 10px 5px 10px" readonly></td>
								<td><input id="searchingBtn" class="btn btn-sm btn-primary" type="button" value="주소검색" onclick="execDaumPostcode()"></td>
							</tr>
							<tr>
								<td colspan="2"><input id="detailAddress" name="detailAddr" placeholder="상세 주소를 입력해주세요. (동, 호수)" style="width:480px;padding:5px 10px 5px 10px"></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="address" id="realAddr">
					<input type="hidden" name="lat" id="lat">
					<input type="hidden" name="lng" id="lng">
					<hr style="margin-top:0px">
				</div>
			</div>
		</div>
	</section>
	<section class="" name="info">
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">기본정보</h2>
					<table class="table talbe-hover align-items-center" style="margin-bottom:0px">
						<tbody>
							<tr>
								<th>방 종류</th>
								<td>
									<select class="btn btn-sm btn-primary" name="proType" id="proType">
									  <option value="">방 종류 선택</option>
									  <option value="oneroom">원룸</option>
									  <option value="onefiveroom">1.5룸</option>
									  <option value="tworoom">투룸</option>
									  <option value="threeroom">쓰리룸</option>
									  <option value="studio">오피스텔</option>
									  <option value="apartment">아파트</option>
									</select>
								</td>
								<td colspan="5">
									FullHouse에서는 고시원(텔)등의 고시원업 매물 등록을 제한합니다. (차단조치) 
								</td>
							</tr>
							<tr>
								<th rowspan="2">거래 종류</th>
								<td colspan="5">
									<input id="addSellBtn" class="btn btn-sm btn-primary" type="button" value="매매 추가" onclick="addPrice('sell')">&nbsp;&nbsp;
									<input id="addDepositBtn" class="btn btn-sm btn-primary" type="button" value="전세 추가" onclick="addPrice('deposit')">&nbsp;&nbsp;
									<input id="addMonthlyBtn" class="btn btn-sm btn-primary" type="button" value="월세 추가" onclick="addPrice('monthly')">
								</td>
							</tr>
							<tr>
								<td colspan="5" id="addPrice">
									<span style="color:red">거래종류를 추가해주세요. 다중 선택이 가능합니다.</span>
								</td>
							</tr>
							<tr>
								<th rowspan="2">건물 층수</th>
								<th>건물 층수</th>
								<td>
									<select class="btn btn-sm btn-primary" name="wholeFloor" id="wholeFloor">
									  <option value="">건물 층수 선택</option>
									  <c:forEach var="a" begin="1" end="50" step="1">
									  	<option value="${a}">${a}층</option>
									  </c:forEach>
									</select>
								</td>
								<th rowspan="2">건물 크기(1P = 3.3058m2)</th>
								<th>공급 면적</th>
								<td><input name="gArea" id="gArea" onkeyup="checkNumber(this, 'double')" placeholder="ex) 27.4">평 (m2)</td>
							</tr>
							<tr>
								<th>해당 층수</th>
								<td>
									<select class="btn btn-sm btn-primary" name="floor" id="floor" onchange="checkFloor()">
									  <option value="">해당 층수 선택</option>
									  <option value="-1">반지하</option>
									  <option value="100">옥탑</option>
									  <c:forEach var="a" begin="1" end="50" step="1">
									  	<option value="${a}">${a}층</option>
									  </c:forEach>
									</select>
								</td>
								<th>전용 면적</th>
								<td><input name="jArea" id="jArea" onkeyup="checkNumber(this, 'double')" placeholder="ex) 17.9">평 (m2)</td>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
						</tbody>
					</table>
					<hr style="margin-top:0px">
				</div>
			</div>
		</div>
	</section>
	<section class="" name="addinfo">
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">추가정보</h2>
					<table class="table talbe-hover align-items-center" style="margin-bottom:0px">
						<tbody>
							<tr>
								<th rowspan="2">관리비</th>
								<td colspan="5">
									<input type="radio" name="costFeeT" value="1" onclick="$('#costFeeP').css('background-color','').removeAttr('readonly');$('#costFeeCB [type=checkbox]').prop('disabled',false)"> 있음 &nbsp;&nbsp;
									<input id="costFeeP" onkeyup="checkNumber(this, 'int')" placeholder="ex) 120000">&nbsp;만원 &nbsp; &nbsp;
									<input type="radio" name="costFeeT" value="0" onclick="$('#costFeeP').css('background-color','rgba(200, 200, 240, 0.1)').attr('readonly', true).val('');$('#costFeeCB [type=checkbox]').prop({'disabled':true, 'checked':false})"> 없음
									<input type="hidden" name="costFee" id="costFee">
								</td>
							</tr>
							<tr>
								<td colspan="5" id="costFeeCB">
									관리비포함 항목 선택&nbsp;:&nbsp;
									<input type="checkbox" id="internetT" value="1"> 인터넷 &nbsp; 
									<input type="checkbox" id="cost_tvT" value="1"> 유선TV &nbsp; 
									<input type="checkbox" id="cleanFeeT" value="1"> 청소비 &nbsp; 
									<input type="checkbox" id="waterFeeT" value="1"> 수도세 &nbsp; 
									<input type="checkbox" id="gasT" value="1"> 도시가스 &nbsp;
									<input type="checkbox" id="electricityT" value="1"> 전기세 &nbsp;
									<input type="hidden" id="internet" name="internet">
									<input type="hidden" id="cost_tv" name="cost_tv">
									<input type="hidden" id="cleanFee" name="cleanFee">
									<input type="hidden" id="waterFee" name="waterFee">
									<input type="hidden" id="gas" name="gas">
									<input type="hidden" id="electricity" name="electricity">
								</td> 
							</tr>
							<tr>
								<th>주차 여부</th>
								<td>
									<input type="radio" name="parkingT" value="1"> 가능&nbsp;&nbsp; 
									<input type="radio" name="parkingT" value="0"> 불가능&nbsp;
									<input type="hidden" name="parking" id="parking">
								</td>
								<th>난방종류</th>
								<td>
									<select class="btn btn-sm btn-primary" name="heat">
									  <option value="">난방 종류 선택</option>
									  <option value="center">중앙 난방</option>
									  <option value="individual">개별 난방</option>
									  <option value="region">지역 난방</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>엘리베이터</th>
								<td>
									<input type="radio" name="elevatorT" value="1">&nbsp;있음&nbsp;&nbsp;
									<input type="radio" name="elevatorT" value="0">&nbsp;없음
									<input type="hidden" name="elevator" id="elevator">
								</td>
								<th>반려동물</th>
								<td>
									<input type="radio" name="animalT" value="1">&nbsp;가능&nbsp;&nbsp;
									<input type="radio" name="animalT" value="0">&nbsp;불가능
									<input type="hidden" name="animal" id="animal">
								</td>
							</tr>
							<tr>
								<th>입주 가능일</th>
								<td colspan="5">
									<input type="date" name="moveDate">&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<th>옵션 항목</th>
								<td colspan="5">
									<input type="checkbox" id="airconT" value="1">&nbsp;에어컨&nbsp;&nbsp;
									<input type="checkbox" id="washingT" value="1">&nbsp;세탁기&nbsp;&nbsp;
									<input type="checkbox" id="bedT" value="1">&nbsp;침대&nbsp;&nbsp;
									<input type="checkbox" id="deskT" value="1">&nbsp;책상&nbsp;&nbsp;
									<input type="checkbox" id="closetT" value="1">&nbsp;옷장&nbsp;&nbsp;
									<input type="checkbox" id="option_tvT" value="1">&nbsp;TV&nbsp;&nbsp;
									<input type="checkbox" id="shoeRackT" value="1">&nbsp;신발장&nbsp;&nbsp;
									<input type="checkbox" id="fridgeT" value="1">&nbsp;냉장고&nbsp;&nbsp;
									<input type="checkbox" id="gasstoveT" value="1">&nbsp;가스레인지&nbsp;&nbsp;
									<input type="checkbox" id="inductionT" value="1">&nbsp;인덕션&nbsp;&nbsp; 
									<input type="checkbox" id="microwaveT" value="1">&nbsp;전자레인지&nbsp;&nbsp;
									<input type="checkbox" id="doorlockT" value="1">&nbsp;전자도어락&nbsp;&nbsp;
									<input type="checkbox" id="bidetT" value="1">&nbsp;비데
									<input type="hidden" id="aircon" name="aircon">
									<input type="hidden" id="washing" name="washing">
									<input type="hidden" id="bed" name="bed">
									<input type="hidden" id="desk" name="desk">
									<input type="hidden" id="closet" name="closet">
									<input type="hidden" id="option_tv" name="option_tv">
									<input type="hidden" id="shoerack" name="shoerack">
									<input type="hidden" id="fridge" name="fridge">
									<input type="hidden" id="gasstove" name="gasstove">
									<input type="hidden" id="induction" name="induction"> 
									<input type="hidden" id="microwave" name="microwave">
									<input type="hidden" id="doorlock" name="doorlock">
									<input type="hidden" id="bidet" name="bidet">
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="buildState" value="1">
					<input type="hidden" name="buildType" id="buildType">
					<hr style="margin-top:0px">
				</div>
			</div>
		</div>
	</section>
	<section class="" name="detailintro">
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">상세 설명</h2>
					<table class="table talbe-hover align-items-center" style="margin-bottom:0px">
						<tbody>
							<tr>
								<th>방 제목</th>
								<td>
									<input class="form-control" name="roomTitle" placeholder="예) 신논현역 도보 5분거리, 혼자 살기 좋은 방입니다." style="width:100%">
								</td>
							</tr>
							<tr>
								<th>상세 설명</th>
								<td><textarea class="form-control" name="explainText" placeholder="방에 대한 추가 설명을 적어주세요." style="width:100%" rows="10"></textarea></td> 
							</tr>
							<tr>
								<th>비공개 메모</th>
								<td><textarea class="form-control" name="privateMemo" placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다." style="width:100%" rows="5"></textarea></td> 
							</tr>
						</tbody>
					</table>
					<hr style="margin-top:0px">
				</div>
			</div>
		</div>
	</section>
	<section class="slice" name="uploadpic" >
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">사진 업로드</h2>
					<hr>
					<div>
						<div style="border:solid;color:red;padding:10px;border-width:1px;margin-bottom:20px">
							- 사진은 가로로 찍은 사진을 권장하고 최대 12장까지 권장합니다.<br>
							- 사진 용량은 사진 1장당 10MB까지 등록이 가능합니다.<br>
							- 사진의 확장자는 png, jpg, jpeg만 가능합니다.
						</div>
						<div id="picBgd" style="background-color:rgba(150, 150, 150, 0.1);height:400px;padding: 20px;">
								<div align="center">
									<span style="color:red">FullHouse 로고를 제외한 불필요한 정보(워터마크, 상호, 전화번호 등)가 있는 매물은 비공개 처리 됩니다.</span><br>

								    <div class="custom-file" style="margin: 15px 0 20px 0;">
								        <input type="file" class="custom-file-input" id="customFile" name="photo" id="photo" accept=".png, .jpg, .jpeg" onchange="readFile(this);" multiple>
										<label class="custom-file-label" for="customFile">사진을 올려주세요.</label>
								  	</div>
									<div id="status"></div>
									<div id="photos" class="row col-lg-10"></div>
						        </div>
					    </div>
				    </div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div>
			<div align="center" style="background-color:rgb(240, 0, 0);padding:15px"><span style="color:white">허위매물을 등록할 경우 Fullhouse에서 임의적으로 계정 및 매물 전체 삭제 처리되며, 결제된 금액은 환불되지 않습니다.</span></div>
			<div align="center" style="margin-top:20px;margin-bottom:50px">
				<input type="button" style="width:150px" class="btn btn-dark" value="취소">&nbsp;&nbsp;<input type="button" style="width:150px" class="btn btn-primary" value="방 올리기" onclick="submitBtn()">
			</div>
		</div>
	</div>
    </form>
    </main>
    <%@ include file="footer.jsp" %>
    <!-- 다음지도 관련  -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=services"></script>
	<script>

// 		window.onload = function(){
		    function checkNumber(x, type){
		    	if(type==="int") var regexp = /[^0-9]/g;
		    	else var regexp = /[^-\.0-9]/g; 	
		    	v = $(x).val();
		    	if(regexp.test(v) ) {
		    		alert("숫자만 입력해주세요.");
		    		$(x).val(v.replace(regexp,''));
		    	}
		    }
// 		}
	
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = fullAddr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        $("#lat").val(result.y);
	                        $("#lng").val(result.x);
	                        console.log(result.y+", "+ result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	    
		var uploadFiles = [];
		var z = 0;
	    function readFile(input) {
		    setInterval(function(){
		        if($("#photos").height() > 300)
		        	$('#picBgd').css("height", "auto");
		        else
		        	$('#picBgd').css("height", "400px");
		    }, 1000);
	      	$("#status").html('Processing...');
	        counter = input.files.length;
	   		for(x = 0; x<counter; x++){
	   			if (input.files && input.files[x]) {
// 		   			console.log("files["+x+"].name:  "+input.files[x].name);
	   				var reader = new FileReader();
	   				reader.onload = function (e) {
	           			$("#photos").append('<div class="photo" style="width:200px; height:150px;margin:7px"><img src="'+e.target.result+'" class="img-thumbnail" style="width:100%;height:100%"><button type="button" class="btn" onclick="removePic(this)" name="'+(z++)+'"> X </button></div>');
	   				};
	   				reader.readAsDataURL(input.files[x]);
	   				uploadFiles.push(input.files[x]);
// 	   				console.log(uploadFiles);
	   			}
	        }
	        if(counter == x) $("#status").html('');
// 	        console.log("uploadFiles.length: "+ uploadFiles.length);
	      }
	    function addPrice(kind){
	    	if(kind==='sell'){ // 매매
		    	if(!document.getElementById("addSellPrice")){
	    			$("#addPrice").append("<div id='addSellPrice' style='margin:10px'><span class='badge badge-lg badge-pill badge-primary' style='padding:10px'>매매</span><input style='padding:5px 10px 5px 10px; margin:0 10px 0 30px' name='salePrice' placeholder='매매'>&nbsp;만원&nbsp;&nbsp;&nbsp;&nbsp; <button class='btn btn-sm btn-danger sell' name='sellF' onclick='removeThis(this)'> X </button><br></div>");
	    			$("#addSellBtn").attr("disabled", "");
		    	}
	    	}else if(kind==='deposit'){ // 전세 
		    	if(!document.getElementById("addDepositPrice")){
	    			$("#addPrice").append("<div id='addDepositPrice' style='margin:10px'><span class='badge badge-lg badge-pill badge-primary' style='padding:10px'>전세</span><input style='padding:5px 10px 5px 10px; margin:0 10px 0 30px' name='lease' placeholder='전세'>&nbsp;만원&nbsp;&nbsp;&nbsp;&nbsp; <button class='btn btn-sm btn-danger' name='depositF' onclick='removeThis(this)'> X </button><br></div>");
	    			$("#addDepositBtn").attr("disabled", "");
		    	}
	    	}else{ // 월세
	    		$("#addPrice").append("<div class='addMonthlyPrice' style='margin:10px'><span class='badge badge-lg badge-pill badge-primary' style='padding:10px'>월세</span><input style='padding:5px 10px 5px 10px; margin:0 10px 0 30px' name='monthly' placeholder='보증금'>&nbsp;/&nbsp;<input style='padding:5px 10px 5px 10px; margin:0 10px 0 10px' name='deposit' placeholder='월세'>&nbsp;만원&nbsp;&nbsp;&nbsp;&nbsp; <button class='btn btn-sm btn-danger' name='monthlyF' onclick='removeThis(this)'> X </button><br></div>");
	    	}
	    }
	    
	  	function removeThis(x){
	  		if(x.name === 'sellF')
    			$("#addSellBtn").removeAttr("disabled", "");
	  		else if(x.name === 'depositF')
    			$("#addDepositBtn").removeAttr("disabled", "");
	  		x.parentNode.parentNode.removeChild(x.parentNode);
	  	}
	  	
	  	var delCount = 0;
	  	function removePic(x){
			if(confirm("선택한 사진을 지우시겠습니까?")){
				x.parentNode.parentNode.removeChild(x.parentNode);
				uploadFiles[x.name] = 0;
				delCount++;
			}else
				return;
		}
	  	function uploadImg(){
	  		var result = 0;
	  	    var files = JSON.stringify(uploadFiles);
	  	    
	  	 	var form = $('#uploadForm')[0];
	          var formData = new FormData(form);
	
	          for (var index = 0; index < Object.keys(uploadFiles).length; index++) {
	              //formData 공간에 files라는 이름으로 파일을 추가한다.
	              //동일명으로 계속 추가할 수 있다.
	              formData.append('uploadFiles',uploadFiles[index]);
	        }
	  	  
	  	    $.ajax({
	  	        type: 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
	  	        dataType: 'JSON',
	  	        data: formData,
	  	        url: 'imageupload.do',
	  	        success: function(json) {
	  	            console.log("사진 전송 성공");
	  	            if(json===-2){ // 10MB가 넘으면 -2를 return하는데, 이걸로 어떻게 submit을 막을까 ?, 현재는 테스트를 위해 1MB로 해놓음. - 다시 10MB로 바꿈.
	  	            	alert("10MB가 넘는 사진이 있습니다. 확인 후 다시 올려주세요.");
	  	            }
	  	        },
	  	        error: function(request,status,error){
	  	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  	        }
	  	    });

          	result=0;
	  	}
	  	function delIdel(){ // uploadFiles에 들어간 0을 삭제. (0은 삭제할 때 사용한 것) 
	  		for(var i=0; i<uploadFiles.length; i++){
	  			if(uploadFiles[i] === 0){
	  				uploadFiles.splice(i, 1);
	  				delIdel();
	  			}
	  		}
	  	}

		function checkFloor(){
			if($("#floor")[0].selectedIndex > ($("#wholeFloor")[0].selectedIndex+2)){
				alert("건물층수보다 높은 층을 선택할 수 없습니다.");
				$("#floor").val("");
			}
		}
		function checkOutBlank(){
			if($("#address").val() === ""){
				alert('주소를 입력해주세요.');
				$("#searchingBtn").focus();
				return 0;
			}else if($("#detailAddress").val() === "") {
				alert("상세주소를 입력해주세요.");
				$("#detailAddress").focus();
				return 0;
			}else if($("#proType").val()===""){
				alert("방 종류를 선택해주세요");
				$("#proType").focus();
				return 0;
			}else if($("#addPrice").children().length<2){
				alert("가격을 추가해주세요.");
				$("#addSellBtn").focus();
				return 0;
			}else if($("#addSellPrice input").val()===""){
				alert("매매 가격을 입력해주세요.");
				$("#addDepositPrice").focus();
				return 0;
			}else if($("#addDepositPrice input").val()===""){
				alert("전세 가격을 입력해주세요.");
				$("#addDepositPrice").focus();
				return 0;
			}else if($(".addMonthlyPrice").length >=1){
				for(var i=0; i<$(".addMonthlyPrice").length; i++){
					if($(".addMonthlyPrice [name=deposit]:eq("+i+")").val()==="" || $(".addMonthlyPrice [name=monthly]:eq("+i+")").val()===""){
						alert("월세 가격을 입력해주세요.");
						$("#addMonthlyBtn").focus();
						return 0;			
					}
				}
			}
			if($("#wholeFloor").val()===""){
				alert("건물층수를 선택해주세요.");
				$("#wholeFloor").focus();
				return 0;
			}else if($("#floor").val()===""){
				alert("해당층수를 선택해주세요.");
				$("#floor").focus();
				return 0;
			}else if($("#gArea").val()===""){
				alert("공급면적을 입력해주세요.");
				$("#gArea").focus();
				return 0;
			}else if($("#jArea").val()===""){
				alert("전용면적을 입력해주세요.");
				$("#jArea").focus();
				return 0;
			}else if($("input[name=costFeeT]:checked").length===0){
				alert("관리비의 유무를 체크해주세요.");
				$("#costFeeP").focus();
				return 0;
			}else if($("input[name=costFeeT]:checked").val()==="1" && $("#costFeeP").val()===""){
				alert("관리비를 입력해주세요.");
				$("#costFeeP").focus();
				return 0;
			}else if($("#costFeeCB [type=checkbox]:checked").length==0 && $("[name=costFeeT]:checked").val()==="1"){
				alert("관리비포함 항목을 적어도 1개는 선택해주세요.");
				$("[name=parkingT]").focus();
				return 0;
			}else if($("[name=parkingT]:checked").length===0){
				alert("주차여부를 체크해주세요.");
				$("[name=parkingT]").focus();
				return 0;
			}else if($("[name=heat]").val()===""){
				alert("난방종류를 선택해주세요.");
				$("[name=heat]").focus();
				return 0;
			}else if($("[name=elevatorT]:checked").length===0){
				alert("엘리베이터의 유무를 선택해주세요.");
				$("[name=elevatorT]").focus();
				return 0;
			}else if($("[name=animalT]:checked").length===0){
				alert("반려동물의 유무를 선택해주세요.");
				$("[name=animalT]").focus();
				return 0;
			}else if($("[name=moveDate]").val()===""){
				alert("입주가능일을 선택해주세요.");
				$("[name=moveDate]").focus();
				return 0;
			}else if($("[name=roomTitle]").val()===""){
				alert("방 설명의 제목을 선택해주세요.");
				$("[name=roomTitle]").focus();
				return 0;
			}else if($("[name=explainText]").val()===""){
				alert("방 설명의 내용을 입력해주세요.");
				$("[name=explainText]").focus();
				return 0;
			}else if($("#photos").children().length===0){
				alert("최소한 1장의 사진을 올려주세요.");
				$("#customFile").focus();
				return 0;
			}

		}
		
		function chooseBuildType(a, b, c){
	    	if(a==0 && b==0 && c>=1) return 1;
	    	if(a==0 && b==1 && c==0) return 2;
	    	if(a==1 && b==0 && c==0) return 3;
	    	if(a==0 && b==1 && c>=1) return 4;
	    	else return 7;
	    }
		
	    function submitBtn(){
	    	if(checkOutBlank()===0){
	    		return;
	    	};
	    	delIdel();
	    	var wholeAddr = $("#address").val() +"_fhs_"+ $("#detailAddress").val();

	    	uploadImg();
	    	$("#realAddr").val(wholeAddr);
	    	
	    	// 관리비
	    	if($('input[name=costFeeT]:checked').val()==="1") $("#costFee").val($("#costFeeP").val());
	    	else $("[name=costFee]").val(0); 
	    	
			// 관리비옵션
			if($("#internetT:checked").val()==="1") $("#internet").val(1);
			else $("#internet").val(0);
			if($("#cost_tvT:checked").val()==="1") $("#cost_tv").val(1);
			else $("#cost_tv").val(0);
			if($("#cleanFeeT:checked").val()==="1") $("#cleanFee").val(1);
			else $("#cleanFee").val(0);
			if($("#waterFeeT:checked").val()==="1") $("#waterFee").val(1);
			else $("#waterFee").val(0);
			if($("#gasT:checked").val()==="1") $("#gas").val(1);
			else $("#gas").val(0);
			if($("#electricityT:checked").val()==="1") $("#electricity").val(1);
			else $("#electricity").val(0);
			
	    	// 주차
	    	if($('input[name=parkingT]:checked').val()==="1") $("#parking").val(1);
	    	else $("[name=parking]").val(0);
			
	    	// 엘리베이터 
	    	if($('input[name=elevatorT]:checked').val()==="1") $("#elevator").val(1);
	    	else $("[name=elevator]").val(0);
	    	
	    	// 반려동물
	    	if($('input[name=animalT]:checked').val()==="1") $("#animal").val(1);
	    	else $("[name=animal]").val(0);
	    	
	    	// 옵션항목
			if($("#airconT:checked").val()==="1") $("#aircon").val(1);
			else $("#aircon").val(0);
			if($("#washingT:checked").val()==="1") $("#washing").val(1);
			else $("#washing").val(0);
			if($("#bedT:checked").val()==="1") $("#bed").val(1);
			else $("#bed").val(0);
			if($("#deskT:checked").val()==="1") $("#desk").val(1);
			else $("#desk").val(0);
			if($("#closetT:checked").val()==="1") $("#closet").val(1);
			else $("#closet").val(0);
			if($("#option_tvT:checked").val()==="1") $("#option_tv").val(1);
			else $("#option_tv").val(0);
			if($("#shoeRackT:checked").val()==="1") $("#shoerack").val(1);
			else $("#shoerack").val(0);
			if($("#fridgeT:checked").val()==="1") $("#fridge").val(1);
			else $("#fridge").val(0);
			if($("#gasstoveT:checked").val()==="1") $("#gasstove").val(1);
			else $("#gasstove").val(0);
			if($("#inductionT:checked").val()==="1") $("#induction").val(1);
			else $("#induction").val(0);
			if($("#microwaveT:checked").val()==="1") $("#microwave").val(1);
			else $("#microwave").val(0);
			if($("#doorlockT:checked").val()==="1") $("#doorlock").val(1);
			else $("#doorlock").val(0);
			if($("#bidetT:checked").val()==="1") $("#bidet").val(1);
			else $("#bidet").val(0);

			$("#buildType").val(chooseBuildType($("#addSellPrice").length, $("#addDepositPrice").length, $(".addMonthlyPrice").length));
			alert("success");
	    	$("#formId").submit();
	    }
	    
	    
	</script>
	
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