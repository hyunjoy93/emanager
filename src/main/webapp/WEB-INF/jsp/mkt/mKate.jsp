<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/link/pageLink?link=/mkt/mKateHeader" />

<div id="app" class="container m-kate">
	
<header class="header">
	<h1 class="logo"><a href="<c:url value='/' />"><strong>LUPPITER</strong> 장애View</a></h1>
	<button type="button" class="btClose"><i>닫기</i></button>
</header>

<section class="section">

		<div class="headline">
			<h3 class="mainTitle">장애·이상징후 상황 현황</h3>
		</div>	
		
		<ul class="mktTap">
			<li class="on" id="realTimeView">실시간대응</li>
			<li id="fullView">장애이력</li>
		</ul>

	
	<div class="tapCon view1">
	
		<div class="search hide" id="searchBox">
			<div class="box">
				<form>
					<div class="set">
						<select class="select sm" id="searchType">
							<option value="">전체</option>
							<option value="Y">이상징후</option>
							<option value="N">장애</option>
						</select>
						<input type="text" class="input date" placeholder="시작일" id="startDate">
						<span class="txt">~</span>
						<input type="text" class="input date" placeholder="종료일" id="endDate">
						<button type="button" class="bt bg primary" id="btnSearch">검색</button>
						<input type="hidden" class="input time"id="startTime" value="">
						<input type="hidden" class="input time"id="endTime" value="">
					</div>
				</form>
			</div>
		</div><!--//search-->	
			
		<!-- GRID -->
		<div class="tui-grid-mkt">
			<div id="grid"></div>
		</div>								
	</div><!--//tapCon view1-->

    <!-- PAGING -->
	<!--<div id="divPaging" class="control">
		<span class="count"></span>
		<div class="pages"></div>
	</div>-->

</section>


<!-- 팝업 -->

<article class="popup hide" id="popMktDetail">
	<div class="popBox">

		<div class="conHead">
			<span class="badge" id="mktPopIcdLevelBadgeHead">인시던트등급</span>
			<p class="time" id="mktPopOccuTime">이벤트 발생시간</p>
			<button type="button" class="btClose" id="btnPopClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			
			<h5 class="popTitle crop" id="mktPopIcdContents"><span class="badge">인시던트 등급</span> 인시던트 제목</h5>
			
			<div class="headline">
				<h6 class="minTitle">상황대응 담당자</h6>
			</div>
			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="80px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="3">상황담당</th>
						<th>관제상황조장</th>
						<td id="mktPopCaptain"></td>
					</tr>
					<tr>
						<th>상황반장</th>
						<td id="mktPopIcdChief"></td>
					</tr>
					<tr>
						<th>복구반장</th>
						<td id="mktPopIcdResChief"></td>
					</tr>
					<tr>
						<th>연관조직정보</th>
						<th>복구팀</th>
						<td id="mktPopIcdResTeam"></td>
					</tr>
				</tbody>
			</table>
			
			<div class="headline">
				<h6 class="minTitle">실시간 대응 현황</h6>
				<p class="txt" id="mktPopIcdPropLstUpdDt">최근 Update <b>2022-10-28 00:00</b></p>
			</div>
			<!-- GRID -->
			<div class="tui-grid-mkt">
				<div id="gridPop"></div>
			</div>
				
		</div><!--//conBody-->

	</div>
</article>

<!--//팝업 -->
	
	
	
<!-- 로딩
<div class="loading">
	<ul class="spinner">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
-->
	
</div><!--//container-->
<!-- form hidden value -->
<form id="viewFrm" name="viewFrm" method="post">
	<input type="hidden" id="viewType"  name="viewType" value="${viewType}"/>
	<input type="hidden" id="pageNo"  name="pageNo" value="1"/>
    <input type="hidden" id="listTotalCount"  name="listTotalCount" value="0"/>
    <!-- <input type="hidden" id="alramCount"  name="alramCount" value="0"/> -->
    <input type="hidden" id="incidentYn"  name="incidentYn" value="${incidentYn}"/>
	<input type="hidden" id="incidentState"  name="incidentState" value="조치완료"/>
	<!-- <input type="hidden" id="addThirtyTime"  name="addThirtyTime" value=""/> -->
	<!-- <input type="hidden" id="evtIcdId"  name="evtIcdId" value="${evtIcdId }"/> -->
