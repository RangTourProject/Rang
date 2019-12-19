<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <c:import url="views/common/commonUtil.jsp"/>
</head>
<body id="page-top">
<!-- head -->
<c:import url="views/common/header.jsp"/>

<!-- nav -->
<c:import url="views/common/nav.jsp"/>

<!-- 인기 있는 여행지-->
<div id="most-destination">
    <div class="tour-fluid">
        <div class="row">
            <div class="col-md-12">
                <ul id="most-destination-list" class="animate-box">
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-1.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=부평">
                            <div class="case-studies-summary">
                                <h2>부평</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-2.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=홍콩">
                            <div class="case-studies-summary">
                                <h2>홍콩</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-3.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=이탈리아">
                            <div class="case-studies-summary">
                                <h2>이탈리아</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-4.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=필리핀">
                            <div class="case-studies-summary">
                                <h2>필리핀</h2>
                            </div>
                        </a>
                    </li>

                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-5.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=오사카">
                            <div class="case-studies-summary">
                                <h2>오사카</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-half text-center">
                        <div class="title-bg">
                            <div class="case-studies-summary">
                                <h2>가장 인기있는 여행지</h2>
                                <span><a href="${pageContext.request.contextPath}/selectList.mb">모든 여행지 보기</a></span>
                            </div>
                        </div>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-6.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=파리">
                            <div class="case-studies-summary">
                                <h2>파리</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-7.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=싱가폴">
                            <div class="case-studies-summary">
                                <h2>싱가폴</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-8.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=마다가스카">
                            <div class="case-studies-summary">
                                <h2>마다가스카</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-9.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=이집트">
                            <div class="case-studies-summary">
                                <h2>이집트</h2>
                            </div>
                        </a>
                    </li>
                    <li class="one-forth text-center" style="background-image: url(resources/images/destinationBG/place-10.jpg); ">
                        <a href="${pageContext.request.contextPath}/searchHashtag.sh?keyword=스위스">
                            <div class="case-studies-summary">
                                <h2>스위스</h2>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<!-- footer -->
<c:import url="views/common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="resources/js/scroll.js"></script>

</body>
</html>