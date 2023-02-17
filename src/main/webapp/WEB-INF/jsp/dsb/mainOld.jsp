<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />

<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<!-- CONTENTS -->
<section class="section main">
		
	<div class="panel row">
		<div class="panel">
			
			<div class="box">
				<div class="headline">
					<h3 class="mainTitle">점검·인시던트 현황</h3>
					<div class="graph lable">
						<ul>
							<li><i style="background:rgba(11,94,215,0.2)"></i>이벤트</li>
							<li><i style="background:rgba(11,94,215,0.5)"></i>인시던트</li>
							<li><i style="background:rgb(0,19,76)"></i>장애</li>
						</ul>
					</div>
				</div>
				<ul class="issue">
					<li>
						<div class="total">
							<h4 class="subTitle">이벤트</h4>
							<p><a id="evtCntLink"><strong id="evtCnt"></strong>건</a></p>
						</div>
					</li>
					<li>
						<div class="total">
							<h4 class="subTitle">이상징후</h4>
							<p><a id="icdCntLink"><strong id="icdCnt"></strong>건</a></p>
						</div>
					</li>
					<li>
						<div class="total">
							<h4 class="subTitle">장애</h4>
							<p><a id="errCntLink"><strong id="errCnt"></strong>건</a></p>
						</div>
					</li>
					<li>
						<div class="graph"><canvas id="chart4" height="150px"></canvas></div>
					</li>
				</ul>
			</div>
			
			<div class="box">
				<div class="headline">
					<h3 class="mainTitle">작업현황</h3>
					<div class="graph lable">
						<ul>
							<li><i style="background:rgba(11,94,215,0.2)"></i>이벤트</li>
							<li><i style="background:rgba(11,94,215,0.5)"></i>인시던트</li>
							<li><i style="background:rgb(0,19,76)"></i>장애</li>
						</ul>
					</div>
				</div>
				
				<ul class="situation">
					<li>
						<div class="graph">
							<div>
								<h4 class="subTitle">IPC</h4>
								<em>총<strong>10</strong>건</em>
							</div>
							<canvas id="chart1"></canvas>
						</div>
					</li>
					<li>
						<div class="graph">
							<div>
								<h4 class="subTitle">EPC</h4>
								<em>총<strong>3</strong>건</em>
							</div>
							<canvas id="chart2"></canvas>
						</div>
					</li>
					<li>
						<div class="graph">
							<div>
								<h4 class="subTitle">기타</h4>
								<em>총<strong>2</strong>건</em>
							</div>
							<canvas id="chart3"></canvas>
						</div>
					</li>
					<li>
						<div class="graph"><canvas id="chart5" height="150px"></canvas></div>
					</li>
				</ul>
			</div>
			
			<div class="box fix">
				<div class="tap">
					<ul>
						<li class="on">이벤트</li>
						<li>인시던트</li>
						<li>작업현황</li>
					</ul>
				</div>
				<div class="tapCon view1">
					<div class="grid sizeS">
						<table>
							<thead>
								<tr>
									<th><span>ID</span></th>
									<th><span>도메인</span></th>
									<th><span>서비스명</span></th>
									<th><span>제목</span></th>
									<th><span>변경작업수행팀</span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>CRM22102487043</td>
									<td>Cloud 공통인프라</td>
									<td>공통-cloud-IPC</td>
									<td class="tl">[목동_HW_Decomm] 목동 1센터 108-2209 Cnode14 유휴화로 인한 네트워크 전원 케이블 제거 작업</td>
									<td>IPC서비스운영팀</td>
								</tr>
								<tr v-for="n in 10">
									<td>CRM22107465387</td>
									<td>Cloud 공통인프라</td>
									<td>공통-cloud-EPC</td>
									<td class="tl">[EPC_CSW] kr-1-vr-pod3 cnode16 H/W fault 로 인한 긴급 마이그레이션</td>
									<td>EPC서비스운영팀</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tapCon view2 hide">
					<div class="grid sizeS">
						<table>
							<thead>
								<tr>
									<th><span>NO</span></th>
									<th><span>인시던트ID</span></th>
									<th><span>등급</span></th>
									<th><span>발생시간</span></th>
									<th><span>데이터센터</span></th>
									<th><span>표준서비스명</span></th>
								</tr>
							</thead>
							<tbody id="icdListbody">
							</tbody>
						</table>
					</div>
				</div>
				<div class="tapCon view3 hide">
					<div class="grid sizeS">
						<table>
							<thead></thead>
							<tbody id="ExpList"></tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="box fix">
				<div class="headline">
					<h3 class="mainTitle">서버현황</h3>
					<div class="graph lable">
						<ul>
							<li><i style="background:#FE0004"></i>경고</li>
							<li><i style="background:#ED6707"></i>주의</li>
							<li><i style="background:#04871F"></i>안전</li>
						</ul>
					</div>
				</div>
				<div class="server">
					<h4 class="subTitle">IPC</h4>
					<ul id="serverStat">
					</ul>
				</div>
				<div class="server">
					<h4 class="subTitle">EPC</h4>
					<ul>
						<li>
							<div class="item success">
								<p class="tit">천안CDC</p>
								<p class="con">
									<em>이벤트<b>0</b></em>
									<em>인시던트<b>0</b></em>
								</p>
							</div>
						</li>
						<li>
							<div class="item success">
								<p class="tit">목동IDCC</p>
								<p class="con">
									<em>이벤트<b>0</b></em>
									<em>인시던트<b>0</b></em>
								</p>
							</div>
						</li>
						<li>
							<div class="item success">
								<p class="tit">부산</p>
								<p class="con">
									<em>이벤트<b>0</b></em>
									<em>인시던트<b>0</b></em>
								</p>
							</div>
						</li>
						<li>
							<div class="item success">
								<p class="tit">목동IDC</p>
								<p class="con">
									<em>이벤트<b>0</b></em>
									<em>인시던트<b>0</b></em>
								</p>
							</div>
						</li>
						<li>
							<div class="item success">
								<p class="tit">목동IDC2</p>
								<p class="con">
									<em>이벤트<b>0</b></em>
									<em>인시던트<b>0</b></em>
								</p>
							</div>
						</li>
						<li>
							<div class="item off">
								<p class="tit">남청주</p>
								<p class="con">연결안됨</p>
							</div>
						</li>
						<li>
							<div class="item off">
								<p class="tit">여의도센터</p>
								<p class="con">연결안됨</p>
							</div>
						</li>
						<li>
							<div class="item off">
								<p class="tit">여의도센터</p>
								<p class="con">연결안됨</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
		
		<div class="panel fix my">
			<div class="box">
				<div class="headline">
					<h3 class="mainTitle">나의 업무</h3>
				</div>
				<div class="calendar"></div>
				<a href="" class="todo">
					<h4 class="subTitle">TO-DO List</h4>
					<p>요청작업 <strong>12</strong>건 있습니다.</p>
				</a>
				<div class="latest bg">
					<ul>
						<li v-for="n in 20">
							<a href="" class="row">
								<span>[목동1] 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="box">
				<div class="tap">
					<ul>
						<li class="on">공지사항</li>
						<li>Q&amp;A</li>
					</ul>
				</div>
				<a href="<c:url value='/view/spt/subSupportNotice' />" class="btMore">더보기</a>
				<div class="tapCon view1" id="noticeDetail">
					<div class="latest">
						<ul id="noticeList">
						</ul>
					</div>
				</div>
				<div class="tapCon view2 hide">
					<div class="latest">
						<ul>
							<li v-for="n in 4">
								<a href="" class="row q">
									<span>[답변대기] 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로</span>
									<span>2022-10-27</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="headline">
					<h4 class="subTitle">관제팀 운영 메뉴얼</h4>
					<a href="" class="btMore">더보기</a>
				</div>
				<div class="latest down">
					<ul>
						<li v-for="n in 3">
							<a href="" class="row">
								<span>[목동1] 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
	</div>

