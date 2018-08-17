<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<head>
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="69570195917-qamvmgijh74iq624fdgdgcttra3u41fq.apps.googleusercontent.com">
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</head>
<script type="text/javascript">
	// 토큰 
	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(function() {
		$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
		});
	});
		
	// 비밀번호 확인
	window.onload = function(){
		$('#inputPw1').keyup(function(){
			if( $('#inputPw1').val() != $('#inputPw2').val()){
				$('#font2').text('');
				$('#font2').html('<b>비밀번호가 다릅니다</b>');
			}else{
				$('#font2').text('');
				$('#font2').text('비밀번호 확인 완료!');
			}
		}); // InputPw1 keyup
		
		$('#inputPw2').keyup(function(){
			if( $('#inputPw1').val() != $('#inputPw2').val()){
				$('#font2').text('');
				$('#font2').html('<b>비밀번호가 다릅니다</b>');
			}else{
				$('#font2').text('');
				$('#font2').text('비밀번호 확인 완료!');
			}
		}); // InputPw2 keyu
		
		// 로그인시 빈칸 확인 및 로그인시 이메일 & 비밀번호 확인
		$("#logIn").click(function(){
			if( $("#input_email").val() === "" ){
				alert("이메일 주소가 비어있습니다. 적어 주세요.")
				return;
			}else if( $("#input_password").val() === "" ){
				alert("비밀번호가 비어있습니다. 채워 주세요.")
				return;
			}
			$("#log").submit();
		});
			/* else{
				$.ajax({
					type:'POST',
					url:'empwCheck.do',
					data:{ mem_email : $('#input_email').val() , mem_pw : $('#input_pw').val() },
					success : function(responseData){
						if( responseData.count == 2 ){
							var fName = '${sessionScope.memName}'
							var name = fName.substring(2);
							alert ( '환영 합니다!!' + name + '님' )
							location.href="../house/main.do"
						}else if( responseData.count == 0){
							alert ( '이메일이 틀렸습니다 다시 입력해 주세요.' )
							return;
						}else if( responseData.count == 1){
							alert ( '비밀번호가 틀렸습니다 다시 입력해 주세요.' )
							return;
						}
					}
				});
			} */
		// mem_pw : $('#input_pw').val()
		// 이메일 주소 중복 체크
		$('#inputEmail').keyup(function(){
			
			$.ajax({
				type:'POST',
				url:'emCheck.do',
				data:{ mem_email : $("#inputEmail").val() },
				success : function(responseData){
					var data = responseData.email;
					
					if( $("#inputEmail").val() != data ){
						$('#font').text('');
						$('#font').html('<b> 중복되지 않습니다. 사용가능 합니다! </b>');
						$('#memInput').attr( 'disabled', false );
					}else if($("#inputEmail").val() === ""){
						$('#font').text('');
					}else{
						$('#font').text('');
						$('#font').text('중복 되는 이메일 입니다.');
						$('#memInput').attr( 'disabled', true );
						
					}
				}
			});
		});

		// inputEmail / inputPw1 / userName / phone / customCheck6 / customCheck7
		//회원 가입시 확인 스크립트
		$("#memInput").click(function(){
			if( $("#inputEmail").val() === "" ){
				alert(" 이메일을 입력해주세요.")
				return;
			}
			if( $("#inputPw1").val() === "" ){
				alert(" 비밀번호를 입력해주세요.")
				return;
			}
			if( $("#userName").val() === "" ){
				alert(" 이름을 입력해주세요.")
				return;
			}
			if( $("#phone").val() === "" ){
				alert(" 핸드폰 번호를 입력해주세요.")
				return;
			}
			if( $("input[name=customCheck6]").prop("checked") === false ){
				alert(" 이용약관에 확인 해주세요.")
				return;
			}
			if( $("input[name=customCheck7]").prop("checked") === false ){
				alert(" 개인정보 이용에 확인 해주세요.")
				return;
			}
			$("#memInsert").submit();
		});
		
	}
/* <sec:authorize access="isAnonymous()">

	<a href="${CONTEXT }/j_spring_security_check">로그인</a>

</sec:authorize>

<sec:authorize access="isAuthenticated()">

	<a href="${CONTEXT }/j_spring_security_logout">로그아웃</a>

</sec:authorize> */

</script>


