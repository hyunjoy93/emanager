<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />

<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<!-- CONTENTS -->
<section class="section">

	<div class="conHead">

		<ol class="breadcrumb">
			<li><a href="" class="home">Home</a></li>
			<li>인벤토리 및 통계</li>
			<li>이벤트 통계(발생/조치/처리)</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">이벤트 통계(발생/조치/처리)</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

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
	fnInitGnbLnb(6, 2, 6, 2);
}

//-->
</script>