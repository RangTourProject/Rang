<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>error Page</title>
    <c:import url="../common/commonUtil.jsp"/>
    <style>
	    .treepic {
		  position: absolute;
		  bottom: 0;
		  left: 0;
		  z-index: -10;
			max-height: 50vh;
		}
		.cloudpic {
		  position: absolute;
		  top: 0;
		  Right: 0;
		  z-index: -10;
			max-height: 35vh;
		}
		
		.content {
		  max-width: 70vw;
		  margin: auto;
		  padding-top: 100px;
		}
		
		h1 {
		  font-size: 38px;
		  font-family: 'Sanchez','Times New Roman', Times, serif;
		}
		
		p {
		  font-size: 20px;
		  font-family: 'Lato', Arial, sans-serif;
		}
		
		body {
		  background-image: linear-gradient(#3AB6DD 0%, #D4FCF7 100%);
		  background-repeat: no-repeat;
		  background-size: 100vw 100vh;
			overflow: hidden;
		}
    </style>
</head>
<body>
<c:import url="../../views/common/nav.jsp"/>

<section>
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Sanchez" rel="stylesheet">
	
	<div class="content">
	  <h1>An Error Occurred</h1>
	
	  <p>An error has occured on this page.  Please try again.  If you continue to run into this error, please contact an administrator.</p>
	</div>
	
	<img class="treepic" src="http://nmchivers.design/staging/IMGS/Projects-Misc/ErrorPage/ErrorImg1.png" alt="Trees and Compass Image">
	<img class="cloudpic" src="http://nmchivers.design/staging/IMGS/Projects-Misc/ErrorPage/ErrorImg2.png" alt="Clouds">
</section>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
</body>
</html>