</form>
		
<c:import url="/link/pageLink?link=/mkt/mKateFooter" />

<script type="text/javaScript">
cmmObj['isLogin'] = false;

$(function(){	
	
	//로딩화면
	/*
 	setTimeout(function(){
		$('.loading').addClass('hide');
	}, 1000); 
	*/
	
	/* MKATE TAP 클릭이벤트 */
	$(document).on("click", ".mktTap > li", function(e){
		fnStopEvent(e);
		
		$(this).siblings('li').removeClass('on');
		$(this).addClass('on');
		
		var idChk = $(this).attr("id");
		
 		if(idChk == "realTimeView" ){
			//$("#searchBox").addClass('hide'); 
			$("#viewType").val("realTimeView");
			$("#incidentState").val("조치완료");
			fnList();
			
		} else {
			//$("#searchBox").removeClass('hide'); 
			$("#incidentState").val("");
			fnInitSearchBox();
			$("#btnSearch").click();
		}

	});	
	
	/* searchBox 검색 버튼 클릭 */
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		let sd = $("#startDate").val();
		let st = $("#startTime").val();
		let ed = $("#endDate").val();
		let et = $("#endTime").val();
		$("#incidentState").val("");
		
		console.log("검색버튼 click >>>>> " + sd + " " + st + " ~ "+ ed + " " + et);
		fnList();
	});

	/* grid 클릭시 팝업 열림 */
	$(document).on("click", "#grid .tui-grid-table tbody tr td", function(){
		
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();	
 		var incidentId = gridObj["grid"].getValue(cell.rowKey, "incident_id", true);
 		
 		// 인시던트 id로 detail조회
 		//fnPopupData(incidentId);
 		fnPostSend("<c:url value='/view/mkt/mKateDetail' />", {incidentId:incidentId});
	});
	
	/* 팝업 제목 dropDown */
	$(document).on("click", "#mktPopIcdContents", function(e){
		$(this).toggleClass('on');
	});
	
	// 초기화
	fnInit();
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	fnInitGnbLnb(0, 0, 0, 0);
	
	// 검색박스 초기화
	fnInitSearchBox();
	
	// 그리드 초기화
	fnInitGrid();
	
	// 팝업 초기화
	fnInitPopup();
	
	// 리스트 조회
	fnList();
	
	// 리스트 페이징
	
	
	// 공통
	fnCommon();
}

/**********************************************************
 * 검색박스 초기화
 **********************************************************/
function fnInitSearchBox(){
	$("#searchType option:eq(0)").prop('selected', true);
	$("#startDate").val("");
	$("#startTime").val("");
	$("#endDate").val("");
	$("#endTime").val("");
}

/**********************************************************
 * 그리드 초기화
 **********************************************************/
function fnInitGrid(){
	
	var columnsData = [			  
			  {header:'발생시간', name:'occu_time', align:'center', width:'auto'}
			, {header:'구분', name:'incident_level', align:'center', width:70}
			, {header:'이벤트 제목', name:'incident_contents', ellipsis : true}
	];
	
	fnDrawGrid("04", "grid", columnsData);
}

/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
 function fnList(){

	// Validator DateTime
	fnValidatorDateTime("startDate", "startTime", "endDate", "endTime");
	
	if(! valObj["validator"]) return;
	
	var params = {
		pageNo : 1,
		pageNavi : 1,
		pageSize : 1000,
		startDateTime : valObj["startDateTime"],
		endDateTime : valObj["endDateTime"],
		incidentYn : $("#searchType option:selected").val(),
		incidentState : $("#incidentState").val()
	};
	
    // GRID 리스트 조회
	fnAjax("<c:url value='/api/mkt/list'/>", params, function(data) {

		if(successResCode == data.resCode){

			// SET 리스트 전체 건수
			$("#listTotalCount").val(data.total_count);

			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.list);	
			fnSetBadgeColor();

			// 페이징
			//fnPagenation(data.paging, "fnPagenationList");

		}else{
			
			// 경고메세지
			fnErrorMsg(failResMsg);
		}
		
	});
}

