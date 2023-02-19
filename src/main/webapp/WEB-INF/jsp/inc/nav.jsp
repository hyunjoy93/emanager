<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="lnb hide">
	<ul class="mainMenu">
		<li>
			<a href="/view/dsb/mainOld" class="menu">Dashboard</a>
		</li>
		<li>
			<p class="menu more">운영관리</p>
			<ul class="subMenu">
				<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'00'})" class="menu">사용자관리</a></li>
				<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'10'})" class="menu">업체관리</a></li>
				<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'10'})" class="menu">자산관리</a></li>
			</ul>
		</li>
		<li>
			<p class="menu more">점검관리</p>
			<ul class="subMenu">
				<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'00'})" class="menu">점검현황</a></li>
				<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'10'})" class="menu">점검요청</a></li>
				<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'10'})" class="menu">점검보고서</a></li>
			</ul>
		</li>
		<li class="hide">
			<p class="menu more">통계관리</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/cst/subManageConsist' />" class="menu">자산통계</a></li>
				<li><a href="<c:url value='/view/cst/subManagePerformance' />" class="menu">점검통계(자산별)</a></li>
				<li><a href="<c:url value='/view/cst/subManagePerformance' />" class="menu">점검통계(업체별)</a></li>
			</ul>
		</li>
		<li>
			<p class="menu more">환경설정</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/stt/subStatsLinkage' />" class="menu">기본설정</a></li>
				<li><a href="<c:url value='/view/stt/subStatsEvent' />" class="menu">부서분류</a></li>
				<li><a href="<c:url value='/view/stt/subStatsIncident' />" class="menu">자산분류</a></li>
				<li><a href="<c:url value='/view/stt/subStatsUserrate' />" class="menu">점검양식</a></li>
			</ul>
		</li>
		<li>
			<p class="menu more">공지사항</p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/spt/subSupportVoc' />" class="menu">공지사항</a></li>
			</ul>
		</li>
<%-- 		<li<c:if test="${'사용자' eq loginInfo.user_group}"> class="hide"</c:if>> --%>
<!-- 			<p class="menu more">관제운영관리</p> -->
<!-- 			<ul class="subMenu"> -->
<%-- 				<li><a href="<c:url value='/view/ctl/subControlMember' />" class="menu">사용자 관리</a></li> --%>
<%-- 				<li><a href="<c:url value='/view/ctl/subControlContact' />" class="menu">공지그룹 관리</a></li> --%>
<!-- 				<li class="hide"><a href="" class="menu">운영자 매뉴얼(WIKI)</a></li> -->
<!-- 			</ul> -->
<!-- 		</li>					 -->
	</ul>
</nav>