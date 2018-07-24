<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>Full House is Station4 ^_^</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    <!--항상 최신 버전의 SDK를 사용합니다.-->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer>
	
</script>
  </head>
  <body>
  
  <%@ include file="nav.jsp"%>
  
    <main class="main">
      <section class="spotlight parallax bg-cover bg-size--cover" data-spotlight="fullscreen" style="background-image: url('../assets/images/backgrounds/img-1.jpg')">
        <span class="mask bg-primary alpha-7"></span>
        <div class="spotlight-holder py-lg pt-lg-xl">
          <div class="container d-flex align-items-center no-padding">
            <div class="col">
              <div class="row cols-xs-space align-items-center text-center text-md-left justify-content-center">
                <div class="col-7">
                  <div class="text-center mt-5">
                    <img src="../assets/images/brand/icon.png" style="width: 200px;" class="img-fluid animated" data-animation-in="jackInTheBox" data-animation-delay="1000">
                    <h2 class="heading display-4 font-weight-400 text-white mt-5 animated" data-animation-in="fadeInUp" data-animation-delay="2000">
                      <span class="font-weight-700">Full House</span>
                    </h2>
                    <p class="lead text-white mt-3 lh-180 c-white animated" data-animation-in="fadeInUp" data-animation-delay="2500">
                                                   안녕하세요 바까봤으여~ <strong class="text-white">수정이 할랑</strong>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
	  <section class="slice pt-5 sct-color-1">
        <div class="container">
          <div class="row justify-content-center align-items-center">
            <div class="col-lg-8 text-center">
              <h3 class="heading h3 font-weight-400">
                I am ready to start a new project with <span class="font-weight-800">Full House</span>
              </h3>
            </div>
          </div>
        </div>
      </section>
	<section>
    	<%@ include file="themeS.jsp"%>
      </section>
      <section class="slice pt-10 sct-color-2">
      	<div class="container">
        	<div class="row">
        		<div class="col-6 col-md">
		            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">형태별 검색</h5>
		            <ul class="list-unstyled text-small">
		              <li><a class="text-muted" href="#">원룸</a></li>
		              <li><a class="text-muted" href="#">투룸</a></li>
		              <li><a class="text-muted" href="#">쓰리룸</a></li>
		              <li><a class="text-muted" href="#">오피스텔</a></li>
		              <li><a class="text-muted" href="#">아파트</a></li>
		            </ul>
          		</div>
		        <div class="col-6 col-md">
		            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">테마별 검색</h5>
		            <ul class="list-unstyled text-small">
		              <li><a class="text-muted" href="#">저보증금</a></li>
		              <li><a class="text-muted" href="#">오피스텔</a></li>
		              <li><a class="text-muted" href="#">직거래 매물</a></li>
		              <li><a class="text-muted" href="#">주차 가능</a></li>
		              <li><a class="text-muted" href="#">반려동물 가능</a></li>
		              <li><a class="text-muted" href="#">360도 매물</a></li>
		            </ul>
		        </div>
		        <div class="col-6 col-md">
		            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">공인중개사 회원가입</h5>
		            <ul class="list-unstyled text-small">
		              <li><a class="text-muted" href="#">풀하우스 이용 설명서</a></li>
		              <li><a class="text-muted" href="#">가입 신청</a></li>
		            </ul>
		            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">상품소개</h5>
		            <ul class="list-unstyled text-small">
		              <li><a class="text-muted" href="#">동 상품</a></li>
		              <li><a class="text-muted" href="#">지하철 상품</a></li>
		              <li><a class="text-muted" href="#">캠퍼스 상품</a></li>
		              <li><a class="text-muted" href="#">일반 상품</a></li>
		            </ul>
		        </div>
	            <div class="col-6 col-md">
	            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">풀 하우스 뉴스</h5>
	            <ul class="list-unstyled text-small">
	              <li><a class="text-muted" href="#">공지사항</a></li>
	              <li><a class="text-muted" href="#">이벤트</a></li>
	              <li><a class="text-muted" href="#">기사보기</a></li>
	              <li><a class="text-muted" href="#">일반 상품</a></li>
	            </ul>
	            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">고객지원</h5>
	              <ul class="list-unstyled text-small">
		              <li><a class="text-muted" href="#">자주 묻는 질문</a></li>
		              <li><a class="text-muted" href="#">Android / IOS</a></li>
		              <li><a class="text-muted" href="#">웰페이퍼</a></li>
		              <li><a class="text-muted" href="#">풀 하우스 공식 포스트</a></li>
	              </ul>
	            </div>
	            <div class="col-6 col-md">
	              <h5 class="heading h6 text-uppercase font-weight-700 mb-3">About 풀 하우스</h5>
	              <ul class="list-unstyled text-small">
	                <li><a class="text-muted" href="#">팀 소개</a></li>
	                <li><a class="text-muted" href="#">오시는 길</a></li>
	                <li><a class="text-muted" href="#">제휴문의</a></li>
	              </ul>
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
