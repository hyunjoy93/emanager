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
			</ol>

			<div class="headline">
				<button type="button" class="btMenu"><i>서브메뉴열닫</i></button>
				<h3 class="mainTitle">POD별 VM</h3>
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
						<a href="<c:url value='/view/pod/subPodVmView' />" class="bt primary bd">서비스요약</a>
						<button type="button" class="bt bd">엑셀다운로드</button>
					</div>
				</div>
				
				<div class="grid">
					<table>
						<thead>
							<tr>
								<th class="noB old hide"><span>20:00</span></th>
								<th class="noB"><span>display_name</span></th>
								<th class="noB"><span>instance_name</span></th>
								<th class="noB"><span>name</span></th>
								<th class="noB"><span>용도</span></th>
								<th class="noB"><span>redundant_info</span></th>
								<th class="noB"><span>내부IP</span></th>
								<th class="noB"><span>외부IP</span></th>
								<th class="noB"><span>CIP</span></th>
								<th class="noB"><span>state</span></th>
								<th class="noB"><span>created</span></th>
								<th class="noB"><span>cs_update</span></th>
								<th class="noB"><span>xe_uptime</span></th>
								<th class="noB"><span>사양</span></th>
								<th class="noB"><span>볼륨</span></th>
								<th class="noB"><span>cs_os</span></th>
								<th class="noB"><span>xe_os</span></th>
								<th class="noB"><span>젠툴최신</span></th>
								<th class="noB"><span>OS/Xentool<br>ver</span></th>
								<th class="noB"><span>CORES PER<br>SOCKET</span></th>
								<th class="noB"><span>account_name</span></th>
								<th class="noB"><span>고객ID</span></th>
							</tr>
						</thead>
						<tbody>
							<tr class="fix">
								<td colspan="100">
									<div class="category">
										<span class="label">
											<em>CA-DMZ-CSPROD-17</em>
											<em>cnode06</em>
										</span>
										<span>cnode_ip : 10.3.10.16</span>
										<span>resource_ver : XenServer650</span>
										<span>hyper_ver : 6.5.0</span>
									</div>
								</td>
							</tr>
							
							<tr v-for="n in 20">
								<td class="old hide"></td>
								<td class="tl">ktnmsweb05</td>
								<td class="tl"><a href="#" class="link" title="instance">i-278-3735-VM</a></td>
								<td class="tl">a38bb19f-2c30-43ee-865a-58bde5780036</td>
								<td>WEB</td>
								<td></td>
								<td>172.27.82.25</td>
								<td>14.63.145.191</td>
								<td>14.63.148.17</td>
								<td class="tl"><span class="state">Running</span></td>
								<td>2013-12-10 05:58:13</td>
								<td>2022-03-12 10:46</td>
								<td class="tr">236.9</td>
								<td>4C24G</td>
								<td class="tl">400G(100G 100G 200G)</td>
								<td class="tl">CentOS 6.0 (64-bit)</td>
								<td class="tl">CentOS Linux release 7.0.1406 (Core)</td>
								<td>true</td>
								<td>65/65</td>
								<td>0</td>
								<td><a href="#" class="link" onclick="window.open('<c:url value="/view/pod/subPodVmPop" />','','All=no,width=1000px,height=840px,left=0,top=0');">EPC_M140688_S1820</a></td>
								<td class="tl">customer@email.com</td>
							</tr>
							
							<tr class="fix">
								<td colspan="100">
									<div class="category">
										<span class="label">
											<em>kr-0-t2pod11</em>
											<em>cnode07</em>
										</span>
										<span>cnode_ip : 10.3.10.16</span>
										<span>resource_ver : XenServer650</span>
										<span>hyper_ver : 6.5.0</span>
									</div>
								</td>
							</tr>
							
							<tr v-for="n in 30">
								<td class="old hide">cnode08</td>
								<td class="tl">c-sbill-pd1-w03</td>
								<td class="tl"><a href="#" class="link" title="instance">i-371-5665-c-sbill-pd1-w03</a></td>
								<td class="tl">c-sbill-pd1-w03</td>
								<td>WEB</td>
								<td></td>
								<td>172.27.82.25</td>
								<td>14.63.145.191</td>
								<td>14.63.148.17</td>
								<td class="tl"><span class="state">Running</span></td>
								<td>2013-12-10 05:58:13</td>
								<td>2022-03-12 10:46</td>
								<td class="tr">236.9</td>
								<td>4C4G</td>
								<td class="tl">200G(100G 30G 60G 10G)</td>
								<td class="tl">CentOS 6.0 (64-bit)</td>
								<td class="tl">CentOS Linux release 7.0.1406 (Core)</td>
								<td>true</td>
								<td>65/65</td>
								<td>0</td>
								<td><a href="#" class="link" title="account">EPC_M140688_S1820</a></td>
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


<!-- 팝업 -->

<article class="popup hide" id="pop1">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">POD정보</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody cols">
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="300px">
				</colgroup>
				<tbody>
					<tr>
						<th>POD명</th>
						<td>CA-DMZ-CSPROD-01</td>
					</tr>
					<tr>
						<th>pod_id</th>
						<td>173</td>
					</tr>
					<tr>
						<th>pod_uuid</th>
						<td>7306280a-aef7-47f3-b7cd-cd53c0f6bfae</td>
					</tr>
				</tbody>
			</table>
		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary">확인</button>
			</div>
		</div>

	</div>
</article>	

<article class="popup hide" id="pop2">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">i-278-3735-VM</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="200px">
					<col width="100px">
					<col width="200px">
				</colgroup>
				<tbody>
					<tr>
						<th>acc_name</th>
						<td><a href="#" class="link" title="account">EPC M140688 S1820</a></td>
						<th>host_name</th>
						<td>cnode06</td>
					</tr>
					<tr>
						<th>pod_name</th>
						<td>CA-DMZ-CSPROD-17</td>
						<th>host_ip</th>
						<td>10.10.11.5</td>
					</tr>
					<tr>
						<th>vm_name</th>
						<td>i-278-3735-VM</td>
						<th>vm_state</th>
						<td><span class="state">Running</span></td>
					</tr>
					<tr>
						<th>vm_uuid</th>
						<td colspan="3">7306280a-aef7-47f3-b7cd-cd53c0f6bfae</td>
					</tr>
				</tbody>
			</table>
			<div class="headline">
				<h6 class="minTitle">Port Check</h6>
			</div>
			<div class="grid">
				<table>
					<thead>
						<tr>
							<th><span>public_ip</span></th>
							<th><span>private_ip</span></th>
							<th><span>port</span></th>
							<th><span>protocol</span></th>
							<th><span>port_check (10s)</span></th>
							<th><span>firewall_rules</span></th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="n in 10">
							<td>211.253.31.45</td>
							<td>172.27.0.163</td>
							<td>22</td>
							<td>tcp</td>
							<td></td>
							<td>Accept - 0.0.0.0/0</td>
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

<article class="popup hide" id="pop3">
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
	$('.btInfo').click(function(){
		$('#pop1').removeClass('hide');
	});
	$('.link[title="instance"]').click(function(){
		$('#pop2').removeClass('hide');
	});
	$('.link[title="account"]').click(function(){
		$('#pop3').removeClass('hide');
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