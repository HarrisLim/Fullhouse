<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
  <head>
	  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>Full House QNA</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
	<style>
		::-webkit-input-placeholder {
		   text-align: center;
		}
		
		:-moz-placeholder { /* Firefox 18- */
		   text-align: center;  
		}
		
		::-moz-placeholder {  /* Firefox 19+ */
		   text-align: center;  
		}
		
		:-ms-input-placeholder {  
		   text-align: center; 
		}
		
		tr::before {
		  content: '';
		  display: block;
		  height: 15px;
		}
	</style>
	
	<style>
	.border-styles > p{
		margin: 2px 0;
		padding: 1px 3px;
		border-width: 2px;
		border-color: #aaa;
	}
	</style>
	
		
	<script type="text/javascript">

	 // 토큰 생성
	    var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    $(function() {
	        $(document).ajaxSend(function(e, xhr, options) {
	        	console.log("dd");
	            xhr.setRequestHeader(header, token);
	        });
	    });

	    
		function answerToggle(){
			$("#myDIV2").css("display", "none");
	        $("#myDIV4").css("display", "none");
	        $("#myDIV6").css("display", "none");
	        $("#myDIV8").css("display", "none");
	        $("#myDIV10").css("display", "none");
	        $("#myDIV12").css("display", "none");
	        $("#myDIV14").css("display", "none");
	        $("#myDIV16").css("display", "none");
	        $("#myDIV18").css("display", "none");
	        $("#myDIV20").css("display", "none");
	        $("#myDIV22").css("display", "none");
	        $("#myDIV24").css("display", "none");
	        $("#myDIV26").css("display", "none");
	        $("#myDIV28").css("display", "none");
	        $("#myDIV30").css("display", "none");
	        $("#myDIV32").css("display", "none");
	        $("#myDIV34").css("display", "none");
		}
		function doDisplay(){
			$("#memberTab").css("display", "");
			$("#buildingTab").css("display", "");
			$("#payTab").css("display", "");
			answerToggle();
			$("#myQuestion").css("display", "none");
			$("#askQuestion").css("display", "none");
		}
		function showMemberTab(){
			$("#memberTab").css("display", "");
			$("#buildingTab").css("display", "none");
			$("#payTab").css("display", "none");
			answerToggle();
			$("#myQuestion").css("display", "none");
			$("#askQuestion").css("display", "none");
		}
		function showBuildingTab(){
			$("#memberTab").css("display", "none");
			$("#buildingTab").css("display", "");
			$("#payTab").css("display", "none");
			answerToggle();
			$("#myQuestion").css("display", "none");
			$("#askQuestion").css("display", "none");
		}
		function showPayTab(){
			$("#memberTab").css("display", "none");
			$("#buildingTab").css("display", "none");
			$("#payTab").css("display", "");
			answerToggle();
			$("#myQuestion").css("display", "none");
			$("#askQuestion").css("display", "none");
		}
		function myQuestion(type){
			if(type.length===0) alert("로그인 후 이용할 수 있는 서비스입니다.");
			else {
				$("#memberTab").css("display", "none");
				$("#buildingTab").css("display", "none");
				$("#payTab").css("display", "none");
				answerToggle();
				
				$("#myQuestion").css("display", "");
				$("#askQuestion").css("display", "none");
				$("#emptyQuestionList").css("width",$('#wholeTap').width()-100);
			}
		}
		
		function askQuestion(type){
			if(type.length===0) alert("로그인 후 이용할 수 있는 서비스입니다.");
			else {
				$("#memberTab").css("display", "none");
				$("#buildingTab").css("display", "none");
				$("#payTab").css("display", "none");
				answerToggle();
				
				$("#myQuestion").css("display", "none");
				$("#askQuestion").css("display", "");
			}
		}
		
		function showContent(i){
			$("#content"+i).slideToggle();
		}
		function callFunction(i){
	        $("#myDIV"+i).slideToggle();
		}
		
		function question(subject, contentBody){
			var map={};
			map.subject = subject;
			map.contentBody = contentBody;
			map = JSON.stringify(map);
			
	    	$.ajax({
	  	        type: 'POST',
	  	        dataType: 'JSON',
	  	      	contentType:'application/json; charset=utf-8',
	  	        data: map,
	  	        url: 'question.do',
	  	        success: function(response) {
	  	       		if(response===1) alert("문의를 성공적으로 마쳤습니다.\n[내 질문]에서 확인할 수 있습니다.");
	  	       		location.reload();
	  	        },error:function(request,status,error){
  	  	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 	  	       }
	  	    });
		}
		
		function deleteMyQuestion(x){
			if(confirm("정말 삭제하시겠습니까?")){
				$.ajax({
		  	        type: 'POST',
		  	        dataType: 'JSON',
		  	        data: {"qna_no":x},
		  	        url: 'deletemyquestion.do',
		  	        success: function(response) {
		  	       		alert("삭제되었습니다.");
		  	       		var qnaListSize = Object.keys(response.qnaList).length;
		  	       		var html = '';
		  	       		for(var i=0; i<qnaListSize; i++){
			  	       		html+='<tr>';
			  	       		html+='<td style="padding:0 15px 0 0;font-size:30px;">'+(qnaListSize-i)+'</td>';
			  	       		html+='<td><button type="button" class="btn btn-secondary btn-animated btn-animated-y" onclick="showContent($(this).parents().prev()[0].childNodes[0].nodeValue)" style="width:550px;height:50px">';
			  	       		html+='<span class="btn-inner--hidden">클릭하면 펼치고 접을 수 있습니다. </span>';
			  	       		html+='<span class="btn-inner--visible">'+response.qnaList[i].subject+'</span>';
			  	       		html+='<br><br>';
			  	       		html+='</td>';
			  	       		html+='<td>';
			  	       		html+='<input type="hidden" value="'+response.qnaList[i].qna_no+'">';
			  	       		html+='<button class="btn btn-sm btn-outline-danger" style="margin: 0 0 0px 10px;" onclick="deleteMyQuestion($(this).prev().val())">삭제</button>';
			  	       		html+='</td>';
			  	       		html+='</tr>';
			  	       		html+='<tr class="questionBody">';
			  	       		html+='<td colspan="2">';
			  	       		html+='<div id="content'+(qnaListSize-i)+'" style="display:none">';
			  	       		html+='<textarea rows="10" class="form-control" style="margin:20px" resize="none" readonly> - 질문 내용 - &#10;&#10;'+response.qnaList[i].content+'</textarea>';
			  	       		html+='<div style="background-color:rgba(200,200,240,0.1);margin:20px; height:100px" class="form-control"><strong> - 답변 - </strong><br><br>'+response.qnaList[i].reply+'</div>';
			  	       		html+='</div>';
			  	       		html+='</td>';
			  	       		html+='</tr>';
		  	       		}
						$("#questionTBody").empty().append(html);
		  	        },error:function(request,status,error){
	  	  	          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	  	       }
		  	    });
			}else{
				return;
			}
		}

    	function makeActive(idx){
    		for(var i=1; i<=6; i++){
    			if(i===idx) {
    				$("#btn"+i).addClass("active");
    				continue;
    			}
    			$("#btn"+i).removeClass("active");
    		}
    	}
		
	</script>	
  </head>
  <body>
	<%@include file="pronav2.jsp" %>
	<main class="main" style="margin-bottom: 50px;">
	<section class="slice slice-xl" style="margin-bottom:-80px">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="text-center pt-lg-md">
						<h2 class="heading h1 mb-4">자주 묻는 질문 </h2>
 					</div>
				</div>
			</div>
		</div>
	</section>

		<section  class="" >
		<div class="container">
			<div class="row justify-content-center" align="center">
				<div class="col-lg-12" > 
				<div>
					<div id="wholeTap" class="btn-group" role="group" aria-label="...">
					  <button id="btn1" type="button" onclick="doDisplay(); makeActive(1);" class="btn btn-block btn-outline-tertiary mt-5 active">전체질문</button>
					  <button id="btn2" type="button" onclick="showMemberTab(); makeActive(2);" class="btn btn-block btn-outline-tertiary mt-5">회원정보 / 계정관리</button>
					  <button id="btn3" type="button" onclick="showBuildingTab(); makeActive(3);" class="btn btn-block btn-outline-tertiary mt-5">매물 / 광고 관리</button>
					  <button id="btn4" type="button" onclick="showPayTab(); makeActive(4);" class="btn btn-block btn-outline-tertiary mt-5">상품 / 결제 관리</button>
					  <button id="btn5" type="button" onclick="myQuestion('${type}'); makeActive(5);" class="btn btn-block btn-outline-tertiary mt-5"><strong>내 질문</strong></button>
					  <button id="btn6" type="button" onclick="askQuestion('${type}'); makeActive(6);" class="btn btn-block btn-outline-tertiary mt-5"><strong>직접문의</strong></button>
					</div>
				</div>
				<section id="memberTab">
					<a href="javascript:callFunction(2);"> 
					<div align="left" id="myDIV1" class="col-lg-8">
						<hr>
					    Q. 아이디를 변경할수 없나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
						<div id="myDIV2" style="display:none">
					    	<p style="color:black; padding:10px 20px 0 20px">아이디는 회원의 고유 계정으로 활용되는 수단으로 변경 및 수정이 불가합니다.  </p>
					    </div> 
					</div>
					</a>
					<a href="javascript:callFunction(4);">
					<div align="left" id="myDIV3" class="col-lg-8">
						<hr>
					    Q. 회원 정보를 변경하고 싶어요.<i class="fas fa-angle-down" style="float:right;color:black"></i>
						<div id="myDIV4" style="display:none">
					    	<p style="color:black; padding:10px 20px 0 20px">가입된 회원정보 변경은 사이트 메인 > 계정관리에서 가능합니다.  </p>
						</div>
					</div>
					</a>
					<a href="javascript:callFunction(6);">
					<div align="left" id="myDIV5" class="col-lg-8">
						<hr>
					    Q. 직원들과 광고상품을 나누어 관리하고 싶어요.<i class="fas fa-angle-down" style="float:right;color:black"></i>
						<div id="myDIV6" style="display:none">
					    	<p style="color:black; padding:10px 20px 0 20px">결제한 상품을 여러 직원이 함께 나누어 이용하실 수 있습니다.	계정관리> 하위 계정관리에서 
					    	사용하고자 하는 아이디(이메일)을 추가 하시면 됩니다. </p>
					    </div>
					</div>
					</a>
					<a href="javascript:callFunction(8);">
					<div align="left" id="myDIV7" class="col-lg-8">
						<hr>
					    Q. 하위계정 추가 (수정/삭제) 는 어디서 하나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
						<div id="myDIV8" style="display:none">
					    	<p style="color:black; padding:10px 20px 0 20px">하위계정을 삭제할 경우 계정에 등록된 매물정보도 함께 삭제 처리되므로,필히 매물이동 가능을 통해 다른계정으로 매물이동 후 삭제하시기 바랍니다. </p>
					    </div>
					</div>
					</a>
					<a href="javascript:callFunction(10);">
					<div align="left" id="myDIV9" class="col-lg-8">
						<hr>
					    Q. 회원 탈퇴는 어디서 해야하나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
						<div id="myDIV10" style="display:none">
					    	<p style="color:black; padding:10px 20px 0 20px">현재 재가입은 제한하지 않으므로 언제든 가입이 가능합니다.   </p>
					    </div>
					</div>
					</a>
					<a href="javascript:callFunction(12);">
					<div align="left" id="myDIV11" class="col-lg-8">
						<hr>
					    Q. 회원탈퇴 후 재가입은 가능한가요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
						<div id="myDIV12" style="display:none">
					    	<p style="color:black; padding:10px 20px 0 20px">상품관리 > 이용중인 상품에서 사용중인 상품 정보봐 광고기간을 확인하실 수 있습니다.  </p>
					    </div>
					</div>
					</a>
				</section>
				<section id="buildingTab">
					<a href="javascript:callFunction(14);">
						<div align="left" id="myDIV13" class="col-lg-8">
							<hr>
						    Q. 매물 등록(방등록)은 어떻게 하나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV14" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">
						    		매물관리 > 매물등록에서 매물을 등록하실 수 있습니다. <br>
								    매물 정보가 사용자 필터검색시에 반영되므로 꼼꼼하고 자세하게 매물정보를 기입하시면 광고노출이 더 많아질 수 있습니다.
						    	</p>
						    </div>
						</div>
					</a>
					<a href="javascript:callFunction(16);">
						<div align="left" id="myDIV15" class="col-lg-8">
							<hr>
						    Q. 검수반려 처리가 됐습니다.<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV16" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">
						    		검수반려된 매물은 매물정보가 다르거나, 이미 거래가 완료된 경우 등 허위매물로 신고된 경우입니다.<br>
						    		거래가 완료된 경우라면 거래완료 처리를, 정보가 잘못되었다면 정보 수정 후 검수재요청하시면 됩니다.<br>
						    		검수재요청한 경우 관리자 확인 후에 광고 노출처리되며, 정보수정이 미비한 경우 다시 검수반려 처리될 수 있습니다.
						    	</p>
						    </div>
						</div>
					</a>
					<a href="javascript:callFunction(18);">
						<div align="left" id="myDIV17" class="col-lg-8">
							<hr>
						    Q. 추천매물 등록은 어떻게 하나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV18" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">
						    		추천 매물 등록은 광고 진행중인 매물에만 가능합니다.<br> 
						    		추천매물등록은 동상품 및 지하철상품 이용회원에게만 제공되며, 추천등록된 매물들은 비등록 매물보다 상단에 노출됩니다.<br> 
						    		* 등록방법 <br>
						    		매물관리 > 매물내역 > 등록하고자 하는 매물 우측 "추천매물" 클릭
						    	</p>
						    </div>
						</div>
					</a>
					<a href="javascript:callFunction(20);">
						<div align="left" id="myDIV19" class="col-lg-8">
							<hr>
						    Q. 매물 수정/삭제는 어떻게 하나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV20" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">
						    		매물리스트에서 우측 "수정"버튼을 클릭 후 매물 정보를 수정하시면 됩니다.<br> 
						    		* 매물 수정/삭제는 광고진행 중이거나, 광고종료된 매물에서만 가능합니다.  
						    	</p>
						    </div>
						</div>
					</a>
					<a href="javascript:callFunction(22);">
						<div align="left" id="myDIV21" class="col-lg-8">
							<hr>
						    Q. 삭제된 매물을 복구할 수 있나요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV22" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">
						    		삭제된 매물은 복구가 불가능합니다. 매물 삭제시 신중을 기해주시기 바랍니다.  
						    	</p>
						    </div>
						</div>
					</a>
					<a href="javascript:callFunction(24);">
						<div align="left" id="myDIV23" class="col-lg-8">
							<hr>
						    Q. 거래완료와 광고종료는 무엇이 다른건가요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV24" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">
						    		거래완료는 등록한 매물의 거래가 완료된 매물정보이며, 광고종료는 광고하지 않는 매물로 비공개 처리된 매물정보입니다.<br>
									거래완료된 매물 수량정보는 이용자에게 노출되며, 광고종료 매물 수량은 노출되지 않습니다. 						    		  
						    	</p>
						    </div>
						</div>
					</a>
				</section>
				<section id="payTab">
						<a href="javascript:callFunction(26);">
						<div align="left" id="myDIV25" class="col-lg-8">
							<hr>
						    Q. 상품내역은 어디서 확인 가능한가요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV26" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">상품관리 > 이용중인 상품에서 사용중인 상품 정보의 광고기간을 확인하실 수 있습니다.  </p>
						    </div>
						</div>
						</a>
						<a href="javascript:callFunction(28);">
						<div align="left" id="myDIV27" class="col-lg-8">
							<hr>
						    Q. 환불을 하고싶어요 !<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV28" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">환불은 상품의 사용기간과 사용수량을 확인 후에 최종 환불금액이 산정됩니다. 1899-6804로 연락주시면 운영자 확인후 처리됩니다, </p>
						    </div>
						</div>
						</a>
						<a href="javascript:callFunction(30);">
						<div align="left" id="myDIV29" class="col-lg-8">
							<hr>
						    Q. 결제 연장이 뭔가요?<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV30" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">현재 이용중인 상품의 광고기간을 연장하는 기능입니다. 필요한 기간만큼 추가로 결제하여 광고 기간을 연장할수 있습니다.    </p>
						    </div>
						</div>
						</a>
						<a href="javascript:callFunction(32);">
						<div align="left" id="myDIV31" class="col-lg-8">
							<hr>
						    Q. 상품 결제 확인서 또는 계약서를 받고싶어요.<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV32" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">결제가 완료된 상품의 계약사실확인서를 제공하고 있습니다. 상품관리 > 이용중인 상품 > 계약확인서 보기를 클릭하세요</p>
						    </div>
						</div>
						</a>
						<a href="javascript:callFunction(34);">
						<div align="left" id="myDIV33" class="col-lg-8">
							<hr>
						    Q. 예전에 이용했던 상품을 보고싶어요.<i class="fas fa-angle-down" style="float:right;color:black"></i>
							<div id="myDIV34" style="display:none">
						    	<p style="color:black; padding:10px 20px 0 20px">상품관리 > 지난 이용 내역에서 기존에 사용했던 상품 이력을 확인하실수 있습니다.  </p>
						    </div>
						</div>
						</a>
				</section>
			</div>
			<hr>
			</div>
		</div>
	</section>
	<section class="slice" style="margin-bottom:-80px;display:none" id="myQuestion">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
				<table>
					<tbody id="questionTBody">
						<c:choose>
							<c:when test="${empty qnaList }">
								<tr>
									<td><button id="emptyQuestionList" type="button" onclick="askQuestion('${type}');makeActive(6);" class="btn btn-secondary btn-animated btn-animated-y" style="width:550px;height:50px">
										<span class="btn-inner--hidden">질문하시려면 저를 클릭해주세요 :)</span>
										<span class="btn-inner--visible">현재 질문 내역이 없습니다.</span>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" begin="0" end="${fn:length(qnaList)-1}" step="1">
									<tr>
										<td style="padding:0 15px 0 0;font-size:30px;">${fn:length(qnaList)-(i)}</td>
										<td><button type="button" class="btn btn-secondary btn-animated btn-animated-y" onclick="showContent($(this).parents().prev()[0].childNodes[0].nodeValue)" style="width:550px;height:50px">
											<span class="btn-inner--hidden">클릭하면 펼치고 접을 수 있습니다. </span>
											<span class="btn-inner--visible">${qnaList[i].subject }</span>
											<br><br>
										</td>
										<td>
											<input type="hidden" value="${qnaList[i].qna_no }">
											<button class="btn btn-sm btn-outline-danger" style="margin: 0 0 0px 10px;" onclick="deleteMyQuestion($(this).prev().val())">삭제</button>
										</td>
									</tr>
									<tr class="questionBody">
										<td colspan="2">
											<div id="content${fn:length(qnaList)-(i)}" style="display:none">
												<textarea rows="10" class="form-control" style="margin:20px" resize="none" readonly> - 질문 내용 - &#10;&#10;${qnaList[i].content }</textarea>
												<div style="background-color:rgba(200,200,240,0.1);margin:20px; height:100px" class="form-control"><strong> - 답변 - </strong><br><br>${qnaList[i].reply }</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</section>
	<section class="slice" style="margin-bottom:-80px;display:none" id="askQuestion">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<input id="subject" placeholder="궁금한 것을 물어보세요 :)" class="form-control"><br><br>
					<textarea id="contentBody" rows="20" class="form-control" placeholder="내용을 입력해주세요." style="margin-bottom:20px"></textarea>
					<button class="btn btn-block btn-outline-primary" style="float:right;margin-top:10px" onclick="question(document.getElementById('subject').value, document.getElementById('contentBody').value)">문의</button>
				</div>
			</div>
		</div>
	</section>
	</main>
	<%@include file="footer.jsp" %>
	<!-- Core -->
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/popper/popper.min.js"></script>
	<script src="../assets/js/bootstrap/bootstrap.min.js"></script>
	<!-- FontAwesome 5 -->
	<script src="../assets/vendor/fontawesome/js/fontawesome-all.min.js"
		defer></script>
	<!-- Page plugins -->
	<script
		src="../assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script
		src="../assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="../assets/vendor/input-mask/input-mask.min.js"></script>
	<script src="../assets/vendor/nouislider/js/nouislider.min.js"></script>
	<script
		src="../assets/vendor/textarea-autosize/textarea-autosize.min.js"></script>
	<!-- Theme JS -->
	<script src="../assets/js/theme.js"></script>
</body>
</html>