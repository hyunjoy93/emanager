<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/pod/podHeader" />

<!-- NAV -->
<c:import url="/link/pageLink?link=/pod/podNav" />

<!-- CONTENTS -->
<section class="section row">

	<article class="content">
		
		<div class="conHead">
			<ol class="breadcrumb">
				<li><a href="" class="home">Home</a></li>
				<li>VM관리</li>
				<li>[CS] IPC-PROD</li>
				<li>검색</li>
				<li>POD별 VM</li>
				<li>서비스요약</li>
			</ol>

			<div class="headline">
				<button type="button" class="btMenu"><i>서브메뉴열닫</i></button>
				<h3 class="mainTitle">POD별 VM 서비스요약</h3>
				<div class="history">
					<select class="select" id="week">
						<option value="0" selected>2022-10-12일(수)</option>
						<option value="1">2022-10-11일(화)</option>
						<option value="1">2022-10-10일(월)</option>
						<option value="1">2022-10-09일(일)</option>
						<option value="1">2022-10-08일(토)</option>
						<option value="1">2022-10-07일(금)</option>
						<option value="1">2022-10-06일(목)</option>
					</select>
					<ul id="today">
						<li class="now on"><span>현재</span></li>
						<li><span>14:00</span></li>
						<li><span>12:00</span></li>
						<li><span>10:00</span></li>
						<li><span>08:00</span></li>
						<li><span>06:00</span></li>
						<li><span>04:00</span></li>
						<li><span>02:00</span></li>
					</ul>
					<ul id="before" class="hide">
						<li><span>24:00</span></li>
						<li><span>22:00</span></li>
						<li><span>20:00</span></li>
						<li><span>18:00</span></li>
						<li><span>16:00</span></li>
						<li><span>14:00</span></li>
						<li><span>12:00</span></li>
						<li><span>10:00</span></li>
						<li><span>08:00</span></li>
						<li><span>06:00</span></li>
						<li><span>04:00</span></li>
						<li><span>02:00</span></li>
					</ul>
				</div>
			</div>
			
			<div class="nowURL">https://10.0.7.55/client</div>
		</div>
		
		<div class="conBody cols noP">
			<div class="node resize x">
				<dl class="scroll">
					<dt>
						<div class="check"><input type="checkbox" name="checkall"><label><b>CA-DMZ-CS-PROD</b></label></div>
					</dt>
					<dd>
						<ul>
							<li>
								<button type="button" class="btInfo">POD정보</button>
								<div class="check"><input type="checkbox" name="chk"><label><b>CA-DMZ-CSPROD-01</b> (173) Enabled</label></div>
								<dl class="tree">
									<dt>
										<div class="check"><input type="checkbox"><label><b>cluster1</b> (548) Managed Enabled</label></div>
									</dt>
								    <dd>
								  		<ul>
											<li v-for="n in 8">
												<button type="button" class="btData">HOST정보</button>
												<div class="check"><input type="checkbox"><label><b>cnode01</b> (3309) 650 Up Enabled XS65 tier3 GPU tier2</label></div>
												<div class="info">
													<table class="field">
														<colgroup>
															<col width="100px">
															<col width="*">
															<col width="100px">
															<col width="*">
														</colgroup>
														<tbody>
															<tr>
																<th>host_id</th>
															    <td>3390</td>
																<th>created</th>
																<td>2016-04-08</td>
															</tr>
															<tr>
																<th>host_name</th>
																<td colspan="3">cnode01-m.t2pod11.kr-0.epc.ucloud.com</td>
															</tr>
															<tr>
																<th>MGMT IP</th>
																<td>10.10.11.1</td>
																<th>IPMI IP</th>
																<td>10.10.11.101</td>
															</tr>
															<tr>
																<th>모델명</th>
																<td colspan="3">HPA_SVR-DL360 G9</td>
															</tr>
															<tr>
																<th>CPU 코어 수</th>
																<td>48 개</td>
																<th>CPU 소켓 수</th>
																<td>2 개</td>
															</tr>
															<tr>
																<th>메모리</th>
																<td>213 GB</td>
																<th>하이퍼바이저</th>
																<td>XenServer 6.5.0</td>
															</tr>
															<tr>
																<th>장비바코드</th>
																<td colspan="3">K918434100001036</td>
															</tr>
														</tbody>
													</table>
												</div>
											</li>
										</ul>
									</dd>
								</dl>
							</li>
							<li>
								<button type="button" class="btData">POD정보</button>
								<div class="check"><input type="checkbox" name="chk" id="test1"><label><b>CA-DMZ-CSPROD-13</b> (173) Enabled</label></div>
								<div class="info">
									<table class="field">
										<colgroup>
											<col width="100px">
											<col width="*">
											<col width="100px">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th>pod_id</th>
												<td>173</td>
												<th>POD명</th>
												<td>CA-DMZ-CSPROD-01</td>
											</tr>
											<tr>
												<th>pod_uuid</th>
												<td colspan="3">7306280a-aef7-47f3-b7cd-cd53c0f6bfae</td>
											</tr>
										</tbody>
									</table>
								</div>
								<dl class="tree">
									<dt>
										<div class="check"><input type="checkbox"><label><b>cluster1</b> (548) Managed Enabled</label></div>
									</dt>
								    <dd>
								  		<ul>
											<li v-for="n in 5">
												<button type="button" class="btData">HOST정보</button>
												<div class="check"><input type="checkbox"><label><b>cnode01</b> (3309) 650 Up Enabled XS65 tier3 GPU tier2</label></div>
												<div class="info">
													<table class="field">
														<colgroup>
															<col width="100px">
															<col width="*">
															<col width="100px">
															<col width="*">
														</colgroup>
														<tbody>
															<tr>
																<th>host_id</th>
															    <td>3390</td>
																<th>created</th>
																<td>2016-04-08</td>
															</tr>
															<tr>
																<th>host_name</th>
																<td colspan="3">cnode01-m.t2pod11.kr-0.epc.ucloud.com</td>
															</tr>
															<tr>
																<th>MGMT IP</th>
																<td>10.10.11.1</td>
																<th>IPMI IP</th>
																<td>10.10.11.101</td>
															</tr>
															<tr>
																<th>모델명</th>
																<td colspan="3">HPA_SVR-DL360 G9</td>
															</tr>
															<tr>
																<th>CPU 코어 수</th>
																<td>48 개</td>
																<th>CPU 소켓 수</th>
																<td>2 개</td>
															</tr>
															<tr>
																<th>메모리</th>
																<td>213 GB</td>
																<th>하이퍼바이저</th>
																<td>XenServer 6.5.0</td>
															</tr>
															<tr>
																<th>장비바코드</th>
																<td colspan="3">K918434100001036</td>
															</tr>
														</tbody>
													</table>
												</div>
											</li>
										</ul>
									</dd>
									<dt>
										<div class="check"><input type="checkbox"><label><b>cluster2</b> (548) Managed Enabled</label></div>
									</dt>
								    <dd>
								  		<ul>
											<li v-for="n in 10">
												<button type="button" class="btData">HOST정보</button>
												<div class="check"><input type="checkbox"><label><b>cnode01</b> (3309) 650 Up Enabled XS65 tier3 GPU tier2</label></div>
												<div class="info">
													<table class="field">
														<colgroup>
															<col width="100px">
															<col width="*">
															<col width="100px">
															<col width="*">
														</colgroup>
														<tbody>
															<tr>
																<th>host_id</th>
															    <td>3390</td>
																<th>created</th>
																<td>2016-04-08</td>
															</tr>
															<tr>
																<th>host_name</th>
																<td colspan="3">cnode01-m.t2pod11.kr-0.epc.ucloud.com</td>
															</tr>
															<tr>
																<th>MGMT IP</th>
																<td>10.10.11.1</td>
																<th>IPMI IP</th>
																<td>10.10.11.101</td>
															</tr>
															<tr>
																<th>모델명</th>
																<td colspan="3">HPA_SVR-DL360 G9</td>
															</tr>
															<tr>
																<th>CPU 코어 수</th>
																<td>48 개</td>
																<th>CPU 소켓 수</th>
																<td>2 개</td>
															</tr>
															<tr>
																<th>메모리</th>
																<td>213 GB</td>
																<th>하이퍼바이저</th>
																<td>XenServer 6.5.0</td>
															</tr>
															<tr>
																<th>장비바코드</th>
																<td colspan="3">K918434100001036</td>
															</tr>
														</tbody>
													</table>
												</div>
											</li>
										</ul>
									</dd>
								</dl>
							</li>
							<li>
								<div class="check"><input type="checkbox" name="chk"><label><b>CA-DMZ-CSPROD-17</b> (173) Enabled</label></div>
							</li>
						</ul>
					</dd>
					
					<dt>
						<div class="check"><input type="checkbox"><label><b>CA-DMZ-CS-PROD</b></label></div>
					</dt>
					<dd>
						<ul>
							<li>
								<button type="button" class="btData">POD정보</button>
								<div class="check"><input type="checkbox"><label><b>CA-DMZ-CSPROD-01</b> (173) Enabled</label></div>
								<dl class="tree">
									<dt>
										<div class="check"><input type="checkbox"><label><b>cluster1</b> (548) Managed Enabled</label></div>
									</dt>
								    <dd>
								  		<ul>
											<li v-for="n in 8">
												<button type="button" class="btData">HOST정보</button>
												<div class="check"><input type="checkbox"><label><b>cnode01</b> (3309) 650 Up Enabled XS65 tier3 GPU tier2</label></div>
												<div class="info">
													<table class="field">
														<colgroup>
															<col width="100px">
															<col width="*">
															<col width="100px">
															<col width="*">
														</colgroup>
														<tbody>
															<tr>
																<th>host_id</th>
															    <td>3390</td>
																<th>created</th>
																<td>2016-04-08</td>
															</tr>
															<tr>
																<th>host_name</th>
																<td colspan="3">cnode01-m.t2pod11.kr-0.epc.ucloud.com</td>
															</tr>
															<tr>
																<th>MGMT IP</th>
																<td>10.10.11.1</td>
																<th>IPMI IP</th>
																<td>10.10.11.101</td>
															</tr>
															<tr>
																<th>모델명</th>
																<td colspan="3">HPA_SVR-DL360 G9</td>
															</tr>
															<tr>
																<th>CPU 코어 수</th>
																<td>48 개</td>
																<th>CPU 소켓 수</th>
																<td>2 개</td>
															</tr>
															<tr>
																<th>메모리</th>
																<td>213 GB</td>
																<th>하이퍼바이저</th>
																<td>XenServer 6.5.0</td>
															</tr>
															<tr>
																<th>장비바코드</th>
																<td colspan="3">K918434100001036</td>
															</tr>
														</tbody>
													</table>
												</div>
											</li>
										</ul>
									</dd>
								</dl>
							</li>
						</ul>
					</dd>
				</dl>
			</div>
			
			<div class="result">
				<div class="control">
					<span class="count"><button type="button" class="btSort">POD열닫</button> Total <b>0</b></span>
					<div class="btns">
						<a href="sub_pod_vm.html" class="bt primary bd">전체</a>
						<button type="button" class="bt bd">엑셀다운로드</button>
					</div>
				</div>
				
				<div class="grid">
					<table>
						<thead>
							<tr>
								<th class="noB"><span>전파<br>등급</span></th>
								<th class="noB"><span>등급</span></th>
								<th class="noB"><span>도메인</span></th>
								<th class="noB"><span>서비스</span></th>
								<th class="noB"><span>HOST</span></th>
								<th class="noB"><span>VM수</span></th>
								<th class="noB"><span>WEB</span></th>
								<th class="noB"><span>WAS</span></th>
								<th class="noB"><span>DB</span></th>
								<th class="noB"><span>ETC</span></th>
								<th class="noB"><span>VR수</span></th>
								<th class="noB"><span>서비스<br>이중화</span></th>
								<th class="noB"><span>POD<br>이중화</span></th>
								<th class="noB"><span>Cnode<br>이중화</span></th>
								<th class="noB"><span>OS</span></th>
								<th class="noB"><span>DB</span></th>
								<th class="noB"><span>MW</span></th>
								<th class="noB"><span>AP</span></th>
								<th class="noB"><span>운영</span></th>
								<th class="noB"><span>OS담당</span></th>
								<th class="noB"><span>OS전화</span></th>
								<th class="noB"><span>OS메일</span></th>
								<th class="noB"><span>전파<br>등급</span></th>
								<th class="noB"><span>등급</span></th>
								<th class="noB"><span>도메인</span></th>
								<th class="noB"><span>서비스</span></th>
								<th class="noB"><span>HOST</span></th>
								<th class="noB"><span>VM수</span></th>
								<th class="noB"><span>WEB</span></th>
								<th class="noB"><span>WAS</span></th>
								<th class="noB"><span>DB</span></th>
								<th class="noB"><span>ETC</span></th>
								<th class="noB"><span>VR수</span></th>
								<th class="noB"><span>서비스<br>이중화</span></th>
								<th class="noB"><span>POD<br>이중화</span></th>
								<th class="noB"><span>Cnode<br>이중화</span></th>
								<th class="noB"><span>OS</span></th>
								<th class="noB"><span>DB</span></th>
								<th class="noB"><span>MW</span></th>
								<th class="noB"><span>AP</span></th>
								<th class="noB"><span>운영</span></th>
								<th class="noB"><span>OS담당</span></th>
								<th class="noB"><span>OS전화</span></th>
								<th class="noB"><span>OS메일</span></th>
							</tr>
						</thead>
						<tbody>
							<tr class="fix">
								<td colspan="100">
									<div class="category pop">
										<span class="label">
											<em>CA-DMZ-CSPROD-17</em>
										</span>
										<span>대상장비 : cnode06, cnode07, cnode08, cnode09</span>
										<span>상면 : 천안-04-08-19</span>
										<span>최고전파등급 : 2등급</span>
									</div>
								</td>
							</tr>
							
							<tr v-for="n in 30">
								<td>2</td>
								<td>A</td>
								<td class="tl">19.융합플랫폼</td>
								<td class="tl">종합차량정보</td>
								<td class="tl">
									<span class="badge">cnode04</span>
									<span class="badge">cnode05</span>
									<span class="badge">cnode06</span>
									<span class="badge">cnode07</span>
								</td>
								<td>3</td>
								<td></td>
								<td>2</td>
								<td>1</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td></td>
								<td></td>
								<td>인수인계중</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td class="tl">customer@email.com</td>
								<td>2</td>
								<td>A</td>
								<td class="tl">19.융합플랫폼</td>
								<td class="tl">종합차량정보</td>
								<td class="tl">
									<span class="badge">cnode04</span>
									<span class="badge">cnode05</span>
									<span class="badge">cnode06</span>
									<span class="badge">cnode07</span>
								</td>
								<td>3</td>
								<td></td>
								<td>2</td>
								<td>1</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td></td>
								<td></td>
								<td>인수인계중</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td class="tl">customer@email.com</td>
							</tr>
							
							<tr class="fix">
								<td colspan="100">
									<div class="category pop">
										<span class="label">
											<em>CA-DMZ-CSPROD-18</em>
										</span>
										<span>대상장비 : cnode06, cnode07, cnode08</span>
										<span>상면 : 천안-04-08-19</span>
										<span>최고전파등급 : 2등급</span>
									</div>
								</td>
							</tr>
							
							<tr v-for="n in 30">
								<td>4</td>
								<td>B</td>
								<td class="tl">05.KOS-유통</td>
								<td class="tl">대리점경영지원</td>
								<td class="tl">
									<span class="badge">cnode04</span>
									<span class="badge">cnode05</span>
									<span class="badge">cnode06</span>
								</td>
								<td>1</td>
								<td></td>
								<td></td>
								<td>1</td>
								<td></td>
								<td></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td>운영중</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td class="tl">customer@email.com</td>
								<td>4</td>
								<td>B</td>
								<td class="tl">05.KOS-유통</td>
								<td class="tl">대리점경영지원</td>
								<td class="tl">
									<span class="badge">cnode04</span>
									<span class="badge">cnode05</span>
									<span class="badge">cnode06</span>
								</td>
								<td>1</td>
								<td></td>
								<td></td>
								<td>1</td>
								<td></td>
								<td></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td><span class="sign yes">Y</span></td>
								<td>운영중</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td class="tl">customer@email.com</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				
				<div class="control">
					<span class="count">
						<select class="select sm">
							<option>20</option>
							<option>50</option>
							<option>100</option>
							<option>1,000</option>
						</select>
					</span>
					<div class="btns">
						<button type="button" class="bt bg">장애view생성</button>
					</div>
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
				
			</div><!--//result-->
		</div><!--//conBody-->
	</article>

