<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />

<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<!-- CONTENTS --> 
<section class="section">

	<div class="conHead">

		<ol class="breadcrumb">
			<li><a href="" class="home">Home</a></li>
			<li>인시던트관리</li>
			<li id="viewTypeLi">인시던트 상황 관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle" id="viewTypeHeader">인시던트 상황 관리</h2>
			<button type="button" class="btSound" title="스피커" id="btnSound">소리끔/켬</button>
			<p class="informTxt">구글정책으로 사운드 자동실행이 불가하오니 스피커 버튼으로 사운드를 실행시켜 주세요.</p>
			<div class="btns">
				<button type="button" class="bt bd" id="btnExcelDown">엑셀다운로드</button>
			</div>
		</div>

		<div id="printNowDateTime" class="nowTime"><b></b></div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="realTime">
			<div class="check switch hide"><input type="checkbox" id="realCHK" checked><label>실시간</label></div>
			<div class="check switch"><input type="checkbox" id="btnKeyword"><label>검색필터</label></div>
			<p class="txt on" id="chkCurr"><span class="bulletTxt" id="currCheckTime"></span></p>
			<button id="btnReload" type="button" class="btSync" title="지금 업데이트">지금 업데이트</button>
		</div>
		
		<div class="search hide" id="searchBox">

			<div class="box">
				<form>
					<table class="field">
						<tbody class="keyword-td">
							<tr>
								<th>조회기간</th>
								<td>
									<select class="select" style="width: auto;" id="searchType">
										<option value="evtOccu">이벤트 발생시간</option>
										<option value="icdEnd">인시던트 종료시간</option>
									</select>
								</td>
								<td colspan="4">
									<input type="text" class="input date" placeholder="시작일" id="startDate">
									<input type="time" class="input time" id="startTime" step="2">
									<span class="txt">~</span>
									<input type="text" class="input date" placeholder="종료일" id="endDate">
									<input type="time" class="input time" id="endTime" step="2">
								</td>
							</tr>
							<tr>
								<th></th>
								<td>
									<input type="text" class="keyword-input" value="" placeholder="인시던트ID" id="kwIncidentId">
								</td>								
								<td colspan="2">									
									<select class="keyword-select" id="kwIncidentLevel">
										<option value="" selected>인시던트 등급</option>
										<option value="이상징후">이상징후</option>
										<option value="모든장애">모든장애</option>
										<option value="1등급">1등급</option>
										<option value="2등급">2등급</option>
										<option value="3등급">3등급</option>
										<option value="4등급">4등급</option>
									</select>
									<select class="keyword-select" id="kwIncidentState">
										<option value="" selected>인시던트 상태</option>
										<option value="조치중">조치중</option>
										<option value="조치완료">조치완료</option>										
									</select>									
								</td>
								<td>	
									<input type="text" class="keyword-input" value="" placeholder="관제상황조장" id="kwCaptain">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="상황반장" id="kwIncidentChief">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="복구반장" id="kwRestoreChief">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="복구팀" id="kwRestoreTeam">
								</td>																																																		
							</tr>
							<tr>
								<th></th>
								<td>	
									<input type="text" class="keyword-input" value="" placeholder="이벤트제목" id="kwIncidentContents">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="센터" id="kwContainerNm">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="표준서비스명" id="kwStdnm">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="단위서비스명" id="kwEstdnm">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="ITSM인시던트ID" id="kwItsmIncidentId">
								</td>	
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="서비스영향도" id="kwIncidentServiceImpact">
								</td>														
							</tr>														
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary" id="btnSearch">검색</button>
					<!--button type="button" class="bt bg">초기화</button-->
					<button type="button" class="btRefresh" title="초기화" id="btnSearchInit">초기화</button>
				</div>
			</div>

		</div><!--//search-->

		<div class="result">

			<div class="control">

				<span class="count">
					<select id="slcPageSize" name="pageSize" class="select sm">
						<option>25</option>
						<option>50</option>
						<option>75</option>
						<option>100</option>
						<option>200</option>
						<option>300</option>
						<option>전체</option>
					</select>
					<i>화면에 표시할 리스트 갯수</i>
				</span>

			</div><!--//control-->

			<!-- GRID -->
			<div class="tui-grid">
				<div id="grid"></div>
			</div>

            <!-- PAGING -->
			<div id="divPaging" class="control">

				<span class="count"></span>

			<div class="pages"></div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>