/**********************************************************
 * 팝업 내용 초기화
 **********************************************************/ 
function fnInitPopup(){
	$("#mktPopIcdContents").removeClass('on');
	$("#mktPopIcdLevelBadgeHead").html("");	
	$("#mktPopOccuTime").html("");
	$("#mktPopIcdContents").html("");
	$("#mktPopCaptain").html("");
	$("#mktPopIcdChief").html("");
	$("#mktPopIcdResChief").html("");
	$("#mktPopIcdResTeam").html("");
	$("#mktPopIcdPropLstUpdDt").html("");
	$("#gridPop").empty();	
}

/**********************************************************
 * 팝업 내용 조회
 **********************************************************/ 
function fnPopupData(incidentId){
	
	var param = { incidentId : incidentId };
	console.log(param);
	
	fnAjax("<c:url value='/api/mkt/detail'/>", param, function(data){
		
		console.log(data);
		if(successResCode == data.resCode) {
			fnInitPopup();
			fnShowPopup(data);
		} else {
			alert("인시던트 상세내역 조회에 실패했습니다.");
		}
		
	});
}

/**********************************************************
 * 조회된 팝업 data 보여줌
 **********************************************************/ 
function fnShowPopup(data){
	
	var detail = data.detail;
	
	var lv = detail.incident_level;
	
	if(lv == "이상징후"){
		$("#mktPopIcdLevelBadgeHead").removeClass('danger');
		$("#mktPopIcdLevelBadgeHead").addClass('careful');
	} else {
		$("#mktPopIcdLevelBadgeHead").removeClass('careful');
		$("#mktPopIcdLevelBadgeHead").addClass('danger');
	}
	
	$("#mktPopIcdLevelBadgeHead").text(lv);
	$("#mktPopOccuTime").html(detail.occu_time);
	$("#mktPopIcdContents").html('<span class="badge">'+detail.incident_level+'</span> '+detail.incident_contents);
	$("#mktPopCaptain").html(detail.captain);
	$("#mktPopIcdChief").html(detail.incident_chief);
	$("#mktPopIcdResChief").html(detail.restore_chief);
	$("#mktPopIcdResTeam").html(detail.restore_team);
	
	var latest = detail.latest_proc;
	if("" != fnNullChangeBlank(latest)){
		$("#mktPopIcdPropLstUpdDt").html('최근 Update <b>'+detail.latest_proc+'</b>');
	} else {
		$("#mktPopIcdPropLstUpdDt").html("");
	}	
	
	// 조치내역 grid
	fnPopGridList(data);
}

/**********************************************************
 * 그리드 초기화 (팝업)
 **********************************************************/
function fnInitPopupGrid(){
	
	var columnsData = [
	  	  {header:'처리시간', name:'proc_time', align:'center', width : 'auto'}
		, {header:'처리내역', name:'proc_content', whiteSpace: 'pre-line'}
	];
	
	// 그리드 생성
	fnDrawGrid("02", "gridPop", columnsData);
}

/**********************************************************
 * 팝업 내 그리드 생성
 **********************************************************/
 function fnPopGridList(data){
	
	var procList = data.icdProcList;
	
	fnInitPopupGrid();
	
	gridObj["gridPop"].resetData(procList);
}

 /**********************************************************
  * 메인그리드 내 구분에 따른 badge color 변경
  **********************************************************/
function fnSetBadgeColor(){
	 
	var cnt = gridObj["grid"].getRowCount();
	
	for(i=0; i<=cnt; i++){
		var a = gridObj["grid"].getValue(i,"incident_level");
		if(a =='이상징후'){
			gridObj["grid"].addCellClassName(i,"incident_level","tag");
			gridObj["grid"].addCellClassName(i,"incident_level","careful");
		} else {
			gridObj["grid"].addCellClassName(i,"incident_level","tag");
			gridObj["grid"].addCellClassName(i,"incident_level","danger");
		}
	}
 }
</script>