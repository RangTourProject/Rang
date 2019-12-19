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
                <li class="nav-item" >
                    <a class="nav-link" href="${pageContext.request.contextPath}/selectList.mb">여행공유</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/selectList.tb">너랑나랑</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/readPlan.do">Planner</a>
                </li>
                <li class="nav-item">
                    <c:if test="${member.nickName != null}">
                        <a class="nav-link " href="${pageContext.request.contextPath}/memberPage.mp?nickName=${member.nickName}">마이페이지</a>
                    </c:if>
                </li>
            </ul>
            <!-- 검색 버튼 -->
            <form class="form-inline my-4 my-lg-0" >
                <select name="searchCondition" id="searchCondition" class="btn btn-outline-warning my-2 my-sm-0">
                    <option value="nickName" id="searchNickName">닉네임</option>
                    <option value="hashtag" id="searchHashtag">#태그</option>
                </select>
                <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세여" aria-label="Search" id="keyword">
                <button class="btn btn-outline-warning my-2 my-sm-0" type="button" onclick="search();">검색</button>
            </form>

            <!-- 로그인 상태가 아닐때 -->
            <c:if test="${empty member}">
            <!-- login 버튼 -->
            <button type="button" class="btn btn-outline-warning ml-auto" onclick="location.href='${pageContext.request.contextPath}/views/member/login.jsp'">Login / Join</button>
            </c:if>

            <!-- 로그인 일 때 -->
            <c:if test="${!empty member}">
                <div class="btn-group ml-2" role="group">
                    <button type="button" class="btn" data-toggle="dropdown">
                        <i class="fas fa-user-circle fa-3x" style="color: #fed136;"></i>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/memberPage.mp?nickName=${member.nickName}">마이페이지</a>
                        <a class="dropdown-item" href="logout.me">로그아웃</a>
                    </div>
                </div>
            </c:if>

        </div>

    </div>
</nav>

<%-- nav bar 검색박스 검색용 스크립트 --%>
<script>
    function search(){

        // location.href="${ pageContext.request.contextPath }/search.ck?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();

        switch($('#searchCondition').val()){
            case "nickName":
                location.href="${ pageContext.request.contextPath }/searchNickName.sn?keyword="+$('#keyword').val();
                break;
            case "hashtag" :
                location.href="${ pageContext.request.contextPath }/searchHashtag.sh?keyword="+$('#keyword').val();
                break;
        }
    }
</script>