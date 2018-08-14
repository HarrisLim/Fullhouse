<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <div class="sidebar" data-color="blue"  style="width:480px;height:calc(100% - 70px);right:0;">
<!--      
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
        	  〉
        </a>
        <a href="#" class="simple-text logo-normal" >
                 <div id="listCount" >검색 결과 ${count} 개</div>
                 <input type="hidden" value="${page.total}" id="total" name="total" />
                 <input type="hidden" value="${page.listCnt}" id="listCnt" name="listCnt" />
                 <input type="hidden" value="${page.pageCnt}" id="pageCnt" name="pageCnt" />
        </a>
      </div>
	<!--       슬라이드바 상단 -->
	<div class="sidebar-wrapper" id="sidebar" style="height:calc(100% - 70px);">
		<style>
			.itemList a:hover { font-weight:bold;color:gray; }
		</style>
	<c:forEach var="dto" items="${list}">	
		<div class ="itemList" style="width:95%;height:145px;border:1px solid gray;margin:5px;margin-left:12px;" onmouseover="getterLatLng(this)" onmouseout="buildMouseOut(this)" >
			<!-- 관심목록 추가 하트모양 -->
			<div class="RoomItem-icons" style="float:right;margin:15px;" onClick="heart(this)" id="test1">
				<span class="room-favorite" >
					<i id="icon_heart" class="fa fa-heart-o fa-2x" style="color:gray" onmouseover="$(this).css('color', 'red')" onmouseout="$(this).css('color', 'gray')"></i>
				</span>
			</div>
			<a href="room.do?buildNo=${dto.getBuild_no()}" target="_self" style="color:black" >
				<div class="RoomItem-preview" style="width:120px;height:145px;float:left" >
					<div class="RoomItem-preview__image" ></div>
					<div class="RoomItem-preview__image" style="background-image:url(${dto.picPath});width:100%;height:135px;margin:5px;" ></div>
					<div class="RoomItem-preview__cover" ></div>
				</div>
				<div class="RoomItem-detail">
					<div class="RoomItem-info" >
						<div class="RoomItem-header" >
							<div class="RoomItem-price" style="font-size:2em;margin-bottom:-10px;margin-top:10px;width:60%;float:left" >
								<p>
								<c:choose>
									<c:when test="${priceMap.get(dto).get(0).monthly ne 0}">
										<span class="RoomItem-price__type" style="margin-left:25px;" >월세</span>
										<span class="RoomsItem-price__title is-0" >${priceMap.get(dto).get(0).deposit} / ${priceMap.get(dto).get(0).monthly}</span>
									</c:when>
									<c:when test="${priceMap.get(dto).get(0).monthly eq 0 && priceMap.get(dto).get(0).lease ne 0}">
										<span class="RoomItem-price__type" style="margin-left:25px;" >전세</span>
										<span class="RoomsItem-price__title is-0" >${priceMap.get(dto).get(0).deposit}</span>
									</c:when>
									<c:when test="">
										<span class="RoomItem-price__type" style="margin-left:25px;" >매매</span>
										<span class="RoomsItem-price__title is-0" >${priceMap.get(dto).get(0).salePrice}</span>
									</c:when>
								</c:choose>
									
								</p>
							</div>
							<span class="room-visited" >
								<i class="dabang-icon" ></i>
							</span>
						</div>
						<div class="room_summary" style="width:60%;float:left;margin-left:25px;">
							<span class="RoomItem-summary" >
								<span >${dto.proType} |</span>
								<span > ${dto.floor}층 |</span>
								<span > ${dto.jArea}m²</span>
							</span>
						</div>
						<div class="RoomItem-types types" style="margin-top:10px;float:left;" >
							<span class="#주차 tag" style="background-color:yellow;margin-left:30px;" >#주차</span>
						</div>
						<div class="RoomItem-content" style="margin-top:10px;float:left;" >
							<span class="RoomItem-title" style="margin-left:25px;display:inline;"> 신축첫입주/왕테라스/7호선역세권/초등학교인...</span>
						</div>
						<input type="hidden" class="RoomItem-date" value="2일전"/>
					</div>
					<div class="RoomItem-options" >
						<input type="hidden" class="option" value="에어컨, 가스레인지, 신발장, 전자도어락">
						<input type="hidden" id="build_no" name="build_no" value="${dto.build_no}">
						<input type="hidden" id="lat" name="lat" value="${dto.lat}">
						<input type="hidden" id="lng" name="lng" value="${dto.lng}">
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
	
	
      </div>

    </div> 
    
       	<div id="page" style="height:45px;width:480px;bottom:calc(-100% + 60px);float:right;position:relative;">  
			<div id="pageLoad">
      		<!-- 5. paging view -->
			<ul class="pagination" style="justify-content:center;margin-top:5px;">
		
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
                <input type="text" value="" class="form-control" placeholder="관심지역 또는 매물 번호 검색.." size="50dp">
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
	
					