<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>KT Cloud Cloud-Bot 운영자동화</title>
	
<!-- [Favicons] -->
<link href="<c:url value='/img/favicon_cloud.png' />" rel="icon">
<link href="<c:url value='/img/apple-touch-icon.png' />" rel="apple-touch-icon">
	
<!--[CSS]-->
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.css' />"/>
<link rel="stylesheet" href="<c:url value='/css/style.css' />"/>
	
<!--[JS]-->
<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />"></script>
<script src="<c:url value='/js/chart.min.js' />"></script>
<script src="<c:url value='/js/common.js' />"></script>

<script src="<c:url value='/js/biz.js' />"></script>
</head>
	
<body>
<div id="app" class="container">

<header class="header">
	
	<button type="button" class="btMenu"><i>좌측메뉴열닫</i></button>

	<h1 class="logo"><a href="/"><strong>Cloud-Bot</strong> 운영자동화</a></h1>

	<nav class="gnb">
		<ul class="mainMenu">
			<li>
				<a href="<c:url value='' />" class="menu">VM조회</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/pod/ipc' />" class="menu">IPC</a></li>
					<li><a href="<c:url value='/view/pod/epc' />" class="menu">EPC</a></li>
					<li><a href="<c:url value='/view/pod/gcloud' />" class="menu">Gcloud</a></li>
				</ul>
			</li>	
			<li>
				<a href="<c:url value='' />" class="menu">점검</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/pod/infra' />" class="menu">인프라 점검</a></li>
					<li><a href="<c:url value='/view/pod/jogn' />" class="menu">조근 점검</a></li>
				</ul>
			</li>			
		</ul>
	</nav>

	<div class="user">
		<div class="userName"><span class="pic"><!--img src="img/temp_profile.png" alt=""--></span>홍길동</div>
		<div class="userMenu">
			<!--
			<p class="head">마스터 관리자<em>Super Admin</em></p>
			<a href="" class="menu">나의 프로필</a>
			<a href="" class="menu">프로필수정</a>
			-->
			<a href="login.html" class="menu">로그아웃</a>
		</div>
	</div>

</header>