<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="lnb hide">
	<ul class="mainMenu">
		<li>
			<a href="/" class="menu">Dashboard</a>
			<a href="#" class="btPop" onclick="window.open('<c:url value='/view/dsb/mainDashboard' />','','All=no,width=1600px,height=840px,left=0,top=0');">관제용</a>
		</li>
		<li>
			<p id="eventId" class="menu more">이벤트관리</p>
			<ul class="subMenu">
				<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'00'})" class="menu">이벤트 상황 관리</a></li>
				<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'10'})" class="menu">이벤트 이력 조회</a></li>
			</ul>
		</li>
		<li>
			<p class="menu more">인시던트관리</p>
			<ul class="subMenu">
				<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'00'})" class="menu">인시던트 상황 관리</a></li>
				<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'10'})" class="menu">인시던트 이력 조회</a></li>
			</ul>
		</li>
		<li class="hide">
			<p class="menu more">구성/성능관리</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/cst/subManageConsist' />" class="menu">구성정보 조회</a></li>
				<li><a href="<c:url value='/view/cst/subManagePerformance' />" class="menu">성능정보 조회</a></li>
			</ul>
		</li>
		<li class="hide">
			<p class="menu more">작업관리</p>
			<ul class="subMenu">
			    <li><a href="<c:url value='/view/wrk/subWorkList' />" class="menu">작업 리스트</a></li>
				<!-- <li><a href="<c:url value='/view/wrk/subWorkException' />" class="menu">예외 등록</a></li> -->
			</ul>
		</li>
		<li>
			<p class="menu more">인벤토리 및 통계</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/stt/subStatsLinkage' />" class="menu">관제 대상 및 연동상태</a></li>
				<li class="hide"><a href="<c:url value='/view/stt/subStatsEvent' />" class="menu">이벤트 통계(발생/조치/처리)</a></li>
				<li class="hide"><a href="<c:url value='/view/stt/subStatsIncident' />" class="menu">인시던트 통계(발생/조치/처리)</a></li>
				<li><a href="<c:url value='/view/stt/subStatsUserrate' />" class="menu">지원 사용률 통계</a></li>
			</ul>
		</li>
		<li>
			<p class="menu more">Support</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/spt/subSupportVoc' />" class="menu">VOC</a></li>
				<li><a href="<c:url value='/view/spt/subSupportFaq' />" class="menu">FAQ</a></li>
				<li><a href="<c:url value='/view/spt/subSupportNotice' />" class="menu">공지사항</a></li>
			</ul>
		</li>
		<li<c:if test="${'사용자' eq loginInfo.user_group}"> class="hide"</c:if>>
			<p class="menu more">관제운영관리</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/ctl/subControlMember' />" class="menu">사용자 관리</a></li>
				<li><a href="<c:url value='/view/ctl/subControlContact' />" class="menu">공지그룹 관리</a></li>
				<li class="hide"><a href="" class="menu">운영자 매뉴얼(WIKI)</a></li>
			</ul>
		</li>					
	</ul>
</nav>