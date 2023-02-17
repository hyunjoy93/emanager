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
			<li>Support</li>
			<li>VOC</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">VOC</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="search">

			<div class="box">
				<form>
					<table class="field">
						<tbody>
							<tr>
								<th>구분</th>
								<td>
									<select class="select lg" id="ctgryTypeCdGroup">
										<option value="" selected>전체</option>
										<option value="V01">개선요청</option>
										<option value="V02">결함개선</option>
										<option value="V03">결함수정</option>
									</select>
								</td>
								<th>상태</th>
								<td>
									<select class="select md" id="ansYn">
										<option value="">전체</option>
										<option value="N">답변대기</option>
										<option value="Y">답변완료</option>
									</select>
								</td>
								<th>검색어</th>
								<td>
									<select class="select md" id="searchType">
										<option value="title">제목</option>
										<option value="creUser">작성자</option>
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
						<option>전체</option>
					</select>
				</span>

				<div class="btns">
					<button type="button" class="bt bg secondary" id="regVoc">질문등록</button>
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




<!-- [팝업] 질문등록 -->
<article class="popup hide" id="vocPopupRegist">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="regPopTitle">VOC 질문등록</h5>
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
						<th>구분</th>
						<td colspan="3">
							<select class="select lg" id="ctgryId">
								<option value="" selected>선택</option>
								<option value="V01">개선요청</option>
								<option value="V02">결함개선</option>
								<option value="V03">결함수정</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" class="input" id="regTitle"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="regDt"></td>
						<th>작성자</th>
						<td id="regNm"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea class="textarea" placeholder="" id="regContent"></textarea></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd" id="btnRegCancel">취소</button>
				<button type="button" class="bt max bg primary" id="btnRegVoc" data-mode="regist">저장</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 등록 -->




<!-- [팝업] 상세 -->
<article class="popup hide" id="vocPopupDetail">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">VOC 상세</h5>
			<button type="button" class="btClose" id="btnCancelReply"><i>닫기</i></button>
		</div>

		<div class="conBody" style="overflow:auto" id="popDetailBody">
			<input type="hidden" id="txn_id" />
			<table class="field" style="word-break:break-all; table-layout:fixed;">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<td id="vocCtgry"></td>
						<th>상태</th>
						<td><span id="vocAnsYn"></span></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="vocDt"></td>
						<th>작성자</th>
						<td id="vocUser"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3" id="vocTitle"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" id="vocContent" style="white-space: pre;"></td>
					</tr>
				</tbody>
			</table>
			
			<!-- 답변상세 -->
			<table class="field hide" id="ansDetail" style="word-break:break-all; table-layout:fixed;">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr>
						<th>답변일</th>
						<td id="ansDt"></td>
						<th>답변자</th>
						<td id="ansNm"></td>
					</tr>
					<tr>
						<th>답변내용</th>
						<td colspan="3" id="ansContent" style="white-space: pre;"></td>
					</tr>
				</tbody>
			</table>
			
			<!-- 답변입력 -->
			<table class="field hide" id="ansForm">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr>
						<th>답변일</th>
						<td id="regAnsDt"></td>
						<th>답변자</th>
						<td id="regAnsNm"></td>
					</tr>
					<tr>
						<th>답변내용</th>
						<td colspan="3"><textarea class="textarea" placeholder="" id="regAnsContent"></textarea></td>
					</tr>
				</tbody>
			</table>
			
			<!-- 댓글입력 -->
			<div class="hide" id="replForm" style="margin: 15px 10px 15px;">
				<textarea class="textarea" style="height: 60px;" cols="5" placeholder="댓글입력" id="replSbst"></textarea>
				<span class="count" id="replInputCnt"><b>0</b><i>/</i>300</span>
				<button type="button" class="bt bg secondary" style='float: right; margin-top: 5px;' id="btnReplSave">저장</button>
			</div>
			
			<!-- 댓글목록 -->
			<div>
				<table class="field" id="replListTbl">
					<tbody id="replList">
					</tbody>
				</table>
			</div>

		</div><!--//conBody-->

		<div class="conFoot" id="footBtn">
			<div class="btns">
				<button type="button" class="bt max bd secondary disabledUser" id="btnAns" data-mode="regist">답변등록</button>
			</div>
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnClose">확인</button>
			</div>
		</div>
		<div class="conFoot hide" id="footBtn2">
			<div class="btns">
				<button type="button" id="btnCancelAns" class="bt max bg">취소</button>
				<button type="button" id="btnSaveAns" class="bt max bg primary">저장</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 상세 -->
  
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">

