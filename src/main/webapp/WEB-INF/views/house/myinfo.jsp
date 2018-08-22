<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		 <meta name="_csrf" content="${_csrf.token}"/>
	    <meta name="_csrf_header" content="${_csrf.headerName}"/>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
	    <meta name="author" content="Webpixels">
  <link rel="apple-touch-icon" sizes="76x76" href="../kanu/main/로고.png">
  <link rel="icon" type="image/png" href="../kanu/main/로고.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    MyInfo : FullHouse
  </title>
	    <!-- Fonts -->
	    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
	    <!-- Theme CSS -->
	    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
	    <!-- Demo CSS - No need to use these in your project -->
	    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
    	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	    <!-- <link href="../kanu/slidephotos/js-image-slider.css" rel="stylesheet" type="text/css" />
	    <script src="../kanu/slidephotos/js-image-slider.js" type="text/javascript"></script> -->
    
    <script>
	    
	    function readFile(input) {
   			if (input.files && input.files[0]) {
   				var reader = new FileReader();
   				reader.onload = function (e) {
           			$("#pho").empty().append('<img src="'+e.target.result+'" class="img-thumbnail" style="width:100%;height:100%;z-index:10">');
   				};
   				reader.readAsDataURL(input.files[0]);
   			}
	      }
    
	</script>
    
    <style>
		th{
			background:rgba(200,200,240,0.1);
			padding:10px;
		}
		td{
			padding:10px;
		}
		tr input{
			padding:5px 10px 5px 10px;
		}
		.phoneNum{
			background:rgba(200,200,240,0.1);
		}
	</style>
    
  </head>
  <body>
    <%@ include file ="nav.jsp" %>
    <main class="main">
	<section class="slice"> 
		<div class="container">
			<div class="justify-content-center">
				<div class="pt-lg-md">
					<form id="myinfo" action="myinfoUp.do?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<h3 class="h1 mb-5">내 계정</h3>
					<hr size="5" color="black">
					<table>
						<tbody>
							<tr>
								<th>프로필</th>
								<td>
									<div id="photo" data-toggle="tooltip" title="클릭하여 사진을 추가해주세요." style="position:relative;width:77px;height:102px;border:1px solid;background-image:url('../kanu/images/picImage.png');">
										<input type="file" style="height:100px" class="custom-file-input" id="customFile" name="photo" accept=".png, .jpg, .jpeg"  onchange="readFile(this);" >
										<div id="pho" style="width:75px;height:100px;position:absolute;top:0px;">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>성명</th>
								<td><input id="myName" name="mem_name" value="${sessionScope.mem.mem_name.substring(2)}" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input id="myEmail" name="mem_email" value="${sessionScope.mem.mem_email}" style="background:rgba(200,200,240,0.1); width:100%" readonly></td>
							</tr>
							<tr>
								<th rowspan="2">휴대폰번호</th>
								<td><input class="phoneNum" id="p1" value="" readonly>&nbsp;-&nbsp;<input class="phoneNum" id="p2" value="" readonly>&nbsp;-&nbsp;<input class="phoneNum" id="p3" value="" readonly></td>
								<!-- <td><button id="modifyBtn" class="btn btn-outline-primary">변경</button></td> -->
								<input id="mPhone" name="mem_phone" type="hidden" value="${sessionScope.mem.mem_phone}"/>
							</tr>
							<tr>
								<td id="certiPhone" style="display:none"><input placeholder="인증번호 입력해주세요" style="width:100%"></td>
								<td id="certiPhoneBtn" style="display:none"><button class="btn btn-outline-primary">인증번호 확인</button></td>
							</tr> 
							<tr>
								<th rowspan="3">비밀번호 변경</th>
								<td><input type="password" id="nowPw" name="nowPw" placeholder="현재 비밀번호" style="width:100%" value=""></td> 
							</tr>
							<tr>
								<td><input type="password" id="changePw1" name="mem_pw" placeholder="변경될 비밀번호" style="width:100%" value=""></td>
							</tr>
							<tr>
								<td><input type="password" id="changePw2" name="changePw2" placeholder="변경될 비밀번호 확인" style="width:100%" value=""></td>
							</tr>
						</tbody>
					</table>
					<div align="center" style="margin-top:20px;margin-bottom:50px">
						<button type="button" id="myinfoB2" class="btn btn-dark" onclick="location.href='main.do'">취소</button>
						&nbsp;&nbsp;
						<button type="button" id="myinfoB1" class="btn btn-primary">확인</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>
    </main>
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