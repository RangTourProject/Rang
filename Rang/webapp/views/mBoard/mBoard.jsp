<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>메인 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>
    <style>
        .modal-backdrop {
            z-index: -1;
        }
        .modal {
            position: absolute;
            top: 100px;
        }
    </style>
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

        <!-- 게시글 조회 -->
        <div class="row">
            <c:forEach var="mboard" items="${list}">
                <div class="col-md-4 col-sm-6 mboard-item">
                    <a class="mboard-link" data-toggle="modal" onclick="test(${mboard.mbno});" href="#modal1">
                        <div class="mboard-hover">
                            <div class="mboard-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="/Rang/resources/mBoardPhoto/${mboard.mbfile}" alt="">
                    </a>
                    <div class="mboard-caption">
                        <h4 class="d-block">${mboard.mbtitle}</h4>
                        <ul class="float-right d-inline-block">
                            <li style="display: inline-block; margin-right: 5px">
                                <i class="far fa-heart" style="margin-right: 5px; color:#fed136;"></i>준비
                            </li>
                            <li style="display: inline-block; margin-right: 5px">
                                <i class="far fa-comment" style="margin-right: 5px; color:#fed136;"></i>준비중
                            </li>
                            <li style="display: inline-block; margin-right: 5px">
                                <i class="fas fa-map-marked-alt" style="margin-right: 5px; color:#fed136;"></i>${mboard.locationname}
                            </li>
                        </ul>
                        <p class="text-muted txt_post d-inline-block">${mboard.mbcontent}
                        </p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 글작성 -->
    <c:if test="${!empty member}">
    <div class="col" align="right">
        <button type="button" class="btn btn-outline-warning" onclick="location.href='${pageContext.request.contextPath}/views/mBoard/insertMBoard.jsp'">게시글 작성</button>
    </div>
    </c:if>


</section>


<!-- 모달 -->
<section>
    <!-- 모달 선언 부분 -->
    <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-5">

                            <!-- Carousel Wrapper 태그 적용 -->
                            <div id="carousel-thumb" class="carousel carousel-fade carousel-thumbnails"
                                 data-ride="carousel">
                                <!-- 슬라이드 효과 -->
                                <div class="carousel-inner" role="listbox">
                                    <!-- 첫 페이지 -->
                                    <div id="photo1" class="carousel-item active">
                                        <img class="d-block w-100" src="">
                                    </div>
                                    <div id="photo2" class="carousel-item">
                                        <img class="d-block w-100" src="">
                                    </div>
                                    <div id="photo3" class="carousel-item">
                                        <img class="d-block w-100" src="">
                                    </div>
                                    <div id="photo4" class="carousel-item">
                                        <img class="d-block w-100" src="">
                                    </div>
                                </div>
                                <!-- 좌 우 이동 컨트롤러 -->
                                <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                                <!--/.Controls-->
                                <!-- 아래 이동 버튼 -->
<%--                                <ol class="carousel-indicators">--%>
<%--                                    <li data-target="#carousel-thumb" data-slide-to="0" class="active">--%>
<%--                                        <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(23).jpg" width="60">--%>
<%--                                    </li>--%>
<%--                                    <li data-target="#carousel-thumb" data-slide-to="1">--%>
<%--                                        <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(24).jpg" width="60">--%>
<%--                                    </li>--%>
<%--                                    <li data-target="#carousel-thumb" data-slide-to="2">--%>
<%--                                        <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/img%20(25).jpg" width="60">--%>
<%--                                    </li>--%>
<%--                                </ol>--%>
                            </div>
                        </div>
                        <div class="col-lg-7">

                            <!-- 타이트 제목 -->
                            <h2 class="h2-responsive" id="modalTitle">
                                <strong></strong>
                            </h2>
                            <h4 class="h4-responsive">
                            </h4>

                            <!-- 아코디언 효과 -->
                            <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                                <!-- 아코디언 card -->
                                <div class="card">

                                    <!-- 1번째 아코디언 헤더 -->
                                    <div class="card-header" role="tab" id="locationName">
                                        <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
                                           aria-controls="collapseOne1">
                                            <h5 class="mb-0">
                                                <!-- 소 제목 1-->
                                                <i class="fas fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                         data-parent="#accordionEx">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                            squid. 3
                                            wolf moon officia aute,
                                            non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                        </div>
                                    </div>

                                </div>
                                <!-- Accordion card -->

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingTwo2">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2"
                                           aria-expanded="false" aria-controls="collapseTwo2">
                                            <h5 class="mb-0">
                                                Collapsible Group Item #2 <i class="fas fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2"
                                         data-parent="#accordionEx">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                            squid. 3
                                            wolf moon officia aute,
                                            non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                        </div>
                                    </div>

                                </div>
                                <!-- Accordion card -->

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingThree3">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree3"
                                           aria-expanded="false" aria-controls="collapseThree3">
                                            <h5 class="mb-0">
                                                Collapsible Group Item #3 <i class="fas fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3"
                                         data-parent="#accordionEx">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                            squid. 3
                                            wolf moon officia aute,
                                            non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                        </div>
                                    </div>

                                </div>
                                <!-- Accordion card -->

                            </div>
                            <!-- Accordion wrapper -->

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ajax -->
    <script>
        function test(mbno){
            $.ajax({
                url : '${pageContext.request.contextPath}/selectOne.mb?mbno='+ mbno,
                type : 'post',
                success : function (data) {

                    var $title = $('#modalTitle > strong');
                    var $location = $('#locationName > a > h5');
                    var $photo1 = $('#photo1 > img');
                    var $photo2 = $('#photo2 > img');
                    var $photo3 = $('#photo3 > img');
                    var $photo4 = $('#photo4 > img');

                    $photo1.attr('src', "");
                    $photo2.attr('src', "");
                    $photo3.attr('src', "");
                    $photo4.attr('src', "");

                    $title.text(data.mBoard.mbtitle);
                    $location.html(data.mBoard.locationname + "<i class=\"fas fa-angle-down rotate-icon\"></i>");

                    for(var i in data.mAttachment){
                        $photo1.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[0].mchangeName);
                        $photo2.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[1].mchangeName);
                        $photo3.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[2].mchangeName);
                        $photo4.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[3].mchangeName);

                    }

                },
                error : function (request) {
                    console.log("ajax 확인 바람");
                    console.log(request);
                }
            })
        };
    </script>

</section>

<c:import url="../common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
</body>
</html>