$(function(){

	// 초기화
	fnInit();
	
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
	
	// 질문등록 버튼 클릭 이벤트
	$('#regVoc').click(function(){
		
		var today = new Date();
		var regdate = today.getFullYear()
					+"-"+fnLpad(String((today.getMonth()+1)), 2, "0")
					+"-"+fnLpad(String(today.getDate()), 2, "0"); 

		$('#regDt').text(regdate);
		$('#regNm').text(loginUserName);
		
		$('#ctgryId').val("");		
		$('#vocAnsYn').removeClass();
		$('#vocAnsYn').text("");
		$('#txn_id').val("");
		$('#regTitle').val("");
		$('#regContent').val("");
		
		// 팝업타이틀 VOC 질문 등록으로 변경
		$('#regPopTitle').text('VOC 질문등록');
		// 수정완료버튼 => 저장으로 변경
		$('#btnRegVoc').text('저장');
		$('#btnRegVoc').data("mode","regist");
		
		$('#vocPopupRegist').removeClass('hide');
	});
	
	// 등록팝업 저장버튼 클릭 이벤트
	$('#btnRegVoc').click(function(){
		
		if(fnVocValChk()){
			var params = { 
					title: $('#regTitle').val(),
					content: $('#regContent').val(),
					ctgryType: $('#ctgryId').val()
			};
			
			if($('#btnRegVoc').data("mode") == "regist"){
				
				// VOC 등록
		 		fnAjax("<c:url value='/api/spt/registVoc'/>", params, function(data) {
		
		 			if(data.insertResult == "successed") {
						alert("등록되었습니다.");
						fnList("1");
					} else {
						alert("등록 오류.");
					}
					$('#vocPopupRegist').addClass('hide');
		 		});
			}
			else{
				// 파라미터에 idx값 추가
				params.txnId = $('#txn_id').val();
								
			 	// 공지사항 수정
		 		fnAjax("<c:url value='/api/spt/updateVoc'/>", params, function(data) {
		
		 			if(data.updateResult == "successed") {
						alert("수정되었습니다.");
						fnList("1");
					} else {
						alert("수정 오류.");
					}
					$('#vocPopupRegist').addClass('hide');
		 		}); 
			}
		}
	});
	
	// 상세팝업
 	$(document).on("dblclick", "#grid .tui-grid-table tbody tr td", function(){
 				
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();
 		
 		let id = gridObj["grid"].getValue(cell.rowKey, "bbs_txn_id", true);

		fnVocDetail(id);
		
		// 레이어팝업 보여줌
		$('#vocPopupDetail').removeClass('hide');
		// 스크롤 위치 초기화
		$("#popDetailBody").scrollTop(0);
	}); 
	
	// 수정
	$(document).on("click", ".user-update", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		//console.log("user-update cell==>" + cell.rowKey);
		var id = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "bbs_txn_id"));
		
		var param = { txn_id : id };
		
		fnAjax("<c:url value='/api/spt/vocDetail'/>", param, function(data) {
			
			if(successResCode == data.resCode){
 				
 				$('#ctgryId').val(data.vocDetail.ctgry_type_cd);
 				$('#txn_id').val(data.vocDetail.bbs_txn_id);
				$('#regTitle').val(data.vocDetail.pstng_title_nm);
				$('#regDt').text(data.vocDetail.cret_dt);
				$('#regNm').text(data.vocDetail.cret_nm);
				$('#regContent').val(data.vocDetail.pstng_sbst);
 			}
 		});

		// 팝업타이틀 VOC 질문 등록 => 수정으로 변경
		$('#regPopTitle').text('VOC 질문수정');
		// 저장버튼 => 수정완료로 변경
		$('#btnRegVoc').text('수정완료');
		$('#btnRegVoc').data("mode","update");
		
		// 레이어팝업 보여줌
		$('#vocPopupRegist').removeClass('hide');
	});
	
	// 삭제
	$(document).on("click", ".user-delete", function(e){
		fnStopEvent(e);
		
		var confirmDel = confirm("선택하신 VOC를 '삭제'하시겠습니까?");
		
		if(confirmDel){
			var cell = gridObj["grid"].getFocusedCell();
			//console.log("user-delete cell==>" + cell.rowKey);	
			var id = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "bbs_txn_id"));
			
			var param = { txn_id : id };
			
			fnAjax("<c:url value='/api/spt/deleteVoc'/>", param, function(data) {

				if(data.deleteResult == "successed"){
					alert("삭제되었습니다.");
					fnList("1");
				} else {
					alert("삭제 오류.");
				}
	 		});
		}
		else{
			return;
		}
	});
	
	// 답변작성 버튼 클릭
	$('#btnAns').click(function(){
		
		if($('#btnAns').data("mode") == "toUpdate"){
			$('#regAnsContent').val($('#ansContent').text());
			$('#ansDetail').addClass('hide');
			$('#replForm').addClass('hide');
		}

		var today = new Date();
		var ansdate = today.getFullYear()
						+"-"+fnLpad(String((today.getMonth()+1)), 2, "0")
						+"-"+fnLpad(String(today.getDate()), 2, "0"); 

		$('#regAnsDt').text(ansdate);
		$('#regAnsNm').text("${loginInfo.user_name}");

		$('#ansForm').removeClass('hide');
		
		$('#footBtn').addClass('hide');
		$('#footBtn2').removeClass('hide'); 
	});
	
	
	// 답변 저장 버튼 클릭
	$('#btnSaveAns').click(function(){
		
		if($('#regAnsContent').val() == ''){
			alert("내용을 입력해주세요.");
			$('#regAnsContent').focus();
			return false;
		}
		
		var params = {
				ansYn : "Y",
				txnId : $('#txn_id').val(),
				regAnsContent : $('#regAnsContent').val()
		}
		
		fnAjax("<c:url value='/api/spt/updateAns'/>", params, function(data) {
			
 			if(data.insertResult == "successed") {
				alert("등록되었습니다.");
				fnList("1");
				$('#regAnsContent').val('');
				$('#ansForm').addClass('hide');
				$('#footBtn').removeClass('hide');
				$('#footBtn2').addClass('hide');
				fnVocDetail($('#txn_id').val());
			} else {
				alert("등록 오류.");
			}
 		});
	});
	
	
	// 답변취소 버튼 클릭
	$('#btnRegCancel, #btnCancelAns').click(function(){
		$('#regAnsContent').val('');
		$('#ansForm').addClass('hide');
		$('#footBtn').removeClass('hide');
		$('#footBtn2').addClass('hide'); 
		$(".btClose").click();
	});
	
	$('#btnCancelReply').click(function(){
		$('#regAnsContent').val('');
		$('#ansForm').addClass('hide');
		$('#footBtn').removeClass('hide');
		$('#footBtn2').addClass('hide'); 
	});
	
	$('#btnClose').click(function(){
		$(".btClose").click();
	});
	
	

	// 댓글내용 입력시 글자수 count
	$('#replSbst').on('keyup', function() {
		
        $('#replInputCnt').html("<b>"+$(this).val().length+"</b><i>/</i>300");

        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('#replInputCnt').html("<b>300</b><i>/</i>300");
        }
    });
	
	//댓글 저장버튼 클릭
	$('#btnReplSave').click(function(){
		
		var params = {
				txnId : $('#txn_id').val(),
				replSbst : $('#replSbst').val()
		}
		
		fnAjax("<c:url value='/api/spt/insertRepl'/>", params, function(data) {
			
 			if(data.insertResult == "successed") {
				alert("등록되었습니다.");
				$('#replSbst').val('');
				 $('#replInputCnt').html("<b>0</b><i>/</i>300");
				fnVocDetail($('#txn_id').val());
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
	fnInitGnbLnb(7, 1, 7, 1);
	
	// 초기화(그리드)
	fnInitGrid();
	
	// 공통
	fnCommon();
	
	// 리스트(그리드) 조회
	fnList("1");
}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
			  {header:'구분', name:'ctgry_type_nm', sortable: true, align:'center', width:150}
			, {header:'제목', name:'pstng_title_nm', sortable: true, align:'left'}
			, {header:'작성자', name:'cret_user_nm', sortable: true, align:'center', width:150}
			, {header:'등록일자', name:'cret_dt', sortable: true, align:'center', width:200}
			, {header:'상태', name:'repl_yn', sortable: true, align:'center', width:150}
			, {header:'변경', name:'btn_upd_del', align:'center', width:350}
	];
	
	// 그리드 생성
	fnDrawGrid("03", "grid", columnsData);
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
		ctgryTypeCdGroup : $("#ctgryTypeCdGroup").val(),
		ansYn: $('#ansYn').val(),
		searchType : $("#searchType option:selected").val(),
		searchStr : $("#searchStr").val()
	};
	
    
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/spt/vocList'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.VocList);
			
			// 페이징
			fnPagenation(data.paging, "fnList");

		}else{
			// 경고메세지
			fnWarnMsg(systemErrorMsg);
		}
	});
}

