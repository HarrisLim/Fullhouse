<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
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
  
    <nav class="navbar navbar-expand-lg navbar-transparent navbar-dark bg-dark py-4">
      <div class="container">
        <a class="navbar-brand" href="#"><strong>풀 하우스 </strong> FullHouse - Pro</a>
        <button class="navbar-toggler" type="button" data-action="offcanvas-open" data-target="#navbar_main" aria-controls="navbar_main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse offcanvas-collapse" id="navbar_main">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <h6 class="dropdown-header font-weight-600 d-lg-none px-0">Menu</h6>
            
            <!-- 하이브리드 시작 -->
				<li>
				<a href="#" class="navbar-brand">상품소개</a>
				</li>&nbsp;
				
				<li>
				<a href="#" class="navbar-brand">고객센터</a>
				</li>&nbsp;
				
				<li>
				<a href="#" class="navbar-brand">회원가입</a>
				
				</li>
				<li>
				<a href="#" class="navbar-brand" data-toggle="modal" data-target="#myModal" >로그인</a>
				</li>
			
				<!-- 하이브리드 종료 -->

            <!-- 모달 시작 -->	<!-- Modal -->
            
			<div class="modal fade" id="myModal" role="dialog" aria-hidden="true" tabindex="-1">
			 <div class="modal-dialog" role="document"> 
			      <!-- Modal content-->
			      <div class="modal-content">
			     
			      
			        <div class="modal-header">
			        <h4 class="modal-title">로그인</h4>
			        <button type="button" class="close" aria-label="Close" data-dismiss="modal" >
				  <span aria-hidden="true">&times;</span>
					</button>
			          
			    
			        </div>
			        <div class="modal-body">
			        
			        	<!--  아이디 비밀번호 입력란,  -->
			         	      <form role="form">
					            <div class="form-group">
					              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
					              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
					            </div>
					            <div class="form-group">
					              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
					              <input type="text" class="form-control" id="psw" placeholder="Enter password">
					            </div>
					              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> 로그인</button>
					          </form>
					        </div>

					        <div class="modal-footer" >
					          	<a href="#"class="btn btn-danger btn-default pull-left" >회원가입</a></p>
					          	<a href="#"class="btn btn-danger btn-default pull-left" >비밀번호 찾기</a></p>   
						  </div>
			  <!-- 동영상 집어넣는것  -->
        </div>
      </div>
    </nav>
    
    
    
    
    