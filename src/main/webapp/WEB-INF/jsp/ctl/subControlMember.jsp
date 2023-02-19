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
			<li>관제운영관리</li>
			<li>사용자 관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">사용자 관리</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="search">

			<div class="box">
				<form>
					<table class="field">
						<tbody>
							<tr>
								<th>사용권한</th>
								<td>
									<select class="select md" id="userGroup">
										<option value="" selected>전체</option>
										<option value="관리자">관리자</option>
										<option value="운용관제자">운용관제자</option>
										<option value="사용자">사용자</option>
										<option value="승인대기">승인대기</option>
									</select>
								</td>
								<th>검색어</th>
								<td>
									<select class="select md" id="searchType">
										<option value="userId">사용자ID</option>
										<option value="userName">사용자명</option>
										<option value="userDepart">소속</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력" id="keyword">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary" id="btnSearch">검색</button>
					<!--button type="button" class="bt bg">초기화</button-->
					<button type="button" class="btRefresh" title="초기화">초기화</button>
				</div>
			</div>

		</div><!--//search-->

		<div class="result">

			<div class="control">

				<span class="count">
					<select class="select sm" id="slcPageSize" name="pageSize">
						<option>25</option>
						<option>50</option>
						<option>75</option>
						<option>100</option>
						<option>200</option>
						<option>300</option>
					</select>
					<i>화면에 표시할 리스트 갯수</i>
				</span>

				<div class="btns">
					<button type="button" class="bt bg secondary disabledUser" id="test-bt-popup1">사용자추가</button>
				</div>

			
			</div><!--//control-->
			
			<!-- GRID -->
			<!--<div class="tui-grid" id="grid"></div>-->
			<div class="tui-grid">
				<div id="grid"></div>
			</div>
			
			<!-- 
				<table>
					<thead>
						<tr>
							<th class="range"><span>사용자ID</span></th>
							<th class="range"><span>사용자명</span></th>
							<th class="range"><span>소속</span></th>
							<th class="range"><span>사용권한</span></th>
							<th class="range"><span>변경</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 10">
							<td>82253220</td>
							<td>홍길동</td>
							<td>KT</td>
							<td>
								<select class="select md">
									<option>권한1</option>
									<option>권한2</option>
								</select>
							</td>
							<td>
								<button type="button" class="bt bd primary">수정</button>
								<button type="button" class="bt bd">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!--//grid-->
			

            <!-- PAGING -->
			<div id="divPaging" class="control">

				<span class="count"></span>

				<div class="pages"></div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>




<!-- [팝업] 사용자추가 -->
<article class="popup hide" id="test-popup1">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">사용자추가</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>사용자ID</th>
						<td>
						<input type="text" class="input xl" value="" id="popUserId">
						<button class="bt bg secondary" type="button" id="idCheck" value="N">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>사용자명</th>
						<td><input type="text" class="input" value="" id="popUserName"></td>
					</tr>
					<tr>
						<th>소속</th>
						<td><input type="text" class="input" value="" id="popUserDepart"></td>
					</tr>
					<tr>
						<th>사용권한</th>
						<td>
							<select class="select" id="popUserGroup">
								<option value="" selected>선택</option>
								<option value="관리자">관리자</option>
								<option value="운용관제자">운용관제자</option>
								<option value="사용자">사용자</option>
								<option value="승인대기">승인대기</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd btClose" id="btnCancleAndClose">취소</button>
				<button type="button" class="bt max bg primary" id="btnSave">저장</button>
			</div>
		</div>

	</div>
</article>	



<!-- [팝업] 사용자수정-->

<article class="popup hide" id="test-popup2">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">사용자수정</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>사용자ID</th>
						<td>
						<input type="text" class="input xl" value="" id="updUserId">
						</td>
					</tr>
					<tr>
						<th>사용자명</th>
						<td><input type="text" class="input" value="" id="updUserName"></td>
					</tr>
					<tr>
						<th>소속</th>
						<td><input type="text" class="input" value="" id="updUserDepart"></td>
					</tr>
					<tr>
						<th>사용권한</th>
						<td>
							<select class="select" id="updUserGroup">
								<option value="" selected>선택</option>
								<option value="관리자">관리자</option>
								<option value="운용관제자">운용관제자</option>
								<option value="사용자">사용자</option>
								<option value="승인대기">승인대기</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd btClose" id="updCancleAndClose">취소</button>
				<button type="button" class="bt max bg primary" id="updSave">저장</button>
			</div>
		</div>

	</div>
