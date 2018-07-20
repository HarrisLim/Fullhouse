// 4. Javascript
//submit
function frmPaging() {
	alert("frmPaging");
	document.getElementById("frmPaging").submit();
}
// 이전 페이지 index
function pagePre(index, pageCnt) {
	alert("pagePre");
	if (0 < index - pageCnt) {
		index -= pageCnt;
		document.getElementById("pageStartNum").value = index;
		document.getElementById("index").value = index - 1;
		frmPaging();
	}
}
// 다음 페이지 index
function pageNext(index, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	var max = Math.ceil(totalPageCnt / pageCnt);
	if (max * pageCnt > index + pageCnt) {
		index += pageCnt;
		document.getElementById("pageStartNum").value = index;
		document.getElementById("index").value = index - 1;
		frmPaging();
	}
}
// 마지막 페이지 index
function pageLast(index, total, listCnt, pageCnt) {
	var totalPageCnt = Math.ceil(total / listCnt);
	var max = Math.ceil(totalPageCnt / pageCnt);
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
function pageIndex(pageStartNum) {
	document.getElementById("index").value = pageStartNum - 1;
	frmPaging();
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
	pageIndex.setAttribute("class", "active");
	// 리스트갯수 selected 처리
	$("#listCount > option").each(function () {
		if ($(this).val() == $('#listCnt').val()) {
			$(this).prop("selected", true);
		}
	});
}