</section>



<!-- [팝업] 공지사항 상세 -->
<article class="popup hide" id="noticePopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">공지사항 상세</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3" id="noticeTit"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="noticeRegDt"></td>
						<th>작성자</th>
						<td id="noticeName"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" id="noticeContent" style="white-space: pre;"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnNoticePopClose">확인</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 공지사항 상세 -->


<!-- [팝업] 공지사항 리스트 -->
<article class="popup hide" id="noticeListPopup">
	<div class="popBox">
		<div class="conHead">
			<h5 class="popTitle">공지사항 보기</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>
		
		<div class="conBody">
		
			<h7> 공지리스트 </h7>
			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="500px">
					<col width="100px">
				</colgroup>
				<thead></thead>
				<tbody id="popnoticeList"></tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
		</div>

	</div>
</article>	
<!--// [팝업] 공지사항 리스트 -->


<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){

	// 초기화
	fnInit();
	
	// 공지사항 팝업
	$(document).on("click", "#noticeDetail ul li", function(){
		
		// 선택한 row의 idx 가져오기
		var idx = $(this).attr('idx');
				
		var params = { idx : parseInt(idx) };
		
		fnAjax("<c:url value='/api/dsb/noticeDetail'/>", params, function(data) {
			
			if(successResCode == data.resCode){
				
				// 공지사항 팝업 데이터 셋팅
				$('#noticeTit').text(data.noticeDetail.title);
				$('#noticeRegDt').text(fn_setDateFormat(data.noticeDetail.regist_time, 'YYYY-MM-DD'));
				$('#noticeName').text(data.noticeDetail.regist_person);
				$('#noticeContent').text(data.noticeDetail.content);
				
				// 공지사항 팝업 보여줌
				$('#noticePopup').removeClass('hide');
			}else{
				fnErrorMsg(failResMsg);
			}
		});
	});
	
	// 공지사항 팝업 닫기
	$('#btnNoticePopClose').on('click', function(){
		$('#noticePopup').addClass('hide');
	});
	
	
	// 공지사항 더보기 팝업
	$(document).on("click", "#noticeListPop", function(){
		
		var params = {  };
		
		fnAjax("<c:url value='/api/dsb/popnoticeList'/>", params, function(data) {
			
			if(successResCode == data.resCode){
				
				var noticeListData = "";
				var cnt = 1;
				
				$.each(data.noticeList, function(index, list){
					
					noticeListData += "<tr class='view-btn1' idx='"+list.idx+"'>";
					noticeListData += "<td>"+cnt+"</td>";
					noticeListData += "<td class='tl'>"+list.title+"</td>";
					noticeListData += "<td class='tl'>"+fn_setDateFormat(list.regist_time, 'YYYY-MM-DD')+"</td>";
					noticeListData += "</tr>";
					
					noticeListData += "<tr class='answer' id='ans_"+list.idx+"' style='display:none;'>";
					noticeListData += "<td></td>";
					noticeListData += "<td colspan='2'>"+list.content;
					noticeListData += "<br>";
					noticeListData += "<button type='button' onclick='$("+'"#ans_'+list.idx+'").hide();'+"'>닫기</button>";
					noticeListData += "</td>";
					noticeListData += "</tr>";
					
					cnt++;
				})
				
				//console.log(noticeListData);
				
				$('#popnoticeList').html(noticeListData);
				// 공지사항 더보기 팝업 보여줌
				$('#noticeListPopup').removeClass('hide');
				
			}else{
				fnErrorMsg(failResMsg);
			}
		});
		
	});


	$(document).on('click','.view-btn1',function(){
		
	    var no = $(this).attr('idx');
	    $('.answer').hide();
	    $('#ans_'+no).show();
	});
	
	$("#evtCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/evt/subEventState' />", {viewType:'00'});
	});
	
	$("#icdCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/icd/subIncidentState' />", {viewType:'00',incidentYn:'Y'});
	});
	
	$("#errCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/icd/subIncidentState' />", {viewType:'00',incidentYn:'N'});
	});
	
});


