<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
  <link rel="apple-touch-icon" sizes="76x76" href="../kanu/main/로고.png">
  <link rel="icon" type="image/png" href="../kanu/main/로고.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    MyInfo : FullHouse
  </title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    <link href="../kanu/slidephotos/ninja-slider.css" rel="stylesheet" type="text/css" />
    <script src="../kanu/slidephotos/ninja-slider.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script>
		/*$(document).ready(function(){
			$("#modifyBtn").click(function() {
				$("#certiPhone").css("display","");
				$("#certiPhoneBtn").css("display","");
				$("#modifyBtn").text("인증"); // 인증번튼 누르면 실제로 핸드폰번호로 인증메시지 보내는 거 할건데, "인증"으로 바꾸는 부분에서 class추가해서 class에 기능 추가해서 위의 "변경"버튼과 구분하자.
				$(".phoneNum").removeAttr("readonly");
				$(".phoneNum").css("background","white");
			});
		}); */
		/* bd 에서 스태프 정보 가져오기
		$(function(){
		 $.ajax({
			 type:'POST',
			 url:
		 })
			
		} */

	    
	    function readFile(input) {
   			if (input.files && input.files[0]) {
   				var reader = new FileReader();
   				reader.onload = function (e) {
           			$("#pho").empty().append('<img src="'+e.target.result+'" class="img-thumbnail" style="width:100%;height:100%;z-index:10">');
   				};
   				reader.readAsDataURL(input.files[0]);
   			}
	      }
		
		// 다음 주소찾기 
		function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
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

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address').value = fullAddr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById('address').focus();
	            }
	        }).open();
	    }
		
		$(function(){
			//공인중개사 값 채우기
			
			
			// 폰 번호 나눠 넣기 ~
			var str = $('#stPhone').val();
			var sharePh = str.split("-", 3);
			
			$("#p1").val(sharePh[0]);
			$("#p2").val(sharePh[1]);
			$("#p3").val(sharePh[2]);
			
			var str2 = $('#stHomePhone').val();
			var sharePh2 = str2.split("-", 3);
			
			$("#op1").val(sharePh2[0]);
			$("#op2").val(sharePh2[1]);
			$("#op3").val(sharePh2[2]);
			
			var str3 = $('#lrno').val();
			var sharePh3 = str3.split("-");
			
			$("#lrno1").val(sharePh3[0]);
			$("#lrno2").val(sharePh3[1]);
			$("#lrno3").val(sharePh3[2]);
			
			var str4 = $('#estateaddr').val();
			if(str4.includes("_fhs_")){
				var sharePh4 = str4.split("_fhs_");
				var st = sharePh4[0] + " " + sharePh4[1];
				$("#address").val(st);
			}else{
				$("#address").val(str4);
			}
			
			
			
			
			// 프로 내 계정 정보 변경 전 정보확인 스크립트
			$('#proinfoB1').click(function(){
				if( $('#nowPw').val() == "" ){
					alert ("현재 비밀번호가 비어있습니다! 확인해주세요. ")
					$('#nowPw').focus();
					return;
				}
				if( $('#changePw1').val() == "" || $('#changePw12').val() == "" ){
					alert ("변경할 비밀번호가 비어 있습니다! 확인해주세요.")
					$('#changePw1').focus();
					return;
				}
				
				var value2 = $('#postcode').val();
				value2 += "-";
				value2 += $('#estateaddr1').val();
				value2 += "-";
				value2 += $('#estateaddr2').val();
				$('#estateaddr').val(value2);
				
				var arr = {};
				arr['st_email'] = $('#st_Email').val();
				arr['st_pw'] = $('#nowPw').val();
				arr['estateaddr'] = $('#estateaddr').val();
				arr['estate_no'] = $('#estate_no').val();
				var array = JSON.stringify(arr);
				$.ajax({
					contentType:'application/json', 
					type:'POST',
					dataType:'json',
					url:'chkproinfo.do',
					data: array,
					success : function(responseData){
						alert ( "responseData.count : " + responseData.count )
						if( responseData.count == 0) {
							alert ( '현재 비밀번호가 틀립니다.' )
							return;
						}else{
							if( $('#changePw1').val() != $('#changePw2').val() ){
								alert( '변경할 비밀번호가 동일 하지 않습니다.' )
								$('#changePw1').focus();
								return;
							}else{
								alert( '??' )
							}
						}
					}
				})
				/* proinfo.action="changeproinfo.do";
				$("#proinfo").submit(); */
			});
		});
	</script>
	<style>
		th{
			background:rgba(200,200,240,0.1);
			padding:10px;
		}
		td{
			padding:10px;
		}
		tr input{
			padding:5px 10px 5px 10px;
		}
		.phoneNum{
			background:rgba(200,200,240,0.1);
		}
	</style>
  </head>
  <body>
    <%@ include file ="nav.jsp" %>
    <main class="main">
    <section class="slice" name="esateinfo" style="padding-bottom:0px"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">공인중개사 계정</h2>
				</div>
			</div>
		</div>
	</section>
	<form id="proinfo" method="POST">
	    <section class="" name="buildinginfo"> 
			<div class="container">
				<div class="justify-content-center">
					<div class="pt-lg-md">
						<h2 class="h3 mb-4">공인중개소 정보</h2>
						<hr size="5" color="black">
						<table>
							<tbody>
								<tr>
									<th>중개사무소명</th>
									<td colspan="2"><input id="estate_name" name="estate_name" value="${estate.estate_name}" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
								</tr>
								<tr>
									<th>중개등록번호</th>
									<td colspan="2"><input id="erno" name="erno" value="${estate.erno}" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
								</tr>
								<tr>
									<th>사업자 등록번호</th>
									<td colspan="2"><input id="lrno1" name="lrno1" class="phoneNum" value="" readonly>
									&nbsp;-&nbsp;<input id="lrno2" name="lrno2" class="phoneNum" value="" readonly>
									&nbsp;-&nbsp;<input id="lrno3" name="lrno3" class="phoneNum" value="" readonly>
									<input type="hidden" id="lrno" name="lrno" class="phoneNum" value="${estate.lrno}" readonly></td>
								</tr>
								<tr>
									<th>중개사무소 주소</th>
									<td><input type="hidden" id="postcode" value="48060"><input type="text" id="address" style="width:100%" value="" onclick="alert('주소검색을 통해서 입력해주세요')" readonly></td>
									<td><input type="button" onclick="execDaumPostcode()" value="주소검색"><input type="hidden" id="estateaddr"  name="estateaddr" style="width:100%" value="${estate.estateaddr}"></td>
								</tr>
								<tr>
									<th>공인중개사 대표자명</th>
									<td colspan="2"><input id="owner_name" name="owner_name" style="background:rgba(200,200,240,0.1); width:100%" value="${estate.owner_name}" readonly></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
		<section class="" name="staffinfo"> 
			<div class="container">
				<div class="justify-content-center">
					<div class="pt-lg-md">
						<h2 class="h3 mb-4">직원 정보</h2>
						<hr size="5" color="black">
						<table>
							<tbody>
								<tr>
									<th>프로필</th>
									<td>
										<div id="photo" data-toggle="tooltip" title="클릭하여 사진을 추가해주세요." style="position:relative;width:77px;height:102px;border:1px solid;background-image:url('../kanu/images/picImage.png');">
											<input type="file" style="height:100px" class="custom-file-input" id="customFile" name="photo" accept=".png, .jpg, .jpeg"  onchange="readFile(this);" >
											<div id="pho" style="width:75px;height:100px;position:absolute;top:0px;">
											</div>
										</div>
									</td>
									<td><input type="hidden" id="Estate_no" name="Estate_no" value="${sessionScope.st.estate_no}" style="background:rgba(200,200,240,0.1); width:100%" readonly/></td>
								</tr>
								<tr>
									<th>성명</th>
									<td><input id="st_name" name="st_name" value="${sessionScope.st.st_name.substring(2)}" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input id="st_email" name="st_email" value="${sessionScope.st.st_email}" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
								</tr>
								<tr>
									<th rowspan="2">휴대폰번호</th>
									<td><input id="p1" class="phoneNum" value="" readonly>
									&nbsp;-&nbsp;<input id="p2" class="phoneNum" value="" readonly>
									&nbsp;-&nbsp;<input id="p3" class="phoneNum" value="" readonly>
									<input type="hidden" id="stPhone" class="phoneNum" value="${sessionScope.st.st_phone}" readonly></td>
									<!-- <td><button id="modifyBtn" class="btn btn-outline-primary">변경</button></td> -->
								</tr>
								<tr>
									<td id="certiPhone" style="display:none"><input placeholder="인증번호 입력해주세요" style="width:100%"></td>
									<td id="certiPhoneBtn" style="display:none"><button class="btn btn-outline-primary">인증번호 확인</button></td>
								</tr>
								<tr>
									<th>대표번호</th>
									<td><input id="op1" value="">
									&nbsp;-&nbsp;<input id="op2" value="">
									&nbsp;-&nbsp;<input id="op3" value="">
									<input type="hidden" id="stHomePhone" class="phoneNum" value="${sessionScope.st.st_homephone}" readonly></td>
								</tr>
								<tr>
									<th rowspan="3">비밀번호 변경</th>
									<td><input id="nowPw" name="nowPw" placeholder="현재 비밀번호" style="width:100%"></td> 
								</tr>
								<tr>
									<td><input id="changePw1" name="st_pw" placeholder="변경될 비밀번호" style="width:100%"></td>
								</tr>
								<tr>
									<td><input id="changePw2" name="changePw2" placeholder="변경될 비밀번호 확인" style="width:100%"></td>
								</tr>
							</tbody>
						</table>
						<div align="center" style="margin-top:20px;margin-bottom:50px">
							<input type="button" id="proinfoB2" class="btn btn-dark" value="취소" onclick="location.href='main.do'">&nbsp;&nbsp;
							<input type="button" id="proinfoB1" class="btn btn-primary" value="확인">
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
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