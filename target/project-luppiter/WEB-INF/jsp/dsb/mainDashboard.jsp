<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/popHeader" />

<!-- CONTENTS -->
<div id="app" class="container">

<section class="section main control">
	
	<h1 class="logo"><a href="<c:url value='/view/dsb/mainDashboard' />"><strong>LUPPITER</strong>통합관제시스템</a></h1>
		
	<div class="panel row">
		<div class="panel fix">
			<div class="map">
				<p class="notify"><span id="dpTime"></span><br>현재 <strong id="icdCntMain"></strong>건의 인시던트 대응중입니다.</p>
				<ul class="area">
					<li class="pin1"><span class="state">목동</span></li>
					<li class="pin2"><span class="state">분당</span></li>
					<li class="pin3"><span class="state">과천</span></li>
					<li class="pin4 on"><span class="state">천안</span></li>
					<li class="pin5 on"><span class="state">청주</span></li>
				</ul>
			</div>
		</div>
		<div class="panel">
			<div class="box">
				<div class="headline">
					<h3 class="mainTitle">점검·인시던트 현황</h3>
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
								<em>총<strong>4</strong>건</em>
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
				</ul>
			</div>
		</div>
	</div>
	
	<div class="panel row fix">
		<div class="box">
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
	
</section>

</div><!--//container-->
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/popFooter" />

<script type="text/javaScript">


$(function(){

	// 초기화
	fnInit();
	
	// 실시간
	setInterval("dpTime()",1000);
	
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
	
	// 점검/인시던트 현황 건수
	fn_getCnt();
	
	//서버현황
	fn_getServerStatus();

	//작업현황 차트
	fn_drawChart();

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
 * 작업현황 차트
 **********************************************************/
function fn_drawChart(){
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
			cutout: 65,
			plugins: {
				legend: {
					display: false
				},
			}
		}
	});
}

//-->
</script>