<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>KT Cloud LUPPITER 통합관제시스템</title>
	
<!-- [Favicons] -->
<link href="<c:url value='/img/favicon_cloud.png' />" rel="icon">
<link href="<c:url value='/img/apple-touch-icon.png' />" rel="apple-touch-icon">
	
<!--[CSS]-->
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.css' />"/>
<link rel="stylesheet" href="<c:url value='/css/style.css' />"/>
<link rel="stylesheet" href="<c:url value='/css/tui-grid.css' />"/>	
<link rel="stylesheet" href="<c:url value='/css/grid-style.css' />"/>

<!--[JS]-->
<script type="text/javaScript">
<!--

//공통 객체, 그리드 객체, 성공응답코드, 시스템메세지, 
var cmmObj = new Array();
cmmObj["isLogin"] = true;
cmmObj["isDisabledUser"] = true;

var gridObj = new Array();
var valObj = new Array();
var isLogin = ${isLogin};
var successResCode = "${successResCode}";
var failResCode = "${failResCode}";
var noChangeDataResCode = "${noChangeDataResCode}";
var successResMsg = "${successResMsg}";
var failResMsg = "${failResMsg}";
var noChangeDataResMsg = "${noChangeDataResMsg}";
var longLogoutMsg = "${longLogoutMsg}";
var defaultDate = "${defaultDate}";
var logoutUrl = "<c:url value='/view/ctl/logout' />";
var loginUserId = "${loginInfo.user_id}";
var loginUserName = "${loginInfo.user_name}";
var loginUserGroup = "${loginInfo.user_group}";

//-->
</script>
<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />"></script>
<script src="<c:url value='/js/chart.min.js' />"></script>
<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/tui-grid.js' />"></script>
<script src="<c:url value='/js/biz.js' />"></script>

</head>
	
<body>
<div id="app" class="container">

<header class="header">
	
	<button type="button" class="btMenu"><i>좌측메뉴열닫기</i></button>

	<h1 class="logo"><a href="/"><strong>LUPPITER</strong> 통합관제시스템</a></h1>

	<nav class="gnb">
		<ul class="mainMenu">
			<li>
				<a href="/view/dsb/main" class="menu">Dashboard</a>
				<a href="" class="btPop" onclick="window.open('<c:url value='/view/dsb/mainDashboardOld' />','','All=no,width=1800px,height=840px,left=0,top=0');">관제용</a>
				<ul class="subMenu">
					<li><a href="" onclick="window.open('<c:url value='/view/dsb/mainDashboardOld' />','','All=no,width=1800px,height=840px,left=0,top=0');" class="menu">상황실 대시보드</a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'00'})" class="menu">이벤트관리</a>
				<ul class="subMenu">
					<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'00'})" class="menu">이벤트 상황 관리</a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'10'})" class="menu">이벤트 이력 조회</a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'00'})" class="menu">인시던트관리</a>
				<ul class="subMenu">
					<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'00'})" class="menu">인시던트 상황 관리</a></li>
					<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'10'})" class="menu">인시던트 이력 조회</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/cst/subManageConsist' />" class="menu">구성/성능관리</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/cst/subManageConsist' />" class="menu">구성정보 조회</a></li>
					<li class="hide"><a href="<c:url value='/view/cst/subManagePerformance' />" class="menu">성능정보 조회</a></li>
				</ul>
			</li>
			<li class="hide">
				<a href="<c:url value='/view/wrk/subWorkList' />" class="menu">작업관리</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/wrk/subWorkList' />" class="menu">작업관리</a></li>
					<!-- <li><a href="<c:url value='/view/wrk/subWorkException' />" class="menu">예외 등록</a></li> -->
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/stt/subStatsLinkage' />" class="menu">인벤토리 및 통계</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/stt/subStatsLinkage' />" class="menu">관제대상 및 연동상태</a></li>
					<li class="hide"><a href="<c:url value='/view/stt/subStatsEvent' />" class="menu">이벤트 통계(발생/조치/처리)</a></li>
					<li class="hide"><a href="<c:url value='/view/stt/subStatsIncident' />" class="menu">인시던트 통계(발생/조치/처리)</a></li>
					<li><a href="<c:url value='/view/stt/subStatsUserrate' />" class="menu">자원 사용률 통계</a></li>
					<li><a href="<c:url value='/view/stt/subStatsInventory' />" class="menu">매뉴얼 인벤토리</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/spt/subSupportVoc' />" class="menu">Support</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/spt/subSupportVoc' />" class="menu">VOC</a></li>
					<li><a href="<c:url value='/view/spt/subSupportFaq' />" class="menu">FAQ</a></li>
					<li><a href="<c:url value='/view/spt/subSupportNotice' />" class="menu">공지사항</a></li>
				</ul>
			</li>
			<li<c:if test="${'사용자' eq loginInfo.user_group}"> class="hide"</c:if>>
				<a href="<c:url value='/view/ctl/subControlMember' />" class="menu">관제운영관리</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/ctl/subControlMember' />" class="menu">사용자 관리</a></li>
					<li><a href="<c:url value='/view/ctl/subControlContact' />" class="menu">공지그룹 관리</a></li>
					<li><a href="<c:url value='/view/ctl/operatorManual' />" class="menu">운영자 매뉴얼(WIKI)</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/dsb/mainOld' />" class="menu">Dashboard_new</a>
				<a href="" class="btPop" onclick="window.open('<c:url value='/view/dsb/mainDashboard' />','','All=no,width=1600px,height=840px,left=0,top=0');">관제용</a>
			</li>				
		</ul>
	</nav>

	<div class="user">
		<div class="userName"><span class="pic"></span>${loginInfo.user_name}</div>
		<div class="userMenu">
			<a href="<c:url value='/view/ctl/logout' />" class="menu">로그아웃</a>
		</div>
	</div>

</header>