<nav class="navbar navbar-expand-lg navbar-transparent navbar-dark py-4">
	<div class="container">
		<img src="../kanu/main/로고.png" class="avatar avatar-sm bg-#00000000" style="background-color:transparent">
        <a class="navbar-brand text-dark" id="logo" href="../house/main.do"><strong>Full House</strong> Station4</a>
        <button class="navbar-toggler" type="button" data-action="offcanvas-open" data-target="#navbar_main" 
        							aria-controls="navbar_main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
		<div class="navbar-collapse offcanvas-collapse" id="navbar_main">
			<ul class="navbar-nav ml-auto align-items-lg-center ">
	            <li class="nav-item active" >
	              <a class="nav-link text-dark" href="../house/myinfo.do">FHS Pro</a>
	            </li>
	            <li class="nav-item dropdown">
	              <a class="nav-link dropdown-toggle text-dark" href="#" id="navbar_main_dropdown_1" role="button" data-toggle="dropdown" 
	              												aria-haspopup="true" aria-expanded="false">검색</a>
	              <div class="dropdown-menu " aria-labelledby="navbar_1_dropdown_1">
	                <a class="dropdown-item text-dark" href="../house/map.do">방 검색</a>
	                <a class="dropdown-item text-dark" href="../house/uploadroom.do">방 등록</a>
	                <a class="dropdown-item text-dark" href="../house/room.do">관심 목록</a>
	              </div>
	            </li>
	            <li class="nav-item" >
	            	<a class="nav-link text-dark" href="../house/proterms.do">공인중개사 회원가입</a>
	            </li>
	            <li>
	            	<sec:authorize access="isAnonymous()">
	            		<a id="xxxxx" class="nav-link text-dark" data-toggle="modal" href="<c:url value="#myModal"/>">회원가입 및 로그인</a>
	            	</sec:authorize>
	            	<sec:authorize access="isAuthenticated()">
						<form:form action="../logout" method="POST">
							<div class="dropdown">
							<c:if test="${sessionScope.type eq 'mem'}">
							    <button type="button" class="nav-link text-dark dropdown-toggle" id="logout" name="logout" value="title" 
							    	aria-expanded="true" data-toggle="dropdown">${sessionScope.mem.mem_name.substring(2)} 님</button>
							</c:if>
							<c:if test="${sessionScope.type eq 'staff'}">
							    <button type="button" class="nav-link text-dark dropdown-toggle" id="logout" name="logout" value="title" 
							    	aria-expanded="true" data-toggle="dropdown">${sessionScope.st.st_name.substring(2)} 님</button>
							</c:if>
							    <ul id="mytype" class="dropdown-menu" role="menu" aria-labelledby="searchType">
							        <li role="presentation" align="">
							            <button type="button" role="menuitem" tabindex="-1">
							            <a class="text-dark nav-item"href="../house/myinfo.do">내 계정</a></button>
							        </li>
							        <li role="presentation">
										<input type="submit" class="text-dark nav-item" role="menuitem" tabindex="-1" value="로그 아웃"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</li>
							    </ul>		
						    </div>
						</form:form>
					</sec:authorize>
	            </li>
			</ul>
           	<div class="modal" id="myModal" tabindex="-1" >
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="col-lg5">
			        <div class="card bg-primary">
			          <div class="card-body">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<img src="../assets/images/brand/icon.png"  style="width: 100px;">
			            <h4 class="heading h2 text-white pt-2 pb-4">환영 합니다</h4>
			            <span class="clearfix"></span>
						<form class="form-primary" id="log" name="log" action="../j_spring_security_check" method="post" >
						<div class="form-group">
						  <input type="email" class="form-control" id="input_email" name="mem_email" placeholder="Your email" value="harris@gmail.com">
						</div>
						<div class="form-group">
						  <input type="password" class="form-control" id="input_pw" name="mem_pw" placeholder="Password" value="1234">
						</div>
							<input type="button" id="logIn" class="btn btn-block btn-lg bg-white mt-4" value="로그인" >
							<a data-toggle="modal" href="#myModal2" class="btn btn-primary btn-lg btn-block">회원가입</a>
							<div class="row">
							 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<div class="col-sm-6"><a id="kakao-login-btn"></a></div>
								<div class="g-signin2 col-lg-6 text-center" data-onsuccess="onSignIn" style="width:205px;height:50px"></div>
							</div>
							
						<script type='text/javascript'>
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('4883831475945bf63a47a6f7ad0f08ca');
						
						// 카카오 로그인 버튼을 생성합니다.
						Kakao.Auth.createLoginButton({
							container: '#kakao-login-btn',
							success: function(authObj) {
								
								// 로그인 성공시, API를 호출합니다.
								Kakao.API.request({
									url: '/v1/user/me',
									success: function(res) {
										console.log(res);
										
										alert(" userID  : " + res.id )
										alert("userEmail : " + res.account_email )
										alert("NN : " + res.properties.nickname )
										
										var userID = res.id;						//유저의 카카오톡 고유 id
										var userEmail = res.account_email;			//유저의 이메일
										var userNickName = res.properties.nickname;	//유저가 등록한 별명
										
										console.log(userID);
										console.log(userEmail);
										console.log(userNickName);
										
										
									},
									fail: function(error) {
										alert(JSON.stringify(error));
									}
								});
							},
							fail: function(err) {
								alert(JSON.stringify(err));
							}
						});
					  //]]>
						</script>
						</form>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> -->
			<script>
			  function onSignIn(googleUser) {
			    // Useful data for your client-side scripts:
			    var profile = googleUser.getBasicProfile();
			    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			    console.log('Full Name: ' + profile.getName());
			    console.log('Given Name: ' + profile.getGivenName());
			    console.log('Family Name: ' + profile.getFamilyName());
			    console.log("Image URL: " + profile.getImageUrl());
			    console.log("Email: " + profile.getEmail());
			
			    // The ID token you need to pass to your backend:
			    var id_token = googleUser.getAuthResponse().id_token;
			    console.log("ID Token: " + id_token);
			  };
			</script>
			<div class="modal" id="myModal2" data-backdrop="static">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
					
						<article class="container">
					        <div class="page-header">
					          <h1>회원가입</h1>
					        </div>
					        <div class="col-md-12 col-md-offset-3">
					          <form role="form" id="memInsert" name="memInsert" action="./memInsert.do?" method="post">
					            <div class="form-group">
					              <label for="inputEmail">이메일 주소</label>
					              <input type="email" class="form-control" id="inputEmail" name="mem_email" placeholder="이메일 주소">
					              <div id="font" style="color:red;"></div>
					            </div>
					            <div class="form-group">
					              <label for="inputPassword1">비밀번호</label>
					              <input type="password" class="form-control" id="inputPw1" name="mem_pw" placeholder="비밀번호">
					            </div>
					            <div class="form-group">
					              <label for="inputPassword2">비밀번호 확인</label>
					              <input type="password" class="form-control" id="inputPw2" placeholder="비밀번호 확인">
					              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
					              <div id="font2" style="color:red;"></div>
					            </div>
					            <div class="form-group">
					              <label for="username">이름</label>
					              <input type="text" class="form-control" id="userName" name="mem_name" placeholder="이름을 입력해 주세요">
					            </div>
					            <div class="form-group">
					              <label for="username">휴대폰 번호</label>
					              <div class="input-group">
					                <input type="tel" class="form-control" id="phone" name="mem_phone" placeholder="- 없이 입력해 주세요">
					              </div>
					              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

					                <!-- <span class="input-group-btn">
					                  <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
					                </span>
					              </div>
					            
					            <div class="form-group">
					              <label for="username">인증번호 입력</label>
					              <div class="input-group">
					                <input type="text" class="form-control" id="username" placeholder="인증번호">
					                <span class="input-group-btn">
					                  <button class="btn btn-success">인증번호 입력<i class="fa fa-edit spaceLeft"></i></button>
					                </span>
					              </div>-->
					            </div> 
					            <div class="row">
									<div class="custom-control custom-checkbox mb-3">
									  <input type="checkbox" class="custom-control-input is-invalid" id="customCheck6" name="customCheck6">
									  <label class="custom-control-label" for="customCheck6"></label>다음의 
									  <a data-toggle="modal" data-target="#mymodal3" href="#myModal3">이용약관</a>에 동의합니다.
									</div>
						            <div class="custom-control custom-checkbox mb-3">
									  <input type="checkbox" class="custom-control-input is-invalid" id="customCheck7" name="customCheck7">
									  <label class="custom-control-label" for="customCheck7"></label>다음의 
					              	  <a data-toggle="modal" data-target="#mymodal4" href="#myModal4">개인 정보 이용</a>에 동의합니다.
					              	</div>
					            </div>
					            <div class="form-group text-center">
					              <button type="button" class="btn btn-info" id="memInput" disabled>회원가입<i class="fa fa-check spaceLeft"></i></button>
					              <button type="button" class="btn btn-warning" id="Cancel" data-dismiss="modal" >가입취소<i class="fa fa-times spaceLeft"></i></button>
					            </div>
					          </form>
					        </div>
						</article>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mymodal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" style="height: 80%" role="document">
					<div class="modal-content" style="height: 80%">
						<div class="modal-header">
							<h5 class="modal-title " id="exampleModalLongTitle">이용 약관</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
						</div>
						
						<div class="modal-body" style="max-height: calc(100% - 120px); overflow-y: scroll">
							<p class="text-sm-center">제 1 조 (약관의 적용목적)</p>

							<p class="text-sm-left">이 약관은 스테이션4(이하 “회사”라 한다)가 운영하는 “풀 하우스”에서 제공하는 인터넷 서비스(이하 “서비스”라 한다)를 이용함에 있어 “팀”와 “이용자”의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.</p>
							
							
							<p class="text-sm-center">제 2조 (용어의 정의)</p>
							
							<p class="text-sm-left">1. “풀 하우스”이라 함은 “회사”가 “임대인”이 등록한 “매물”을 “이용자”에게 제공하기 위하여 컴퓨터 등 정보 통신 설비를 이용하여 설정한 가상의 중개장을 말하며, 
							아울러 인터넷 사이트 및 모바일 어플리케이션을 운영하는 사업자의 의미로도 사용합니다.</p>
							
							<p class="text-sm-left">2. “이용자”라 함은 “풀 하우스”이 제공하는 서비스를 받는 “개인 사용자 회원” 또는 “공인중개사 회원" 또는 “비회원”을 말합니다.</p>
							
							<p class="text-sm-left">3. “회원”은 “개인 사용자 회원”과 “공인중개사 회원”을 의미합니다.</p>
							
							<p class="text-sm-left">4. “개인 사용자 회원”이라 함은 “회사”가 정한 소정의 절차를 거쳐서 회원 가입을 한 개인으로서, “풀 하우스”의 정보를 지속적으로 제공 받으며, 
							“풀 하우스”이 제공하는 서비스를 계속적으로 이용할 수 있고 “임대인” 및 “임차인”이 될 수 있는 권한을 가진 자를 말합니다. 아울러 “회사”는 서비스의 원활한 제공을 위해 회원의 등급을 “회사” 내부 규정에 따라 나눌 수 있습니다.</p> 
							
							<p class="text-sm-left">5. “공인중개사 회원"이라 함은 “회사”가 정한 소정의 절차를 거쳐서 회원 가입을 한 부동산 중개업자로서 “풀 하우스 ”에 허락 받은 “부동산”을 대신하여 “매물”을 제공할 수 있는 권한을 가진 “회원”을 말합니다.</p>
							
							<p class="text-sm-left">6. “비회원”이라 함은 회원으로 가입하지 않고 “회사”가 제공하는 서비스를 이용하는 자를 말합니다.</p> 
							
							<p class="text-sm-left">7. “임대인”이라 함은 “매물”을 “풀 하우스 ”에 등록하여 임대하는 “회원”을 의미합니다.</p>
							
							<p class="text-sm-left">8. “임차인”이라 함은 “풀 하우스 ”에 등록 된 “매물”을 임차하는 “회원”을 의미합니다.</p>
							
							<p class="text-sm-left">9. “매물”이라 함은 “풀 하우스 ”의 등록 절차에 따라 임대를 하기 위해 등록한 사용권을 보유한 부동산, 상품 또는 서비스를 의미합니다.</p>
							
							<p class="text-sm-left">10. “콘텐츠”라 함은 “임대인” 또는 “임차인”이 “매물”의 임대를 위하여 게재한 모든 글, 사진, 동영상, 회원소개 등을 말합니다.</p>
							
							<p class="text-sm-left">11.“분양정보”라 함은 “회사”가 “이용자”에게 제공하는 공동주택(아파트, 오피스텔, 도시형생활주택 등)의 분양에 관련된 모든 글, 사진, 동영상 등의 정보를 말합니다.</p>
							
							<p class="text-sm-left">12. “풀 하우스  매물관리규정”이란 회사가 별도로 규정하여 공개한 부동산 매물 등록 시 회원의 준수 사항 및 위반 시 제재 규정을 의미합니다.
							
							위 항에서 정의되지 않은 이 약관상의 용어의 의미는 일반적인 거래 관행에 의합니다. </p>
						
						
							<p class="text-sm-center">제 3 조 (약관 명시와 개정)</p>
							
							<p class="text-sm-left">1. “회사”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자 우편 주소, 
							사업자 등록 번호, 통신 판매업 신고 번호, 개인 정보 관리 책임자 등을 이용자가 쉽게 알 수 있도록 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.</p>
							
							<p class="text-sm-left">2. “회사”는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 
							방문판매 등에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p>
							
							<p class="text-sm-left">3. “회사”가 이 약관을 개정하는 경우에는 개정된 약관의 적용일자 및 개정사유를 명시하여 현행 약관과 함께 그 적용일자 7일(불리한 경우 30일) 이전부터 적용일자 전일까지 위 제1항의 방법으로 공지합니다. 
							“회원”에게 불리한 약관의 개정은 이용자가 등록한 전자우편, 로그인 시 팝업창 등의 전자적 수단을 통하여 통지하도록 합니다.</p>
							
							<p class="text-sm-left">4. “회사”가 전항에 따라 개정약관을 공지 또는 통지하면서 “회원”에게 동 기간 내에 의사표시를 하지 않으면 
							의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 “회원”이 명시적으로 거부의 의사표시를 하지 아니한 경우 “회원”이 개정약관에 동의한 것으로 봅니다.</p>
							
							<p class="text-sm-left">5. “회원”이 개정약관의 적용에 동의하지 않는 경우 “회사”는 개정 약관의 내용을 적용할 수 없으며, 이 경우 “회원”은 이용계약을 해지할 수 있습니다. 
							기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 “회사”는 이용계약을 해지할 수 있습니다.</p>
							
							<p class="text-sm-left">6. 본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관해서는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제 등에 관한 법률,
							공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호 지침 및 관계 법령 또는 상관례에 의합니다. </p>
							
							
							<p class="text-sm-center">제 4조 (서비스의 제공 및 변경)</p>
							
							<p class="text-sm-left">1. “풀 하우스 ”은 다음과 같은 업무를 수행합니다.</p>
							
							<p class="text-sm-left">부동산 매물 및 부동산 전반에 관한 정보 제공 서비스
							기타 “풀 하우스 ”의 이용자를 위하여 제공하는 서비스
							“풀 하우스 ”은 “임대인”과 “임차인”이 “매물”의 임대를 위해 “콘텐츠”를 올릴 수 있는 플랫폼을 제공하며, 직접적으로 “콘텐츠”를 생산하지 않습니다. 
							“이용자”는 자신이 생산하여 플랫폼에 제공한 “콘텐츠”에 대한 저작권을 갖습니다. 따라서, 웹사이트에 올려진 “콘텐츠”에 대한 책임은 “콘텐츠”를 생산해서 올린 원저작자에 있습니다.
							“풀 하우스 ”은 “이용자”에게 “분양정보”를 제공하며, “회사”는 “분양정보”에 대한 저작권을 갖습니다.
							“풀 하우스 ”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 기술적 사양의 변경 등의 사유로 변경할 경우에는, 그 변경이 실질적으로 이용자에게 불리한 것이 아닌 경우 그 사유를 이용자에게 통지하거나, 
							이용자가 알아볼 수 있도록 공지사항으로 게시합니다. </p>
							
							
							<p class="text-sm-center">제 5조 (서비스의 중단)</p>
							
							<p class="text-sm-left">1. 회원의 서비스 기간은 “회사”에 서비스를 신청하여 이용 승낙이 있은 날로부터 이용 계약 해지 시까지 입니다.</p>
							
							<p class="text-sm-left">2. “풀 하우스 ”은 컴퓨터 등 정보 통신 설비의 보수 점검, 교체 및 고장, 통신의 두절, 천재지변 등 운영상 상당한 이유가 있는 경우에는 서비스의 제공을 제한하거나 일시적으로 중단할 수 있습니다.
							이 경우 서비스 일시 중단 사실과 그 사유를 사전에 사이트 초기 화면에 통지합니다. 다만, 
							“회사”가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 제8조에 정한 방법으로 사후에 통지할 수 있습니다.</p>
							
							<p class="text-sm-left">3. 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는
							 “풀 하우스 ”은 제8조에 정한 방법으로 충분한 기간을 두어 이용자에게 통지하거나 이용자가 알아볼 수 있도록 공지 사항으로 게시합니다.</p> 
							
							
							<p class="text-sm-center">제 6조 (대리 행위의 부인)</p>
							
							<p class="text-sm-left">“회사”는 효율적인 서비스를 위한 시스템 운영 및 관리 책임만을 부담하며, 이용자가 풀 하우스 의 정보를 이용하는 중에 발생한 거래와 관련하여 거래 당사자 중 어느 일방을 대리하지 아니하고, 
							이용자 사이에 성립된 거래 및 회원이 제공하고 등록한 정보에 대해서는 해당 이용자가 그에 대한 책임을 부담하여야 합니다.</p>
							
							
							<p class="text-sm-center">제 7조 (보증의 부인)</p>
							
							<p class="text-sm-left">회사는 신고 받은 허위 매물 정보의 삭제조치를 취하는 등의 서비스 관리자로서의 책임을 부담합니다. 
							단, 이용자가 풀 하우스 을 이용해 얻은 정보를 기반으로 별도의 이용자 간 계약을 체결할 경우에 대한 위험과 책임은 계약을 체결한 해당 이용자가 부담합니다.</p>
							
							
							<p class="text-sm-center">제 8 조 (회원에 대한 통지 및 공지)</p>
							
							<p class="text-sm-left">1. "회사”는 이동전화 단문 메시지 서비스(SMS) 또는 푸시알림(App push) 등으로 회원에게 통지할 수 있습니다.</p>
							
							<p class="text-sm-left">2. “회사”는 불특정다수 회원에 대한 통지의 경우 공지사항을 통하여 게시함으로 개별 통지를 대신 할 수 있습니다. 
							다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항 또는 회원에게 불리한 약관 개정 등에 대해서는 제1항의 방법 또는 문자메시지(SMS) 송신, 전자메일 송신 등의 방법으로 개별적으로 통지합니다.</p> 
							
							
							<p class="text-sm-center">제9 조 (회원가입)</p>
							
							<p class="text-sm-left">1. “이용자”는 “회사”가 정한 가입 양식에 따라 회원 정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원 가입을 신청합니다.</p>
							
							<p class="text-sm-left">2. “회사”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 “개인 사용자 회원” 또는 “공인중개사 회원"으로 등록합니다.</p>
							
							<p class="text-sm-left">등록 내용에 허위, 기재누락, 오기가 있는 경우
							가입 신청자가 이전에 회원 자격을 상실한 적이 있는 경우(다만 회원 자격 상실 후 “회사”가 필요하다고 판단하여 회원 재가입에 대한 승낙을 얻은 경우에는 예외로 합니다.)
							“회사”로부터 회원 자격 정지 조치 등을 받은 회원이 그 조치 기간 중에 이용 계약을 임의 해지하고 재가입 신청을 하는 경우
							기타 회원으로 등록하는 것이 “풀 하우스 ”의 기술상 현저히 곤란하다고 판단되는 경우
							본 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우</p>
							<p class="text-sm-left">3. 회원 가입 계약의 성립 시기는 “풀 하우스 ”의 승낙이 회원에게 도달한 시점으로 합니다.</p>
							
							<p class="text-sm-left">4. “회원”은 “서비스” 안에 “내 정보” 화면을 통하여 언제든지 본인의 개인 정보를 열람하고 수정할 수 있습니다. 
							다만, “서비스” 관리를 위해서 필요한 이동 전화 번호 등은 수정이 불가능 합니다.</p> 
							
							<p class="text-sm-left">5. “회원”은 등록 사항에 변경이 있는 경우, 즉시 온라인 수정을 하거나 전자우편 및 기타 방법으로 “회사”에 그 변경 사항을 알려야 합니다.</p>
							
							<p class="text-sm-left">6. 제5항의 변경 사항을 “회사”에 알리지 않아 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.</p>
							
							<p class="text-sm-left">7. 회원 가입은 반드시 본인의 진정한 정보를 통하여 가입할 수 있습니다. “회사”는 “회원”의 종류에 따라, 
							“회사”는 회원이 등록한 정보에 대하여 전문기관을 통한 실명확인 및 본인인증을 요청하거나, 
							공인중개사 회원의 경우 관할 행정기관에 연락하여 회원 가입 시 기재한 사항이 중개업 신고 현황과 일치하는지 확인하는 등 기타 확인 조치를 할 수 있습니다. 
							“회원”의 정보가 “회원” 본인의 것이 아닌 경우 “회사”는 회원 가입을 거부할 수 있습니다.</p>
							
							<p class="text-sm-left">8. “회사”는 “회원”을 등급 별로 구분하여 이용 시간, 이용 회수, 서비스 메뉴, 매물 등록 건 수 등을 세분하여 서비스 이용에 차등을 둘 수 있습니다.</p> 
							
							
							<p class="text-sm-center">제 10조 (이용계약의 해지 및 회원 탈퇴)</p>
							
							<p class="text-sm-left">1. "회원”은 “풀 하우스 ”에 언제든지 탈퇴를 요청하여 이용 계약을 해지할 수 있습니다. 단 이용 계약이 종료되면 “회사”는 회원에게 부가적으로 제공한 각종 무료혜택을 회수할 수 있습니다.</p>
							
							<p class="text-sm-left">2. 제 1항에 따라 해지를 한 회원은 이 약관이 정하는 회원 가입 절차와 관련 조항에 따라 신규 회원으로 다시 가입 할 수 있습니다. 
							다만 회원이 중복 참여가 제한 된 판촉 이벤트 중복 참여 등 부정한 목적으로 회원 탈퇴 후 재이용을 신청하는 경우 “회사”는 6개월간 가입을 거부할 수 있습니다.  
							또한 가입신청자가 매물정보 등록과 허위매물 신고 및 이와 관련하여 이용정지 혹은 이용계약 해지의 제재를 받은 적이 있는 경우, 
							회사는 풀 하우스  매물관리규정의 내용에 따라서 재가입을 거부할 수 있습니다.</p>
							
							<p class="text-sm-left">3. 제 1항에 따라 해지를 한 이후에는 재가입이 불가하며, 모든 가입은 신규 가입으로 처리 됩니다.</p> 
							
							<p class="text-sm-left">4. 회원이 다음 각 호의 사유에 해당하는 경우, “풀 하우스 ”은 회원의 서비스 이용 정지, 일부 서비스 제한, 이용계약 해지 등을 할 수 있습니다.</p>
							
							<p class="text-sm-left">가입 신청 시에 허위 내용을 등록한 경우
							다른 사람의 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
							“풀 하우스 ”을 이용하여 법령 또는 이 약관이 금지하는 행위를 하는 경우
							“풀 하우스 ” 서비스를 이용하여 “풀 하우스 ”의 회원을 타 사이트로 유도하는 경우
							기타 ”회사”의 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 객관적으로 인정되는 경우</p>
							
							<p class="text-sm-left">5. 회원이 풀 하우스  매물관리규정을 위반하는 경우, 회사는 풀 하우스  매물관리규정의 내용에 따라 회원이 제공한 매물정보를 비공개처리, 
							회원의 서비스 이용정지, 이용계약 해지, 이용계약 해지 후 재가입 또는 신규가입 거부 등의 조치를 취할 수 있습니다. 자세한 내용은 풀 하우스  매물관리규정을 참고해 주시기 바랍니다.</p>
							
							<p class="text-sm-left">6. 회원이 다음 각 호의 사유에 해당하는 경우, “풀 하우스 ”은 회원과의 이용계약을 해지할 수 있습니다. 
							다만 6호, 7호, 8호의 경우에는 7일 이내에 시정할 것을 최고하고, 해당 기간 내에 시정하지 않는 경우로 한정합니다). </p>
							
							<p class="text-sm-left">“풀 하우스 ”이 회원 자격을 제한·정지시킨 후, 회원 자격을 제한 또는 정지시킨 사유와 동일한 행위를 2회 이상 반복하거나, 
							”풀 하우스 ”이 그러한 사유를 시정할 것을 요청하였음에도 불구하고 요청 후30일 이내에 그 사유가 시정되지 아니하는 경우
							“공인중개사 회원”이 적법한 절차를 거쳐 판매를 중개할 권원을 얻지 못한 “매물” 을 등록하는 행위가 2회 이상 반복되는 경우
							다른 회원의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령 또는 공서 양속에 위배되는 행위를 한 경우
							회원가입신청 승낙거부 사유가 추후 발견된 경우
							회사의 확인 결과 공인중개사 회원이 중개업을 휴업 또는 폐업한 경우
							회사가 제공하는 서비스의 원활한 진행을 방해하는 행위를 하거나 시도한 경우
							회사가 정한 서비스 운영정책을 이행하지 않거나 위반한 경우
							기타 회사가 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 인정할 경우</p>
							
							<p class="text-sm-left">7. “회사”가 해지를 하는 경우 “회사”는 “회원”에게 “회원”이 등록한 e-mail, 전화, 기타의 방법을 통하여 해지 사유를 밝혀 해지 의사를 통지 합니다. 
							이용 계약은 “회사”의 해지 의사를 회원에게 통지한 시점에서 종료 됩니다.</p>
							
							<p class="text-sm-left">8. 본 항에서 정한 바에 따라 이용 계약이 종료된 경우에는, 회원의 재이용 신청에 대하여 “회사”는 이에 대한 승인을 거부 할 수 있습니다.</p>  
							
							
							<p class="text-sm-center">제 11 조 (환불 규정)</p>
							
							<p class="text-sm-left">1. "회원"이 서비스를 일부 이용하고 환불 요청 시 결제대금에서 이용일수에 해당하는 금액과 총 이용금의 10% 위약금을 공제한 후 환급합니다. 
							“공인중개사 회원”이 중개업을 폐업신고한 후 환불 요청하는 경우도 같습니다. 단, 서비스 일부 이용 후 7일 이내 청약철회 요청 시 위약금 없이 결제대금의 이용일수에 해당하는 금액만 공제하고 환급합니다.</p>
							
							<p class="text-sm-left">2. 신용카드로 결제한 "회원"의 경우 구매 취소 시 기존에 결제하였던 내역을 전액 취소하며 취소 시점에 따라 상품 취소 수수료를 재승인 합니다. 
							이 경우 구매 취소 시점과 해당 카드사의 환불 처리기준에 따라 취소금액의 환급 방법과 환급일은 다소 차이가 있을 수 있으며, 사용한 신용카드의 환불 정책은 신용카드회사에 직접 문의해 주시기 바랍니다.</p>
							
							<p class="text-sm-left">3. "회원"이 타인의 신용카드 또는 휴대전화번호를 도용하여 부당한 이익을 편취하였다고 볼 수 있는 합리적 사유가 있는 경우 "회사”는 "회원"에게 소명 자료를 요청하고 환불을 보류할 수 있습니다.</p>
														
							<p class="text-sm-left">4. "회원"의 개인정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는 거절될 수 있습니다.</p>
							
							<p class="text-sm-left">5. 위약금과 사용일수 금액이 결제한 금액보다 클 경우 환불이 불가합니다.</p>
							
							<p class="text-sm-left">6. 본 약관에서 정하지 않은 환불에 관한 사항은 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령, 지침 또는 상관례에 의합니다.</p> 
							
							
							<p class="text-sm-center">제 12 조 (개인정보의 보호)</p>
							
							 <p class="text-sm-left">“회사”는 “회원”의 개인정보를 적법하게 수집, 이용하고 안전하게 보관합니다. “회사”는 필요·최소한의 개인정보만 수집·이용하고, “회원”의 동의 또는 법령상 근거가 없는 이상 제3자에게 제공하지 않습니다.
							 “회원”은 법령에서 달리 정하고 있지 않는 이상 언제든지 “회사”가 처리하고 있는 개인정보의 열람·처리정지·수정·삭제를 요청할 수 있고, 
							 “회사”는 지체 없이 관련 조치를 취합니다. 그 밖에 개인정보 수집, 이용, 제3자 제공, 수탁, 파기 등에 관한 사항은 “회사”가 별도로 제공하는 “개인정보 처리방침”에 따릅니다. 
							 “회사”의 홈페이지 또는 어플리케이션 이외의 사이트에는 회사의 약관과 개인정보 처리방침이 적용되지 않습니다.</p>
							
							
							<p class="text-sm-center">제 13조 (부동산 매물에 관한 정보 제공 서비스)</p>
							
							<p class="text-sm-left">“회사”는 부동산 매물에 관한 정보 제공 서비스를 운영하며, “이용자”는 스스로 해당 정보를 통하여 타 이용자와 부동산 거래를 할 수 있습니다. “회사”는 “이용자”와 직접 부동산 거래를 하지 않으며, 
							“이용자” 간의 성립된 부동산 거래와 관련된 법적 책임은 거래 당사자인 이용자들 스스로가 부담합니다. </p>
							
							
							<p class="text-sm-center">제 14 조 (정보 제공 및 광고 게재)</p>
							
							<p class="text-sm-left">1. “회사”는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 서비스 내 공지사항, 서비스 화면, 전자 우편 등의 방법으로 회원에게 제공 할 수 있습니다. 
							다만, 회원은 관련법에 따른 거래 관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 위 정보 제공에 대하여 수신 거절을 할 수 있습니다. </p>
							
							<p class="text-sm-left">2. “회사”는 서비스 운영과 관련하여 “회사”가 제공하는 서비스의 화면 및 홈페이지 등에 광고를 게재할 수 있습니다.</p>

							
							<p class="text-sm-center">제 15조 (거래부적합 매물 및 허위 매물)</p>
							
							<p class="text-sm-left">회사는 풀 하우스 에 등록된 매물 중 사회통념, 관례 및 “회사”가 정한 “풀 하우스  매물관리규정”에 따라 거래가 부적합하거나 허위 매물로 판단되는 경우 “풀 하우스  매물관리규정”에 따라 비공개처리 후 삭제, 
							수정을 요청하거나 직접 삭제 할 수 있으며, 그러한 정보 제공 및 매물 등록이 본 약관 또는 “풀 하우스  매물관리규정”에 위배되는 경우 본 약관 및 “풀 하우스  매물관리규정”의 내용에 따라 해당 회원의 서비스 이용을 정지하거나 회원과의 이용계약을 해지할 수 있습니다. 
							풀 하우스 에 부적합한 매물 및 허위 매물을 등록하여 거래 과정에서 타 이용자에게 손해가 발생하는 경우, 매물 등록자는 관련 법령에 의거하여 책임을 질 수 있습니다.</p>
							
							
							<p class="text-sm-cetner">제 16조 (부동산 거래 계약의 성립)</p>
							
							<p class="text-sm-left">1.“풀 하우스 ”에서 이루어지는 부동산 거래 승낙의 표시가 이용자 상호 간 합의 하에 이루어진 경우, 해당 계약이 성립한 것으로 봅니다. 
							이때 “회사”는 거래 당사자 간의 부동산 계약에 개입하지 않으며, 이와 관련해서 일체의 책임을 부담하지 않습니다.</p>
							
							<p class="text-sm-left">2. 이용자가 미성년자와 계약을 체결하는 경우에는 민법 및 관련 규정에 의하여 법정 대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정 대리인이 계약을 취소할 수 있습니다. 
							회사는 풀 하우스 에서 이루어지는 부동산 거래의 당사자가 미성년자가 아니라는 등 계약 체결에 필요한 권리능력을 갖추고 있는지 여부에 대하여 보증하지 않습니다.</p>
							
							
							<p class="text-sm-center">제 17조 (서비스의 이용)</p>
							
							<p class="text-sm-left">1. “이용자”는 풀 하우스  서비스에서 매물 등록이나 매물 찾기 등 부동산 거래 정보를 제공할 경우, 
							반드시 기본적으로 제공할 것으로 지정되어 있는 항목을 기재해야 하며, 추가적인 정보를 기재할 때에도 “풀 하우스 ”에서 지정하는 양식과 방법에 따라서 기재해야 합니다. </p>
							
							<p class="text-sm-left">. “이용자”는 각자가 제공한 정보에 대한 법적인 책임을 집니다.</p>
							
							<p class="text-sm-left">3. “풀 하우스 ”은 제18조의 규정된 컨텐츠 사용 목적과 방법에 따라서만 이용자가 제공한 정보를 사용합니다.</p> 
							
							<p class="text-sm-left">4. 이용자가 제공하는  “매물”에 대한 상세설명과 이미지는 제 3자의 권리를 침해하지 않아야 하며 해당 “매물”에 엄밀히 한정되어 관련되는 것이어야만 합니다. 
							또한 이용자는 매물정보 제공 시 제공하는 매물 정보와 관련없는 광고를 해서는 안 됩니다.</p>
							
							
							<p class="text-sm-center">제 18 조 (콘텐츠 사용에 대한 권리)</p>
							
							<p class="text-sm-left">1. “이용자”는 “풀 하우스 ”에 직접 작성한 콘텐츠에 대한 저작권을 보유합니다.</p>
							
							<p class="text-sm-left">2. “이용자”는 “풀 하우스 ”에 직접 작성한 콘텐츠를 제공함으로써, 콘텐츠 제공 시점부터 회사에 다음과 같은 내용의 해당 콘텐츠 이용권한을 부여합니다.</p>
							
							<p class="text-sm-left">콘텐츠 이용 목적 : “풀 하우스 ”의 부동산 거래 정보 제공 서비스 운영, “풀 하우스 ”의 부동산 관리 서비스 운영, “풀 하우스 ”의 부동산 계약 체결 지원 서비스 운영, 
							“풀 하우스 ” 서비스의 온라인/오프라인 광고, “풀 하우스 ” 서비스 기획, 운영, 고도화, 예측, 전략 수립 등을 위한 빅데이터 분석
							콘텐츠 이용 권한 : 복제, 배포, 전시, 수정, 공연, 파생저작물 제작이 가능한, 취소불가능한, 비독점적인, 로열티가 없는, 완납된, 전세계적인 라이선스 권한</p>
							
							<p class="text-sm-left">3. “이용자”는 본조 제2항의 콘텐츠 이용권한을 회사에 제공할 수 있는 권리를 가지고 있음을 보증합니다.</p>
							
							
							<p class="text-sm-center">제 19 조 (회사의 의무)</p>
							
							<p class="text-sm-left">1.“회사”는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.</p>
							
							<p class="text-sm-left">2. “회사”는 이용자 상호간의 거래에 있어서 어떠한 보증도 제공하지 않습니다. 이용자 상호간 거래 행위에서 발생하는 문제 및 손실에 대해서 “회사”는 일체의 책임을 부담하지 않으며, 거래 당사자 간에 직접 해결해야 합니다.</p> 
							
							
							<p class="text-sm-center">제 20 조 (회원의 ID 및 비밀번호에 대한 의무)</p>
							
							<p class="text-sm-left">1. ID와 비밀번호에 관한 관리책임은 “회원”에게 있습니다.</p>
							
							<p class="text-sm-left">2. “회원”은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</p>
							
							<p class="text-sm-left">3. “회원”이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “풀 하우스 ”에 통보하고 “풀 하우스 ”의 안내가 있는 경우에는 그에 따라야 합니다.</p>

							
							<p class="text-sm-center">제 21 조 (이용자의 의무)</p>
							
							<p class="text-sm-left">1. “이용자”는 다음 행위를 하여서는 안됩니다. 만약 다음 각 호와 같은 행위가 확인되면 “회사”는 추가적인 피해 발생을 막기 위하여 
							“이용자”에게 위반 사실과 서비스 일시 중단을 통지하고 5일 이내에 시정할 것을 요구합니다. 
							“이용자”가 동 기간 내에 소명하지 아니하거나 정당한 사유를 제시하지 못할 경우 “회사”는 “이용자”와의 서비스 이용 계약을 해지할 수 있습니다. </p>
							
							<p class="text-sm-left">타인의 정보 도용
							“풀 하우스 ”에 게시된 정보의 허위 변경
							“풀 하우스 ”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
							“풀 하우스 ” 기타 제3자의 저작권 등 지적재산권에 대한 침해
							“풀 하우스 ” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
							외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 “풀 하우스 "에 공개 또는 게시하는 행위
							“풀 하우스 ”에 게시된 “임대인"의 연락처 또는 개인정보를 부동산 거래 외 다른 용도로 사용
							“회사” 서비스 운영을 고의 및 과실로 방해하는 경우
							기타 현행 법령 위반 등 중대한 사유로 인하여 “회사”가 서비스 제공을 지속하지 못할 객관적인 이유가 있는 경우</p>
							
							<p class="text-sm-left">2. “풀 하우스 ”은 “회사”의 정책에 따라 회원 간의 차별화된 유료 서비스를 제공할 수 있습니다.</p>
							
							
							<p class="text-sm-center">제 22 조 (저작권의 귀속 및 이용 제한)</p>
							
							<p class="text-sm-left">“이용자”는 서비스를 이용함으로써 얻은 정보·컨텐츠 중 “회사”가 저작권 등 지적 재산권을 보유하고 있는 정보·컨텐츠를 “회사”의 사전 승낙 없이 복제, 송신, 출판, 배포, 
							방송 기타 방법에 의하여 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</p>
							
							
							<p class="text-sm-cetner">제 23 조 (면책 및 회원·이용자간 분쟁해결)</p>
							
							<p class="text-sm-left">1. “회사”는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.</p>
							
							<p class="text-sm-left">2. 회사”는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.</p>
							
							<p class="text-sm-left">3. 회사는 서비스용 설비의 보수, 교체, 점검, 공사 등 서비스 운영에 필요한 상당한 사유로 발생한 손해에 대해 회사의 고의 또는 과실이 없는 한 책임이 면제됩니다. 
							단, 서비스 제공이 중단된 기간은 유료 서비스 기간에서 제외합니다.</p>
							
							<p class="text-sm-left">4. “회사”는 “이용자”의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.</p>
							
							<p class="text-sm-left">5. “회사”는 “이용자”의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.</p>
							
							<p class="text-sm-left">6. “회사”는 이용자가 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.</p>
							
							<p class="text-sm-left">7. “회사”는 회원이 게재한 정보, “자료, 사실의 신뢰도, 정확성 등의 내용에 관하여 회사의 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.</p>
							
							<p class="text-sm-left">8. 회사는 이용자 상호간 및 이용자와 제 3자 사이에 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 책임을 지지 않으며, 그러한 분쟁은 분쟁당사자들이 직접 해결하여야 합니다. 
							이와 관련하여 “회사”는 공인중개사 회원이 제공한 매물 정보를 표시할 경우 공인중개사 회원의 성명, 주소, 전화번호, 공인중개사 등록번호를 함께 제공하며, “회사”가 부동산 중개 거래의 당사자가 아니라는 사실을 명확하게 표시합니다.</p>
							
							
							<p class="text-sm-center">제 24 조 (재판권 및 준거법)</p>
							
							<p class="text-sm-left">1. 서비스 이용과 관련하여 회사와 이용자 간의 분쟁에 관한 소송의 관할은 민사소송법에 의합니다.</p> 
							
							<p class="text-sm-left">2. 본 계약은 대한민국 법에 의하여 해석됩니다.</p> 
							
							<p class="text-sm-left">본 약관은 2018년 6월 15일부터 적용 합니다.</p>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="close" data-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="mymodal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title " id="exampleModalLongTitle">개인 정보 이용 약관</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
						</div>
						
						<div class="modal-body">
							<p>개인 사용자 가입</p>
							
							<p>개인 정보의 수집 및 이용에 대한 안내</p>
							
							<p>(주)스테이션4는 서비스 제공을 위해서 아래와 같이 개인정보를 수집합니다.</p> 
							<p>서비스 제공에 필요한 최소한의 개인 정보 이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.</p>
							
							<p>• 개인정보 항목: 휴대폰 번호, 이름, e-mail(ID) 및 비밀번호</p>
							
							<p>• 수집 및 이용 목적: 서비스의 원활한 제공 및 운영 회원관리, 마케팅 및 광고에의 활용</p>
							
							<p>• 보유 및 이용기간: 이용계약 종료 후 즉시 파기(단 재가입 유예기간동안 2개월까지)</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="close" data-dismiss="modal">닫기</button>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>

