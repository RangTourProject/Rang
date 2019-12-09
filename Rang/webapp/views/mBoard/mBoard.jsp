<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>메인 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>
</head>
<body>
<c:import url="../common/nav.jsp"/>

<!-- Mboard Grid -->
<section class="bg-light page-section" id="mboard">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading text-uppercase">메인 게시판</h2>
                <h3 class="section-subheading text-muted">여행 사진을 공유 한다. 가능하면 modal 활용 예정</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-sm-6 mboard-item">
                <a class="mboard-link" data-toggle="modal" href="#">
                    <div class="mboard-hover">
                        <div class="mboard-hover-content">
                            <i class="fas fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="../../resources/images/sample/01-thumbnail.jpg" alt="">
                </a>
                <div class="mboard-caption">
                    <h4>제목 1</h4>
                    <span>
                        <i class="far fa-heart" style="margin-right: 10px">10</i>
                        <i class="far fa-comment">20</i>
                    </span>
                    <p class="text-muted">내용 1</p>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 mboard-item">
                <a class="mboard-link" data-toggle="modal" href="#">
                    <div class="mboard-hover">
                        <div class="mboard-hover-content">
                            <i class="fas fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="../../resources/images/sample/02-thumbnail.jpg" alt="">
                </a>
                <div class="mboard-caption">
                    <h4>제목 2</h4>
                    <p class="text-muted">내용 2</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 mboard-item">
                <a class="mboard-link" data-toggle="modal" href="#">
                    <div class="mboard-hover">
                        <div class="mboard-hover-content">
                            <i class="fas fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="../../resources/images/sample/03-thumbnail.jpg" alt="">
                </a>
                <div class="mboard-caption">
                    <h4>제목 3</h4>
                    <p class="text-muted">샘플 데이터 3</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 mboard-item">
                <a class="mboard-link" data-toggle="modal" href="#">
                    <div class="mboard-hover">
                        <div class="mboard-hover-content">
                            <i class="fas fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="../../resources/images/sample/04-thumbnail.jpg" alt="">
                </a>
                <div class="mboard-caption">
                    <h4>제목 4</h4>
                    <p class="text-muted">샘플 데이터 4</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 mboard-item ">
                <a class="mboard-link" data-toggle="modal" href="#">
                    <div class="mboard-hover">
                        <div class="mboard-hover-content">
                            <i class="fas fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="../../resources/images/sample/05-thumbnail.jpg" alt="">
                </a>
                <div class="mboard-caption">
                    <h4>한 줄로 생</h4>
                    <span style="color: ">
                        <i class="far fa-heart" style="margin-right: 10px;">10</i>
                        <i class="far fa-comment">20</i>
                    </span>
                    <p class="text-muted text-truncate">샘플 데이터 조금 많이 길게 작성 해보는데 가능할지 모르겠네 overflow 테스트</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 mboard-item">
                <a class="mboard-link" data-toggle="modal" href="#">
                    <div class="mboard-hover">
                        <div class="mboard-hover-content">
                            <i class="fas fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img class="img-fluid" src="../../resources/images/sample/06-thumbnail.jpg" alt="">
                </a>
                <div class="mboard-caption">
                    <h4 class="d-block">길게 생략</h4>
                    <ul class="float-right d-inline-block">
                        <li style="display: inline-block; margin-right: 5px">
                            <i class="far fa-heart" style="margin-right: 5px; color:#fed136;"></i>10
                        </li>
                        <li style="display: inline-block; margin-right: 5px">
                            <i class="far fa-comment" style="margin-right: 5px; color:#fed136;"></i>20
                        </li>
                        <li style="display: inline-block; margin-right: 5px">
                            <i class="fas fa-map-marked-alt" style="margin-right: 5px; color:#fed136;"></i>파리
                        </li>
                    </ul>
                    <p class="text-muted txt_post d-inline-block">샘플 데이터 조금 많이 길게 작성 해보는데 가능할지 모르겠네 overflow 테스트
                        샘플 데이터 조금 많이 길게 작성 해보는데 가능할지 모르겠네 overflow 테스트샘플 데이터 조금 많이 길게 작성 해보는데 가능할지 모르겠네 overflow 테스트
                    </p>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${!empty member}">
    <div class="col" align="right">
        <button type="button" class="btn btn-outline-warning" onclick="location.href='insertMBoard.jsp'">게시글 작성</button>
    </div>
    </c:if>
</section>

<c:import url="../common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
</body>
</html>