/**********************************************************
 * 바이트 수 반환
 **********************************************************/
function byteCheck(el){
    var codeByte = 0;
    for (var idx = 0; idx < el.length; idx++) {
        var oneChar = escape(el.charAt(idx));
        if ( oneChar.length == 1 ) {
            codeByte ++;
        } else if (oneChar.indexOf("%u") != -1) {
            codeByte += 2;
        } else if (oneChar.indexOf("%") != -1) {
            codeByte ++;
        }
    }
    return codeByte;
}

/**********************************************************
 * VOC 등록/수정 유효성 체크
 **********************************************************/
function fnVocValChk(){
	
	if($('#ctgryId').val() == ''){
		alert("구분을 선택해주세요.");
		$('#ctgryId').focus();
		return false;
	}
	
	if($('#regTitle').val() == ''){
		alert("제목을 입력해주세요.");
		$('#regTitle').focus();
		return false;
	}
	var strByte = byteCheck($('#regTitle').val());
	
	if(strByte > 200){
		alert("제목은 200Byte 이하만 가능합니다.");
		$('#regTitle').focus();
		return false;
	}
	
	if($('#regContent').val() == ''){
		alert("내용을 입력해주세요.");
		$('#regContent').focus();
		return false;
	}
	return true;
}

/**********************************************************
 * VOC 상세조회
 **********************************************************/
