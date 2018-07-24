<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <div class="sidebar" data-color="blue"  style="width:480px;height:calc(100%);right:0;">
<!--      
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
        	  〉
        </a>
        <a href="#" class="simple-text logo-normal">
                 검색 결과 ${count} 개
        </a>
      </div>
		<!--       슬라이드바 상단 -->
      <div class="sidebar-wrapper" id="sidebar" style="height:100%;">
		<table class="table table-bordered">
			<br/>
			<tr>
				<th><center>번호</center></th>
				<th><center>주소</center></th>
				<th><center>위도</center></th>
				<th><center>경도</center></th>
				<th><center>날짜</center></th>
			</tr>
      	<c:forEach var="dto" items="${list}">
      		<tr>
      			<td>${dto.build_no}</td>
      			<td>${dto.address}</td>
      			<td>${dto.lat}</td>
      			<td>${dto.lng}</td>
				<td>${dto.bu_rdate}</td>      	
      		</tr>
      	</c:forEach>
      	</table>
   

	<div id="page" style="height:100px;width:100%;background-color:red;position:absolute;bottom:0;">  

      		<!-- 5. paging view -->
			<ul class="pagination" style="justify-content:center">
		
			<!-- 이전 페이지 이동 -->
			<li class="page-item"><a class="page-link" onclick='pagePre(${page.index}, ${page.pageStartNum}, ${page.total},${page.listCnt},${page.pageCnt});'>&lsaquo;</a></li>
		
			<!--페이지번호 -->
			<c:forEach var='i' begin="${page.pageStartNum}" end="${page.pageLastNum}" step="1">
				<li class='pageIndex${i}' id='idx${i}'><a class="page-link" onclick='pageIndex(${i-1}, ${i}, ${page.total}, ${page.listCnt}, ${page.pageCnt});'>${i}</a></li>
			</c:forEach>
		
			<!--다음 페이지 이동 -->
			<li class="page-item"><a class="page-link" onclick='pageNext(${page.index}, ${page.pageStartNum}, ${page.total},${page.listCnt},${page.pageCnt});'>&rsaquo;</a></li>
			</ul>

			<form action="sub('index')" method="post" id='frmPaging'>
				<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
			<input type='hidden' name='index' id='index' value='${page.index}'>
			<input type='hidden' name='pageStartNum' id='pageStartNum' value='${page.pageStartNum}'>
			<input type='hidden' name='listCnt' id='listCnt' value='${page.listCnt}'>	
			</form>
		</div>
    </div>
    	
    </div> 
    <div class="main-panel" style="background-color:navy" >
    
       <!-- Navbar -->
    <div class="sub-panel" >
      <nav class="navbar navbar-expand-lg bg-primary navbar-transparent navbar-absolute" >
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">FullHouse</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
             <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search..." size="50dp">
                  <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
            </form>
            
            <div class="collapse navbar-collapse justify-content-end">
            	<style>
    				#menubar a:hover { font-weight:bold;color:orange; }
				</style>
	            <div id="menubar" class="collapse navbar-collapse justify-content-center">
				
	            	<div><a class="navbar-brand" href="./map.do" >방검색</a></div>
	            	<div><a class="navbar-brand" href="./myMap.do">관심목록</a></div>
	            	<div><a class="navbar-brand" href="#pablo">방 등록</a></div>
	            	<div><a class="navbar-brand" href="#pablo">공인중개사 회원가입</a></div>
	            	<div><a class="navbar-brand" href="#pablo">회원가입 및 로그인</a></div>
	            </div>
	            <!--  ul 지구본, 드랍다운 메뉴 등     -->
	         <ul class="navbar-nav ml-auto align-items-lg-center" style="margin-right:40px">
	         <i class="now-ui-icons users_single-02"></i>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="kind_of_sale" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="font-size: 0.85em">박종석 님</a>
                
             <div class="dropdown-menu " aria-labelledby="navbar_1_dropdown_1">
               	<a class="dropdown-item" id="my_info" href="#">내정보</a>
                <a class="dropdown-item" id="log_out" href="#">로그 아웃</a>
              </div>
              </li>
            </ul>
	          </div>
	        </div>
	      </div>
	    </nav>
	       
<!-- 	sub-panel   -->
	</div>
	
					