<!-- [팝업] 인시던트ID 상황관리 -->
<article class="popup hide" id="test-popup1">
	<div class="popBox">
		<div class="conHead">
			<h5 class="popTitle" id="icdDetailPop">인시던트 상황관리</h5>
			<button type="button" class="btClose hide"><i>닫기</i></button>
		</div>
		<div class="conBody cols">
			<div class="panel fix">
				<table class="field">
					<colgroup>
						<col width="120px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>인시던트 상태</th>
							<td>
								<span class="txt" id="popIcdState"></span>
								<!-- <button type="button" class="bt bd secondary" id="test-bt-popup2">인시던트 종료</button> -->
							</td>
						</tr>
						<tr>
							<th>인시던트 등급</th>
							<td>
								<span class="check"><input type="radio" value="이상징후" name="popIcdLevel" class="disabledUser"><label>이상징후</label></span>
								<span class="check"><input type="radio" value="1등급" name="popIcdLevel" class="disabledUser"><label>1등급</label></span>
								<span class="check"><input type="radio" value="2등급" name="popIcdLevel" class="disabledUser"><label>2등급</label></span>
								<span class="check"><input type="radio" value="3등급" name="popIcdLevel" class="disabledUser"><label>3등급</label></span>
								<span class="check"><input type="radio" value="4등급" name="popIcdLevel" class="disabledUser"><label>4등급</label></span>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="headline">
					<h6 class="minTitle">서비스 정보</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="120px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>이벤트ID</th>
							<td>
								<select class="select" id="popEvtId">
								</select>
							</td>
						</tr>
						<tr>
							<th>인시던트ID</th>
							<td id="popIcdId"></td>
						</tr>
						<tr>
							<th>센터</th>
							<td id="popCenter"></td>
						</tr>
						<tr>
							<th>표준서비스명</th>
							<td id="popStdNm"></td>
						</tr>
						<tr>
							<th>단위서비스명</th>
							<td id="popEstdNm"></td>
						</tr>
						<tr>
							<th>HOST명</th>
							<td id="popHostname"></td>
						</tr>						
						<tr>
							<th>이벤트 발생시간</th>
							<td id="popOccuTime"></td>
						</tr>
						<tr>
							<th>이벤트제목</th>
							<td id="popEvtNm"></td>
						</tr>
					</tbody>
				</table>

				<div class="headline">
					<h6 class="minTitle">담당자 정보</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="120px">
						<col width="100px">
						<col width="*px">
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="3">상황담당</th>
							<th>관제상황조장</th>
							<td><input type="text" class="input disabledUser" id="popCaptain"></td>
						</tr>
						<tr>
							<th>상황반장</th>
							<td><input type="text" class="input disabledUser" id="popIcdChf"></td>
						</tr>
						<tr>
							<th>복구반장</th>
							<td><input type="text" class="input disabledUser" id="popRstChf"></td>
						</tr>
						<tr>
							<th>연관조직정보</th>
							<th>복구팀</th>
							<td><input type="text" class="input disabledUser" id="popRstTm"></td>
						</tr>
					</tbody>
				</table>

			</div><!--//panel-->

			<div class="panel fix">

				<div class="elapsed time" id="spentTime">경과 시간<strong>00: 00 : 35</strong></div>

				<div class="headline">
					<h6 class="minTitle">조치 진행결과</h6>
					<div class="btns">
						<button type="button" class="bt bd primary hide disabledUser" id="btnPopUpdate">수정</button>
						<button type="button" class="bt bd primary disabledUser" id="btnPopRefresh">새로고침</button>
						<button type="button" class="bt bd disabledUser" id="btnPopCopy">내용복사</button>
					</div>
				</div>
				
				<!-- POPUP GRID -->
				<div class="tui-grid sizeS">
					<div id="popupGrid"></div>
				</div>
				<!-- 인시던트 처리내역 -->
				<div class="hide" id="popProcZone">
					<div class="headline">
						<h6 class="minTitle">인시던트 처리내역 추가</h6>
					</div>
					<table class="field">
						<colgroup>
							<col width="50px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>						
								<th>처리<br>시간</th>
								<td>
									<input type="text" class="input date disabledUser" placeholder="처리시간" id="popInsertIcdResultDate" style="width:130px;">
									<input type="time" class="input time disabledUser" id="popInsertIcdResultTime" step="2" style="width:130px;">
								</td>
							</tr>													
							<tr>						
								<th>처리<br>내역</th>
								<td>
									<div class="set comment">
										<textarea class="textarea disabledUser" placeholder="이벤트 처리내역 입력" id="popIcdResultContentsTextarea"></textarea>
										<span class="count" id="popIcdResultContentsInputcount"><b>0</b><i>/</i>100</span>
										<button type="button" class="bt bg secondary disabledUser" id="popIcdProcSave">추가</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<span class="informTxt">조치경과는 내림차순으로 정렬됩니다.</span>
				<!-- 11/18 -->
				<div class="headline">
					<h6 class="minTitle">인시던트 종료처리</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="140px">
						<col width="210px">
						<col width="140px">
						<col width="210px">
					</colgroup>
					<tbody>
						<tr>
							<th>서비스 영향도 여부</th>
							<td>
								<span class="check"><input type="radio" name="popIcdSvcImp" value="있음" id="popIcdSvcImp" class="disabledUser"><label>있음</label></span>
								<span class="check"><input type="radio" name="popIcdSvcImp" value="없음" id="popIcdSvcImp" class="disabledUser"><label>없음</label></span>
							</td>
							<th>테크센터 VOC</th>
							<td>
								<span class="check"><input type="radio" name="popIcdTechVoc" value="Y" id="popIcdTechVoc" class="disabledUser"><label>Y</label></span>
								<span class="check"><input type="radio" name="popIcdTechVoc" value="N" id="popIcdTechVoc" class="disabledUser"><label>N</label></span>
							</td>
						</tr>
						<tr>
							<th>ITSM 인시던트 ID</th>
							<td colspan="3"><input type="text" class="input disabledUser" id="popItsmIcdId"></td>
						</tr>
						<tr>
							<th>구분</th>
							<td colspan="3" id="popIcdResType">						
							<!-- 
								<span class="check"><input type="radio" name="test4"><label>조치 후 정상화</label></span>
								<span class="check"><input type="radio" name="test4"><label>인시던</label></span>
								<span class="check"><input type="radio" name="test4"><label>변경작업</label></span>
								<span class="check"><input type="radio" name="test4"><label>자연해소</label></span>
								<span class="check"><input type="radio" name="test4"><label>오탐</label></span>
								<span class="check"><input type="radio" name="test4"><label>정보성</label></span>
								<span class="check"><input type="radio" name="test4"><label>운영자 확인</label></span>
								<span class="check"><input type="radio" name="test4"><label>외부영향</label></span>
								<span class="check"><input type="radio" name="test4"><label>테스트 이벤트 발생</label></span>
							 -->
							</td>
						</tr>
						<tr>
							<th>인시던트 종료 처리자</th>
							<td><span class="txt" id="popIcdResUser">홍길동</span></td>
							<th>인시던트 종료 시간</th>
							<td><span class="txt" id="popIcdResTime">23:52:52</span></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="popIcdOccuTime"/>
			</div><!--//panel-->

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd secondary hide">성능정보</button>
				<button type="button" class="bt max bd secondary hide">구성정보</button>
			</div>
			<div class="btns" id="popIcdBtns">				
				<button type="button" class="bt max bd primary disabledUser" id="btnIcdResultComplete">인시던트 조치완료</button>
				<button type="button" class="bt max bg primary disabledUser" id="btnIcdResultSave" >저장</button>
				<button type="button" class="bt max bd" id="icdPopClose">닫기</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 인시던트ID 상황관리 -->

<!-- [임시] 인시던트 조치내역 수정 팝업 -->

<article class="popup hide" id="test-popup2">
	<div class="popBox">
		<div class="conHead">
			<h5 class="popTitle">인시던트 조치 진행결과 수정 팝업</h5>
			<button type="button" class="btClose" id="btnCloseUpdPop"><i>닫기</i></button>
		</div>
		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>	
					<tr>						
						<th>처리시간</th>
						<td>
							<input type="text" class="input date disabledUser" placeholder="처리시간" id="popUpdIcdResultDate">
							<input type="time" class="input time disabledUser" id="popUpdIcdResultTime" step="2">
						</td>
					</tr>										
					<tr>						
						<th>처리내역</th>
						<td>
							<div class="set comment">
								<textarea class="textarea disabledUser" placeholder="이벤트 처리내역 입력" id="popUpdIcdResultContents"></textarea>
								<span class="count" id="popUpdIcdResultContentsCount"><b>0</b><i>/</i>100</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="popUpdIcdResultIdx"/>
		</div><!--//conBody-->
 
		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd" id="btnCancleUpdPop">취소</button>
				<button type="button" class="bt max bg primary disabledUser" id="btnSaveUpdPop">저장</button>
			</div>
		</div>

	</div>
</article>


<!-- form hidden value -->
<form id="viewFrm" name="viewFrm" method="post">
	<input type="hidden" id="viewType"  name="viewType" value="${viewType}"/>
	<input type="hidden" id="pageNo"  name="pageNo" value="1"/>
    <input type="hidden" id="listTotalCount"  name="listTotalCount" value="0"/>
    <input type="hidden" id="alramCount"  name="alramCount" value="0"/>
    <input type="hidden" id="incidentYn"  name="incidentYn" value="${incidentYn}"/>
	<input type="hidden" id="incidentState"  name="incidentState" value="조치완료"/>
	<input type="hidden" id="addThirtyTime"  name="addThirtyTime" value=""/>
	<input type="hidden" id="evtIcdId"  name="evtIcdId" value="${evtIcdId }"/>