/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){

	// InitGnbLnb
	fnInitGnbLnb(9, 0, 9, 0);
	
	// 점검/인시던트 현황 건수
	fn_getCnt();
	
	// 점검/인시던트 현황 차트
	fn_getChart();
	
	//인시던트 리스트
	fn_getIncidentList();
	
	//서버현황
	fn_getServerStatus();
	
	//공지사항
	fn_getNoticeList();
	
	//작업현황
	fn_getExpList();
	
	//30초마다 새로고침
 	setInterval(function(){
		location.reload();
	}, 30000);  
	
}

/**********************************************************
 * 점검/인시던트 현황 건수 가져오기
 **********************************************************/
function fn_getCnt(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/getCnt'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			//console.log("evtCnt:: "+data.cntMap.evtCnt);
			//console.log("icdCnt:: "+data.cntMap.icdCnt);
			//console.log("errCnt:: "+data.cntMap.errCnt);
			
			$("#evtCnt").text(data.cntMap.evtCnt);
			$("#icdCnt").text(data.cntMap.icdCnt);
			$("#errCnt").text(data.cntMap.errCnt);
			
		}else{
			fnErrorMsg(failResMsg);
		}
	});
}


var chartLabels = [];
var event_label_cnt = [];
var incident_label_cnt = [];

