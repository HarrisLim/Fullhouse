<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>Boomerang UI Kit - Free Bootstrap Framework by Webpixels</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../kanu/css/admin_slidebar.css">
    <script>
		var arr = ["year", "month", "week", "day"];
		
   		function chnageTitlt(x){
   			$("#dropdownMenuButton").text($(x).text());
   			for(var i=0; i<arr.length; i++){
				if(arr[i]===x.id)
		   			$("."+x.id).css("display", "");
		   		else
		   			$("."+arr[i]).css("display", "none");
   			}
   		}

    </script>
  </head>
  <body>
	<div class="nav-side-menu left">
	    <div class="brand">
	    	
	    	<a class="" href="../house/main.do" style="color:white">
	    		<img src="../kanu/main/로고.png" class="avatar avatar-sm bg-#00000000" style="background-color:transparent"><strong>Full House</strong> Station4
	    	</a>
    	</div>
	    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
	  
	        <div class="menu-list">
	            <ul id="menu-content" class="menu-content collapse out">
	                <li id="firstBtn" class="active">
	                  <a href="#">
	                  	<img src="../kanu/images/chart.png" style="margin:6px"> <span style="font-size:13px">매물현황</span>
	                  </a>
	                </li>
	                <li id="secondBtn">
	                  <a href="#">
	                  	<img src="../kanu/images/box.png" style="margin:6px"> <span style="font-size:13px">매물관리</span>
	                  </a>
	                </li>
	                <li id="thirdBtn">
	                  <a href="#">
	                  	<img src="../kanu/images/money.png" style="margin:6px"> <span style="font-size:13px">매출현황</span>
	                  </a>
	                </li>
	                <li id="fourthBtn">
	                  <a href="#">
	                  	<img src="../kanu/images/qna.png" style="margin:6px"> <span style="font-size:13px">Q&A관리</span>
	                  </a>
	                </li>
	            </ul>
	     </div>
	</div>
    <main class="main right" id="first">
    <section class="slice">
      <div class="container">
        <div class="mb-md text-left">
          <h3 class="heading h3">매물현황</h3>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">매물 종류</h5>
            <div class="card border-0 chartWrapper">
              <canvas id="pieChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">일일 매물 등록 건수</h5>
            <div class="card border-0 chartWrapper">
              <canvas id="barChart" class="chart"></canvas>
            </div>
          </div>
        </div>
        <h5 class="card-title" style="background-color:rgba(200,200,240,0.5); padding:10px; margin:20px 0 20px 0">행정구역별 등록 현황</h5>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">수도권</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="centerChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">강원도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gangwondoChart" class="chart"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">충청도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="chungcheongdoChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">전라도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jolladoChart" class="chart"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">경상도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gyeongsangdoChart" class="chart"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">제주도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jejudoChart" class="chart"></canvas>
            </div>
          </div>
        </div>
      </div>
    </section>	
    </main>
    
    <main class="main right" id="second" style="display:none">
    <section class="slice">
      <div class="container">
        <div class="mb-md text-left">
          <h3 class="heading h3">매물관리</h3>
        </div>
	    <br>
		 <div align="right">
			<input placeholder="매물번호/제목" style="padding:5px">
			<button type="button" class="btn btn-sm btn-outline-dark">검색</button> 
		</div>
		<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
	        <button type="button" class="btn btn-outline-dark" style="width:100%">전체</button>
	        <button type="button" class="btn btn-outline-dark" style="width:100%">광고중</button>
	        <button type="button" class="btn btn-outline-dark" style="width:100%">검수대기</button>
	        <button type="button" class="btn btn-outline-dark" style="width:100%">거래완료</button>
	        <button type="button" class="btn btn-outline-dark" style="width:100%">신고된 매물</button>
	      	</div>
	      	<div>
	      		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
	      			<tbody>
	      				<tr>
	      					<td style="text-align:center">
	      						330001<br>
	      						[현태 상태]<br>
	      						ex,<br>
	      						[광고 종료]
	      					</td>
	      					<td style="text-align:center">
	      						사진 넣는 곳
	      					</td>
	      					<td>
	      						원룸 월세 1000/50<br>
	      						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
	      					</td>
	      					<td>
	      						2015-12-21 | 조회수 445 | 찜 1<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">삭제</button>
								<button class="btn btn-sm btn-outline-dark">광고재등록</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">
	      						330001<br>
	      						[현태 상태]<br>
	      						ex,<br>
	      						[광고 종료]
	      					</td>
	      					<td style="text-align:center">
	      						사진 넣는 곳
	      					</td>
	      					<td>
	      						원룸 월세 1000/50<br>
	      						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
	      					</td>
	      					<td>
	      						2015-12-21 | 조회수 445 | 찜 1<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">삭제</button>
								<button class="btn btn-sm btn-outline-dark">광고재등록</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">
	      						330001<br>
	      						[현태 상태]<br>
	      						ex,<br>
	      						[광고 종료]
	      					</td>
	      					<td style="text-align:center">
	      						사진 넣는 곳
	      					</td>
	      					<td>
	      						원룸 월세 1000/50<br>
	      						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
	      					</td>
	      					<td>
	      						2015-12-21 | 조회수 445 | 찜 1<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">삭제</button>
								<button class="btn btn-sm btn-outline-dark">광고재등록</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">
	      						330001<br>
	      						[현태 상태]<br>
	      						ex,<br>
	      						[광고 종료]
	      					</td>
	      					<td style="text-align:center">
	      						사진 넣는 곳
	      					</td>
	      					<td>
	      						원룸 월세 1000/50<br>
	      						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
	      					</td>
	      					<td>
	      						2015-12-21 | 조회수 445 | 찜 1<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">삭제</button>
								<button class="btn btn-sm btn-outline-dark">광고재등록</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td rowspan="4" style="text-align:center">
	      						330001<br>
	      						[현태 상태]<br>
	      						ex,<br>
	      						[광고 종료]
	      					</td>
	      					<td style="text-align:center">
	      						사진 넣는 곳
	      					</td>
	      					<td>
	      						원룸 월세 1000/50<br>
	      						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
	      					</td>
	      					<td>
	      						2015-12-21 | 조회수 445 | 찜 1<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">삭제</button>
								<button class="btn btn-sm btn-outline-dark">광고재등록</button>
							</div>
	      					</td>
	      				</tr>
	      			</tbody>
	      		</table>
	      		<hr style="margin-top:0px">
	      	</div>
      	</div>
    </section>	
    </main>
    
    <main class="main right" id="third" style="display:none">
    <section class="slice">
      <div class="container">
        <div class="mb-md text-left">
          <h3 class="heading h3">매출현황</h3>
        </div>
        <div class="dropdown" style="float:right;top:-100px">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		  	월 단위
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" href="#" id="year" onclick="chnageTitlt(this)">년 단위</a>
		    <a class="dropdown-item" href="#" id="month" onclick="chnageTitlt(this)">월 단위</a>
		    <a class="dropdown-item" href="#" id="week" onclick="chnageTitlt(this)">주 단위</a>
		    <a class="dropdown-item" href="#" id="day" onclick="chnageTitlt(this)">일 단위</a>
		  </div>
		</div>
        <h5 class="card-title" style="background-color:rgba(200,200,240,0.5); padding:10px; margin:20px 0 20px 0">총 매출 현황</h5>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-12" style="margin-bottom:30px">
            <div class="card border-0 chartWrapper">
              <canvas id="yearBarChart" class="chart year"></canvas>
              <canvas id="monthBarChart" class="chart month"></canvas>
              <canvas id="weekBarChart" class="chart week"></canvas>
              <canvas id="dayBarChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
        <h5 class="card-title" style="background-color:rgba(200,200,240,0.5); padding:10px; margin:20px 0 20px 0">행정구역별 매출 현황</h5>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">수도권</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="centerYearSalesChart" class="chart year"></canvas>
  				<canvas id="centerMonthSalesChart" class="chart month"></canvas>
  				<canvas id="centerWeekSalesChart" class="chart week"></canvas>
  				<canvas id="centerDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">강원도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gangwondoYearSalesChart" class="chart year"></canvas>
  				<canvas id="gangwondoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="gangwondoWeekSalesChart" class="chart week"></canvas>
  				<canvas id="gangwondoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">충청도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="chungcheongdoYearSalesChart" class="chart year"></canvas>
  				<canvas id="chungcheongdoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="chungcheongdoWeekSalesChart" class="chart week"></canvas>
  				<canvas id="chungcheongdoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">전라도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jolladoYearSalesChart" class="chart year"></canvas>
  				<canvas id="jolladoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="jolladoWeekSalesChart" class="chart week"></canvas>
  				<canvas id="jolladoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
        <div class="row cols-xs-space cols-sm-space cols-md-space">
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">경상도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="gyeongsangdoYearSalesChart" class="chart year"></canvas>
  				<canvas id="gyeongsangdoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="gyeongsangdoWeekSalesChart" class="chart week"></canvas>
  				<canvas id="gyeongsangdoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
          <div class="col-lg-6" style="margin-bottom:30px">
            <h5 class="card-title" style="background-color:rgba(200,200,240,0.1); padding:10px">제주도</h5>
            <div class="card border-0 chartWrapper">
  				<canvas id="jejudoYearSalesChart" class="chart year"></canvas>
  				<canvas id="jejudoMonthSalesChart" class="chart month"></canvas>
  				<canvas id="jejudoWeekSalesChart" class="chart week"></canvas>
  				<canvas id="jejudoDaySalesChart" class="chart day"></canvas>
            </div>
          </div>
        </div>
      </div>
    </section>	
    </main>
    
    <main class="main right" id="fourth" style="display:none">
    <section class="slice">
      <div class="container">
        <div class="mb-md text-left">
          <h3 class="heading h3">Q&A관리</h3>
        </div>
	    <br>
		 <div align="right">
			<input placeholder="질문번호/제목" style="padding:5px">
			<button type="button" class="btn btn-sm btn-outline-dark">검색</button> 
		</div>
		<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
	        <button type="button" class="btn btn-outline-dark" style="width:100%">대기중인 질문</button>
	        <button type="button" class="btn btn-outline-dark" style="width:100%">완료된 질문</button>
	      	</div>
	      	<div>
	      		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
	      			<tbody>
	      				<tr>
	      					<td style="text-align:center">1</td>
	      					<td style="text-align:center">
		      					이거 왜 이런 건가요 ? 
	      					</td>
	      					<td style="text-align:center">2015-12-21<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">답변</button>
								<button class="btn btn-sm btn-outline-dark">완료</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">2</td>
	      					<td style="text-align:center">
		      					이거 잘 모르겠어요. 
	      					</td>
	      					<td style="text-align:center">2017-12-21<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">답변</button>
								<button class="btn btn-sm btn-outline-dark">완료</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">3</td>
	      					<td style="text-align:center">
		      					글 올리기가 안됩니다. 
	      					</td>
	      					<td style="text-align:center">2016-12-21<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">답변</button>
								<button class="btn btn-sm btn-outline-dark">완료</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">4</td>
	      					<td style="text-align:center">
		      					방 등록하는 법 설명해주세요. 
	      					</td>
	      					<td style="text-align:center">2018-6-21<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">답변</button>
								<button class="btn btn-sm btn-outline-dark">완료</button>
							</div>
	      					</td>
	      				</tr>
	      				<tr>
	      					<td style="text-align:center">5</td>
	      					<td style="text-align:center">
		      					회원탈퇴는 어떻게 하나요 ? 
	      					</td>
	      					<td style="text-align:center">2018-5-21<br>
							<div class="btn-group" role="group">
								<button class="btn btn-sm btn-outline-dark">답변</button>
								<button class="btn btn-sm btn-outline-dark">완료</button>
							</div>
	      					</td>
	      				</tr>
	      			</tbody>
	      		</table>
	      		<hr style="margin-top:0px">
	      	</div>
      	</div>
    </section>	
    </main>
    
    <script src="../kanu/js/adminchart.js"></script>
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