</form>

<!-- EXCEL GRID -->
<div class="tui-grid hide">
	<div id="excelGrid"></div>
</div>
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">

var timer = null;

$(function(){

	// 초기화
	fnInit();
	
	// 이벤트(엑셀다운로드)
	$("#btnExcelDown").on("click", function(e){
		fnStopEvent(e);
		fnExcelList();		
	});
	
	// 이벤트(실시간확인중, 이력확인 버튼)
	$("#realCHK").on("change", function(e){
		
		fnStopEvent(e);
		
		// CALL 이벤트(검색초기화버튼)

		var chkLiveClsVal = $("#chkCurr").attr("class");
		
		if("txt on" == chkLiveClsVal){
			console.log("1 : "+ chkLiveClsVal);
			$("#incidentState").val("조치완료");
			fnPagenationList("1");
		}else{
			console.log("2 : "+ chkLiveClsVal);
			$("#incidentState").val("");
			fnPagenationList("1");
		}
	});
	
	// 이벤트(지금업데이트)
	$("#btnReload").on("click", function(e){
		fnStopEvent(e);
		fnPagenationList("1");
	});
	
	// 이벤트(검색버튼)
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		fnPagenationList("1");
	});
	
	// 이벤트(검색초기화버튼)
	$("#btnSearchInit").on("click", function(e){
		fnStopEvent(e);
		$("#startDate").val("");
		$("#startTime").val("");
		$("#endDate").val("");
		$("#endTime").val("");
		$("#kwIncidentId").val("");
		$("#kwIncidentLevel option:eq(0)").prop("selected", true);
		$("#kwIncidentState option:eq(0)").prop("selected", true);
		$("#kwCaptain").val("");
		$("#kwIncidentChief").val("");
		$("#kwRestoreChief").val("");
		$("#kwRestoreTeam").val("");
		$("#kwIncidentContents").val("");
		$("#kwContainerNm").val("");
		$("#kwStdnm").val("");
		$("#kwEstdnm").val("");
		$("#kwItsmIncidentId").val("");
		$("#kwIncidentServiceImpact").val("");		
	});
	
	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnPagenationList("1");
	});
	
	// 팝업 닫기버튼
	$("#icdPopClose").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("팝업화면을 닫으시겠습니까?");
		
		if(cfm){
			$("#popInsertIcdResultDate").val("");
			$("#popInsertIcdResultTime").val("");
			fnPagenationList("1");
			$("#test-popup1").addClass('hide');
		} else {
			return;
		}

	});
	
	// 인시던트 상황관리 그리드 클릭후 상세내용 팝업 호출
 	$(document).on("dblclick", "#grid .tui-grid-table tbody tr td", function(){	
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();	
 		let incidentId = gridObj["grid"].getValue(cell.rowKey, "incident_id", true);
 		fnPopupData(incidentId);
 		fnSetToday();
		// 레이어팝업 보여줌
		$('#test-popup1').removeClass('hide');		
	}); 
	
	
	//선택된 이벤트 아이디에 따른 이벤트 발생시간 및 제목 changeEvent
	$("#popEvtId").on("change", function(){
		let selectedEvtId = $("#popEvtId option:selected").val();
		let evtData = {};
		
		if(selectedEvtId !== null) {
			evtData = $("#popEvtId option:selected").data();
			console.log(evtData);
			$("#popHostname").html('');
			$("#popOccuTime").html('');
			$("#popEvtNm").html('');
			$("#popHostname").html(evtData.hostname); //host명_td
			$("#popOccuTime").html(evtData.occutime); //이벤트발생시간_td
			$("#popEvtNm").html(evtData.evtnm); //이벤트제목_td
		}

	});

 	// 팝업 - 내용복사 
	$(document).on("click", "#btnPopCopy", function(e){
		fnStopEvent(e);
		/*
		* 1. 내용복사 버튼을 두번 클릭
		* 2. grid의 아무 cell을 한번 클릭한 후에 내용복사 버튼을 클릭
		* 해야 작동하고,, 팝업 뜨고 버튼 한번만 클릭했을때는 제대로 작동하지 않음
		*/
		if($("#popupGrid .tui-grid-table tbody tr td").length) { //그리드에 복사할 row가 있을때
	
			// 그리드 영역 선택
 	 		gridObj["popupGrid"].setSelectionRange({
				start : [0, 0],
				end : [ (gridObj["popupGrid"].getRowCount())-1 ,gridObj["popupGrid"].getColumns().length-1]
			});
			
			// 선택영역 복사
			gridObj["popupGrid"].copyToClipboard();
			let test111 = gridObj["popupGrid"].getFocusedCell();
			
		} else { // 그리드에 데이터 없을때
			alert("복사할 내용이 없습니다.");
		}
			
	});
	
	// 팝업 - 저장
	$("#btnIcdResultSave").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("입력하신 내용을 저장하시겠습니까?");
		
		if(cfm){
			let icdId = $("#popIcdId").text();
			let icdLevel = $("input:radio[name='popIcdLevel']:checked").val();
			let captain = $("#popCaptain").val();
			let incidentChief = $("#popIcdChf").val();
			let restoreChief = $("#popRstChf").val();
			let restoreTeam = $("#popRstTm").val();
			
			if(icdLevel != "이상징후"){
				if(captain == null || captain == "" || captain == undefined) {
					alert("담당자 정보의 관제상황조장은 필수 입력 사항입니다.");
					return false;
				}
				if(incidentChief == null || incidentChief == "" || incidentChief == undefined) {
					alert("담당자 정보의 상황반장은 필수 입력 사항입니다.");
					return false;
				}
				if(restoreChief == null || restoreChief == "" || restoreChief == undefined) {
					alert("담당자 정보의 복구반장은 필수 입력 사항입니다.");
					return false;
				}
				if(restoreTeam == null || restoreTeam == "" || restoreTeam == undefined) {
					alert("담당자 정보의 복구팀은 필수 입력 사항입니다.");
					return false;
				}
			}
			
			let param = {
					incidentId : icdId
				  , incidentLevel : icdLevel
				  , captain : $("#popCaptain").val()
				  , incidentChief : $("#popIcdChf").val()
				  , restoreChief : $("#popRstChf").val()	
				  , restoreTeam : $("#popRstTm").val()
			}
			
			console.log(param);
			
	  		fnAjax("<c:url value='/api/icd/save'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("인시던트 등급 및 담당자정보 입력에 성공했습니다.");
					fnPopupData(icdId);
				} else {
					alert("인시던트 등급 및 담당자정보 입력에 실패했습니다.");
				}
			});
		} else {
			return;
		}
		
			
	});
	
	// 팝업 - 인시던트 조치완료
	$("#btnIcdResultComplete").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("인시던트 조치완료 처리를 하시겠습니까?");
		
		if(cfm){
			let impact = $("input:radio[name='popIcdSvcImp']:checked").val();
			let tech = $("input:radio[name='popIcdTechVoc']:checked").val();
			let itsm = $("#popItsmIcdId").val();
			let icdId = $("#popIcdId").text();
			let icdLevel = $("input:radio[name='popIcdLevel']:checked").val();
			let captain = $("#popCaptain").val();
			let incidentChief = $("#popIcdChf").val();
			let restoreChief = $("#popRstChf").val();
			let restoreTeam = $("#popRstTm").val();
			
			if(icdLevel != "이상징후"){
				if(captain == null || captain == "" || captain == undefined) {
					alert("담당자 정보의 관제상황조장은 필수 입력 사항입니다.");
					return false;
				}
				if(incidentChief == null || incidentChief == "" || incidentChief == undefined) {
					alert("담당자 정보의 상황반장은 필수 입력 사항입니다.");
					return false;
				}
				if(restoreChief == null || restoreChief == "" || restoreChief == undefined) {
					alert("담당자 정보의 복구반장은 필수 입력 사항입니다.");
					return false;
				}
				if(restoreTeam == null || restoreTeam == "" || restoreTeam == undefined) {
					alert("담당자 정보의 복구팀은 필수 입력 사항입니다.");
					return false;
				}
			}
			
			if(impact == null || impact == "" || impact == undefined){
				alert("서비스 영향도 여부는 필수 입력 사항입니다.");
				return false;
			}
			
			if(tech == null || tech == "" || tech == undefined){
				alert("테크센터 VOC는 필수 입력 사항입니다.");
				return false;
			}
			
			if(itsm == null || itsm == "" || itsm == undefined){
				alert("ITSM 인시던트 ID는 필수 입력 사항입니다.");
				return false;
			}
			

			let param = {
					incidentId : icdId
				  , incidentLevel : icdLevel
				  , incidentState : '조치완료'
				  , incidentServiceImpact : impact
				  , incidentTechVoc : tech
				  , itsmIncidentId : itsm
				  , captain : captain
				  , incidentChief : incidentChief
				  , restoreChief : restoreChief	
				  , restoreTeam : restoreTeam
			}
			
			console.log(param);
			
	   		fnAjax("<c:url value='/api/icd/end'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("인시던트 조치완료 처리에 성공했습니다.");
					fnPopupData(icdId);
				} else {
					alert("인시던트 조치완료 처리에 실패했습니다.");
				}
			});
		} else {
			return;
		}
		
	});
	
	// 팝업 그리드에서 td 선택시 선택한 rowKey 수정버튼에 담기
 	$(document).on("click", "#popupGrid .tui-grid-table tbody tr td", function(){	
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["popupGrid"].getFocusedCell();
 		$("#btnPopUpdate").data("idx", cell.rowKey);
	}); 
	
	// 팝업 - 수정 - 퍼블 없음 - 임시용
	$("#btnPopUpdate").on("click", function(e){
		fnStopEvent(e);
		
		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let idxChk = $(this).data("idx");
		if(idxChk == undefined ){ // 선택된 row가 없을 때
			alert("수정하실 조치 내용을 선택해주시기 바랍니다.");
		} else {
			let popRowData = gridObj["popupGrid"].getRow(idxChk);
			
			fnInitPopUdpIcdResult(); // 팝업 내부 초기화
			fnSetPopupIcdResult(popRowData); //팝업 내부에 수정 선택한 row의 data 보여줌
			
			$("#test-popup2").removeClass('hide'); //팝업 보여줌
		}
	});
	
	// 팝업 - 새로고침
	$("#btnPopRefresh").on("click", function(e){
		fnStopEvent(e);
		console.log("새로고침 버튼 click");
		fnPopGridSearch();
	});
	
	// 팝업 - 추가
	$("#popIcdProcSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업 - 인시던트 조치내역 추가 click");
		
		if($("#popIcdResultContentsTextarea").val() == "" || $("#popIcdResultContentsTextarea").val() == null){
			alert("조치내역을 입력해주세요");
			$("#popIcdResultContentsTextarea").focus();
			return false;
		}
		
		var icdDate = $("#popInsertIcdResultDate").val();
		var icdTime = $("#popInsertIcdResultTime").val();	
		
		if("" == fnNullChangeBlank(icdTime)) {
			var today = new Date();
			icdTime = today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
		}
		
		var dateTime = icdDate + " " + icdTime;
		var param = {
				incidentId : $("#popIcdId").text()
			  , procContent : $("#popIcdResultContentsTextarea").val()
			  , procTime : dateTime
		}
		
		console.log(param);

  		fnAjax("<c:url value='/api/icd/proc'/>", param, function(data){
			if(successResCode == data.resCode) {
				$("#popIcdResultContentsTextarea").val("");
				alert("인시던트 처리내역 입력에 성공했습니다.");
				$("#popIcdResultContentsInputcount").html('<b>0</b><i>/</i>100');
				fnPopGridSearch();
			} else {
				alert("인시던트 처리내역 입력을 실패했습니다.");
			}
		});
	});
	
	// 팝업 글자수 입력 popIcdResultContentsTextarea
	$("#popIcdResultContentsTextarea").on("keyup", function(e){
		var content = $(this).val();
		$("#popIcdResultContentsInputcount").html('<b>'+content.length+'</b><i>/</i>100');
		if(content.length > 100){
			alert("최대 100자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$("#popIcdResultContentsInputcount").html('<b>100</b><i>/</i>100');
		}
	});
	
	// 팝업 글자수 입력 popIcdResultContentsTextarea
	$("#popUpdIcdResultContents").on("keyup", function(e){
		var content = $(this).val();
		$("#popUpdIcdResultContentsCount").html('<b>'+content.length+'</b><i>/</i>100');
		if(content.length > 100){
			alert("최대 100자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$("#popUpdIcdResultContentsCount").html('<b>100</b><i>/</i>100');
		}
	});
	
	// 팝업 내용 수정 저장
	$(document).on("click", "#btnSaveUpdPop", function(e){

		let idx = $("#popUpdIcdResultIdx").val();
		let date = $("#popUpdIcdResultDate").val();					// 처리시간 날짜 - input date
		let time = $("#popUpdIcdResultTime").val();					// 처리시간 시간 - input
		let content = $("#popUpdIcdResultContents").val();

		let params = {
				idx : Number(idx),
				procTime : date+" "+time,
				procContent : content
		}
		
  		fnAjax("<c:url value='/api/icd/udpProc'/>", params, function(data){
			if(successResCode == data.resCode) {
				alert("인시던트 처리내역 수정에 성공했습니다.");
				$("#btnCloseUpdPop").click();
				fnPopGridSearch();
			} else {
				alert("인시던트 처리내역 수정에 실패했습니다.");
			}
		});
	});
	
	/* 조회기간 시작일 종료일 min, max 설정 */
	$("#startDate").datepicker({
		dateFormat: "yy-mm-dd",  
		onClose : function(selectedDate){
			$("#endDate").datepicker( "option", "minDate", selectedDate );
		}
	});
	$("#endDate").datepicker({
		dateFormat: "yy-mm-dd", 
		onClose : function(selectedDate){
			$("#startDate").datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	// 검색필터 버튼 click
	$("#btnKeyword").on("change", function(e){
		fnStopEvent(e);
		$("#searchBox").toggleClass('hide');
		var off = $("#searchBox").hasClass('hide');
		if(!off){ // 검색필터 열리면 5분간 리스트 갱신 멈춤
			var now = new Date();
			now.setMinutes(now.getMinutes()+5);
			var add5 = now.getFullYear()
			+ fnLpad(String((now.getMonth()+1)), 2 , "0")
			+ fnLpad(String(now.getDate()), 2 , "0")
			+ fnLpad(String(now.getHours()), 2 , "0")
			+ fnLpad(String(now.getMinutes()), 2 , "0")
			+ fnLpad(String(now.getSeconds()), 2 , "0");

			$("#addThirtyTime").val(add5);
		}
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	var viewType = $("#viewType").val();
	
	if(viewType == "00"){
		
		fnInitGnbLnb(3, 1, 3, 1);
		$("#chkCurr").attr("class", "txt on");
		$("#incidentState").val("조치완료");
		$("#viewTypeLi").html("인시던트 상황 관리");
		$("#viewTypeHeader").html("인시던트 상황 관리");
		$("#kwIncidentState").prop('disabled', true);
		
		
	} else if (viewType == "10"){
		
		fnInitGnbLnb(3, 2, 3, 2);
		$("#chkCurr").removeClass('on');
		//$("#searchBox").removeClass('hide');
		$("#incidentState").val("");
		$("#btnSearchInit").click();
		$("#viewTypeLi").html("인시던트 이력 조회");
		$("#viewTypeHeader").html("인시던트 이력 조회");
		$("#kwIncidentState").prop('disabled', false);
		
	}
	
	// 현재일시출력
	fnPrintNowDateTime();

	// 자동실행(지금업데이트)
	fnAutoReload();
	
	// 초기화(그리드)
	fnInitGrid();
	
	// 리스트(그리드) 조회
	fnList();
	
	// 알림
	fnAlarm();
	
	// 팝업 그리드 초기화
	fnInitPopupGrid();
	
	// 리스트(페이지번호) 조회
	fnPagenationList("1");
	
	// 공통
	fnCommon();

}

/**********************************************************
 * 리스트(페이지번호) 조회 
 **********************************************************/
function fnPagenationList(slcPageNo){
	
	// SET 페이지번호
	$("#pageNo").val(slcPageNo);
	
	// 리스트(그리드) 조회
	fnList();
}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

/* 	// 그리드 컴럼 정보
	var columnsData = [
		  	  {header:'인시던트 ID', name:'incident_id', sortable: true, filter:'select', align:'center', width:150}
			, {header:'인시던트 등급', name:'incident_level', sortable: true, filter:'select', align:'center', width:150}
			, {header:'인시던트 상태', name:'incident_state', sortable: true, filter:'select', align:'center', width:150}
			, {header:'이벤트 발생시간', name:'occu_time', sortable: true, align:'center', width:180}
			, {header:'경과시간', name:'cal_occu_time', sortable: true, align:'center', width:120}
			, {header:'관제상황조장', name:'captain', sortable: true, filter:'select', align:'center', width:150}
			, {header:'상황반장', name:'incident_chief', sortable: true, filter:'select', align:'center', width:120}
			, {header:'복구반장', name:'restore_chief', align:'center', sortable: true, filter:'select', width:120}
			, {header:'복구팀', name:'restore_team', sortable: true, filter:'select', align:'center', width:120}
			, {header:'HOST명', name:'incident_hostname', sortable: true, filter:'select', align:'center', width:210}
			, {header:'이벤트 ID', name:'incident_event_id', sortable: true, filter:'select', align:'center', width:120}
			, {header:'이벤트 제목', name:'incident_contents', align:'center', ellipsis : true, width:300}
			, {header:'센터', name:'container_nm', sortable: true, filter:'select', align:'center', width:80}
			, {header:'표준서비스명', name:'stdnm', align:'center', width:140}
			, {header:'단위서비스명', name:'estdnm', align:'center', width:140}
			, {header:'인시던트 종료시간', name:'incident_end_time', sortable: true, align:'center', width:180}
			, {header:'ITSM인시던트ID', name:'itsm_incident_id', sortable: true, filter:'select', align:'center', width:140}
			, {header:'서비스영향도', name:'incident_service_impact', sortable: true, filter:'select', align:'center', width:120} 
	]; */
	// 그리드 컴럼 정보
	var columnsData = [
		  	  {header:'인시던트 ID', name:'incident_id', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, align:'center', width:106, whiteSpace: 'pre-line'}
			, {header:'인시던트 등급', name:'incident_level', sortable: true, filter:'select', align:'center', width:70}
			, {header:'인시던트 상태', name:'incident_state', sortable: true, filter:'select', width:66, ellipsis : true}
			, {header:'이벤트 발생시간', name:'occu_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:120, ellipsis : true}
			, {header:'경과시간', name:'cal_occu_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:88, ellipsis : true}
			, {header:'관제상황조장', name:'captain', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'상황반장', name:'incident_chief', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'복구반장', name:'restore_chief', align:'center', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'복구팀', name:'restore_team', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'HOST명', name:'incident_hostname', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:258, ellipsis : true}
			, {header:'이벤트 ID', name:'incident_event_id', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'이벤트 제목', name:'incident_contents', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true, width:280, ellipsis : true}
			, {header:'센터', name:'container_nm', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'표준서비스명', name:'stdnm', align:'center', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'단위서비스명', name:'estdnm', align:'center', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'인시던트 종료시간', name:'incident_end_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'ITSM인시던트ID', name:'itsm_incident_id', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
			, {header:'서비스영향도', name:'incident_service_impact', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true} 
	];	
	
	// 그리드 생성
	fnDrawGrid("00", "grid", columnsData);
	fnDrawGrid("00", "excelGrid", columnsData);
	gridObj["grid"].hideColumn('_checked');
	gridObj["excelGrid"].hideColumn('_checked');
}
/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(){

	// Validator DateTime
	fnValidatorDateTime("startDate", "startTime", "endDate", "endTime");
	
	if(! valObj["validator"]) return;
	var pageSize = $("#slcPageSize").val();
	var pagingYn = "";
	
	if(pageSize == "전체"){
		pagingYn = "N";
		pageSize = 9999999;
	} else {
		pagingYn = "Y";
	}
	
	var params = {
		pageNo : $("#pageNo").val(),
		pageNavi : "5",
		pageSize : pageSize,
		startDateTime : valObj["startDateTime"],
		endDateTime : valObj["endDateTime"],
		searchType : $("#searchType option:selected").val(),
		incidentYn : $("#incidentYn").val(),
		incidentState : $("#incidentState").val(),
		pagingYn : pagingYn,
		kwIncidentId : $("#kwIncidentId").val(),
		kwIncidentLevel : $("#kwIncidentLevel option:selected").val(),
		kwIncidentState : $("#kwIncidentState option:selected").val(),
		kwCaptain : $("#kwCaptain").val(),
		kwIncidentChief : $("#kwIncidentChief").val(),
		kwRestoreChief : $("#kwRestoreChief").val(),
		kwRestoreTeam : $("#kwRestoreTeam").val(),
		kwIncidentContents : $("#kwIncidentContents").val(),
		kwContainerNm : $("#kwContainerNm").val(),
		kwStdnm : $("#kwStdnm").val(),
		kwEstdnm : $("#kwEstdnm").val(),
		kwItsmIncidentId : $("#kwItsmIncidentId").val(),
		kwIncidentServiceImpact : $("#kwIncidentServiceImpact").val()			
	};
	
    // GRID 리스트 조회
	fnAjax("<c:url value='/api/icd/list'/>", params, function(data) {

		if(successResCode == data.resCode){

			// SET 리시트전체건수, 시간변경(지금업데이트), 30초이후일시
			$("#listTotalCount").val(data.total_count);
			$("#currCheckTime").text(data.now_date_time);
			$("#addThirtyTime").val(data.add_thirty_time);

			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.list);
			fnSetRowBgcolor();
			fnSetBadgeColor();

			// 페이징
			fnPagenation(data.paging, "fnPagenationList");
			
			var evtIcdId = fnNullChangeBlank($("#evtIcdId").val());
			if(evtIcdId != ""){
				fnPopupData(evtIcdId);
				fnSetToday();
				
				$("#evtIcdId").val("");
				$('#test-popup1').removeClass('hide');
			}
			
			// 검색필터 닫기
			var filterChk = $("#btnKeyword").is(':checked');
			if(filterChk){
				$("#btnKeyword").click();
			}

		}else{
			
			// 경고메세지
			fnErrorMsg(failResMsg);
		}
		
	});
}
/**********************************************************
 * 현재일시출력
 **********************************************************/
function fnPrintNowDateTime(){

	var now = new Date();
	
	var nowDateTime = now.getFullYear() + "-" 
					+ fnLpad(String((now.getMonth()+1)), 2 , "0") + "-" 
					+ fnLpad(String(now.getDate()), 2 , "0") + " " 
					+ fnLpad(String(now.getHours()), 2 , "0") + ":" 
					+ fnLpad(String(now.getMinutes()), 2 , "0") + ":" 
					+ fnLpad(String(now.getSeconds()), 2 , "0");
					
	$("#printNowDateTime").html("<b>" + nowDateTime + "</b>");
	
	setTimeout("fnPrintNowDateTime()", 1000);
}
/**********************************************************
 * 자동실행(알람)
 **********************************************************/
function fnAlarm(){

	var chkSoundClsVal = $("#btnSound").attr("class");
	
	if("btSound on" == chkSoundClsVal){
		
		var params = {
				incidentState : "조치완료"
			};
			
	    // 알림건수
		fnAjax("<c:url value='/api/icd/newAlarmCount'/>", params, function(data) {
			
			if(successResCode == data.resCode){
				var totalCount = parseInt(data.info.total_count, 10);
				var alramCount = parseInt($("#alramCount").val(), 10);
				$("#alramCount").val(totalCount);
	
				if((0 < totalCount) && (0 < alramCount) && (alramCount < totalCount)){

					// 신규알림
				    var myAudio = new Audio();
				    myAudio.src = "/sound/event.mp3";
				    myAudio.play();
				}
				
			}else{
				fnErrorMsg(failResMsg);
			}
			
		});
	}
	
	setTimeout("fnAlarm()", 1000);
}
/**********************************************************
 * 자동실행(지금업데이트)
 **********************************************************/
function fnAutoReload(){
	
	// 30초이후일시(지금업데이트)
	var addThirtyTime = $("#addThirtyTime").val();
	
	// 현재일시 
	var nowDateTime = fnNowDateTime();
	
	if(("" != fnNullChangeBlank(addThirtyTime)) && addThirtyTime <= nowDateTime){
		
		// 이벤트(지금업데이트)
		$("#btnReload").trigger("click");
	}
	
	if("00" == $("#viewType").val()){
		setTimeout("fnAutoReload()", 1000);
	}
}

/********************************************************** 
 * 인시던트 상황관리 팝업 호출
 **********************************************************/
function fnShowPopup(data){
	let detail = data.detail;
	let evtList = data.popEvtList;
	console.log("시간 >>>>> "+detail.cal_occu_time);
	$("#icdDetailPop").html("["+detail.incident_id+"]["+detail.incident_level+"] 발생대응");
	
	
		
		if(detail.incident_state == '조치중'){
			
			if("사용자" != loginUserGroup){
				$("#popCaptain").prop('readonly', false);
				$("#popIcdChf").prop('readonly', false);
				$("#popRstChf").prop('readonly', false);
				$("#popRstTm").prop('readonly', false);
				$("input[name='popIcdSvcImp']").prop('disabled', false);	//서비스영향도_radioButton
				$("input[name='popIcdTechVoc']").prop('disabled', false);	//테크센터VOC_radioButton
				$("#popItsmIcdId").prop('readonly', false);
				$("#popIcdResType").prop('disabled', false);
				$("#popIcdResUser").prop('disabled', false);
				$("#popIcdResTime").prop('disabled', false);
				$("input[name='popIcdLevel']").prop('disabled', false); //인시던트 등급
			}
			
			$("#btnPopUpdate").removeClass('hide');
			$("#btnIcdResultComplete").removeClass('hide');
			$("#btnIcdResultSave").removeClass('hide');
			$("#popProcZone").removeClass('hide');
			
			clearInterval(timer); //경과시간 interval 초기화
  			var time = fnPrintOccuTime(detail.occu_time);
			fnStartTimer(detail.occu_time);
			
		} else if(detail.incident_state == '조치완료') {
			if("사용자" != loginUserGroup){
				$("#popCaptain").prop('readonly', true);
				$("#popIcdChf").prop('readonly', true);
				$("#popRstChf").prop('readonly', true);
				$("#popRstTm").prop('readonly', true);
				$("input[name='popIcdSvcImp']").prop('disabled', true);	//서비스영향도_radioButton
				$("input[name='popIcdTechVoc']").prop('disabled', true);	//테크센터VOC_radioButton
				$("#popItsmIcdId").prop('readonly', true);
				$("#popIcdResType").prop('disabled', true);
				$("#popIcdResUser").prop('disabled', true);
				$("#popIcdResTime").prop('disabled', true);
			}
			
			$("#btnPopUpdate").addClass('hide');
			$("#btnIcdResultComplete").addClass('hide');
			$("#btnIcdResultSave").addClass('hide');
			$("#popProcZone").addClass('hide');
			
			clearInterval(timer); //경과시간 interval 초기화
			$("#spentTime").html('경과시간 <strong>'+detail.diff_time+'</strong>'); //경과시간_div
			
			$("input[name='popIcdLevel']").prop('disabled', true); //인시던트 등급
		}
		

	
	//이벤트 아이디 selectBox 옵션 추가
	if(evtList.length > 0){
		for(evt of evtList) {
			console.log(evt);
			let option = "<option value="+evt.event_id+" data-occutime='"+evt.occu_time+"' data-evtnm='"+evt.target_contents+"' data-hostname='"+evt.hostname+"'>"+evt.event_id+"</option>";
			$("#popEvtId").append(option);
		}
		$("#popEvtId option:eq(0)").prop("selected", true); //첫번째 option 선택
		let firstEvtId = $("#popEvtId option:selected").val();
		let firstEvtData = {};

		if(firstEvtId !== null) {
			$("#popEvtId").prop('disabled', false);
			firstEvtData = $("#popEvtId option:selected").data();
			console.log(firstEvtData);
			$("#popHostname").html(firstEvtData.hostname); //호스트명_td
			$("#popOccuTime").html(firstEvtData.occutime); //이벤트발생시간_td
			$("#popEvtNm").html(firstEvtData.evtnm); //이벤트제목_td
		}		

	} else {
		$("#popEvtId").prop('disabled', true);
		$("#popHostname").html('없음'); //host명_td
		$("#popOccuTime").html('없음'); //이벤트발생시간_td
		$("#popEvtNm").html('없음'); //이벤트제목_td
	}
	
	$("#popIcdState").text(detail.incident_state); //인시던트상태_span
	$("input:radio[name='popIcdLevel']:radio[value='" + detail.incident_level + "']").prop('checked', true); //인시던트등급_radioButton
	//$("#popEvtId").append(popEvtIdOption); //이벤트아이디_selectBox
	$("#popIcdId").html(detail.incident_id); //인시던트ID_td
	$("#popCenter").html(detail.container_nm); //센터_td
	$("#popStdNm").html(detail.stdnm); //표준서비스명_td
	$("#popEstdNm").html(detail.estdnm); //단위서비스명_td
	$("#popCaptain").val(detail.captain); //관제상황조장_td
	$("#popIcdChf").val(detail.incident_chief); //상황반장_td
	$("#popRstChf").val(detail.restore_chief); //복구반장_td
	$("#popRstTm").val(detail.restore_team); //복구팀_td
	$("#popIcdOccuTime").val(detail.occu_time);

/* 	var time = fnPrintOccuTime(detail.occu_time);
	fnStartTimer(detail.occu_time); */
	
	$("#popIcdResultContentsInput").val(''); //이벤트처리내역_input
	$("#popUpdIcdResultContentsCount").html('<b>0</b><i>/</i>100'); //글자수카운트1,2_span
	$("#popIcdResultContentsInputcount").html('<b>0</b><i>/</i>100');
	$("#popIcdResultContentsTextarea").val(''); //이벤트처리내역_textarea
	$("input:radio[name='popIcdSvcImp']:radio[value='" + detail.incident_service_impact + "']").prop('checked', true);		//서비스영향도_radioButton
	$("input:radio[name='popIcdTechVoc']:radio[value='" + detail.incident_tech_voc + "']").prop('checked', true);	//테크센터VOC_radioButton
	$("#popItsmIcdId").val(detail.itsm_incident_id);								//ITSM인시던트ID_span
	$("#popIcdResType").html(detail.incident_result_type);								//구분_td
	$("#popIcdResUser").html(detail.incident_result_user);								//인시던트종료처리자_span
	$("#popIcdResTime").html(detail.incident_end_time);								//인시던트종료시간_span
	
	fnPopGridSearch();
};



/********************************************************** 
 * 인시던트 상황관리 팝업 내부 데이터 초기화
 **********************************************************/
function fnInitPopup(){
	let hideChkBtn = $("#btnPopUpdate").hasClass('hide');
	let hideChkDiv = $("#popProcZone").hasClass('hide');
	
	$("#icdDetailPop").html("");
	
	if(hideChkBtn == false) {
		$("#btnPopUpdate").addClass('hide');
		$("#btnIcdResultComplete").addClass('hide');
		$("#btnIcdResultSave").addClass('hide');
	} else {
		$("#btnPopUpdate").removeClass('hide');
		$("#btnIcdResultComplete").removeClass('hide');
		$("#btnIcdResultSave").removeClass('hide');
	}
	
	if(hideChkDiv == false) {
		$("#popProcZone").addClass('hide');
	}
	
	$("#popIcdState").text("");									//인시던트상태_span
	$("input[name='popIcdLevel']").prop('checked', false);		//인시던트등급_radioButton
	$("#popEvtId").empty();										//이벤트아이디_selectBox
	$("#popIcdId").html('');									//인시던트ID_td
	$("#popCenter").html('');									//센터_td
	$("#popStdNm").html('');									//표준서비스명_td
	$("#popEstdNm").html('');									//단위서비스명_td
	$("#popHostname").html('');									//호스트명_td
	$("#popOccuTime").html('');									//이벤트발생시간_td
	$("#popEvtNm").html('');									//이벤트제목_td
	$("#popCaptain").val('');									//관제상황조장_td
	$("#popIcdChf").val('');									//상황반장_td
	$("#popRstChf").val('');									//복구반장_td
	$("#popRstTm").val('');										//복구팀_td
	$("#spentTime").html('경과시간 <strong>00: 00 : 00</strong>');	//경과시간_div
	$("#popIcdOccuTime").val('');
	$("#popIcdResultContentsInput").val('');					//이벤트처리내역_input
	$("#popUpdIcdResultContentsCount").html('<b>0</b><i>/</i>100'); //글자수카운트1,2_span
	$("#popIcdResultContentsInputcount").html('<b>0</b><i>/</i>100');
	$("#popIcdResultContentsTextarea").val('');					//이벤트처리내역_textarea
	$("input[name='popIcdSvcImp']").prop('checked', false);		//서비스영향도_radioButton
	$("input[name='popIcdTechVoc']").prop('checked', false);	//테크센터VOC_radioButton
	$("#popItsmIcdId").html('');								//ITSM인시던트ID_span
	$("#popIcdResType").html('');								//구분_td
	$("#popIcdResUser").html('');								//인시던트종료처리자_span
	$("#popIcdResTime").html('');								//인시던트종료시간_span
	
	/*
	$("#popCaptain").prop('disabled', false);
	$("#popIcdChf").prop('disabled', false);
	$("#popRstChf").prop('disabled', false);
	$("#popRstTm").prop('disabled', false);
	$("input[name='popIcdSvcImp']").prop('disabled', false);	//서비스영향도_radioButton
	$("input[name='popIcdTechVoc']").prop('disabled', false);	//테크센터VOC_radioButton
	$("#popItsmIcdId").prop('disabled', false);
	$("#popIcdResType").prop('disabled', false);
	$("#popIcdResUser").prop('disabled', false);
	$("#popIcdResTime").prop('disabled', false);*/
};


/**********************************************************
 * 인시던트 상황 관리 팝업 데이터 조회
 **********************************************************/
function fnPopupData(incidentId){
	var param = { incidentId : incidentId }

	fnAjax("<c:url value='/api/icd/detail'/>", param, function(data){
		if(successResCode == data.resCode) {
			fnInitPopup();
			fnShowPopup(data);
		} else {
			alert("인시던트 상세내역 조회에 실패했습니다.");
		}
	});
}

/**********************************************************
 * 초기화(팝업그리드)
 **********************************************************/
function fnInitPopupGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
		  	  {header:'처리시간', name:'proc_time', align:'center', width : 160}
			, {header:'처리내역', name:'proc_content', width : 340, whiteSpace: 'pre-line'}
			, {header:'등록자', name:'user_name', align:'center', width : 120}
	];
	
	
	// 그리드 생성
	fnDrawGrid("02", "popupGrid", columnsData);
}

/**********************************************************
 * 인시던트 상황 관리 팝업 내 조치내역 그리드 조회
 **********************************************************/
function fnPopGridSearch() {
	let icdId = $("#popIcdId").text();
	console.log("fnPopGridList "+ icdId);
	let param = { incidentId : icdId }
	
 	// 인시던트ID로 조치내역 조회
	fnAjax("<c:url value='/api/icd/proclist'/>", param, function(data){
		if(successResCode == data.resCode) {
			fnPopGridList(data);
		} else {
			alert("인시던트 조치내역 조회에 실패했습니다.");
		}
	});
}

/**********************************************************
 * 인시던트 상황 관리 팝업 내 그리드 생성
 **********************************************************/
function fnPopGridList(data){
	$("#popupGrid").empty();									//인시던트처리내역 그리드 초기화
	let procList = data.icdProcList;
	fnInitPopupGrid();
	gridObj["popupGrid"].resetData(procList);
	if(procList.length > 0){
		// 내용복사를 위한 1번째 셀 focus 주기
		gridObj["popupGrid"].focusAt(0,0);		
	}	
}

/**********************************************************
 * 인시던트 조치내역 수정 팝업 input 초기화
 **********************************************************/
function fnInitPopUdpIcdResult(){
	$("#popUpdIcdResultIdx").val('');
	$("#popUpdIcdResultDate").val('');					// 처리시간 날짜 - input date
	$("#popUpdIcdResultTime").val('');					// 처리시간 시간 - input
	$("#popUpdIcdResultContents").val('');				// 처리내역 - textarea
	$("#popUpdIcdResultContentsCount").text('');		// 처리내역 글자수 - span
	
}

/**********************************************************
 * 인시던트 조치내역 수정 팝업 선택한 row data 입력
 **********************************************************/
function fnSetPopupIcdResult(popRowData){
	let procTime = popRowData.proc_time;
	let procTimeArr = procTime.split(" ");
	
	let date = procTimeArr[0];
	let time = procTimeArr[1];
	
	let procStr = popRowData.proc_content;
	let idx = popRowData.idx;
	$("#popUpdIcdResultIdx").val(idx);
	$("#popUpdIcdResultDate").val(date);					// 처리시간 날짜 - input date
	$("#popUpdIcdResultTime").val(time);					// 처리시간 시간 - input
	$("#popUpdIcdResultContents").val(procStr);				// 처리내역 - textarea
	$("#popUpdIcdResultContentsCount").html('<b>'+procStr.length+'</b><i>/</i>100');		// 처리내역 글자수 - span

} 

/**********************************************************
 * 인시던트 팝업 내 처리시간 오늘 날짜로 set
 **********************************************************/
function fnSetToday() {
	
	let today = new Date();
	
	let date = today.getFullYear()+"-"+(today.getMonth() + 1)+"-"+today.getDate();
	let time = fnLpad(String(today.getHours()), 2, "0")+":"+fnLpad(String(today.getMinutes()), 2, "0")+":"+fnLpad(String(today.getSeconds()), 2, "0");
	
	$("#popInsertIcdResultDate").datepicker("setDate", date);
	$("#popInsertIcdResultTime").val(time);
	
	console.log(time);
}

/**********************************************************
 * 인시던트 그리드 내 조치완료 row 배경색 변경
 **********************************************************/
function fnSetRowBgcolor(){

	var cnt = gridObj["grid"].getRowCount();
	
	for(i=0; i<=cnt; i++){
		var a = gridObj["grid"].getValue(i,"incident_state");
		if(a =='조치중'){
			//console.log(i + '조치완료');
			gridObj["grid"].addRowClassName(i,"bg-blue");
		}
	}
}

/**********************************************************
 * 경과시간 출력
 **********************************************************/
function fnPrintOccuTime(occutime){ 
	
	var occu = new Date(occutime);
	var today = new Date();
	
	var diffTime = today.getTime() - occu.getTime();
	
	var h = ((Math.floor(diffTime / (1000*60*60))).toString()).padStart(2, '0') ;
	var m = (Math.floor((diffTime % (1000*60*60)) / (1000*60)).toString()).padStart(2, '0');
	var s = (Math.floor((diffTime % (1000*60)) / 1000).toString()).padStart(2, '0');
	
	var diff = h + " : " + m  + " : " + s;
	$("#spentTime").html('경과시간 <strong>'+diff+'</strong>');
}

function fnStartTimer(occutime){
	clearInterval(timer);
	timer = setInterval(function(){fnPrintOccuTime(occutime)}, 1000);
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

/**********************************************************
 * 엑셀 다운로드용 리스트(그리드) 조회
 **********************************************************/
function fnExcelList(){

	// Validator DateTime
	fnValidatorDateTime("startDate", "startTime", "endDate", "endTime");
	
	if(! valObj["validator"]) return;
	
	var params = {
		pageNo : $("#pageNo").val(),
		pageNavi : "5",
		pageSize : $("#slcPageSize").val(),
		startDateTime : valObj["startDateTime"],
		endDateTime : valObj["endDateTime"],
		searchType : $("#searchType option:selected").val(),
		incidentYn : $("#incidentYn").val(),
		incidentState : $("#incidentState").val(),
	};
	
    // GRID 리스트 조회
	fnAjax("<c:url value='/api/icd/list'/>", params, function(data) {

		if(successResCode == data.resCode){

			// RESET DATA(그리드)
			gridObj["excelGrid"].resetData(data.list);
			
			var cnt = gridObj["excelGrid"].getRowCount();
			
			if( 0 < cnt) {
				const options = {
						fileName: ("incident_" + fnNowDateTimeUnderScore())
					};
			 		gridObj["excelGrid"].export("csv", options);
			} else {
				alert("조회된 데이터가 없어 엑셀 다운로드를 할 수 없습니다.");
			}

		}else{
			
			// 경고메세지
			fnErrorMsg(failResMsg);
		}
		
	});
}
//-->
</script>