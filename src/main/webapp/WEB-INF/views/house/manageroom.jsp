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
						일반회원은 1개의 매물만 등록이 가능합니다. -- 일반회원일 때만 보여줘.
					</p><br>
					${buildList[0].lat}
					${buildList[0].roomTitle}
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
							<input placeholder="매물번호/제목/메모" style="padding:5px">
							<button type="button" class="btn btn-sm btn-outline-dark">검색</button> 
						</div>
						<div class="btn-group" role="group" style="width:100%; margin:10px 0 10px 0">
					        <button type="button" class="btn btn-outline-dark" style="width:100%">전체</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">광고중</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">광고 종료</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">거래 완료</button>
					        <button type="button" class="btn btn-outline-dark" style="width:100%">검수 반려</button>
				       	</div>
				       	<div>
				       		<table class="table talbe-hover align-items-center"  style="margin-bottom:0px">
				       			<tbody>
					       			<c:forEach items="${buildList }" var="build">
						       			<tr>
					       					<td>
					       						No. ${build.build_no }<br>
				       							[${build.buildState }]<br> <!-- 여기도 buildstate에 따라 한글로 보여줘 if로 조건줘서  -->
					       					</td>
					       					<td>
					       						<img src="../${build.picPath }" class="img-thumbnail" style="width:250px;height:150px">
					       					</td>
					       					<td>
			       								${build.proType } ${build.buildType } 여기에 돈.<br> <!-- 여기에 if로 주자.  -->
					       						${build.roomTitle }
					       					</td>
					       					<td>
					       						<textarea rows="5" cols="40" placeholder="[메모]&#10;등록자만 볼 수 있는 비공개 메모입니다." rows="3" cols="30">${build.privateMemo }</textarea>
					       					</td>
					       					<td>
					       						<p style="text-align:left;margin-left:10px">업로드: ${build.bu_rdate }<br>
					       						조회수: ${build.view_count }<br>
												</p>
												<div class="btn-group" role="group">
													<button class="btn btn-sm btn-outline-dark">수정</button>
													<button class="btn btn-sm btn-outline-dark">삭제</button>
													<button class="btn btn-sm btn-outline-dark">광고재등록</button>
												</div>
					       					</td>
					       				</tr>
				       				</c:forEach>
				       			</tbody>
				       		</table>
				       		<hr style="margin-top:0px">
				       		<div style="height:50px">
								<p class="lead lh-180" style="text-align:left;float:right;font-weight: bold;">
									- 광고중: 내가 등록한 매물이 공개중인 상태<br>
									- 거래완료: 등록한 매물이 거래완료된 상태<br> 
									- 검수반려: 운영원칙 위배 또는 신고로 비공개된 상태<br>
								</p>
							</div>
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