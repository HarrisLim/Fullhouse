<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>공인중개사 계정 관리</title>
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
		$(document).ready(function(){
			$("#modifyBtn").click(function() {
				$("#certiPhone").css("display","");
				$("#certiPhoneBtn").css("display","");
				$("#modifyBtn").text("인증"); // 인증번튼 누르면 실제로 핸드폰번호로 인증메시지 보내는 거 할건데, "인증"으로 바꾸는 부분에서 class추가해서 class에 기능 추가해서 위의 "변경"버튼과 구분하자.
				$(".phoneNum").removeAttr("readonly");
				$(".phoneNum").css("background","white");
			});
		});
		
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
	                document.getElementById('address2').focus();
	            }
	        }).open();
	    }
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
								<td colspan="2"><input value="스테이션4중개사무소" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
							</tr>
							<tr>
								<th>중개등록번호</th>
								<td colspan="2"><input value="123-456-123456789" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
							</tr>
							<tr>
								<th>사업자 등록번호</th>
								<td colspan="2"><input class="phoneNum" value="1234" readonly>&nbsp;-&nbsp;<input class="phoneNum" value="5678" readonly>&nbsp;-&nbsp;<input class="phoneNum" value="123245567" readonly></td>
							</tr>
							<tr>
								<th rowspan="2">중개사무소 주소</th>
								<td><input type="text" id="postcode" value="48060"></td>
								<td><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
							</tr>
							<tr>
								<td><input type="text" id="address" style="width:100%" value="부산 해운대구 APEC로 30 (우동, 벡스코제2전시장)"></td>
								<td><input type="text" id="address2" style="width:100%" value="바다가고 싶다"> </td> 
							</tr>
							<tr>
								<th>공인중개사 대표자명</th>
								<td colspan="2"><input style="background:rgba(200,200,240,0.1); width:100%" value="임정수" readonly></td>
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
								<td>사진 변경하는 거 넣자.</td>
							</tr>
							<tr>
								<th>성명</th>
								<td><input value="text" style="width:100%"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input value="text@.text.com" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
							</tr>
							<tr>
								<th rowspan="2">휴대폰번호</th>
								<td><input class="phoneNum" value="010" readonly>&nbsp;-&nbsp;<input class="phoneNum" value="3333" readonly>&nbsp;-&nbsp;<input class="phoneNum" value="2222" readonly></td>
								<td><button id="modifyBtn" class="btn btn-outline-primary">변경</button></td>
							</tr>
							<tr>
								<td id="certiPhone" style="display:none"><input placeholder="인증번호 입력해주세요" style="width:100%"></td>
								<td id="certiPhoneBtn" style="display:none"><button class="btn btn-outline-primary">인증번호 확인</button></td>
							</tr>
							<tr>
								<th>대표번호</th>
								<td><input value="02">&nbsp;-&nbsp;<input value="1234">&nbsp;-&nbsp;<input value="1234"></td>
							</tr>
							<tr>
								<th rowspan="3">비밀번호 변경</th>
								<td><input placeholder="현재 비밀번호" style="width:100%"></td> 
							</tr>
							<tr>
								<td><input placeholder="변경될 비밀번호" style="width:100%"></td>
							</tr>
							<tr>
								<td><input placeholder="변경될 비밀번호 확인" style="width:100%"></td>
							</tr>
						</tbody>
					</table>
					<div align="center" style="margin-top:20px;margin-bottom:50px">
						<input class="btn btn-dark" value="취소">&nbsp;&nbsp;<input class="btn btn-primary" value="확인">
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