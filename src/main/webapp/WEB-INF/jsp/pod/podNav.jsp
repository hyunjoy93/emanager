<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="lnb">
	<!--<h2 class="pageTitle">[CS] IPC-PROD</h2>-->
	<ul class="mainMenu">
		<li>
			<p class="menu more"><i>VM조회</i></p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/pod/ipc' />" class="menu"><i>IPC</i></a></li>
				<li><a href="<c:url value='/view/pod/epc' />" class="menu"><i>EPC</i></a></li>
				<li><a href="<c:url value='/view/pod/gcloud' />" class="menu"><i>Gcloud</i></a></li>
			</ul>
		</li>
		<li>
			<p class="menu more"><i>점검</i></p>
			<ul class="subMenu">
				<li><a href="<c:url value='/view/pod/infra' />" class="menu"><i>인프라 점검</i></a></li>
				<li><a href="<c:url value='/view/pod/jogn' />" class="menu"><i>조근 점검</i></a></li>
			</ul>
		</li>
	</ul>
</nav>