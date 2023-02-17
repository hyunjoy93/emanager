<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />
<script src="/js/cytoscape.min.js"></script>
<script src="/js/cytoscape.js"></script>
<link rel="stylesheet" href="/css/cytoscape.css">

<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<!-- CONTENTS -->
<section class="section">

	<div class="conHead">

		<ol class="breadcrumb">
			<li><a href="" class="home">Home</a></li>
			<li>구성/성능관리</li>
			<li>구성정보 조회</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">구성정보 조회</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody visual">
		<!-- <div class="visual">
			<div class="wrap" > -->    
				<div class="col-sm-12" id="cy">
				</div>
			<!-- </div>
		</div> -->
	</div><!--//pageBody-->

</section>
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

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
	
	// InitGnbLnb
	fnInitGnbLnb(4, 1, 4, 1);
}

//-->
</script>