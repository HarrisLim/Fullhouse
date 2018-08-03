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
	console.log("pageIndex메서드1 pageStarNum: "+pageStartNum+", totalPageCnt: "+totalPageCnt);
	
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
	$.ajax({
		url : "indexJson.do",
		type : "post",
		//data : {"index" : pageStartNum-1, "pageStartNum" : $("#pageStartNum").val(), "listCnt" : $("#listCnt").val()},
		data : {"index" : index, "pageStartNum" : pageStartNum, "listCnt" : $("#listCnt").val()},
		success : function(responseData){
			
			//console.log("인입"+responseData);
			var data = responseData;
			//console.log("인입2"+data);
			var html = "";
			html += "<table class='table table-bordered'>";
			html += "<br/>";
			html += "<tr>";
			html += "<th><center>번호</center></th>";
			html += "<th><center>주소</center></th>";
			html += "<th><center>위도</center></th>";
			html += "<th><center>경도</center></th>";
			html += "<th><center>날짜</center></th>";
			html += "</tr>";
			if(data.length != 0){
				for(var i=0; i<data.list.length; i++){
					html +="<tr>";
					html +="<td>"+data.list[i].build_no+"</td>";
					html +="<td>"+data.list[i].address+"</td>";
					html +="<td>"+data.list[i].lat+"</td>";
					html +="<td>"+data.list[i].lng+"</td>";
					html +="<td>"+data.list[i].bu_rdate+"</td>";
					html +="</tr>";
				}
				html += "</table>";
			}
			var text = "";
			///////////////
      		//5. paging view
			html += "<div id='page' style='height:100px;width:100%;background-color:red;position:absolute;bottom:0;'>";
			html += "<ul class='pagination' style='justify-content:center'>";
			//이전 페이지 이동
			//text += "<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.pageStartNum+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
			html += "<li class='page-item'><a class='page-link' onclick='pagePre("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+");'>&lsaquo;</a></li>";
				//페이지번호
				for(var i=data.pagingVo.pageStartNum; i<=data.pagingVo.pageLastNum; i++){
					html += "<li class='pageIndex"+i+"'><a class='page-link' onclick='pageIndex("+(i-1)+","+i+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+");'>"+i+"</a></li>";
				}
				//<!--다음 페이지 이동 -->
				html += "<li class='page-item'><a class='page-link' onclick='pageNext("+data.pagingVo.index+","+data.pagingVo.pageStartNum+","+data.pagingVo.total+","+data.pagingVo.listCnt+","+data.pagingVo.pageCnt+");'>&rsaquo;</a></li>";
				html += "</ul>";
				html += "</div>";
				$("#sidebar").empty().append(html);
				$(".pageIndex"+(data.pagingVo.index+1)).addClass("page-item active");
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