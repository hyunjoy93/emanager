<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/link/pageLink?link=/mkt/mKateHeader" />

<body>
<div id="app" class="container m-kate window">

<article class="popup">
	<div class="popBox">

		<div class="conHead">
			<span id="mktPopIcdLevelBadgeHead" class="badge careful">이상징후</span>
			<p id="mktPopOccuTime" class="time">발생시각 2022-10-28 00:00</p>
		</div>

		<div class="conBody">
			
			<h5 id="mktPopIcdContents" class="popTitle crop"><span class="badge">C등급</span> EPC-ucloud-서버</h5>
			
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
				<div id="gridList"></div>
			</div>


			
		</div><!--//conBody-->

	</div>
</article>

	
</div><!--//container-->
		
<c:import url="/link/pageLink?link=/mkt/mKateFooter" />

<script type="text/javaScript">


cmmObj['isLogin'] = false;

$(function(){	
	
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
	fnDetail();
}
/**********************************************************
 * 상세조회
 **********************************************************/
function fnDetail(){
	
	var incidentId = "${incidentId}";
	
	var param = { incidentId : incidentId };
	
	fnAjax("<c:url value='/api/mkt/detail'/>", param, function(data){
		
		console.log(data);
		
		if(successResCode == data.resCode) {
			var detail = data.detail;
			var lv = detail.incident_level;
			
			if(lv == "이상징후"){
				$("#mktPopIcdLevelBadgeHead").removeClass('danger');
				$("#mktPopIcdLevelBadgeHead").addClass('careful');
			} else {
				$("#mktPopIcdLevelBadgeHead").removeClass('careful');
				$("#mktPopIcdLevelBadgeHead").addClass('danger');
			}
			console.log(detail);
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
			
		} else {
			alert("인시던트 상세내역 조회에 실패했습니다.");
		}
		
	});
}



/**********************************************************
 * 그리드 초기화
 **********************************************************/
function fnInitPopupGrid(){
	
	var columnsData = [
	  	  {header:'처리시간', name:'proc_time', align:'center', width: 50, whiteSpace: 'pre-line'}
		, {header:'처리내역', name:'proc_content', whiteSpace: 'pre-line'}
	];
	
	// 그리드 생성
	fnDrawGrid("02", "gridList", columnsData);
}

/**********************************************************
 * 그리드 생성
 **********************************************************/
 function fnPopGridList(data){
	
	var procList = data.icdProcList;
	
	fnInitPopupGrid();
	
	gridObj["gridList"].resetData(procList);
}

	 


</script>