// 4. Javascript
//submit
function frmPaging() {
	
	document.getElementById("frmPaging").submit();
}
// 이전 페이지 index
function pagePre(index, pageStartNum, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	index -= 1;
	pageStartNum -= 1;
	if(pageStartNum <= 1){
		pageStartNum = 1;
	}
	if(index <= 0){
		console.log("이전페이지클릭 totalPageCnt: "+totalPageCnt+", index: "+index);
		index = 0;
	}
	$("#pageStartNum").val(pageStartNum);
	$("#index").val(index);

	ajaxList(index, pageStartNum);

}
// 다음 페이지 index
function pageNext(index, pageStartNum, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt); 
	var max = Math.ceil(totalPageCnt / pageCnt); 
//	if (max * pageCnt > index + pageCnt) {
		//console.log("다음페이지클릭: max*pageCnt:"+max*pageCnt+", index+pageCnt: "+index+pageCnt+", totalPageCnt: "+totalPageCnt+", max: "+max+", index:"+index);
	index += 1;
	pageStartNum += 1;
	if(pageStartNum > totalPageCnt - pageCnt){
		pageStartNum = totalPageCnt - pageCnt+1;
	}
	if(index >= totalPageCnt-1){
		console.log("다음페이지클릭 totalPageCnt: "+totalPageCnt+", index: "+index);
		index = totalPageCnt-1;
	}
	if(pageStartNum <= 0){
		pageStartNum = 1;
	}
	console.log("다음페이지클릭 pageCnt보다 인덱스 커질때 pageStartNum: "+pageStartNum+", index: "+index);
	$("#pageStartNum").val(pageStartNum);
	$("#index").val(index);
	ajaxList(index, pageStartNum);
}

// 마지막 페이지 index
function pageLast(index, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	//var max = Math.ceil(totalPageCnt / pageCnt);
	while (max * pageCnt > index + pageCnt) {
		index += pageCnt;
	}
	var remainListCnt = total - listCnt * (index - 1);
	var remainPageCnt = Math.floor(remainListCnt / listCnt);
	if (remainListCnt % listCnt != 0) {
		remainPageCnt++;
	}
	var pageLastNum = 0;
	if (remainListCnt <= listCnt) {
		pageLastNum = index;
	} else if (remainPageCnt <= pageCnt) {
		pageLastNum = remainPageCnt + index - 1;
	} else {
		pageLastNum = pageCnt + index - 1;
	}
	document.getElementById("pageStartNum").value = index;
	document.getElementById("index").value = pageLastNum - 1;
	frmPaging();
}
// index 리스트 처리
function pageIndex(index, pageStartNum, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	console.log("pageIndex메서드 pageStarNum: "+pageStartNum+", totalPageCnt: "+totalPageCnt+", total: "+total);
	
	if(pageStartNum > totalPageCnt - pageCnt){
		pageStartNum = totalPageCnt - pageCnt+1;
	}
	if(pageStartNum <= 0){
		pageStartNum = 1;
	}
	$("#pageStartNum").val(pageStartNum);
	$("#index").val(index);
	console.log("숫자 페이지 클릭 pageStartNum: "+pageStartNum+", index: "+index);
	ajaxList(index, pageStartNum);
}