</section>



<!--팝업 -->

<article class="popup hide" id="pop1">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">CA-DMZ-CSPROD-17</h5>
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
						<th>대상장비</th>
						<td>
							<span class="badge">cnode04</span>
							<span class="badge">cnode05</span>
							<span class="badge">cnode06</span>
							<span class="badge">cnode07</span>
						</td>
					</tr>
					<tr>
						<th>상면</th>
						<td>천안-04-08-19</td>
					</tr>
					<tr>
						<th>최고전파등급</th>
						<td>2등급</td>
					</tr>
				</tbody>
			</table>
			<div class="headline">
				<h6 class="minTitle">서비스</h6>
			</div>
			<div class="grid">
				<table>
					<thead>
						<tr>
							<th><span>no.</span></th>
							<th><span>서비스</span></th>
							<th><span>VM</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 20">
							<td>0</td>
							<td class="tl">종합차량정보</td>
							<td>1</td>
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
<!--//팝업 -->

<!-- FOOTER -->
<c:import url="/link/pageLink?link=/pod/podFooter" />

<script type="text/javaScript">
<!--

$(function(){

	// 초기화
	fnInit();
	
	// HISTORY
	$('.history li').click(function(){
		$(this).siblings('li').removeClass('on');
		$(this).addClass('on');
		$('.grid .old').removeClass('hide');
	});
	$('.history li.now').click(function(){
		$('.grid .old').addClass('hide');
	});
	$('#week').change(function() {
		var result = $('#week option:selected').val();
		if (result == '1') {
			$('#today').addClass('hide');
			$('#before').removeClass('hide');
		} else {
			$('#before').addClass('hide');
			$('#today').removeClass('hide');
		}
	});
	
	// NODE
	$('.node input').change(function() {
		if ($(this).is( ":checked")){
            $(this).parents('.check').siblings('.tree').show();
			$(this).parents('.check').siblings('.info').addClass('line');
        } else {
            $(this).parents('.check').siblings('.tree').hide();
			$(this).parents('.check').siblings('.info').removeClass('line');
        }
	});
	
	// POPUP
	$('.grid .category.pop').click(function(){
		$('#pop1').removeClass('hide');
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(8, 1, 2, 1);
}

//-->
</script>