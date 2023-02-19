<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/popHeader" />

<!-- CONTENTS -->
<div id="app" class="container">

<!-- CONTENTS -->
<section class="section mainOld">
	
	<div class="panel cols">

		<div class="today">
			<p class="notify"><span id="dpTime"></span><br>현재 <strong id="icdCntMain"></strong>건의 인시던트 대응중 입니다.</p>
			<div class="box cols">
				<h3 class="mainTitle">현재 처리중 이벤트<strong id="evtCnt"></strong></h3>
				<div class="box" id="noticeDetail">
					<h4 class="subTitle">Notice</h4>
					<a href="<c:url value='/view/spt/subSupportNotice' />" class="btMore">더보기</a>
					<ul class="latest" id="noticeList">
					</ul>
				</div>
			</div>
		</div><!--//today-->

		<div class="panel">

			<div class="panel fix cols">

				<a id="icdCntLink" class="box situation">
					<h3 class="mainTitle">이상징후</h3>
					<strong class="warning" id="icdCnt"></strong>
				</a>

				<a id="errCntLink" class="box situation">
					<h3 class="mainTitle">장애</h3>
					<strong class="danger" id="errCnt"></strong>
				</a>

				<div class="box situation zabbix">
					<h3 class="mainTitle">수집서버상태</h3>
					<strong class="normal" id="agentStat"></strong>
				</div>

				<div class="box situation working">
					<h3 class="mainTitle">작업현황</h3>
					<ul id="ExpList">
					</ul>
				</div>

			</div>

			<div class="panel">
				<div class="box">

					<h3 class="mainTitle">인시던트목록</h3>
					<div class="grid">
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
			</div>

			<div class="panel fix">
				<div class="box">

					<h3 class="mainTitle">일일 발생 현황</h3>
					<!-- <button type="button" class="btMore">더보기</button> -->

					<div class="graph">
						<canvas id="chart" height="150"></canvas>
					</div>

				</div>
			</div>

		</div>

	</div><!--//panel-->

	<div class="panel fix">
		<div class="box">
			<div class="server">
				<h3 class="mainTitle">서버<br>현황</h3>
				<ul id="serverStat">
				</ul>
			</div>
		</div>
	</div><!--//panel-->

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

</div><!--//container-->
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/popFooter" />

<script type="text/javaScript">

$(function(){

	// 초기화
	fnInit();
	
	// 실시간
	setInterval("dpTime()",1000);
	
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
	
	
	$("#icdCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/icd/subIncidentState' />", {viewType:'00',incidentYn:'Y'});
	});
	
	$("#errCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/icd/subIncidentState' />", {viewType:'00',incidentYn:'N'});
	});
	
});

/**********************************************************
 * 현재시간
 **********************************************************/
function dpTime(){
	var now = new Date();
	
	var year = now.getFullYear();
	var month = fnLpad(String((now.getMonth()+1)), 2 , "0");
	var date = fnLpad(String(now.getDate()), 2 , "0");
    var hours = fnLpad(String(now.getHours()), 2 , "0");
    var minutes = fnLpad(String(now.getMinutes()), 2 , "0");
    var seconds = fnLpad(String(now.getSeconds()), 2 , "0");
    var day = now.getDay();
    var week = ['일', '월', '화', '수', '목', '금', '토'];

	document.getElementById("dpTime").innerHTML = year+"."+month+"."+date+ " " + hours + ":" + minutes + ":" + seconds + " ("+week[day]+"요일)";
}

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 현재 날짜시간요일
	dpTime();
	
	// InitGnbLnb
	fnInitGnbLnb(1, 0, 1, 0);
	
	// 점검/인시던트 현황 건수
	fn_getCnt();
		
	//인시던트 리스트
	fn_getIncidentList();
	
	//공지사항
	fn_getNoticeList();

	//작업현황
	fn_getExpList();
	
	//서버현황
	fn_getServerStatus();
	
	//일일발생현황 차트
	fn_getChart();
	
	//수집서버상태
	fn_getAgentStat();
	
	//30초마다 새로고침