/**********************************************************
 * 점검/인시던트 현황 차트데이터 가져오기
 **********************************************************/
function fn_getChart(){
	
	var today = new Date();	
	var monthBefore = new Date(today.setMonth(today.getMonth()-1));
	
	var year = monthBefore.getFullYear();
	var month = monthBefore.getMonth()+1;
	var day = monthBefore.getDate();

	// Generate yyyy-mm-dd date string
	var start_chart_date = year + "-" + month + "-" + day;
	
	var params = {
		start_chart_date : start_chart_date
	};
	
    // 차트데이터 가져오기
	fnAjax("<c:url value='/api/dsb/chart'/>", params, function(data) {

		$.each(data.chartData, function(inx, obj) {
			var cDate = new Date(obj.chart_date);
			
	        chartLabels.push(cDate.getMonth()+1+"-"+cDate.getDate());
	        event_label_cnt.push(obj.event_count);
	        incident_label_cnt.push(obj.incident_count);
	    });
		
		fn_drawChart();
	});
}

/**********************************************************
 * 점검/인시던트 현황 차트그리기
 **********************************************************/
function fn_drawChart(){
	const ctx4 = document.getElementById('chart4');
	const chart4 = new Chart(ctx4, {
		type: 'bar',
		data: {
			labels: chartLabels,
			datasets: [{
				label: '장애',
				data: [8,5,9,6,3,1,7,10,12,19,3,5,2,3,8,5,9,6,3,1,7,10,12,19,3,5,2,3],
				borderWidth: 0,
				backgroundColor: 'rgb(0,19,76)',
				barThickness: 4
				},{
				label: '인시던트',
				data: incident_label_cnt,
				borderWidth: 0,
				backgroundColor: 'rgba(11,94,215,0.5)', 
				barThickness: 4
				},{
				label: '이벤트',
				data: event_label_cnt,
				borderWidth: 0,
				backgroundColor: 'rgba(11,94,215,0.2)',
				barThickness: 4
			}],
		},
		options: {
			responsive: false,
			scales: {
				x: { 
					stacked: true,
					grid: {
						display: false
					}
				},
				y: { 
					stacked: true,
				},
			},
			plugins: {
				legend: {
					display: false
				},
			}
		}
	});
}


/**********************************************************
 * 인시던트 리스트 가져오기
 **********************************************************/
function fn_getIncidentList(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/getIcdList'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			var icdListData = "";
			
			$.each(data.IcdList, function(index, list){
				
				icdListData += "<tr>";
				icdListData += "<td>"+(index+1)+"</td>";
				icdListData += "<td>"+list.incident_id+"</td>";
				icdListData += "<td>"+list.incident_level+"</td>";
				icdListData += "<td>"+fn_setDateFormat(list.incident_start_time, 'YYYY-MM-DD HH:mm:SS')+"</td>";
				icdListData += "<td>"+list.container_nm+"</td>";
				icdListData += "<td>"+list.stdnm+"</td>";
				icdListData += "</tr>";
			})
			
			//console.log(icdListData);
			
			$('#icdListbody').html(icdListData);
			
			
		}else{
			fnErrorMsg(failResMsg);
		}
	});
}


/**********************************************************
 * 날짜 YYYY-MM-DD HH:MM:SS 형태로 변환
 **********************************************************/
function fn_setDateFormat(strDate, format){
	var dt = new Date(strDate);
	
	var year = dt.getFullYear();
	var month = fnLpad(String((dt.getMonth()+1)), 2 , "0");
	var date = fnLpad(String(dt.getDate()), 2 , "0");
	var hour = fnLpad(String(dt.getHours()), 2 , "0");
	var min = fnLpad(String(dt.getMinutes()), 2 , "0");
	var seconds = fnLpad(String(dt.getSeconds()), 2 , "0");

	var rtnDt = "";
	
	switch(format){
		case 'YYYY-MM-DD HH:mm:SS':
			rtnDt = year+"-"+month+"-"+date+" "+hour+":"+min+":"+seconds;
			break;
		case 'YYYY-MM-DD':
			rtnDt = year+"-"+month+"-"+date;
			break;
		case 'YYYY.MM.DD':
			rtnDt = year+"."+month+"."+date;
			break;
	}

	return rtnDt;
}


