<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/popHeader" />

<!-- CONTENTS -->
<div id="app" class="container window">

<article class="popup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">CA-DMZ-CS-PROD-13 : cnode05</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
					<col width="100px">
					<col width="*">
					<col width="100px">
					<col width="*">
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>뷰번호</th>
						<td>#1327</td>
						<th>구분</th>
						<td>IPC_PROD</td>
						<th>상면</th>
						<td>천안-05-10-04</td>
						<th>최고전파등급</th>
						<td>2등급</td>
					</tr>
					<tr>
						<th>대상장비</th>
						<td colspan="5">CA-DMZ-CS-PROD-13 : cnode05</td>
						<th>기준시간</th>
						<td>2022-11-08 17:00:00</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<button type="button" class="bt bd primary">새로고침</button>
			</div>
			
			<div class="result">
				<div class="control">
					<span class="count">Total <b>0</b></span>
					<div class="btns">
						<select class="select md">
							<option>SLA등급 전체</option>
							<option>A</option>
							<option>B</option>
							<option>C</option>
						</select>
					</div>
				</div>

				<div class="grid">
					<table>
						<thead>
							<tr>
								<th><span>도메인</span></th>
								<th><span>서비스명</span></th>
								<th><span>SLA<br>등급</span></th>
								<th><span>AP담당</span></th>
								<th><span>영향도</span></th>
								<th><span>최종점검<br>결과</span></th>
								<th><span>운영범위</span></th>
								<th><span>운영여부</span></th>
								<th><span>IT기획실<br>여부</span></th>
								<th><span>서비스<br>이중화</span></th>
								<th><span>POD-CNODE목록</span></th>
								<th><span>POD<br>이중화</span></th>
								<th><span>CNODE<br>이중화</span></th>
								<th><span>VR수</span></th>
								<th><span>VM수</span></th>
								<th><span>web수</span></th>
								<th><span>was수</span></th>
								<th><span>db수</span></th>
								<th><span>etc수</span></th>
								<th><span>OS담당</span></th>
								<th><span>OS부서</span></th>
								<th><span>AP부서</span></th>
								<th><span>AP담당</span></th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="n in 20">
								<td class="tl">02.KOS-Web</td>
								<td>웹서비스GW</td>
								<td>A</td>
								<td>임은영</td>
								<td>
									<select class="select sm">
										<option>옵션1</option>
										<option>옵션2</option>
										<option>옵션3</option>
									</select>
								</td>
								<td></td>
								<td>OS MW AP</td>
								<td>운영중</td>
								<td><span class="sign not">N</span></td>
								<td><span class="sign yes">Y</span></td>
								<td class="tl">CA-DMZ-CS-PROD-13 : cnode05</td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td>-</td>
								<td>1</td>
								<td>1</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>이승훈</td>
								<td>KTDS 인프라 서비스본부 인프라운영담당 채널경영 인프라팀</td>
								<td>CRM담당 오픈채널서비스팀</td>
								<td>임은영</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><span></span></td>
								<td><span>11</span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span>0</span></td>
								<td><span>14</span></td>
								<td><span>10</span></td>
								<td><span>1</span></td>
								<td><span>0</span></td>
								<td><span>3</span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
								<td><span></span></td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				<div class="control">
					<span class="count">
						<select class="select sm">
							<option>20</option>
							<option>1,000</option>
						</select>
					</span>

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
				</div>
				
			</div>
			
		</div><!--//conBody-->

		<!--div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary">확인</button>
			</div>
		</div-->

	</div>
</article>

</div>
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/popFooter" />

<script type="text/javaScript">
<!--

$(function(){

	// 초기화
	fnInit();
	
	
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){

}

//-->
</script>