</article>	

	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){  // === $(document).ready
	// 초기화
	fnInit();
	
	
	// 엔터키 검색 시 refresh 되는것 막기
	$('form').submit(function(e){
		fnStopEvent(e);
		e.preventDefault();
	});
	
	
	// 사용자 추가
	$("#test-bt-popup1").on("click", function(e){
		fnStopEvent(e);
		$("#popUserId").prop("disabled", false);
		$("#popUserId").val("");
		$("#popUserName").val("");
		$("#popUserDepart").val("");
		$("#popUserGroup").val("");
		$('#test-popup1').removeClass('hide');		
	});
	

	// 검색 조건 입력 후 조회
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	
 	// 엔터 키로 검색
    $("#keyword").on("keyup", function(e) {
    	fnStopEvent(e);
    	console.log(e.key);
         if($("#keyword :focus") && e.key == "Enter"){
			$("#btnSearch").click();
        }
    });


	// 검색 조건 초기화
	$(".btRefresh").on("click", function(e){
		fnStopEvent(e);
		$("#keyword").val("");
		$("#searchType option:eq(0)").prop("selected", true); 
		$("#userGroup").val("");
	});

	
	// 사용자 수정
	$(document).on("click", ".user-update", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("user-update cell==>" + cell.rowKey);
		var updUserData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updUserData));
		
		$("#updUserId").val(updUserData.user_id);
		$("#updUserId").prop("disabled", true);
		$("#updUserName").val(updUserData.user_name);
		$("#updUserDepart").val(updUserData.user_depart);
		$("#updUserGroup").val(updUserData.user_group);
		$('#test-popup2').removeClass('hide');	
		
	});
		

	// 사용자 수정 팝업에서 저장 버튼 클릭
	$("#updSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
			var param = {
					updUserId : $("#updUserId").val()
				  , updUserName : $("#updUserName").val()
				  , updUserDepart : $("#updUserDepart").val()	
				  , updUserGroup : $("#updUserGroup").val()
			}
			
			console.log(param);
			
			fnAjax("<c:url value='/api/ctl/update'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("사용자 정보가 수정되었습니다.");
					// 리스트 새로고침
					fnList("1");
					$(".btClose").click();
				} else {
					alert("사용자 정보 수정에 실패했습니다.");
				}
			});
				
	});
	
		
	// 사용자 삭제
	$(document).on("click", ".user-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("user-delete cell==>" + cell.rowKey);	
		var user_id = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "user_id"));
		console.log("del user_id==>" + user_id);	
		
		var param = {
				delUserId : user_id
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/ctl/delete'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("사용자 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("사용자 삭제에 실패했습니다.");
				}
			});
	    }
	});
	
	
	// 사용자 추가 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		// input data null체크 진행
		if(fnPopNullCheck() == false) {
			$("#popUserId").focus();
			return;
		};
		
		// ID 중복체크 진행 여부 확인
		let idCheckVal = $("#idCheck").val();	
		
		if(idCheckVal == "N") {
			
			alert("사용자ID 중복체크는 필수사항입니다.");
			
		} else if(idCheckVal == "Y") {
			
			var param = {
					popUserId : $("#popUserId").val()
				  , popUserName : $("#popUserName").val()
				  , popUserDepart : $("#popUserDepart").val()	
				  , popUserGroup : $("#popUserGroup").val()
			}
			
			console.log(param);
			
			fnAjax("<c:url value='/api/ctl/add'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("사용자가 추가되었습니다.");
					// 리스트 새로고침
					fnList("1");
					$(".btClose").click();
					$("#popUserId").attr("disabled", false);
				} else {
					alert("사용자 추가에 실패했습니다.");
				}
			});
		}
				
	});
	
	
	// 사용자 추가 팝업에서 중복확인 버튼 클릭
	$("#idCheck").on("click", function(e){
		fnStopEvent(e);
		
		if(fnValidatorRequir("사용자ID", "popUserId", "popUserId", "사용자ID를 입력해주세요.") == true) {
			return;
		} else {
			$.ajax({
				url : "/api/ctl/check",
				type : "post",
				dataType : "json",
				data : {regUserId : $("#popUserId").val()},
				success : function(data){
					
					let idCheckResult = data.idCheckResult;
					console.log(idCheckResult);
					
					if (idCheckResult == "disable") {
						alert("중복된 사용자ID가 존재합니다. 사용자ID를 확인해주세요.");
					} else if (idCheckResult == "able") {
						$("#idCheck").attr("value", "Y");
						$("#popUserId").prop("disabled", true);
						alert("사용 가능한 사용자ID입니다.");
					}
					
					let idCheckVal = $("#idCheck").val();
					if(idCheckVal == "N") {
						alert("사용자ID 중복체크는 필수사항입니다.");
					} else if(idCheckVal == "Y") {
						
					}
					
				} 
			
			});
		}

	});
	
	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
});