/**********************************************************
 * 서버현황
 **********************************************************/
function fn_getServerStatus(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/serverStat'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			var serverStatData = "";
			var divCls = "";
			var eveCnt = 0;
			var incCnt = 0;
			
			$.each(data.ServerStat, function(index, list){
				
				if(list.idc_name != '기타'){
					serverStatData += '<li>';
					
					if(list.eve_total_cnt == 0){
						divCls = "item off";
					} else{
						if(list.inc_total_cnt > 0){
							divCls = "item danger";
						} else if(list.inc_total_cnt == 0){
							divCls = "item success";
						}
					}
					
					if(list.inc_total_cnt > 0){
						divCls = "item danger";
					} else if(list.eve_total_cnt > 0 && list.inc_total_cnt == 0){
						divCls = "item warning";
					} else{
						divCls = "item success";
					}
					
					serverStatData += '<div class="'+divCls+'">';
					serverStatData += '<p class="tit">'+list.idc_name+'</p>';
					serverStatData += '<p class="con">';
					
					if(list.eve_total_cnt > 0 || list.inc_total_cnt >0){
						serverStatData += '<em>이벤트<b>'+list.eve_total_cnt+'</b></em>';
						serverStatData += '<em>인시던트<b>'+list.inc_total_cnt+'</b></em>';
						
						eveCnt += list.eve_total_cnt;
						incCnt += list.inc_total_cnt;
						
					} else if(list.eve_total_cnt == 0 && list.inc_total_cnt == 0){
						serverStatData += '<em>정상운용중</em>';
					} else{
						serverStatData += '<em>연결안됨</em>';
					}
					
					serverStatData += '</p>';
					serverStatData += '</div>';
					serverStatData += '<br/>';
					serverStatData += '</li>';
				}
			})
			
			$.each(data.ServerStat, function(index, list){
				
				if(list.idc_name == '기타'){
					serverStatData += '<li>';
					
					var etc_inc_total = data.TotcntMap.TotIcdCnt - incCnt;
					var etc_eve_total = data.TotcntMap.TotEvtCnt - eveCnt;
					
					if(etc_inc_total < 0){
						etc_inc_total = etc_inc_total * -1;
					} 
					
					if(etc_eve_total < 0){
						etc_eve_total = etc_eve_total * -1;
					} 
					
					if(etc_inc_total > 0){
						divCls = "item danger";
					} else if(etc_eve_total > 0 && etc_inc_total == 0){
						divCls = "item warning";
					} else{
						divCls = "item success";
					}
					
					serverStatData += '<div class="'+divCls+'">';
					serverStatData += '<p class="tit">'+list.idc_name+'</p>';
					serverStatData += '<p class="con">';
					
					if(etc_eve_total > 0 || etc_inc_total >0){
						serverStatData += '<em>이벤트<b>'+etc_eve_total+'</b></em>';
						serverStatData += '<em>인시던트<b>'+etc_inc_total+'</b></em>';
											
					} else if(etc_eve_total == 0 && etc_inc_total == 0){
						serverStatData += '<em>정상운용중</em>';
					} else{
						serverStatData += '<em>연결안됨</em>';
					}
					
					serverStatData += '</p>';
					serverStatData += '</div>';
					serverStatData += '<br/>';
					serverStatData += '</li>';
				}
			})
			
			//console.log(serverStatData);
			
			$('#serverStat').html(serverStatData); 
			
		}else{
			fnErrorMsg(failResMsg);
		}
	});
}

/**********************************************************
 * 공지사항 리스트 가져오기
 **********************************************************/
function fn_getNoticeList(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/getNoticeList'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			var noticeListData = "";
			
			$.each(data.NoticeList, function(index, list){
				
				noticeListData += '<li v-for="n in 4" class="row" idx="'+list.idx+'">';
				//noticeListData += '<a href="" class="row">';
				noticeListData += '<span>'+list.title+'</span>';
				noticeListData += '<span>'+fn_setDateFormat(list.regist_time, 'YYYY.MM.DD')+'</span>';
				//noticeListData += '</a>';
				noticeListData += '</li>';
			})
			
			//console.log(noticeListData);
			
			$('#noticeList').html(noticeListData);
			
		}else{
			fnErrorMsg(failResMsg);
		}
	});
}


