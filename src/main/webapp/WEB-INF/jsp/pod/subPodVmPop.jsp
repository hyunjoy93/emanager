<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/pod/podPopHeader" />

<!-- CONTENTS -->
<div id="app" class="container window">

<article class="popup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">EPC_M140688_S1820 (7037) / 도메인 EPC_USER</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			<div class="headline">
				<h6 class="minTitle">회원정보</h6>
			</div>
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
					<col width="100px">
					<col width="*">
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>회원명</th>
						<td colspan="3">닐슨 미디어코리아 유한회사</td>
						<th>회원분류</th>
						<td>VVIP</td>
					</tr>
					<tr>
						<th>회원ID</th>
						<td>customer@email.com</td>
						<th>회원Phone</th>
						<td>010-1234-5678</td>
						<th>최근로그인</th>
						<td>2022-03-30 15:44:47</td>
					</tr>
				</tbody>
			</table>
			<div class="headline">
				<h6 class="minTitle">VM목록</h6>
			</div>
			<div class="grid sizeS">
				<table>
					<thead>
						<tr>
							<th><span>no.</span></th>
							<th><span>pod</span></th>
							<th><span>host</span></th>
							<th><span>host_ip</span></th>
							<th><span>젠버전</span></th>
							<th><span>haper_ver</span></th>
							<th><span>name</span></th>
							<th><span>instance_name</span></th>
							<th><span>display_name</span></th>
							<th><span>내부IP</span></th>
							<th><span>외부IP</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 10">
							<td>0</td>
							<td>kr-1-t2pod48</td>
							<td>cnode05</td>
							<td>10.5.62.5</td>
							<td>XS650</td>
							<td>6.2.0</td>
							<td class="tl">a38bb19f-2c30-43ee-865a-58bde5780036</td>
							<td>i-278-3735-VM</td>
							<td>Redundant (BACKUP)</td>
							<td>211.253.31.45</td>
							<td>172.27.0.163</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="headline">
				<h6 class="minTitle">포트 포워딩</h6>
			</div>
			<div class="grid">
				<table>
					<thead>
						<tr>
							<th><span>public_ip_address</span></th>
							<th><span>start_port</span></th>
							<th><span>end_port</span></th>
							<th><span>protocol</span></th>
							<th><span>instance_name</span></th>
							<th><span>state</span></th>
							<th><span>dest_ip_address</span></th>
							<th><span>dest_port_start</span></th>
							<th><span>dest_port_end</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 30">
							<td>14.63.226.138</td>
							<td>22</td>
							<td>22</td>
							<td>tcp</td>
							<td>i-278-3735-VM</td>
							<td class="tl"><span class="state">Running</span></td>
							<td>211.253.31.45</td>
							<td>22</td>
							<td>22</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary">확인</button>
			</div>
		</div>

	</div>
</article>

</div>
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/pod/podPopFooter" />

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