/********************************************************** 
 * 사용자 추가 팝업 내부 null check
 **********************************************************/
 
function fnPopNullCheck(){
	
	if ($("#popUserName").val() == "" || $("#popUserName").val() == null || $("#popUserName").val() == undefined) {
		alert("사용자명을 입력해주세요.");
		return false;
	} else if ($("#popUserDepart").val() == "" || $("#popUserDepart").val() == null || $("#popUserDepart").val() == undefined) {
		alert("소속을 입력해주세요.");
		return false;
	} else if ($("#popUserGroup").val() == "" || $("#popUserGroup").val() == null || $("#popUserGroup").val() == undefined) {
		alert("사용권한을 선택해주세요.");
		return false;
	}
	
}


/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(2, 1, 2, 1);
	
	// 그리드 초기화
	fnInitGrid();
	
	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
	// 팝업화면 초기화
	//fnInitPopup();
	
	if("사용자" != loginUserGroup){
		$(".user-update").prop('disabled', false);
		$(".user-delete").prop('disabled', false);
		$("#test-bt-popup1").prop('disabled', false);
	} else {
		$(".user-update").prop('disabled', true);
		$(".user-delete").prop('disabled', true);
		//$("#test-bt-popup1").prop('disabled', false);
	}
}


/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){
	
	// 그리드 컬럼 정보
	var columnsData = [
		  {header:'사용자ID', name:'user_id', sortable:true, filter:'select', align:'center'}
		, {header:'사용자명', name:'user_name', sortable:true, filter:'select', align:'center'}
		, {header:'소속', name:'user_depart', sortable:true, filter:'select', align:'center'}
        , {header:'사용권한', name:'user_group', sortable:true, filter:'select', align:'center'}		    
		, {header:'변경', name:'btn_upd_del', align:'center'}
	];
	
	// 그리드 생성
	fnDrawGrid("00", "grid", columnsData);
	gridObj["grid"].hideColumn('_checked');
	
}


 /**********************************************************
  * 리스트(그리드) 조회
  **********************************************************/
function fnList(slcPageNo){
	 
	 // 파라미터 설정
	 var params = {
			 pageSize : $("#slcPageSize").val(),
			 pageNavi : "5",
			 pageNo : slcPageNo, 
			 keyword : $("#keyword").val(),
			 searchType : $("#searchType").val(),
			 userGroup : $("#userGroup").val()
	 };
	 console.log(params);
	 
	 // 그리드에 뿌려질 리스트 조회
	 fnAjax("<c:url value='/api/ctl/list'/>", params, function(data){
		 
		 if(successResCode = data.resCode){ //조회성공
			 
			// SET 리스트전체건수
			$("#listTotalCount").val(data.total_count);
		 	
		 	// RESET DATA(그리드에 데이터 입력)
		 	gridObj["grid"].resetData(data.list);
		 	//사용자일때 수정삭제 컬럼 hide
		 	if(loginUserGroup == "사용자"){
		 		gridObj["grid"].hideColumn('btn_upd_del');
		 	}
		 	// 페이징
			fnPagenation(data.paging, "fnList");

		 } else { //조회실패
			// 경고메세지
			fnErrorMsg(failResMsg);
		 }
	 })
	 
 }

</script>