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
			<li>관제대상 및 연동상태</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">관제대상 및 연동상태</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="result">

			<div class="control">

				<span class="count">
					<select class="select sm">
						<option>20</option>
						<option>1,000</option>
					</select>
					<i>화면에 표시할 리스트 갯수</i>
				</span>

				<div class="btns">
					<button type="button" class="bt bg secondary" id="test-bt-popup1">수집서버추가</button>
				</div>

			</div><!--//control-->

			<div class="grid">
				<table>
					<thead>
						<tr>
							<th class="range"><span>No.</span></th>
							<th class="range"><span>수집서버 IP</span></th>
							<th class="range"><span>수집서버 Port</span></th>
							<th class="range"><span>관제대상 IP</span></th>
							<th class="range"><span>상태</span></th>
							<th><span>변경</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 10">
							<td>0</td>
							<td>000.000.00.000</td>
							<td>0000</td>
							<td><button type="button" class="bt bg primary">관제리스트</button></td>
							<td><span class="badge">정상</span></td>
							<td>
								<button type="button" class="bt bd primary">수정</button>
								<button type="button" class="bt bd">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!--//grid-->

			<div class="control">

				<span class="count">현재 페이지 <b>1</b> <i>/</i> 전체 <b>1</b> 페이지</span>

				<div class="pages">
					<button type="button" class="btPrev end" disabled>처음 페이지</button>
					<button type="button" class="btPrev" disabled>이전 페이지</button>
					<a href="" class="pg on">1</a>
					<a href="" class="pg">2</a>
					<a href="" class="pg">3</a>
					<a href="" class="pg">4</a>
					<a href="" class="pg">5</a>
					<button type="button" class="btNext">다음 페이지</button>
					<button type="button" class="btNext end">마지막 페이지</button>
				</div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>




<!-- [팝업] 수집서버추가 -->
<article class="popup hide" id="test-popup1">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">수집서버추가</h5>
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
						<th>수집서버 IP</th>
						<td><input type="text" class="input" value=""></td>
					</tr>
					<tr>
						<th>수집서버 Port</th>
						<td><input type="text" class="input" value=""></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd">취소</button>
				<button type="button" class="bt max bg primary">저장</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 수집서버추가 -->




<!-- [팝업] 관제대상리스트 -->
<article class="popup hide" id="test-popup2">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">관제대상리스트</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<div class="grid">
				<table>
					<thead>
						<tr>
							<th class="range"><span>No.</span></th>
							<th class="range"><span>타겟 IP</span></th>
							<th class="range"><span>그룹명</span></th>
							<th class="range"><span>호스트명</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 100">
							<td>0</td>
							<td>000.000.00.000</td>
							<td class="tl"></td>
							<td class="tl"></td>
						</tr>
					</tbody>
				</table>
			</div><!--//grid-->

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd">취소</button>
				<button type="button" class="bt max bg primary">저장</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 관제대상리스트 -->
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">
<!--

$(function(){

	// 초기화
	fnInit();
	
	// 팝업테스트
	$('#test-bt-popup1').click(function(){
		$('#test-popup1').removeClass('hide');
	});
	$('.grid .bt.bg').click(function(){
		$('#test-popup2').removeClass('hide');
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(6, 1, 6, 1);
}

//-->
</script>