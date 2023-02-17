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
			<li>인벤토리 및 통계</li>
			<li>매뉴얼 인벤토리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">매뉴얼 인벤토리</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">
	
		<div class="search">

			<div class="box">
				<form>
					<table class="field">
						<tbody>
							<tr>
								<th>검색어</th>
								<td>
									<select class="select md" id="searchType">
										<option value="zone">Zone</option>
										<option value="loc_nm">위치정보</option>
										<option value="datacenter_nm">층/실</option>
										<option value="rack_location">상면정보</option>
										<option value="equip_position">실장위치</option>
										<option value="own_dept_nm">담당운영팀</option>
										<option value="center_nm">센터명</option>
										<option value="equnr">설비번호</option>
										<option value="host_nm">HOST명</option>
										<option value="mgmt_ip">MGMT IP</option>
										<option value="ipmi_ip">IPMI IP</option>
										<option value="std_cd">표준서비스CODE</option>
										<option value="std_nm">표준서비스명</option>
										<option value="e_std_cd">단위서비스CODE</option>
										<option value="e_std_nm">단위서비스명</option>
										<option value="svc_usage">운영/개발</option>
										<option value="platform">플랫폼</option>
										<option value="platform_ver">플랫폼버전</option>
										<option value="os">OS</option>
										<option value="os_ver">OS버전</option>
										<option value="usage">용도</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
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
					</select>
					<i>화면에 표시할 리스트 갯수</i>
				</span>
				<form id="excelForm" action="<c:url value='/api/stt/excelUpload'/>" method="post" enctype="multipart/form-data">
					<input type="file" id="excelInput" name="excelInput">
				</form>					
				<div class="btns">
					<button type="button" class="bt bg secondary" id="btnAdd">추가</button>
					<button type="button" class="bt bg secondary" id="btnDelete">삭제</button>
					<button type="button" class="bt bg secondary" id="btnSave">저장</button>
					<button type="button" class="bt bg secondary" id="btnExcelUpload">엑셀업로드</button>
				</div>

			</div><!--//control-->

			<div class="tui-grid">
				<div id="grid"></div>
			</div>
	
            <!-- PAGING -->
			<div id="divPaging" class="control">

				<span class="count"></span>

				<div class="pages"></div>
			</div><!-- //control -->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>


	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){

	// 초기화
	fnInit();
	
	
	// 엑셀업로드 버튼 클릭이벤트
	$('#btnExcelUpload').click(function(){
		
		if($('#excelInput').val() == ""){
			alert('파일을 선택하세요.');
			return;
		}
		
		let upFile =$('#excelInput')[0];
		
		var frmData = new FormData();
		frmData.append("file", upFile.files[0]);
		
		$.ajax({
			enctype: 'multipart/form-data',
	        type: 'POST',
	        url: "<c:url value='/api/stt/excelUpload'/>",
	        processData: false,   
	        contentType: false,
	        cache: false,
	        data: frmData,
	        beforeSend: function() {
	            //마우스 커서를 로딩 중 커서로 변경
	            $('html').css("cursor", "wait");
	        },
	        complete: function() {
	            //마우스 커서를 원래대로 돌린다
	            $('html').css("cursor", "auto");
	        },
	        success: function(data) {
	            console.log(data);
	            if(data.insertResult == "successed"){
		            	alert("저장되었습니다.");
		            	$("#excelInput").val('');
		            	fnList("1");
		        }
	            else if(data.errMsg != "" && data.errMsg != "undefiend"){
	            	//alert(data.errPos+data.errMsg);
	            	alert(data.errMsg);
	            }
	        },
	        error: function(e) {
	            console.log(e);	            
	            fnErrorMsg("시스템 장애 입니다.\n담당자에게 문의 바랍니다.");
	        }
		});
	});
	
	// 추가버튼 클릭이벤트
	$('#btnAdd').click(function(){ 

		var now = new Date();
		var regdate = now.getFullYear()
					+"-"+fnLpad(String((now.getMonth()+1)), 2, "0")
					+"-"+fnLpad(String(now.getDate()), 2, "0")
					+" "+fnLpad(String(now.getHours()), 2 , "0")
					+":"+fnLpad(String(now.getMinutes()), 2 , "0")
					+":"+fnLpad(String(now.getSeconds()), 2 , "0");
		
		var newRow = {
				cret_dt: regdate,
				cretr_nm: "${loginInfo.user_name}",
				amd_dt: regdate,
				amdr_nm: "${loginInfo.user_name}"
				};
		
		gridObj["grid"].appendRow(newRow);
				
	});
	
	// 이벤트(검색버튼)
	$("#btnSearch").on("click", function(e){
		fnList("1");
	});
	
	// 이벤트(검색초기화버튼)
	$("#btnSearchInit").on("click", function(e){
		$("#searchStr").val("");
	});
	
	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	// 삭제버튼 클릭 이벤트
	$('#btnDelete').click(function(e){
		
		fnStopEvent(e);
		
		var gridCheckdRows = gridObj["grid"].getCheckedRowKeys();

		if(0 < gridCheckdRows.length){
			var delSeq = "";
			var tmpSeq = "";
			var nCnt = 0;
			
			$.each(gridCheckdRows, function(i, item){
				tmpSeq = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "seq"));
				
				if(0 == nCnt){
					delSeq += tmpSeq;
				}else{
					delSeq += ","  + tmpSeq;
				}
				nCnt++;
			});

			if(confirm("선택하신 항목을 삭제하시겠습니까?")){
				var param = { delSeq: delSeq };
		
				fnAjax("<c:url value='/api/stt/delete'/>", param, function(data) {
					
		 			if(data.deleteResult == "successed") {
						alert("삭제되었습니다.");
						fnList("1");
					} else {
						alert("삭제 오류.");
					}
		 		});
					
			}else{
				fnWarnMsg("취소하셨습니다.");
			}
		} else {
			alert("선택된 항목이 없습니다.");
		}
		
	});

	// 저장버튼 클릭 이벤트
	$('#btnSave').click(function(){
		
		gridObj["grid"].focusAt(0, 26);
		
		if(!gridObj["grid"].isModified()){
			alert("추가/수정된 내용이 없습니다.");
			gridObj["grid"].focusAt(0, 0);
			return;
		}
		
		var params = { 
						insertList: JSON.stringify(gridObj["grid"].getModifiedRows().createdRows),
						updateList: JSON.stringify(gridObj["grid"].getModifiedRows().updatedRows)
					};
		
		fnAjax("<c:url value='/api/stt/save'/>", params, function(data) {
			
 			if(data.saveResult == "successed") {
				alert("저장되었습니다.");
				fnList("1");
			} else {
				alert("등록 오류.");
			}
 		});
	});
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(6, 5, 6, 5);
	
	// 초기화(그리드)
	fnInitGrid();
	
	fnList("1");
}


