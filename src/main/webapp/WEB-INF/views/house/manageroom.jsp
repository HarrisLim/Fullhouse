<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>매물관리</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
  </head>
  <body>
    <%@ include file ="nav.jsp" %>
    <main class="main">
	<section class="slice" name="intro"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<h2 class="h1 mb-4">매물관리</h2>
				    <!-- 로그인된 아이디에 등록한 매물이 없다면, -->
					<p class="lead lh-180">
						일반회원은 1개의 매물만 등록이 가능합니다.<br><br>
						- 공개중: 내가 등록한 매물이 공개중인 상태<br>
						- 거래완료: 등록한 매물이 거래완료된 상태<br> 
						- 검수반려: 운영원칙 위배 또는 신고로 비공개된 상태<br>
					</p>
					<br><br><br>
					<!-- 로그인된 아이디에 등록한 매물이 있다면,  -->
					<nav>
					  <div class="nav nav-tabs" id="nav-tab" role="tablist">
					    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">매물관리</a>
					    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">직원관리</a>
					    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">연락 요청</a>
					  </div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
					  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					  <br>
						 <div align="right">
							<select>
								<option value="allacount">전체 계정</option> <!-- 해당 공인중개사에 있는 계정을 선택하여 볼 수 있다. -->
								<option value="firstaccount">1번 계정</option>
								<option value="secondaccount">2번 계정</option>
							</select>
							<input placeholder="매물번호/제목/메모" style="padding:5px">
							<button type="button" class="btn btn-sm btn-outline-dark">검색</button> 
						</div>
						<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
					        <button type="button" class="btn btn-outline-dark" style="width:100%">전체</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">광고 진행</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">광고 종료</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">거래 완료</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">검수 반려</button>
				       	</div>
				       	<div>
				       		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
				       			<tbody>
				       				<tr>
				       					<td>
				       						330001<br>
				       						[현태 상태]<br>
				       						ex,<br>
				       						[광고 종료]
				       					</td>
				       					<td>
				       						사진 넣는 곳
				       					</td>
				       					<td>
				       						원룸 월세 1000/50<br>
				       						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
				       					</td>
				       					<td>
				       						<textarea placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30"></textarea>
				       					</td>
				       					<td>
				       						2015-12-21 | 조회수 445 | 찜 1<br>
											<div class="btn-group" role="group">
												<button class="btn btn-sm btn-outline-dark">수정</button>
												<button class="btn btn-sm btn-outline-dark">삭제</button>
												<button class="btn btn-sm btn-outline-dark">광고재등록</button>
											</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td>
				       						330001<br>
				       						[현태 상태]<br>
				       						ex,<br>
				       						[광고 종료]
				       					</td>
				       					<td>
				       						사진 넣는 곳
				       					</td>
				       					<td>
				       						원룸 월세 1000/50<br>
				       						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
				       					</td>
				       					<td>
				       						<textarea placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30"></textarea>
				       					</td>
				       					<td>
				       						2015-12-21 | 조회수 445 | 찜 1<br>
											<div class="btn-group" role="group">
												<button class="btn btn-sm btn-outline-dark">수정</button>
												<button class="btn btn-sm btn-outline-dark">삭제</button>
												<button class="btn btn-sm btn-outline-dark">광고재등록</button>
											</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td>
				       						330001<br>
				       						[현태 상태]<br>
				       						ex,<br>
				       						[광고 종료]
				       					</td>
				       					<td>
				       						사진 넣는 곳
				       					</td>
				       					<td>
				       						원룸 월세 1000/50<br>
				       						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
				       					</td>
				       					<td>
				       						<textarea placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30"></textarea>
				       					</td>
				       					<td>
				       						2015-12-21 | 조회수 445 | 찜 1<br>
											<div class="btn-group" role="group">
												<button class="btn btn-sm btn-outline-dark">수정</button>
												<button class="btn btn-sm btn-outline-dark">삭제</button>
												<button class="btn btn-sm btn-outline-dark">광고재등록</button>
											</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td>
				       						330001<br>
				       						[현태 상태]<br>
				       						ex,<br>
				       						[광고 종료]
				       					</td>
				       					<td>
				       						사진 넣는 곳
				       					</td>
				       					<td>
				       						원룸 월세 1000/50<br>
				       						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
				       					</td>
				       					<td>
				       						<textarea placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30"></textarea>
				       					</td>
				       					<td>
				       						2015-12-21 | 조회수 445 | 찜 1<br>
											<div class="btn-group" role="group">
												<button class="btn btn-sm btn-outline-dark">수정</button>
												<button class="btn btn-sm btn-outline-dark">삭제</button>
												<button class="btn btn-sm btn-outline-dark">광고재등록</button>
											</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td rowspan="4">
				       						330001<br>
				       						[현태 상태]<br>
				       						ex,<br>
				       						[광고 종료]
				       					</td>
				       					<td>
				       						사진 넣는 곳
				       					</td>
				       					<td>
				       						원룸 월세 1000/50<br>
				       						서울특별시 금천구 가산동 가산디지털단지 근처. 가격대비 넓은방
				       					</td>
				       					<td>
				       						<textarea placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30"></textarea>
				       					</td>
				       					<td>
				       						2015-12-21 | 조회수 445 | 찜 1<br>
											<div class="btn-group" role="group">
												<button class="btn btn-sm btn-outline-dark">수정</button>
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
					  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					  <br>
						  <div class="container">
							  <div class="row">
							  	<div class="col-lg-4" align="center">
								  <div class="card" style="width: 18rem;">
									  <img class="card-img-top" src="../kanu/slidephotos/images/a.jpg">
									  <ul class="list-group list-group-flush">
									    <li class="list-group-item" style="font-size:20px">박종석 (큰형)</li>
									    <li class="list-group-item" style="font-size:15px">bigbro@gmail.com</li>
									    <li class="list-group-item" style="font-size:15px">010-1234-5678</li>
									    <li class="list-group-item" style="font-size:15px">02-1234-5678</li>
									  </ul>
									</div>
								</div>
							  	<div class="col-lg-4" align="center">
								  <div class="card" style="width: 18rem;">
									  <img class="card-img-top" src="../kanu/slidephotos/images/b.jpg">
									  <ul class="list-group list-group-flush">
									    <li class="list-group-item" style="font-size:20px">박승균 (작은형)</li>
									    <li class="list-group-item" style="font-size:15px">smallbro@gmail.com</li>
									    <li class="list-group-item" style="font-size:15px">010-1234-1234</li>
									    <li class="list-group-item" style="font-size:15px">02-1234-1234</li>
									  </ul>
									</div>
								</div><div class="col-lg-4" align="center">
								  <div class="card" style="width: 18rem;">
									  <img class="card-img-top" src="../kanu/slidephotos/images/c.jpg">
									  <ul class="list-group list-group-flush">
									    <li class="list-group-item" style="font-size:20px">임정수 (막내)</li>
									    <li class="list-group-item" style="font-size:15px">youngerbro@gmail.com</li>
									    <li class="list-group-item" style="font-size:15px">010-5678-5678</li>
									    <li class="list-group-item" style="font-size:15px">02-5678-5678</li>
									  </ul>
									</div>
								</div>
							</div>
						</div>
					  </div>
					  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
					  	연락요청이 있을 시에, 위에 연락요청 탭에 숫자 나오게 못하나 ?
					  	<table class="table table-striped">
					  		<thead>
					  			<tr style="text-align:center">
					  				<th>매물제목</th>
					  				<th>이름 </th>
					  				<td>연락처</td>
					  				<td>연락요청일자</td>
					  			</tr>
					  		</thead>
					  		<tbody>
					  			<tr>
					  				<th>매물제목넣자 (링크 걸고)</th>
					  				<th>여기에 이름 넣고 </th>
					  				<td>여기에 번호 넣자</td>
					  				<td>여기에 연락요청일자</td>
					  			</tr>
					  		</tbody>
					  	</table>
					  </div>
					</div>
					
				</div>
			</div>
		</div>
	</section>
    </main>
    <%@ include file="footer.jsp" %>
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