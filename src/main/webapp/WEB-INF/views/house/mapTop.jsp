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
        <a href="#" class="simple-text logo-normal" >
                 <div id="listCount">검색 결과 ${count} 개</div>
        </a>
      </div>
	<!--       슬라이드바 상단 -->
	<div class="sidebar-wrapper" id="sidebar" style="height:100%;">
	<div class ="itemList" style="width:95%;height:145px;border:1px solid gray;margin:5px;margin-left:12px;">
		<a href="#" target="_blank" >
			<div class="RoomItem-preview" style="width:120px;height:145px;float:left" >
				<div class="RoomItem-preview__image" ></div>
				<div class="RoomItem-preview__image" style="background-image:url(../kanu/roomimg/1.jpeg);width:100%;height:138px;margin:3px;" ></div>
				<div class="RoomItem-preview__cover" ></div>
			</div>
			<div class="RoomItem-detail">
				<div class="RoomItem-info" >
					<div class="RoomItem-header" >
						<div class="RoomItem-price" >
							<p>
								<span class="RoomItem-price__type" >월세</span>
								<span class="RoomsItem-price__title is-0" >7000/60</span>
							</p>
						</div>
						<span class="room-visited" >
							<i class="dabang-icon" ></i>
						</span>
						<div class="RoomItem-icons" >
							<span class="room-favorite" >
								<i class="dabang-icon dabang-icon-heart-o icon-size-2xl" ></i>
							</span>
						</div>
					</div>
					<span class="RoomItem-summary" >
						<span >쓰리룸 </span>
						<span > 4층 </span>
						<span > 59.4m²</span>
					</span>
					<div class="RoomItem-types types" >
						<span class="#주차 tag" >#주차</span>
					</div>
					<span class="RoomItem-title"> 신축첫입주/왕테라스/7호선역세권/초등학교인접된 3룸입니다.</span>
					<span class="RoomItem-date" >2일전</span>
				</div>
				<div class="RoomItem-options" >
					<span class="option-list clearfix" >
						<span class="title" >옵션</span>
							<span class="ellipsis" >에어컨, 가스레인지, 신발장, 전자도어락</span>
					</span>
				</div>
			</div>
		</a>
	</div>
		
		
		

   

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
            <img src="../kanu/main/로고.png" class="avatar avatar-sm bg-#00000000" style="background-color:transparent;width:50px;margin-left:-30px">
            <a class="navbar-brand" href="./main.do">FullHouse</a>
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
	            	<div><a class="navbar-brand" href="./testInjection.do">공인중개사 회원가입</a></div>
	            	<div><a class="navbar-brand" href="#pablo">회원가입 및 로그인</a></div>
	            </div>
	            <!--  ul 지구본, 드랍다운 메뉴 등     -->
	         <ul class="navbar-nav ml-auto align-items-lg-center" style="margin-right:40px">
	         <i class="now-ui-icons users_single-02"></i>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="my_station" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="font-size: 0.85em">박종석 님</a>
                
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
	
					