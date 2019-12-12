<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand " href="${pageContext.request.contextPath}/index.jsp">Rang Project</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/selectList.mb">인기 게시글</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#">여행 Share</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/selectList.tb">너랑나랑</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/views/planner/map.jsp">Planner</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/planner.do">어떠한 메뉴</a>
                </li>
            </ul>
            <!-- 검색 버튼 -->
            <form class="form-inline my-2 my-lg-0 ml-auto">
                <input class="form-control mr-sm-2" type="search" placeholder="#태그" aria-label="Search">
                <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">검색</button>
            </form>

            <!-- 로그인 상태가 아닐때 -->
            <c:if test="${empty member}">
            <!-- login 버튼 -->
            <button type="button" class="btn btn-outline-warning ml-auto" onclick="location.href='${pageContext.request.contextPath}/views/member/login.jsp'">Login</button>
            </c:if>

            <!-- 로그인 일 때 -->
            <c:if test="${!empty member}">
                <div class="btn-group ml-2" role="group">
                    <button type="button" class="btn" data-toggle="dropdown">
                        <i class="fas fa-user-circle fa-3x" style="color: #fed136;"></i>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/views/myPage/myPage.jsp">마이페이지</a>
                        <a class="dropdown-item" href="logout.me">로그아웃</a>
                    </div>
                </div>
            </c:if>

        </div>

    </div>
</nav>