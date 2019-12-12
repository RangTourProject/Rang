<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>너랑 나랑 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>
<style>
    .card{
        background-color: #FFFFFF;
        padding:0;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius:4px;
        box-shadow: 0 4px 5px 0 rgba(0,0,0,0.14), 0 1px 10px 0 rgba(0,0,0,0.12), 0 2px 4px -1px rgba(0,0,0,0.3);
    }
    .card:hover{
        box-shadow: 0 16px 24px 2px rgba(0,0,0,0.14), 0 6px 30px 5px rgba(0,0,0,0.12), 0 8px 10px -5px rgba(0,0,0,0.3);
        color:black;
    }
</style>
</head>
<body>
<c:import url="../common/nav.jsp"/>

<section>
    <div class="container">
        <!-- 글작성 -->
        <c:if test="${!empty member}">
            <div class="col" align="right">
            <button type="button" class="btn btn-outline-warning"s
            onclick="location.href='${pageContext.request.contextPath}/views/tBoard/tBoardInsert.jsp'">게시글 작성</button>
            </div>
        </c:if>

        <div class="card-columns">
        <c:forEach var="tBoard" items="${List}" >
            <div class="card card-body text-xs-center">
                <div class="detail">
                <a href="${pageContext.request.contextPath}/selectOne.tb?tbno=${tBoard.tbno}" class="btn">
                <h4 class="card-title">제목 : ${tBoard.tbTitle}</h4>
                    <img class="card-img" src="/Rang/resources/tBoardPhoto/${tBoard.tbfile}" alt="Card image" onerror="defaultImg(this);">
                </a>
                </div>

                <div>
                <button type="button" class="btn" data-toggle="dropdown">
                <i class="fas fa-user-circle fa-3x" style="color: #fed136;" aria-hidden="true"></i><p>${tBoard.writer}</p>
                </button>
                </div>

                <div>
                ${tBoard.tbdate}
                </div>

                <p class="card-text text-muted txt_post d-inline-block">내용 : ${tBoard.tbContent}</p>

            </div>

        </c:forEach>

        </div>
    </div>
</section>

<c:import url="../common/footer.jsp"/>

<script>
    function defaultImg(obj){
        $(obj).attr('src','/Rang/resources/images/Rangicon.png');
    }
</script>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>