function fnVocDetail(id){
	
	var loginUser = "${loginInfo.user_id}";
	
	let param = { txn_id : id }

	// id로 상세내역 조회		
	fnAjax("<c:url value='/api/spt/vocDetail'/>", param, function(data) {

		if(successResCode == data.resCode){
			
			$('#vocCtgry').text(data.vocDetail.ctgry_type_nm);
			$('#txn_id').val(data.vocDetail.bbs_txn_id);
			$('#vocTitle').text(data.vocDetail.pstng_title_nm);
			$('#vocDt').text(data.vocDetail.cret_dt);
			$('#vocUser').text(data.vocDetail.cret_nm);
			$('#vocContent').text(data.vocDetail.pstng_sbst);
		
			if(data.vocDetail.ans_cmplt_yn == "N"){
				$('#vocAnsYn').addClass("state");
				$('#vocAnsYn').text("답변대기");
				$('#btnAns').removeClass('hide');
				
				$('#ansDt').text('');
				$('#ansNm').text('');
				$('#ansContent').text('');
				$('#ansDetail').addClass('hide');
				$('#btnAns').text('답변등록');
				$('#btnAns').data("mode","regist");
				
				$('#replForm').addClass('hide');
			}
			else{
				$('#vocAnsYn').addClass("state ok");
				$('#vocAnsYn').text("답변완료");
				
				$('#ansDt').text(data.vocDetail.ans_dt);
				$('#ansNm').text(data.vocDetail.ans_nm);
				$('#ansContent').text(data.vocDetail.answer);
				$('#ansDetail').removeClass('hide');
				
				$('#replSbst').val('');
				$('#replInputCnt').html("<b>0</b><i>/</i>300");
				$('#replForm').removeClass('hide');

				if(data.vocDetail.reql_cnt > 0){
					$('#btnAns').addClass('hide');
					fngetRepl(id);
				}
				else{
					if(data.vocDetail.ans_id == loginUser){
						$('#btnAns').removeClass('hide');
						$('#btnAns').text('답변수정');
						$('#btnAns').data("mode","toUpdate");	
					}
					else{
						$('#btnAns').addClass('hide');
					}
				}
			}

			$('#replList').html('');
			$('#replListTbl').addClass('hide');
		}
	});
}

/**********************************************************
 * VOC 답변 댓글 조회
 **********************************************************/
function fngetRepl(id){
	
	var loginUser = "${loginInfo.user_id}";
	var param = { txnId : id };

	fnAjax("<c:url value='/api/spt/getreplyList'/>", param, function(data) {
		
		if(successResCode == data.resCode){
			
			if(data.replyList.length > 0){			
				
				var replyListData = "";
				
				$.each(data.replyList, function(index, list){

					replyListData += "<tr>";
					replyListData += "<td>";
					replyListData += "<div>";
					replyListData += "<span style='white-space: pre;'>"+list.repl_sbst+"</span>";
					replyListData += "<br>";
					replyListData += "<span>"+list.cretr_nm+" | "+list.cret_dt+"</span>";
					
					if(list.cretr_id == loginUser){
						replyListData += "<button type='button' class='bt bg secondary' style='float: right;' onclick='fnDelRepl("+list.bbs_txn_id+","+list.bbs_repl_id+")'>삭제</button>";
					}	
					replyListData += "</div>";
					replyListData += "</td>";
					replyListData += "</tr>";
				});

				//console.log(replyListData);
				
				$('#replList').html(replyListData);
				$('#replListTbl').removeClass('hide');
			}
		}
		else{
			fnErrorMsg(failResMsg);
		}
	});
	
}	

/**********************************************************
 * VOC 답변 댓글 삭제
 **********************************************************/
function fnDelRepl(txnId, replId){
	
	var confirmDel = confirm("선택하신 댓글을 삭제하시겠습니까?");
	
	if(confirmDel){
		var param = { replId : replId };
		
		fnAjax("<c:url value='/api/spt/deleteRepl'/>", param, function(data) {
			
			if(data.deleteResult == "successed") {
				alert("삭제되었습니다.");
				$('#replSbst').val('');
				$('#replInputCnt').html("<b>0</b><i>/</i>300");
				fnVocDetail(txnId);
			} else {
				alert("삭제 오류.");
			}
		});
	}
	else{
		return;
	}
}

	
</script>