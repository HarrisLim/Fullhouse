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
    Join : FullHouse
  </title>
	    <!-- Fonts -->
	    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
	    <!-- Theme CSS -->
	    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
	    <!-- Demo CSS - No need to use these in your project -->
	    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
	    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	    <script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>

	    
		<script>

	    function readFile(input) {
   			if (input.files && input.files[0]) {
   				var reader = new FileReader();
   				reader.onload = function (e) {
           			$("#pho").empty().append('<img src="'+e.target.result+'" class="img-thumbnail" style="width:100%;height:100%;z-index:10">');
   				};
   				reader.readAsDataURL(input.files[0]);
   			}
	      }
		
	    
		// 토큰 
		var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(function() {
			$(document).ajaxSend(function(e, xhr, options) {
			    xhr.setRequestHeader(header, token);
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
		                document.getElementById('estateaddr1').value = fullAddr;

		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('estateaddr2').focus();
		            }
		        }).open();
		    }
			
			/* 파일 업로드 스크립트 */
			/*  function uploadFile(){
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
	            } */
	            
			function semCheck1(){
				
				$.ajax({
					type : 'POST',
					url : "stemCheck.do",
					data : { "st_email" : $('#st_email').val() },
					success : function(responseData){
						
						var data = JSON.parse(responseData.sem)
						if( $("#st_email").val()==="" ){
							alert(" 이메일을 등록해주세요")
							$("#st_email").focus();
							return;
						}else if( data > 0){
							alert ('중복되는 이메일 입니다. 다시 입력해 주세요')
							return;
						}else{
							var input;
							input = confirm("사용 가능한 이메일 입니다. 등록하시겠습니까?");
							if( input ){
								$('#st_email').attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
								$("#semCheck").attr("disabled",true);
							}else{
								$("#st_email").val("");
								$("#st_email").focus;
								return;
							}
							
						}
					}
				});
			}
			//다중 submit ( 중복검사 버튼 & 회원가입 버튼)
			 function lrnoCheck(str) {
					
				var value = $('#lrno1').val();
				value += "-";
				value += $('#lrno2').val();
				value += "-";
				value += $('#lrno3').val();
				$('#lrno').val(value);
				console.log(value);
				
					if(str == "check"){
						
						$.ajax({
							type:'POST',
							url:'procheck.do',
							data:{ lrno : $("#lrno").val() },
							success : function(responseData){
								var data = responseData.dto2;
								
								if( $("#lrno1").val()==="" || $("#lrno2").val()==="" || $("#lrno3").val()==="" ){
									alert(" 사업자 등록번호를 등록해주세요")
									$("#lrno1").focus();
									return;
								} 
								if( data === null ) {
									var input;
									input = confirm("등록되어 있지 않습니다. 등록하시겠습니까?");
									
									if( input ){
										var value = $('#lrno1').attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
										value += $('#lrno2').attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
										value += $('#lrno3').attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
										$('#lrno').val(value).attr("readonly",true);
										$("#lrCheck").attr("disabled",true);
									}else{
										$("#lrno1").val("");
										$("#lrno2").val("");
										$("#lrno3").val("");
										return;
									}
										
									
								}else if( data.lrno != null ) {
									
									
									alert(" 등록된 번호 값을 불러옵니다.");
									var String2 = data.lrno;
									var lrnoin = String2.split("-");
									$("#lrno1").val(lrnoin[0]).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#lrno2").val(lrnoin[1]).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#lrno3").val(lrnoin[2]).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#lrno").val(data.lrno).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#estate_name").val(data.estate_name).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#erno").val(data.erno).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#owner_name").val(data.owner_name).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#estateaddr").val(data.estateaddr).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									var String = data.estateaddr;
									var addrin = String.split("-");
									$("#postcode").val(addrin[0]).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#estateaddr1").val(addrin[1]).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#estateaddr2").val(addrin[2]).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									$("#lrCheck").attr("disabled",true);
									$("#postco").attr("disabled",true);
									$("#Estate_no").val(data.estate_no).attr("readonly",true).css("background-color","rgba(200,200,240,0.1)");
									return;
								}
								/* if( $('#semCheck').prop("disabled") == true ){
									$('#proin').attr('disabled' , false)
								} */
							}
						});
						//$('#proin').attr('disabled' , false)
					}else if( str == "str" ){
						// 분할 테그 합치기
						
						var value2 = $('#postcode').val();
						value2 += "-";
						value2 += $('#estateaddr1').val();
						value2 += "-";
						value2 += $('#estateaddr2').val();
						$('#estateaddr').val(value2);
						console.log(value2);
						
						var value3 = $('#st_phone1').val();
						value3 += "-";
						value3 += $('#st_phone2').val();
						value3 += "-";
						value3 += $('#st_phone3').val();
						$('#st_phone').val(value3);
						console.log(value3);
						
						var value4 = $('#st_homephone1').val();
						value4 += "-";
						value4 += $('#st_homephone2').val();
						value4 += "-";
						value4 += $('#st_homephone3').val();
						$('#st_homephone').val(value4);
						console.log(value4);
						
						if( $("#estate_name").val()===""){
							alert(" 중개 사무소명을 등록해주세요 ")
							$("#estate_name").focus();
							return;
						}
						if( $("#erno").val()==="" ){
							alert(" 중개등록번호를 등록해주세요")
							$("#erno").focus();
							return;
						}
						if( $("#estateaddr").val()==="" ){
							alert(" 중개사무소 주소를 등록해주세요")
							$("#estateaddr").focus();
							return;
						}
						if( $("#owner_name").val()==="" ){
							alert(" 중개사 대표자 이름을 등록해주세요")
							$("#owner_name").focus();
							return;
						}
						 if( $("#st_name").val()==="" ){
							alert(" 본인 이름을 등록해주세요")
							$("#st_name").focus();
							return;
						}
						if( $("#st_qual").val()==="" ){
							alert(" 본인의 권한을 선택해주세요")
							$("#st_qual").focus();
							return;
						}
						if( $("#st_phone").val()==="" ){
							alert(" 본인 휴대폰 번호를 등록해주세요")
							$("#st_phone").focus();
							return;
						}
						if( $("#st_homephone").val()==="" ){
							alert(" 대표 전화번호를 등록해주세요")
							$("#st_homephone").focus();
							return;
						}
						if( $("#st_pw").val()==="" ){
							alert(" 비밀번호를 입력해주세요")
							$("#st_pw").focus();
							return;
						}
						//비밀번호 유효성 검사
						if( $("#st_pw").val() != "" ){
							
							var pw = $('#st_pw').val();
							var num = pw.search(/[0-9]/g);
							var eng = pw.search(/[a-z]/ig);
							var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
							if(pw.length < 8 || pw.length > 20){
								alert("8자리 ~ 20자리 이내로 입력해주세요.");
							  return false;
							}
							if(pw.search(/₩s/) != -1){
								alert("비밀번호는 공백없이 입력해주세요.");
								return false;
							}
							if(num < 0 || eng < 0 || spe < 0 ){
								alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
								return false;
							}
						}
						if( $('#st_pw').val() != $('#st_pwcheck').val()){
							alert("비밀번호가 같지 않습니다 다시 입력해주세요")
							$("#st_pw").focus();
							return;
						}
						if( $('#lrCheck').prop("disabled") == false && $('#semCheck').prop("disabled") == false ){
							alert('인증을 완료해 주세요^^')
							return;
						}
						if( $('#lrCheck').prop("disabled") == true && $('#semCheck').prop("disabled") == false ){
							alert('이메일 인증을 완료해 주세요.')
							$("#st_email").focus();
							return;
						}
						if( $('#lrCheck').prop("disabled") == false && $('#semCheck').prop("disabled") == true ){
							alert('사업자등록번호 인증을 완료해 주세요.')
							$("#lrno1").focus();
						}
						if( $('#lrCheck').prop("disabled") == true && $('#semCheck').prop("disabled") == true ){
							alert('pro 회원가입 완료!')
							
							proInsert.action="estate.do";
							$("#proInsert").submit();
						}
					}
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
	<form name="proInsert" id="proInsert" method="post">
	<section class="slice"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-sm">
					<h3 class="h1 mb-5 text-center">공인중개사 정보 입력</h3>
					<div align="center" style="color:red">* 이미 등록된 공인중개소의 직원이라면 사업자등록번호로 공인중개소 정보를 등록할 수 있습니다. </div>
					<hr size="4" color="black" width="900" style="margin-top:0px">
					<table width="800" align="center">
						<tbody>
							<tr>
								<th>중개 사무소명</th>
								<td><input id="estate_name" name="estate_name" style="width:75%" value=""></td>
							</tr>
							<tr>
								<th>중개 등록번호</th>
								<td>
									<input value="" id="erno" name="erno" style="width:50%"/>
									<!-- <button type="button" class="btn btn-sm btn-outline-primary btn-icon" style="width:25%">
										    <span class="btn-inner--text">중개등록증 첨부</span>
										    <span class="btn-inner--icon"><i class="fas fa-user"></i></span>
									</button> -->
									
						        <!-- <form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
						            <input type="file" id="FILE_TAG" name="FILE_TAG">
						            <input type="file" id="FILE_TAG2" name="FILE_TAG2">
						            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a> -->
								</td>
							</tr>
							<tr>
								<th>사업자 등록번호</th>
								<td><input style="width:14%" id="lrno1" name="lrno1" value="">
								&nbsp;-&nbsp;<input style="width:14%" id="lrno2" name="lrno2" value="">
								&nbsp;-&nbsp;<input style="width:14%" id="lrno3" name="lrno3" value="">
								<input type="hidden" id="lrno" name="lrno" value=""/>
								<input type="button" id="lrCheck" name="lrCheck" class="btn btn-sm btn-outline-primary" onClick="lrnoCheck('check')" value="인증">
								<p> 인증 확인 후 회원가입이 가능합니다.</p>
								</td>
							</tr>
							
							<tr>
								<th rowspan="2">중개 사무소 주소</th>
								<td><input type="text" id="postcode" value="">
								<input class="btn btn-sm btn-outline-primary" id=postco type="button" onclick="execDaumPostcode()" value="주소검색"></td>
							</tr>
							<tr>
								<td><input type="text" id="estateaddr1" style="width:35%" value="">
								<input type="text" id="estateaddr2" style="width:35%" value=""> 
								<input type="hidden" id="estateaddr" name="estateaddr" value=""/></td> 
							</tr>
							<tr>
								<th>중개사 대표자명</th>
								<td><input value="" id="owner_name" name="owner_name" style="width:75%"/></td>
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
					<h3 class="h1 mb-5 text-center">개인 정보 입력</h3>
					<hr size="5" color="black">
					<table width="800" align="center">
						<tbody>
							<div><input type="hidden" id="Estate_no" name="Estate_no" value="0" /></div>
							<tr>
								<th>프로필</th>
								<td>
									<div id="photo" data-toggle="tooltip" title="클릭하여 사진을 추가해주세요." style="position:relative;width:77px;height:102px;border:1px solid;background-image:url('../kanu/images/picImage.png');">
										<input type="file" style="height:100px" class="custom-file-input" id="customFile" name="photo" accept=".png, .jpg, .jpeg"  onchange="readFile(this);" >
										<div id="pho" style="width:75px;height:100px;position:absolute;top:0px;">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>본인 성명</th>
								<td>
									<input value="" id="st_name" name="st_name" style="width:25%"/>
									직책 직급<input value="" id="st_position" name="st_position" style=" width:25%"/>
								</td>
								<td>	
								    <div class="col-lg-12">
					                    <select class="selectpicker" id="st_qual" name="st_qual" data-style="btn-sm btn-outline-primary btn-icon" title="권한/자격">
											<option value="권한/자격">권한/자격</option>
											<option value="대표공인중개사">대표공인중개사</option>
											<option value="소속공인중개사">소속공인중개사</option>
											<option value="중개보조원">중개보조원</option>
											<option value="중개인">중개인</option>
					                    </select>
									</div>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="2"><input style="width:60%" id="st_email" name="st_email"value=""/>
								<button type="button" id="semCheck" name="semCheck" class="btn btn-sm btn-outline-primary" onClick="semCheck1()">인증</button>
								<p> 인증 확인 후 회원가입이 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td colspan="2"><input id="st_phone1" value="" >&nbsp;-&nbsp;<input id="st_phone2" value="">&nbsp;-&nbsp;<input id="st_phone3" value="">
								<input type="hidden" id="st_phone" name="st_phone" value=""/>
								</td>
								
							</tr>
							<tr>
								<th>대표 번호</th>
								<td colspan="2"><input value="" id="st_homephone1">&nbsp;-&nbsp;<input value="" id="st_homephone2">&nbsp;-&nbsp;<input  value="" id="st_homephone3">
								<input type="hidden" id="st_homephone" name="st_homephone" value=""/>
								</td>
							</tr>
							<!-- <tr>
								<td id="certiPhone" style="display:none"><input placeholder="인증번호 입력해주세요" style="width:100%"></td>
								<td id="certiPhoneBtn" style="display:none"><button class="btn btn-outline-primary">인증번호 확인</button></td>
							</tr> -->
							<tr>
								<th rowspan="2">비밀번호</th>
								<td colspan="2"><input type="password"placeholder="비밀번호" style="width:65%" id="st_pw" name="st_pw"/>
								<p> 8자 ~ 20자 내에서 특수문자 / 숫자 / 영어를 혼합하여 입력해주세요. </p>
								</td> 
							</tr>
							<tr>
								<td colspan="2">
								<input type="password" placeholder="비밀번호 확인" style="width:65%" id="st_pwcheck" name="st_pwcheck"/>
								<div name="profont2" style="color:red;" ></div>
								</td>
							</tr>
							<tr>
								<th>가입 경로</th>
								<td colspan="2">
									<div class="col-lg-4">
					                    <select class="selectpicker"  id="st_joinpath" name="st_joinpath" data-style="btn-sm btn-outline-primary btn-icon" title="가입 경로">
											<option value="가입 경로">가입 경로</option>
											<option value="인터넷 광고(카페,블로그)">인터넷 광고(카페,블로그)</option>
											<option value="TV광고,옥외광고,포스터(오프라인)">TV광고,옥외광고,포스터(오프라인)</option>
											<option value="미디어월 영업대행">미디어월 영업대행</option>
											<option value="지인 추천 및 기타">지인 추천 및 기타</option>
					                    </select>
									</div>
								</td>
								
							</tr>
						</tbody>
					</table>
					<hr>
					<p class="text-center">*공인중개사법 제18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호, 소재지, 성명)를 기입하시기 바랍니다.</p>
  					<p class="text-center">이에 발생한 문제는 (주)스테이션4 에서 책임을 지지 않습니다.</p>
					<div align="center" style="margin-top:20px;margin-bottom:50px">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<button type="button" id="proin" name="proin" class="btn btn-primary" onclick="lrnoCheck('str')">가입 신청</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	</form>
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

							