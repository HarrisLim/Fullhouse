<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav class="navbar navbar-expand-lg navbar-transparent navbar-dark bg-dark py-4">
      <div class="container">
        <a class="navbar-brand" href="../house/test.do"><strong>Full House</strong> Station4</a>
        <button class="navbar-toggler" type="button" data-action="offcanvas-open" data-target="#navbar_main" 
        							aria-controls="navbar_main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse offcanvas-collapse" id="navbar_main">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <li class="nav-item active" >
              <a class="nav-link" href="../house/main.do">FHS Pro</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbar_main_dropdown_1" role="button" data-toggle="dropdown" 
              															aria-haspopup="true" aria-expanded="false">검색</a>
              <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
                <a class="dropdown-item" href="../pages/homepage.html">방 검색</a>
                <a class="dropdown-item" href="../pages/about.html">방 등록</a>
                <a class="dropdown-item" href="../pages/sign-in.html">관심 목록</a>
              </div>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="">공인중개사 회원가입</a>
            </li>
            <li>
            	<a class="nav-link" data-toggle="modal" href="#myModal">회원가입 및 로그인</a>
            </li>
			<!-- Modal -->
			 <div class="modal fade" id="myModal" role="dialog">
			   <div class="modal-dialog">
			     <!-- Modal content-->
			     <div class="modal-content">
			       <div class="modal-header">
			         <button type="button" class="close" data-dismiss="modal">&times;</button>
			         <h4 class="modal-title">Modal Header</h4>
			       </div>
			       <div class="modal-body">
			         <p>Some text in the modal.</p>
			       </div>
			       <div class="modal-footer">
			         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			       </div>
			     </div>
			     
			   </div>
			 </div>
			 
		  </ul>
        </div>
      </div>
    </nav>