function ajaxList(index, pageStartNum){
	var latLngArray = {};
	latLngArray["north"] = $("#north").val();
	latLngArray["south"] = $("#south").val();
	latLngArray["east"] = $("#east").val();
	latLngArray["west"] = $("#west").val();
	latLngArray["index"] = index;
	latLngArray["pageStartNum"] = pageStartNum;
	//매물 종류
	if($("#kind_of_sale").text() == '월세' || $("#kind_of_sale").text() == '전세or월세' || $("#kind_of_sale").text() == '전세' || $("#kind_of_sale").text() == '매매'){
		console.log("매물 종류 클릭: "+$("#kind_of_sale").text());
		latLngArray["buildType"] = $("#kind_of_sale").text();
	}
	//거래종류
	if($("#kind_of_trade").text() == '전체' || $("#kind_of_trade").text() == '중개' || $("#kind_of_trade").text() == '직거래'){
		console.log("거래 종류 클릭: "+$("#kind_of_trade").text());
		latLngArray["kind_of_trade"] = $("#kind_of_trade").text();
	}
	//방종류
	if($("#kind_of_room").text() == '전체' || $("#kind_of_room").text() == '원룸' || $("#kind_of_room").text() == '1.5룸' || $("#kind_of_room").text() == '투룸' || $("#kind_of_room").text() == '쓰리룸' || $("#kind_of_room").text() == '오피스텔' || $("#kind_of_room").text() == '아파트'){
		console.log("방 종류 클릭: "+$("#kind_of_room").text());
		latLngArray["proType"] = $("#kind_of_room").text();
	}
	//보증금
	if($("#begin_text").val() != null || $("#end_text").val() != null){
		console.log("보증금 시작: "+$("#begin_text").val()+", 보증금 끝: "+$("#end_text").val());
	}
	
	var jsonLatLng = JSON.stringify(latLngArray);
	console.log("latLng:"+jsonLatLng);
	$.ajax({
		contentType : "application/json",
		url : "indexJson.do",
		type : "post",
		dataType : "json",
		data : jsonLatLng,
		success : function(responseData){
			
			//console.log("인입"+responseData);
			var data = responseData;
			console.log("pagingVo.pageStartNum: "+data.pagingVo.pageStartNum+"pagingVo.getPageLastNum: "+data.pagingVo.pageLastNum);
			//console.log("인입2"+data);
			var html = "";
			html +="<style>";
			html +=".itemList a:hover { font-weight:bold;color:gray; }";
			html +="</style>";

			if(data.length != 0){
				for(var i=0; i<data.list.length; i++){
					html +="<div class ='itemList' style='width:95%;height:145px;border:1px solid gray;margin:5px;margin-left:12px;' onmouseover='backColor(this)' onmouseout='buildMouseOut(this)'>";
					html +="<div class='RoomItem-icons' style='float:right;margin:15px;' onClick='heart(this)'>";
					html +="<span class='room-favorite' >";
					html +="<i id='icon_heart' class='fa fa-heart-o fa-2x' style='color:gray' onmouseover='heartMouseOver(this)' onmouseout='heartMouseOut(this)'></i>";
					html +="</span>";
					html +="</div>";
					html +="<a href='#' target='_blank' style='color:black' >";
					html +="<div class='RoomItem-preview' style='width:120px;height:145px;float:left' >";
					html +="<div class='RoomItem-preview__image' ></div>";
					html +="<div class='RoomItem-preview__image' style='background-image:url("+data.list[i].picPath+");width:100%;height:135px;margin:5px;' ></div>";
					html +="<div class='RoomItem-preview__cover' ></div>";
					html +="</div>";
					html +="<div class='RoomItem-detail'>";
					html +="<div class='RoomItem-info' >";
					html +="<div class='RoomItem-header' >";
					html +="<div class='RoomItem-price' style='font-size:2em;margin-bottom:-10px;margin-top:10px;width:60%;float:left' >";
					html +="<p>";
					html +="<span class='RoomItem-price__type' style='margin-left:25px;' >월세</span>";
					html +="<span class='RoomsItem-price__title is-0' >7000 / 60</span>";
					html +="</p>";
					html +="</div>";
					html +="<span class='room-visited' >";
					html +="<i class='dabang-icon' ></i>";
					html +="</span>";
					html +="</div>";
					html +="<div class='room_summary' style='width:60%;float:left;margin-left:25px;'>";
					html +="<span class='RoomItem-summary' >";
					html +="<span >"+data.list[i].proType+" |</span>";
					html +="<span > "+data.list[i].floor+"층 |</span>";
					html +="<span > "+data.list[i].jArea+"m²</span>";
					html +="</span>";
					html +="</div>";
					html +="<div class='RoomItem-types types' style='margin-top:10px;float:left;' >";
					html +="<span class='#주차 tag' style='background-color:yellow;margin-left:30px;' >#주차</span>";
					html +="</div>";
					html +="<div class='RoomItem-content' style='margin-top:10px;float:left;' >";
					html +="<span class='RoomItem-title' style='margin-left:25px;display:inline;'> 신축첫입주/왕테라스/7호선역세권/초등학교인...</span>";
					html +="</div>";
					html +="<input type='hidden' class='RoomItem-date' value='2일전'/>";
					html +="</div>";
					html +="<div class='RoomItem-options' >";
					html +="<input type='hidden' class='option' value='에어컨, 가스레인지, 신발장, 전자도어락'>";
					html +="<input type='hidden' id='build_no' name='build_no' value='"+data.list[i].build_no+"'>";
					html +="<input type='hidden' id='lat' name='lat' value='"+data.list[i].lat+"'>";
					html +="<input type='hidden' id='lng' name='lng' value='"+data.list[i].lng+"'>";
					html +="</div>";
					html +="</div>";
					html +="</a>";
					html +="</div>";
				}
				html +="</div>";
				html +="</div>";

			}
			var text = "검색결과 "+data.pagingVo.total+" 개";
			var paging = "";
			//<!-- 5. paging view -->
			//paging +="<div id='page' style='height:45px;width:480px;bottom:calc(-100% + 60px);float:right;position:relative;'> "; 
			paging +="<div id='pageLoad'>";
			paging +="<ul class='pagination' style='justify-content:center;margin-top:5px;'>";
			//<!-- 이전 페이지 이동 -->
			paging +="<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
			//<!--페이지번호 -->
			for(var i=data.pagingVo.pageStartNum; i<=data.pagingVo.pageLastNum; i++){
				paging+="<li class='pageIndex"+i+"' id='idx"+i+"'><a class='page-link' onclick='pageIndex("+(i-1)+","+i+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+");'>"+i+"</a></li>";
			}
			
			//<!--다음 페이지 이동 -->
			paging+="<li class='page-item'><a class='page-link' onclick='pageNext("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+");'>&rsaquo;</a></li>";
			paging+="</ul>";
			paging+="</div>";
			$("#sidebar").empty().append(html);
			$("#page").empty().append(paging);
			$(".pageIndex"+(data.pagingVo.index+1)).addClass("page-item active");
			$("#listCount").empty().append(text);
			$("#total").val(data.pagingVo.total);
			$("#listCnt").val(data.pagingVo.listCnt);
			$("#pageCnt").val(data.pagingVo.pageCnt);
		}
	});
}

// 리스트출력개수 처리
function listCnt() {
	document.getElementById("index").value = 0;
	document.getElementById("pageStartNum").value = 1;
	document.getElementById("listCnt").value = document.getElementById("listCount").value;
	frmPaging();
}
window.onload = function() {
	// 현재번호 active
	var index = document.getElementById("index").value;
	var pageIndex = document.querySelector('.pageIndex'+(Number(index)+1));
	pageIndex.setAttribute("class", "page-item active"); ////page에 인덱스 1번 포인트 주는 함수
	// 리스트갯수 selected 처리
	$("#listCount > option").each(function () {
		if ($(this).val() == $('#listCnt').val()) {
			$(this).prop("selected", true);
		}
	});
}