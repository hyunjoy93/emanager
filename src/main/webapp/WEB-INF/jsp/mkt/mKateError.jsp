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
<link href="img/favicon_cloud.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
	
<!--[CSS]-->
<link rel="stylesheet" href="css/jquery-ui.css"/>
<link rel="stylesheet" href="css/style.css"/>
	
<!--[JS]-->
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/chart.min.js"></script>
	
<!--테스트용-->
<script src="js/vue.min.js"></script>

</head>
	
<body>
<div id="app" class="container m-kate">
	
<header class="header">
	<h1 class="logo"><a href=""><strong>{{ name_eng }}</strong> 장애View</a></h1>
	<button type="button" class="btClose"><i>닫기</i></button>
</header>

<section class="section">
	
	<div class="error">
		<h2 class="pageTitle">404 ERROR</h2>
		<p>요청하신 페이지를 찾을 수 없습니다. 이용에 불편을 드려 대단히 죄송합니다.<br>이용문의 02-1234-5678</p>
		<div class="btns">
			<a href="" class="bt max bd primary">이전화면</a>
		</div>
	</div>

</section>

	
</div><!--//container-->
</body>
</html>
<script src="js/common.js"></script>
<script>
var app = new Vue({
	el: '#app',
	data: { name_eng:'LUPPITER', name_kor:'통합관제시스템' }
})
</script>
<script>
	var depth1=0
	var depth2=0
	var depth3=0
	var depth4=0	
</script>