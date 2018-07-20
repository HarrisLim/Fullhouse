<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>Full House Custm</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    
	<style>
		::-webkit-input-placeholder {
		   text-align: center;
		}
		
		:-moz-placeholder { /* Firefox 18- */
		   text-align: center;  
		}
		
		::-moz-placeholder {  /* Firefox 19+ */
		   text-align: center;  
		}
		
		:-ms-input-placeholder {  
		   text-align: center; 
		}
	</style>
	
	<style>
	.border-styles > p{
		margin: 2px 0;
		padding: 1px 3px;
		border-width: 2px;
		border-color: #aaa;
	}
	</style>
	
		
	<script type="text/javascript">
		
		function doDisplay(){
	        $("#myDIV2").css("display", "none");
	        $("#myDIV4").css("display", "none");
	        $("#myDIV6").css("display", "none");
	        $("#myDIV8").css("display", "none");
	        $("#myDIV10").css("display", "none");
	        $("#myDIV12").css("display", "none");
	        $("#myDIV14").css("display", "none");
	        $("#myDIV16").css("display", "none");
	        $("#myDIV18").css("display", "none");
	        $("#myDIV20").css("display", "none");
	        $("#myDIV22").css("display", "none");
	        $("#myDIV24").css("display", "none");
	        $("#myDIV1").toggle();
	        $("#myDIV3").toggle();
	        $("#myDIV5").toggle();
	        $("#myDIV7").toggle();
	        $("#myDIV9").toggle();
	        $("#myDIV11").toggle();
	        $("#myDIV13").toggle();
	        $("#myDIV15").toggle();
	        $("#myDIV17").toggle();
	        $("#myDIV19").toggle();
	        $("#myDIV21").toggle();
	        $("#myDIV23").toggle();
		}
		
		function callFunction(i){
	        $("#myDIV"+i).toggle();
		}
		
		
	</script>	
	
	
	  </head>
  <body>

	<nav class="navbar navbar-expand-lg navbar-transparent navbar-light bg-white py-4">
		<div class="container">
			<a class="navbar-brand" href=""><strong>Full House</strong>Customer</a>
				<button class="navbar-toggler" type="button"
					data-action="offcanvas-open" data-target="#navbar_main"
					aria-controls="navbar_main" aria-expanded="false"
					aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
			<div class="navbar-collapse offcanvas-collapse" id="navbar_main">
				<ul class="navbar-nav ml-auto align-items-lg-center">
					<h6 class="dropdown-header font-weight-600 d-lg-none px-0">Menu</h6>
					<li class="nav-item "><a class="navbar-brand"
						href="">상품소개</a></li>
					<li class="nav-item "><a class="navbar-brand"
						href="">고객센터</a></li>

					<li class="nav-item"><a class="nav-link"
						href="">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main class="main">

	<section class="slice slice-xl">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="text-center pt-lg-md">
						<h2 class="heading h1 mb-4">자주 묻는 질문 </h2>
						
						<p class="lead lh-180">We are a professional digital agency
							providing premium themes, UI/UX design and web apps that you will
							simply love.</p>
						<div class="input-group">
							<input type="text" class="form-control" 
								placeholder="이곳에 궁금한 점을 검색해 보세요!"
								
								aria-describedby="basic-addon2"> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

		<section  class="" >
		<div class="container" style='text-align:center' >
			<div class="row justify-content-center" >
				<div class="col-lg-7" > 
		<div>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" onclick="doDisplay()" class="btn btn-block btn-outline-tertiary mt-5">전체질문</button>
			  <button type="button" class="btn btn-block btn-outline-tertiary mt-5">회원정보 / 계정관리</button>
			  <button type="button" class="btn btn-block btn-outline-tertiary mt-5">매물 / 광고 관리</button>
			  <button type="button" class="btn btn-block btn-outline-tertiary mt-5">상품 / 결재 관리</button>
			  <button type="button" class="btn btn-block btn-outline-tertiary mt-5">리뷰 / 실시간 문의</button>
			  <button type="button" class="btn btn-block btn-outline-tertiary mt-5">기타</button>
			</div>
		</div>
				<hr>
				<div align="left" id="myDIV1">
				    <a href="javascript:callFunction(2);"  > Q .아이디 를 변경할수 없나요?</a><i class="fas fa-angle-down"></i>
					<div id="myDIV2" style="display:none"">
				    	<p>아이디는 회원의 고유 게정으로 활용되는 수단으로 변경 및 수정이 불가합니다.  </p>
				    </div> 
				</div>
				<hr>
				<div align="left" id="myDIV3" >
				    <a href="javascript:callFunction(4);">회원 정보를 변경하고 싶어요.</a>
					<div id="myDIV4" style="display:none">
				    	<p>가입된 회원정보 변경은 사이트 메인 > 계정관리에서 가능합니다.  </p>
					</div>
				</div>
				<hr>
				<div align="left" id="myDIV5">
				    <a href="javascript:callFunction(6);">직원들과 광고상품을 나누어 관리하고 싶어요.</a>
					<div id="myDIV6" style="display:none">
				    	<p>결제한 상품을 여러 직원이 함께 나누어 이용하실 수 있습니다.	계정관리> 하위 계정관리에서 
				    	사용하고자 하는 아이디(이메일)을 추가 하시면 됩니다. </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV7">
				    <a href="javascript:callFunction(8);">하위계정 추가 (수정/삭제) 는 어디서 하나요?</a>
					<div id="myDIV8" style="display:none">
				    	<p>하위계정을 삭제할 경우 계정에 등록된 매물정보도 함께 삭제 처리되므로,필히 매물이동 가능을 통해 다른계정으로 매물이동 후 삭제하시기 바랍니다. </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV9">
				    <a href="javascript:callFunction(10);">회원 탈퇴는 어디서 해야하나요?  </a>
					<div id="myDIV10" style="display:none">
				    	<p>현재 재가입은 제한하지 않으므로 언제든 가입이 가능합니다.   </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV11">
				    <a href="javascript:callFunction(12);">회원탈퇴 후 재가입은 가능한가요? </a>
					<div id="myDIV12" style="display:none">
				    	<p>상품관리 > 이용중인 상품에서 사용중인 상품 정보봐 광고기간을 확인하실 수 있습니다.  </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV13">
				    <a href="javascript:callFunction(14);">상품내역은 어디서 확인 가능한가요?  </a>
					<div id="myDIV14" style="display:none">
				    	<p>상품관리 > 이용중인 상품에서 사용중인 상품 정보의 광고기간을 확인하실 수 있습니다.  </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV15">
				    <a href="javascript:callFunction(16);">환불을 하고싶어요 !  </a>
					<div id="myDIV16" style="display:none">
				    	<p>환불은 상품의 사용기간과 사용수량을 확인 후에 최종 환불금액이 산정됩니다. 1899-6804로 연락주시면 운영자 확인후 처리됩니다, </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV17">
				    <a href="javascript:callFunction(18);">결재 연장이 뭔가요?  </a>
					<div id="myDIV18" style="display:none">
				    	<p>현재 이용중인 상품의 광고기간을 연장하는 기능입니다. 필요한 기간만큼 추가로 결제하여 광고 기간을 연장할수 있습니다.    </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV19">
				    <a href="javascript:callFunction(20);">상품 결제 확인서 또는 계약서를 받고싶어요. </a>
					<div id="myDIV20" style="display:none">
				    	<p>결제가 완료된 상품의 계약사실확인서를 제공하고 있습니다. 상품관리 > 이용중인 상품 > 계약확인서 보기를 클릭하세요</p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV21">
				    <a href="javascript:callFunction(22);">예전에 이용햇던 상품을 보고싶어요  </a>
					<div id="myDIV22" style="display:none">
				    	<p>상품관리 > 지난 이용 내역에서 기존에 사용했던 상품 이력을 확인하실수 있습니다.  </p>
				    </div>
				</div>
				<hr>
				<div align="left" id="myDIV23">
				    <a href="javascript:callFunction(24);">회원 탈퇴후 재가입은 가능한가요?  </a>
					<div id="myDIV24" style="display:none">
				    	<p>회원 탈퇴는 프로사이트 로그인후 계정 관리 우측하단 "회원 탈회" 를 통해 가능합니다.  </p>
				    </div>
				</div>
				<hr>
			</div>
			<hr>
			</div>
		</div>
		</div>
	</section>
		