/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
			  {header:'seq', name:'seq', sortable: true, align:'left', width:0}
			, {header:'Zone', name:'zone', sortable: true, align:'left', width:200, editor:'text'}
			, {header:'위치정보', name:'loc_nm', sortable: true, align:'left', width:350, editor:'text'}
			, {header:'층/실', name:'datacenter_nm', sortable: true, align:'left', width:150, editor:'text'}
			, {header:'상면정보', name:'rack_location', sortable: true, align:'left', width:150, editor:'text'}
			, {header:'실장위치', name:'equip_position', sortable: true, align:'left', width:100, editor:'text'}
			, {header:'담당운영팀', name:'own_dept_nm', sortable: true, align:'center', width:200, editor:'text'}
			, {header:'센터명', name:'center_nm', sortable: true, align:'center', width:100, editor:'text'}
			, {header:'설비번호', name:'equnr', sortable: true, align:'center', width:150, editor:'text'}
			, {header:'HOST명', name:'host_nm', sortable: true, align:'left', width:350, editor:'text'}
			, {header:'MGMT IP', name:'mgmt_ip', sortable: true, align:'center', width:200, editor:'text'}
			, {header:'SNMP/IPMI IP주소', name:'ipmi_ip', sortable: true, align:'center', width:200, editor:'text'}
			, {header:'표준서비스CODE', name:'std_cd', sortable: true, align:'center', width:150, editor:'text'}
			, {header:'표준서비스명', name:'std_nm', sortable: true, lign:'center', width:200, editor:'text'}
			, {header:'단위서비스CODE', name:'e_std_cd', sortable: true, align:'center', width:150, editor:'text'}
			, {header:'단위서비스명', name:'e_std_nm', sortable: true, align:'center', width:200, editor:'text'}
			, {header:'운영/개발', name:'svc_usage', sortable: true, align:'center', width:100, editor:'text'}
			, {header:'플랫폼', name:'platform', sortable: true, align:'center', width:150, editor:'text'}
			, {header:'플랫폼버전', name:'platform_ver', sortable: true, align:'center', width:150, editor:'text'}
			, {header:'OS', name:'os', sortable: true, align:'center', width:100, editor:'text'}
			, {header:'OS버전', name:'os_ver', sortable: true, align:'center', width:70, editor:'text'}
			, {header:'용도', name:'usage', sortable: true, align:'center', width:100, editor:'text'}
			, {header:'HW관제대상', name:'hw_yn', align:'center', width:50, editor: { type: 'select', options: { listItems: [ { text: 'Y', value: 'Y' },{ text: 'N', value: 'N' }]}}}
			, {header:'CSW관제대상', name:'csw_yn', align:'center', width:50, editor: { type: 'select', options: { listItems: [ { text: 'Y', value: 'Y' },{ text: 'N', value: 'N' }]}}}
			, {header:'OS관제대상', name:'os_yn', align:'center', width:50, editor: { type: 'select', options: { listItems: [ { text: 'Y', value: 'Y' },{ text: 'N', value: 'N' }]}}}
			, {header:'생성일', name:'cret_dt', sortable: true, align:'center', width:100}
			, {header:'생성자', name:'cretr_nm', sortable: true, align:'center', width:100}
			, {header:'수정일', name:'amd_dt', sortable: true, align:'center', width:100}
			, {header:'수정자', name:'amdr_nm', sortable: true, align:'center', width:100}
	];
	
	// 그리드 생성
	fnDrawGrid("00", "grid", columnsData);
	gridObj["grid"].hideColumn('seq');
}


/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(slcPageNo){
	
	var pageSize = $("#slcPageSize").val();
	var pagingYn = "";
	
	if(pageSize == "전체"){
		pagingYn = "N";
		pageSize = 9999999;
	} else {
		pagingYn = "Y";
	}
	
	var params = {
		pageNo : slcPageNo,
		pageNavi : "5",
		pageSize : pageSize,
		pagingYn : pagingYn,
		searchType : $("#searchType option:selected").val(),
		searchStr : $("#searchStr").val()
	};
    
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/stt/list'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.InventoryList);
						
			// 페이징
			fnPagenation(data.paging, "fnList");

		}else{
			// 경고메세지
			fnWarnMsg(systemErrorMsg);
		}
	});
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

</script>