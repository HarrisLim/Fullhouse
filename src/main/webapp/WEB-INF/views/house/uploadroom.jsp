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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
						- 부동산 중개사는 직거래 매물을 등록할 수 없으며, 공인중개사회원 가입 후 이용하시기 바랍니다. <br>
					</p>
				</div>
			</div>
		</div>
	</section>
	<section class="" name="location">
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">위치정보</h2>
					<table class="table talbe-hover align-items-center" style="margin-bottom:0px">
						<tbody>
							<tr>
								<th scope="row" rowspan="6" style="width:100px">주소</th>
							</tr>
							<tr class="bg-white" scope="row">
								<td class="col-5" colspan="2">도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</td>
								<td rowspan="6" style="width:300px"><div id="map" style="width:300px;height:300px;margin-top:10px;"></div></td>
							</tr>
							<tr>
								<td><input type="text" id="address" placeholder="예) 번동 10-1, 강북구 번동" style="width:380px"></td>
								<td><input type="button" value="주소검색" onclick="execDaumPostcode()"></td>
							</tr>
							<tr>
								<td colspan="2"><input style="width:480px;height:50px"></td>
							</tr>
							<tr>
								<td colspan="2"><input placeholder="상세 주소를 입력해주세요. (동, 호수)" style="width:480px"></td>
							</tr>
							<tr>
								<td colspan="2"><a href="#">주소가 검색되지 않으세요? (이거 할지 말지 고민 )</a></td>
							</tr>
						</tbody>
					</table>
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
									<select>
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
									다방에서는 고시원(텔)등의 고시원업 매물 등록을 제한합니다. (차단조치) 
								</td>
							</tr>
							<tr>
								<th rowspan="2">거래 종류</th>
								<td colspan="5">
									<input type="button" value="매매 추가">&nbsp;&nbsp;
									<input type="button" value="전세 추가">&nbsp;&nbsp;
									<input type="button" value="월세 추가">
								</td>
							</tr>
							<tr>
								<td colspan="5"><span style="color:red">거래종류를 추가해주세요. 다중 선택이 가능합니다.</span></td>
							</tr>
							<tr>
								<th rowspan="2">건물 층수</th>
								<th>건물 층수</th>
								<td>
									<select>
									  <option value="">건물 층수 선택</option>
									  <option value="first">1층</option>
									  <option value="second">2층</option>
									  <option value="third">3층</option>
									  <option value="fourth">4층</option>
									  <option value="fifth">5층</option>
									  <option value="sixth">6층</option>
									  <option value="seventh">7층</option>
									  <option value="eighth">8층</option>
									  <option value="ninth">9층</option>
									  <option value="tenth">10층</option>
									  <option value="eleventh">11층</option>
									  <option value="twelfth">12층</option>
									  <option value="thirteenth">13층</option>
									  <option value="fourteenth">14층</option>
									  <option value="fifteenth">15층</option>
									  <option value="sixteenth">16층</option>
									  <option value="seventeenth">17층</option>
									  <option value="eighteenth">18층</option>
									  <option value="nineteenth">19층</option>
									  <option value="twentieth">20층</option>
									  <option value="twentyfirst">21층</option>
									  <option value="twentysecond">22층</option>
									  <option value="twentythird">23층</option>
									  <option value="fourth">24층</option>
									  <option value="twentyfifth">25층</option>
									  <option value="twentysixth">26층</option>
									  <option value="twentyseventh">27층</option>
									  <option value="twentyeighth">28층</option>
									  <option value="twentyninth">29층</option>
									  <option value="thirtieth">30층</option>
									  <option value="thirtyfirst">31층</option>
									  <option value="thirtysecond">32층</option>
									  <option value="thirtythird">33층</option>
									  <option value="thirtyfourth">34층</option>
									  <option value="thirtyfifth">35층</option>
									  <option value="thirtysixth">36층</option>
									  <option value="thirtyseventh">37층</option>
									  <option value="thirtyeighth">38층</option>
									  <option value="thirtyninth">39층</option>
									  <option value="fortieth">40층</option>
									  <option value="thirtyfirst">41층</option>
									  <option value="thirtysecond">42층</option>
									  <option value="thirtythird">43층</option>
									  <option value="thirtyfourth">44층</option>
									  <option value="thirtyfifth">45층</option>
									  <option value="thirtysixth">46층</option>
									  <option value="thirtyseventh">47층</option>
									  <option value="thirtyeighth">48층</option>
									  <option value="thirtyninth">49층</option>
									  <option value="fiftieth">50층</option>
									</select>
								</td>
								<th rowspan="2">건물 크기(1P = 3.3058m2)</th>
								<th>공급 면적</th>
								<td><input>평 (m2)</td>
							</tr>
							<tr>
								<th>해당 층수</th>
								<td>
									<select>
									  <option value="">해당 층수 선택</option>
									  <option value="underground">반지하</option>
									  <option value="looptop">옥탑</option>
									  <option value="first">1층</option>
									  <option value="first">1층</option>
									  <option value="second">2층</option>
									  <option value="third">3층</option>
									  <option value="fourth">4층</option>
									  <option value="fifth">5층</option>
									  <option value="sixth">6층</option>
									  <option value="seventh">7층</option>
									  <option value="eighth">8층</option>
									  <option value="ninth">9층</option>
									  <option value="tenth">10층</option>
									  <option value="eleventh">11층</option>
									  <option value="twelfth">12층</option>
									  <option value="thirteenth">13층</option>
									  <option value="fourteenth">14층</option>
									  <option value="fifteenth">15층</option>
									  <option value="sixteenth">16층</option>
									  <option value="seventeenth">17층</option>
									  <option value="eighteenth">18층</option>
									  <option value="nineteenth">19층</option>
									  <option value="twentieth">20층</option>
									  <option value="twentyfirst">21층</option>
									  <option value="twentysecond">22층</option>
									  <option value="twentythird">23층</option>
									  <option value="fourth">24층</option>
									  <option value="twentyfifth">25층</option>
									  <option value="twentysixth">26층</option>
									  <option value="twentyseventh">27층</option>
									  <option value="twentyeighth">28층</option>
									  <option value="twentyninth">29층</option>
									  <option value="thirtieth">30층</option>
									  <option value="thirtyfirst">31층</option>
									  <option value="thirtysecond">32층</option>
									  <option value="thirtythird">33층</option>
									  <option value="thirtyfourth">34층</option>
									  <option value="thirtyfifth">35층</option>
									  <option value="thirtysixth">36층</option>
									  <option value="thirtyseventh">37층</option>
									  <option value="thirtyeighth">38층</option>
									  <option value="thirtyninth">39층</option>
									  <option value="fortieth">40층</option>
									  <option value="thirtyfirst">41층</option>
									  <option value="thirtysecond">42층</option>
									  <option value="thirtythird">43층</option>
									  <option value="thirtyfourth">44층</option>
									  <option value="thirtyfifth">45층</option>
									  <option value="thirtysixth">46층</option>
									  <option value="thirtyseventh">47층</option>
									  <option value="thirtyeighth">48층</option>
									  <option value="thirtyninth">49층</option>
									  <option value="fiftieth">50층</option>
									</select>
								</td>
								<th>전용 면적</th>
								<td><input>평 (m2)</td>
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
									<input type="checkbox"> 있음 &nbsp;&nbsp;
									<input>&nbsp;만원 &nbsp; &nbsp;
									<input type="checkbox" checked> 없음
								</td>
							</tr>
							<tr>
								<td colspan="5">
									관리비포함 항목 선택&nbsp;:&nbsp;<input type="checkbox"> 인터넷 &nbsp; 
									<input type="checkbox"> 유선TV &nbsp; 
									<input type="checkbox"> 청소비 &nbsp; 
									<input type="checkbox"> 수도세 &nbsp; 
									<input type="checkbox"> 도시가스 &nbsp; 
									<input type="checkbox"> 전기세 &nbsp;
								</td> 
							</tr>
							<tr>
								<th>주차 여부</th>
								<td>
									<input type="checkbox"> 가능&nbsp;&nbsp; 
									<input>&nbsp;만원 &nbsp;&nbsp;
									<input type="checkbox" checked> 불가능&nbsp;
								</td>
								<th>난방종류</th>
								<td>
									<select>
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
									<input type="checkbox">&nbsp;있음&nbsp;&nbsp;
									<input type="checkbox" checked>&nbsp;없음
								</td>
								<th>반려동물</th>
								<td>
									<input type="checkbox">&nbsp;가능&nbsp;&nbsp;
									<input type="checkbox" checked>&nbsp;불가능
								</td>
							</tr>
							<tr>
								<th>입주 가능일</th>
								<td colspan="5">
									<input type="date">&nbsp;&nbsp;&nbsp;
									<input type="checkbox">&nbsp;즉시 입주&nbsp;&nbsp;
									<input type="checkbox">&nbsp;날짜 협의  
								</td>
							</tr>
							<tr>
								<th>옵션 항목</th>
								<td colspan="5">
									<input type="checkbox">&nbsp;에어컨&nbsp;&nbsp;
									<input type="checkbox">&nbsp;세탁기&nbsp;&nbsp;
									<input type="checkbox">&nbsp;침대&nbsp;&nbsp;
									<input type="checkbox">&nbsp;책상&nbsp;&nbsp;
									<input type="checkbox">&nbsp;옷장&nbsp;&nbsp;
									<input type="checkbox">&nbsp;TV&nbsp;&nbsp;
									<input type="checkbox">&nbsp;신발장&nbsp;&nbsp;
									<input type="checkbox">&nbsp;냉장고&nbsp;&nbsp;
									<input type="checkbox">&nbsp;가스레인지&nbsp;&nbsp;
									<input type="checkbox">&nbsp;인덕션&nbsp;&nbsp; 
									<input type="checkbox">&nbsp;전자레인지&nbsp;&nbsp;
									<input type="checkbox">&nbsp;전자도어락&nbsp;&nbsp;
									<input type="checkbox">&nbsp;비데
								</td>
							</tr>
						</tbody>
					</table>
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
									<input placeholder="예) 신논현역 도보 5분거리, 혼자 살기 좋은 방입니다." style="width:100%">
								</td>
							</tr>
							<tr>
								<th>상세 설명</th>
								<td><textarea placeholder="방에 대한 추가 설명을 적어주세요." style="width:100%" rows="10"></textarea></td> 
							</tr>
							<tr>
								<th>비공개 메모</th>
								<td><textarea placeholder="외부에 공개되지 않으며, 등록자에게만 보이는 메모입니다." style="width:100%" rows="5"></textarea></td> 
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
							- 사진은 가로로 찍은 사진을 권장합니다.<br>
							- 사진 용량은 사진 1장당 10MB까지 등록이 가능합니다.<br>
							- 사진을 최소 3장 이상 등록해야하며, 최대 15장까지 권장합니다.<br> 
						</div>
						<div style="background-color:rgba(150, 150, 150, 0.1);height:400px">
							<form name="fileForm" method="post" enctype="multipart/form-data">
								<div align="center">
									실시간 최소 3장 이상 등록하셔야 하며, 가로 사진을 권장합니다. <br>
									<span style="color:red">다방 로고를 제외한 불필요한 정보(워터마크, 상호, 전화번호 등)가 있는 매물은 비공개 처리 됩니다.</span><br>
									여기에 다방사이트 보고 수정하자. 이거는 파일 올리는 버튼도 다르고 다른 점이 많아. 
							        <input multiple="multiple" type="file" name="file" title="일반 사진 등록" />
						        </div>
						    </form>
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
				<input class="btn btn-dark" value="취소">&nbsp;&nbsp;<input class="btn btn-primary" value="방 올리기">
			</div>
		</div>
	</div>
    </main>
    <%@ include file="footer.jsp" %>
    <!-- 다음지도 관련  -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=920b18ed9b88780f730ccf0faa6707f7&libraries=services"></script>
	<script>
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
	                        
	                        
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)

	                        $.ajax({
	                            url : "", // 보내는 컨트롤러 
	                            type : "post",
	                            data : {latLng : coords}
	                        });
	                    }
	                });
	            }
	        }).open();
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