<!-- 일단 여기 까지 윗부분  -->

					
	<section class="slice bg-tertiary bg-cover bg-size--cover"
		style="background-image: url('../assets/images/backgrounds/img-1.jpg')">
		<span class="mask bg-tertiary alpha-9"></span>
		<div class="container">
			<div class="row cols-xs-space cols-sm-space cols-md-space">
				<div class="col-lg-6">
					<div
						class="card bg-dark alpha-container text-white border-0 overflow-hidden">
						<a href="#" target="_blank">
							<div class="card-img-bg"
								style="background-image: url('../assets/images/prv/city-1.jpg');"></div>
							<span class="mask bg-dark alpha-5 alpha-4--hover"></span>
							<div class="card-body px-5 py-5">
								<div style="min-height: 300px;">
									<h3 class="heading h1 text-white mb-3">New York Office</h3>
									<p class="mt-4 mb-1 h5 text-white lh-180">E:
										newyork@company.com</p>
									<p class="mb-1 h5 text-white lh-180">T: 0755.222.333</p>
								</div>
								<span href="#" class="text-white text-uppercase font-weight-500">
									See on map <i class="fas fa-arrow-right ml-2"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div
						class="card bg-dark alpha-container text-white border-0 overflow-hidden">
						<a href="#" target="_blank">
							<div class="card-img-bg"
								style="background-image: url('../assets/images/prv/city-2.jpg');"></div>
							<span class="mask bg-dark alpha-5 alpha-4--hover"></span>
							<div class="card-body px-5 py-5">
								<div style="min-height: 300px;">
									<h3 class="heading h1 text-white mb-3">New York Office</h3>
									<p class="mt-4 mb-1 h5 text-white lh-180">E:
										newyork@company.com</p>
									<p class="mb-1 h5 text-white lh-180">T: 0755.222.333</p>
								</div>
								<span href="#" class="text-white text-uppercase font-weight-500">
									See on map <i class="fas fa-arrow-right ml-2"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="slice slice-lg">
		<div class="container">
			<div
				class="row align-items-center cols-xs-space cols-sm-space cols-md-space">
				<div class="col-lg-6">
					<h3 class="heading h3 mb-4">Send us a message</h3>
					<form>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input class="form-control" placeholder="Name" type="text">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input class="form-control" placeholder="Email address"
										type="email">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control" rows="5"
										placeholder="Your message"></textarea>
								</div>
							</div>
						</div>
						<div class="mt-4">
							<button type="submit" class="btn btn-primary px-4">Send
								message</button>
						</div>
					</form>
				</div>
				<div class="col-lg-5 ml-lg-auto">
					<h3 class="heading heading-3 strong-300">
						150 Southeast Pidgeon Meadow <br> Claflin Terrace, 305458
					</h3>
					<p class="lead mt-4 mb-4">
						E: <a href="#">support@webpixels.io</a> <br> T: 0755.222.333
					</p>
					<p class="">Probably the most complete UI kit out there.
						Multiple functionalities and controls added, extended color
						palette and beautiful typography, designed as its own extended
						version of Bootstrap at the highest level of quality.</p>
				</div>
			</div>
		</div>
	</section>
	</main>
	<footer class="pt-5 pb-3 footer  footer-dark bg-tertiary">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4">
					<div class="pr-lg-5">
						<h1 class="heading h6 text-uppercase font-weight-700 mb-3">
							<strong>Boomerang</strong> UI Kit
						</h1>
						<p>Boomerang is a high quality UI Kit built on top of the well
							known Bootstrap 4 Framework. This theme was designed as its own
							extended version of Bootstrap with multiple functionalities and
							controls added, extended color palette and beautiful typography.</p>
					</div>
				</div>
				<div class="col-6 col-md">
					<h5 class="heading h6 text-uppercase font-weight-700 mb-3">Features</h5>
					<ul class="list-unstyled text-small">
						<li><a class="text-muted" href="#">Cool stuff</a></li>
						<li><a class="text-muted" href="#">Random feature</a></li>
						<li><a class="text-muted" href="#">Team feature</a></li>
						<li><a class="text-muted" href="#">Stuff for developers</a></li>
						<li><a class="text-muted" href="#">Another one</a></li>
						<li><a class="text-muted" href="#">Last time</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5 class="heading h6 text-uppercase font-weight-700 mb-3">Solutions</h5>
					<ul class="list-unstyled text-small">
						<li><a class="text-muted" href="#">Resource</a></li>
						<li><a class="text-muted" href="#">Resource name</a></li>
						<li><a class="text-muted" href="#">Another resource</a></li>
						<li><a class="text-muted" href="#">Final resource</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5 class="heading h6 text-uppercase font-weight-700 mb-3">Resources</h5>
					<ul class="list-unstyled text-small">
						<li><a class="text-muted" href="#">Business</a></li>
						<li><a class="text-muted" href="#">Education</a></li>
						<li><a class="text-muted" href="#">Government</a></li>
						<li><a class="text-muted" href="#">Gaming</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5 class="heading h6 text-uppercase font-weight-700 mb-3">About</h5>
					<ul class="list-unstyled text-small">
						<li><a class="text-muted" href="#">Team</a></li>
						<li><a class="text-muted" href="#">Locations</a></li>
						<li><a class="text-muted" href="#">Privacy</a></li>
						<li><a class="text-muted" href="#">Terms</a></li>
					</ul>
				</div>
			</div>
			<hr>
			<div class="d-flex align-items-center">
				<span class=""> &copy; 2018 <a href="https://webpixels.io/"
					class="footer-link" target="_blank">Webpixels</a>. All rights
					reserved.
				</span>
				<ul class="nav ml-lg-auto">
					<li class="nav-item"><a class="nav-link active"
						href="https://instagram.com/webpixelsofficial" target="_blank"><i
							class="fab fa-instagram"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://facebook.com/webpixels" target="_blank"><i
							class="fab fa-facebook"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://github.com/webpixels" target="_blank"><i
							class="fab fa-github"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://dribbble.com/webpixels" target="_blank"><i
							class="fab fa-dribbble"></i></a></li>
				</ul>
			</div>
		</div>
	</footer>
	<!-- Core -->
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/popper/popper.min.js"></script>
	<script src="../assets/js/bootstrap/bootstrap.min.js"></script>
	<!-- FontAwesome 5 -->
	<script src="../assets/vendor/fontawesome/js/fontawesome-all.min.js"
		defer></script>
	<!-- Page plugins -->
	<script
		src="../assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script
		src="../assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="../assets/vendor/input-mask/input-mask.min.js"></script>
	<script src="../assets/vendor/nouislider/js/nouislider.min.js"></script>
	<script
		src="../assets/vendor/textarea-autosize/textarea-autosize.min.js"></script>
	<!-- Theme JS -->
	<script src="../assets/js/theme.js"></script>
</body>
</html>