//  	setInterval(function(){
// 		location.reload();
// 	}, 30000); 
	
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
			
			$("#icdCntMain").text(data.cntMap.TotIcdCnt);
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
			
	        chartLabels.push(fnLpad(String(cDate.getMonth()+1), 2, "0")+"-"+fnLpad(String(cDate.getDate()), 2, "0"));
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

	const ctx = document.getElementById('chart');
	const chart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: chartLabels,
			datasets: [
				{
				label: '이벤트',
				data: event_label_cnt,
				borderWidth: 0,
				backgroundColor: '#FFC107',
				},{
				label: '인시던트',
				data: incident_label_cnt,
				borderWidth: 0,
				backgroundColor: '#FE0004',
				}
			]
		},
		options: {
			scales: {
			  x: { stacked: true, },
			  y: { stacked: true, },
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
					
					if(list.eve_total_cnt == 0){
						divCls = "";
					} else{
						if(list.inc_total_cnt > 0){
							divCls = "danger";
						} else if(list.inc_total_cnt == 0){
							divCls = "success";
						}
					}
					
					if(list.inc_total_cnt > 0){
						divCls = "danger";
					} else if(list.eve_total_cnt > 0 && list.inc_total_cnt == 0){
						divCls = "warning";
					} else{
						divCls = "success";
					}
					
					serverStatData += '<li class="'+divCls+'">';
					serverStatData += '<h4 class="subTitle">'+list.idc_name+'</h4>';
					serverStatData += '<p>';
					
					if(list.eve_total_cnt > 0 || list.inc_total_cnt >0){
						serverStatData += '<b>조치중</b>';
						serverStatData += '이벤트 : '+list.eve_total_cnt+'<br>';
						serverStatData += '인시던트 : '+list.inc_total_cnt;
						
						eveCnt += list.eve_total_cnt;
						incCnt += list.inc_total_cnt;
						
					} else if(list.eve_total_cnt == 0 && list.inc_total_cnt == 0){
						serverStatData += '정상운용중';
					} else{
						serverStatData += '연결안됨';
					}
					
					serverStatData += '</p>';
					serverStatData += '</li>';
				}
			})
			
			$.each(data.ServerStat, function(index, list){
				
				if(list.idc_name == '기타'){
					
					var etc_inc_total = data.TotcntMap.TotIcdCnt - incCnt;
					var etc_eve_total = data.TotcntMap.TotEvtCnt - eveCnt;
					
					if(etc_inc_total < 0){
						etc_inc_total = etc_inc_total * -1;
					} 
					
					if(etc_eve_total < 0){
						etc_eve_total = etc_eve_total * -1;
					} 
					
					if(etc_inc_total > 0){
						divCls = "danger";
					} else if(etc_eve_total > 0 && etc_inc_total == 0){
						divCls = "warning";
					} else{
						divCls = "success";
					}
					
					serverStatData += '<li class="'+divCls+'">';
					serverStatData += '<h4 class="subTitle">'+list.idc_name+'</h4>';
					serverStatData += '<p>';
					
					if(etc_eve_total > 0 || etc_inc_total >0){
						serverStatData += '<b>조치중</b>';
						serverStatData += '이벤트 : '+etc_eve_total+'<br>';
						serverStatData += '인시던트 : '+etc_inc_total;
											
					} else if(etc_eve_total == 0 && etc_inc_total == 0){
						serverStatData += '정상운용중';
					} else{
						serverStatData += '연결안됨';
					}
					
					serverStatData += '</p>';
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
				
				noticeListData += '<li v-for="n in 4" idx="'+list.idx+'">';
				noticeListData += list.title;
				noticeListData += '<em>'+fn_setDateFormat(list.regist_time, 'YYYY.MM.DD')+'</em>';
				noticeListData += '</li>';
			});
		
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
					expListData += '<li>';
					expListData += list.content;
					expListData += '</li>';
				})				
			} else{
				expListData = '<li class="noData">작업중인 현황이 없습니다.</li>';
			}
			
			//console.log(expListData);
			
			$('#ExpList').html(expListData);
			
		}else{
			fnErrorMsg(failResMsg);
		}
	});
}

/**********************************************************
 * 수집서버상태
 **********************************************************/
function fn_getAgentStat(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/getAgentStat'/>", params, function(data) {
		
		if(data.agentStat == "error"){
			$('#agentStat').text("연결이상");
		}
		else{
			$('#agentStat').text("정상");
		}
	});
}
</script>