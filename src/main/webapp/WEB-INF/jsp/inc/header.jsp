<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>e-visitor 통합유지보수 시스템</title>
	
<!-- [Favicons] -->
<link href="<c:url value='/img/favicon.png' />" rel="icon">
<%-- <link href="<c:url value='/img/apple-touch-icon.png' />" rel="apple-touch-icon"> --%>
	
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

	<h1 class="logo"><a href="/"></a></h1>

	<nav class="gnb">
		<ul class="mainMenu">
			<li>
				<a href="/view/dsb/mainOld" class="menu">Dashboard</a>
			</li>
			<li>
				<a href="javascript:fnPostSend('<c:url value="/view/ctl/subControlMember" />', {viewType:'00'})" class="menu">운영관리</a>
				<ul class="subMenu">
					<li><a href="javascript:fnPostSend('<c:url value="/view/ctl/subControlMember" />', {viewType:'00'})" class="menu">사용자관리</a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'10'})" class="menu">업체관리</a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/evt/subEventState" />', {viewType:'10'})" class="menu">자산관리</a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'00'})" class="menu">점검관리</a>
				<ul class="subMenu">
					<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'00'})" class="menu">점검현황</a></li>
					<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'10'})" class="menu">점검요청</a></li>
					<li><a href="javascript:fnPostSend('<c:url value='/view/icd/subIncidentState' />', {viewType:'10'})" class="menu">점검보고서</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/cst/subManageConsist' />" class="menu">통계관리</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/cst/subManageConsist' />" class="menu">자산통계</a></li>
					<li><a href="<c:url value='/view/cst/subManageConsist' />" class="menu">점검통계(자산별)</a></li>
					<li><a href="<c:url value='/view/cst/subManageConsist' />" class="menu">점검통계(업체별)</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/stt/subStatsLinkage' />" class="menu">환경설정</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/stt/subStatsLinkage' />" class="menu">기본설정</a></li>
					<li><a href="<c:url value='/view/stt/subStatsEvent' />" class="menu">부서분류</a></li>
					<li><a href="<c:url value='/view/stt/subStatsIncident' />" class="menu">자산분류</a></li>
					<li><a href="<c:url value='/view/stt/subStatsUserrate' />" class="menu">점검양식</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/spt/subSupportVoc' />" class="menu">공지사항</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/spt/subSupportVoc' />" class="menu">공지사항</a></li>
				</ul>
			</li>
		</ul>
<%-- 			<li<c:if test="${'사용자' eq loginInfo.user_group}"> class="hide"</c:if>>
				<a href="<c:url value='/view/ctl/subControlMember' />" class="menu">관제운영관리</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/ctl/subControlMember' />" class="menu">사용자 관리</a></li>
					<li><a href="<c:url value='/view/ctl/subControlContact' />" class="menu">공지그룹 관리</a></li>
					<li><a href="<c:url value='/view/ctl/operatorManual' />" class="menu">운영자 매뉴얼(WIKI)</a></li>
				</ul>
			</li> --%>
	</nav>

	<div class="user">
		<div class="userName"><span class="pic"></span>${loginInfo.user_name}</div>
		<div class="userMenu">
			<a href="<c:url value='/view/ctl/logout' />" class="menu">로그아웃</a>
		</div>
	</div>

</header>