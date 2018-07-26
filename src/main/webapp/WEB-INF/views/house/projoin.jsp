<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
	    <meta name="author" content="Webpixels">
	    <title>공인중개사 회원가입</title>
	    <!-- Fonts -->
	    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
	    <!-- Theme CSS -->
	    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
	    <!-- Demo CSS - No need to use these in your project -->
	    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
	    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	    <script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>

	    
		<script>
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
			/* 파일 업로드 스크립트 */
			 function uploadFile(){
	                var form = $('#FILE_FORM')[0];
	                var formData = new FormData(form);
	                formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
	                formData.append("fileObj2", $("#FILE_TAG2")[0].files[0]);
	 
	                $.ajax({
	                    url: '',
	                            processData: false,
	                            contentType: false,
	                            data: formData,
	                            type: 'POST',
	                            success: function(result){
	                                alert("업로드 성공!!");
	                            }
	                    });
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
			.container {
			  padding-right: 15px;
			  padding-left: 15px;
			  margin-right: auto;
			  margin-left: auto;
			}
		</style>
	</head>
  	<body>
		<%@ include file="nav.jsp"%>

    <main class="main">
	<section class="slice"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-sm">
					<h3 class="h1 mb-5">공인 중개사 정보 입력</h3>
					<hr size="5" color="black">
					<table>
						<tbody>
							<tr>
								<th>중개 사무소명</th>
								<td><input value="@@@" style="background:rgba(200,200,240,0.1); width:75%"></td>
							</tr>
							<tr>
								<th>중개 등록번호</th>
								<td><input value="text" style="width:50%">
									<button type="button" class="btn btn-sm btn-outline-primary btn-icon" style="width:25%">
									    <span class="btn-inner--text">중개등록증 첨부</span>
									    <span class="btn-inner--icon"><i class="fas fa-user"></i></span>
									</button>
						        <!-- <form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
						            <input type="file" id="FILE_TAG" name="FILE_TAG">
						            <input type="file" id="FILE_TAG2" name="FILE_TAG2">
						            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a> -->
							        </form>
								</td>
							</tr>
							<tr>
								<th>사업자 등록번호</th>
								<td><input style="width:10%">&nbsp;-&nbsp;<input style="width:10%">&nbsp;-&nbsp;<input style="width:10%">
									<button id="modifyBtn" class="btn btn-sm btn-outline-primary">인증</button>
									<button type="button" class="btn btn-sm btn-outline-primary btn-icon disabled">
									    <span class="btn-inner--text" >사업자등록증 첨부</span>
									    <span class="btn-inner--icon"><i class="fas fa-user"></i></span>
									</button>
								</td>
							</tr>
							<tr>
								<th rowspan="2">중개 사무소 주소</th>
								<td><input type="text" id="postcode" value="48060">
								<input class="btn btn-sm btn-outline-primary" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
							</tr>
							<tr>
								<td><input type="text" id="address" style="width:35%" value="ㄱ ㅏ 즈 ㅇ ㅏ">
								<input type="text" id="address2" style="width:35%" value="ㄱ ㅏ 즈 ㅇ ㅏ"> </td> 
							</tr>
							<tr>
								<th>중개사 대표자명</th>
								<td><input value="아무개" style="background:rgba(200,200,240,0.1); width:75%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<section class="slice"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-sm">
					<h3 class="h1 mb-5">개인 정보 입력</h3>
					<hr size="5" color="black">
					<table>
						<tbody>
							<tr>
								<th>프로필</th>
								<td>사진 변경하는 거 넣자.</td>
							</tr>
							<tr>
								<th>본인 성명</th>
								<td><input value="text" style="background:rgba(200,200,240,0.1); width:35%">
									직책 직급<input value="직책/직급" style="background:rgba(200,200,240,0.1); width:20%">
									<div class="dropdown">
									    <button class="btn btn-sm btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									        권한 / 자격
									    </button>
									    <div class="dropdown-menu">
									        <a class="dropdown-item" href="#">대표 공인 중개사</a>
									        <a class="dropdown-item" href="#">소속 공인 중개사</a>
									        <a class="dropdown-item" href="#">중개 보조원</a>
									        <a class="dropdown-item" href="#">중개인</a>
									    </div>
									</div>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input style="background:rgba(200,200,240,0.1); width:60%">&nbsp;-&nbsp;<input class="phoneNum"></td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td><input class="phoneNum" value="010" >&nbsp;-&nbsp;<input class="phoneNum" >&nbsp;-&nbsp;<input class="phoneNum" ></td>
							</tr>
							<tr>
								<th>대표 번호</th>
								<td><input class="phoneNum" value="02" >&nbsp;-&nbsp;<input class="phoneNum" >&nbsp;-&nbsp;<input class="phoneNum" ></td>
							</tr>
							<tr>
								<td id="certiPhone" style="display:none"><input placeholder="인증번호 입력해주세요" style="width:100%"></td>
								<td id="certiPhoneBtn" style="display:none"><button class="btn btn-outline-primary">인증번호 확인</button></td>
							</tr>
							<tr>
								<th rowspan="2">비밀번호 변경</th>
								<td><input placeholder="현재 비밀번호" style="width:100%"></td> 
							</tr>
							<tr>
								<td><input placeholder="비밀번호 확인" style="width:100%"></td>
							</tr>
							<tr>
								<th>가입 경로
									<div class="dropdown">
										<td>
										<div class="dropdown">
										    <button class="btn btn-sm btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가입 경로</button>
										    <div class="dropdown-menu">
										        <a class="dropdown-item" href="#">인터넷 광고(카페,블로그)</a>
										        <a class="dropdown-item" href="#">TV광고,옥외광고,포스터(오프라인)</a>
										        <a class="dropdown-item" href="#">미디어월 영업대행</a>
										        <a class="dropdown-item" href="#">지인 추천 및 기타</a>
										    </div>
										</div>
										</td>
									</div>
								</th>
							</tr>
						</tbody>
					</table>
					<hr>
					<p class="text-center">*공인중개사법 제18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호, 소재지, 성명)를 기입하시기 바랍니다.</p>
  					<p class="text-center">이에 발생한 문제는 (주)스테이션4 에서 책임을 지지 않습니다.</p>
					<div align="center" style="margin-top:20px;margin-bottom:50px">
						<!-- <input class="btn btn-dark" value="취소">&nbsp;&nbsp; --><input class="btn btn-primary" value="가입 신청">
					</div>
				</div>
			</div>
		</div>
	</section>
    </main>
		<section>
			<div id="navbar_main" align="center">
				<a class="navbar-brand" href="#">회사소개</a>
				<a class="navbar-brand" href="#">공인중개사 회원가입</a>
				<a class="navbar-brand" href="#">이용약관</a>
				<a class="navbar-brand" href="#">개인정보처리방침</a>
				<a class="navbar-brand" href="#">위치기반약관</a>
				<a class="navbar-brand" href="#">매물관리규정</a>
				<a class="navbar-brand" href="#">자동저장 서비스</a>
			</div>
		</section>
		<section>
		<%@ include file="footer.jsp"%>
		</section>
    	 
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