/**********************************************************
 * 작업현황 리스트
 **********************************************************/
function fn_getExpList(){
	
	var today = new Date();
	
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	
	var params = {
		SRVDT : year + "-" + month + "-" + day
	};
	
	fnAjax("<c:url value='/api/dsb/getExpList'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			var expListData = "";
			
			if(data.ExpList.length > 0){
				$.each(data.ExpList, function(index, list){
					expListData += '<td>';
					expListData += list.content;
					expListData += '</td>';
				})				
			} else{
				expListData = '<td class="noData">작업중인 현황이 없습니다.</td>';
			}
						
			//console.log(expListData);
			
			$('#ExpList').html(expListData);
			
		}else{
			fnErrorMsg(failResMsg);
		}
	});
}



</script>

<script>
const ctx1 = document.getElementById('chart1');
const chart1 = new Chart(ctx1, {
	type: 'doughnut',
	data: {
		labels: ['IPC','EPC','etc'],
		datasets: [{
			data: [4, 3, 2],
			backgroundColor: [
				'rgb(0,19,76)',
				'rgba(11,94,215,0.5)',
				'rgba(11,94,215,0.2)'
			],
			borderWidth: 0
		}]
	},
	options: {
		responsive: false,
		cutout: 65,
		plugins: {
			legend: {
				display: false
			},
		}
	}
});

const ctx2 = document.getElementById('chart2');
const chart2 = new Chart(ctx2, {
	type: 'doughnut',
	data: {
		datasets: [{
			data: [40, 16, 8],
			backgroundColor: [
				'rgb(0,19,76)',
				'rgba(11,94,215,0.5)',
				'rgba(11,94,215,0.1)'
			],
			borderWidth: 0
		}]
	},
	options: {
		responsive: false,
		cutout: 65,
		plugins: {
			legend: {
				display: false
			},
		}
	}
});

const ctx3 = document.getElementById('chart3');
const chart3 = new Chart(ctx3, {
	type: 'doughnut',
	data: {
		datasets: [{
			data: [40, 16, 8],
			backgroundColor: [
				'rgb(0,19,76)',
				'rgba(11,94,215,0.5)',
				'rgba(11,94,215,0.1)'
			],
			borderWidth: 0
		}]
	},
	options: {
		responsive: false,
		cutout: 65,
		plugins: {
			legend: {
				display: false
			},
		}
	}
});
	
const ctx5 = document.getElementById('chart5');
const chart5 = new Chart(ctx5, {
	type: 'bar',
	data: {
		labels: ['10-09','10-10','10-11','10-12','10-13','10-14','10-15','10-16','10-17','10-18','10-19','10-20','10-21','10-22','10-23','10-24','10-25','10-26','10-27','10-28','10-29','10-30','10-31','11-01','11-02','11-03','11-04','11-05'],
		datasets: [{
			label: '장애',
			data: [8,5,9,6,3,1,7,10,12,19,3,5,2,3,8,5,9,6,3,1,7,10,12,19,3,5,2,3],
			borderWidth: 0,
			backgroundColor: 'rgb(0,19,76)',
			barThickness: 4
			},{
			label: '인시던트',
			data: [5,9,6,3,1,7,10,12,19,3,5,2,3,8,5,9,6,3,1,7,10,12,19,3,5,2,3,8],
			borderWidth: 0,
			backgroundColor: 'rgba(11,94,215,0.5)',
			barThickness: 4
			},{
			label: '이벤트',
			data: [12,19,3,5,2,3,8,5,9,6,3,1,7,10,12,19,3,5,2,3,8,5,9,6,3,1,7,10],
			borderWidth: 0,
			backgroundColor: 'rgba(11,94,215,0.2)',
			barThickness: 4
		}],
	},
	options: {
		responsive: false,
		scales: {
			x: { 
				stacked: true,
				grid: {
					display: false
				}
			},
			y: { 
				stacked: true,
			},
		},
		plugins: {
			legend: {
				display: false
			},
		}
	}
});
</script>