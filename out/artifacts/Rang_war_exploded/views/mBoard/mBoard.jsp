<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>메인 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>
    <style>
        /*.modal-backdrop {*/
        /*    z-index: -1;*/
        /*}*/
        .modal {
            /*position: absolute;*/
            top: 50px;
        }

        /* 모달 오픈시 스크롤 방지 */
        .modal-dialog{ overflow-y: initial !important }
        .modal-body{ height: 100%; overflow-y: auto; }
        body.modal-open {
            overflow: hidden;
            position:fixed;
            width: 100%;
        }
        /*댓글용*/
        .detailBox {
            width:auto;
            border:1px solid #bbb;
            margin:20px;
        }
        .titleBox {
            background-color:#fdfdfd;
            padding:10px;
        }
        .titleBox label{
            color:#444;
            margin:0;
            display:inline-block;
        }

        .commentBox {
            padding:10px;
            border-top:1px dotted #bbb;
        }
        .commentBox .form-group:first-child, .actionBox .form-group:first-child {
            width:80%;
        }
        .commentBox .form-group:nth-child(2), .actionBox .form-group:nth-child(2) {
            width:18%;
        }
        .actionBox .form-group * {
            width:100%;
        }
        .taskDescription {
            margin-top:10px;
        }
        .commentList {
            padding:0;
            list-style:none;
            max-height:200px;
            overflow:auto;
        }
        .commentList li {
            margin:0;
            margin-top:10px;
        }
        .commentList li > div {
            display:table-cell;
        }
        .commenterImage {
            width:30px;
            margin-right:5px;
            height:100%;
            float: left;
        }
        .commenterImage img {
            width:100%;
            border-radius:50%;
        }
        .commentText p {
            margin-left: 10px;
            margin:0;
        }
        .sub-text {
            color:#aaa;
            font-family:verdana;
            font-size:11px;
        }
        .actionBox {
            border-top:1px dotted #bbb;
            padding:10px;
        }
        .fa-save {
            display : none;
        }
    </style>
</head>
<body>
<c:import url="../common/nav.jsp"/>

<!-- Mboard -->
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
                    <a class="mboard-link" data-toggle="modal" onclick="modalCall(${mboard.mbno});" href="#modal1">
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
                        <div class="col-lg-6">

                            <!-- 사진 -->
                            <!-- Carousel Wrapper 태그 적용 -->
                            <div id="carousel-thumb" class="carousel carousel-fade carousel-thumbnails"
                                 data-ride="carousel" data-interval="false" >
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

                        <!-- 모달 내용 부분 -->

                        <div class="col-lg-6">
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
                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingThree4">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree4"
                                           aria-expanded="false" aria-controls="collapseThree4">
                                            <h5 class="mb-0">
                                                Collapsible Group Item #3 <i class="fas fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseThree4" class="collapse" role="tabpanel" aria-labelledby="headingThree4"
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
                                    <div class="card-header" role="tab" id="headingThree5">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree5"
                                           aria-expanded="false" aria-controls="collapseThree5">
                                            <h5 class="mb-0">
                                                Collapsible Group Item #3 <i class="fas fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseThree5" class="collapse" role="tabpanel" aria-labelledby="headingThree5"
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

<%--                            <button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>--%>
                        </div>

                        <!-- 댓글 작성 -->

                        <div class="col-12">
                            <div class="detailBox">
                                <div class="titleBox">
                                    <label>Comment Box</label>
                                    <button type="button" class="close" aria-hidden="true">&times;</button>
                                </div>
                                <div class="commentBox">

                                    <p class="taskDescription">댓글을 작성할 때는 타인을 존중하고 커뮤니티 가이드를 준수해야 합니다</p>
                                </div>
                                <div class="actionBox">
                                    <ul class="commentList">

                                        <!--  <li>
                                             <div class="commenterImage">
                                                 <img src="http://placekitten.com/50/50" />
                                             </div>
                                             <div class="commentText">
                                                 <p class="">Hello this is a test comment.</p> <span class="date sub-text">on March 5th, 2014</span>

                                             </div>
                                         </li> -->

                                    </ul>
                                    <form class="form-inline" role="form">
                                        <div class="form-group">
                                            <input type="hidden" id="mbno4Reply" name="mbno" value="" />
                                            <input class="form-control" id="myComment" type="text" placeholder="Your comments" />
                                        </div>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-default" onclick="insertComment();">Add</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!-- 댓글 끝 -->

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 모달 ajax -->
    <script>
        var loginUserNo = '${member.userNo}';

        // 이미지와 게시글 내용 불러오기
        function modalCall(mbno){
            // 캐러셀 초기화
            $('.carousel').carousel(0);

            $.ajax({
                url : '${pageContext.request.contextPath}/selectOne.mb?mbno='+ mbno,
                type : 'post',
                success : function (data) {

                    // 게시글 이미지 & 텍스트 불러오기
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
                    // 게시글 이미지 & 텍스트 불러오기 끝




                    // 댓글 불러오기
                    // 댓글 영역 초기화
                    $('.commentList').empty();

                    // 반복문으로 댓글 전부 불러오기
                    for(var i in data.clist){

                        // 댓글 한 개 담는 태그
                        var $li = $('<li id="' + data.clist[i].mcno + '">');

                        // 해당 댓글 작성자 사진
                        var $div1 = $('<div class="commenterImage">');
                        var $img = $('<img src="http://placekitten.com/50/50" />');

                        // 해당 댓글 내용
                        var $div2 = $('<div class="commentText">');
                        var $p = $('<p>');
                        var $span = $('<span class="date sub-text">');

                        // 해당 댓글 수정/삭제
                        var $div3 = $('<div><i class="fas fa-edit"></i><i class="fas fa-save"></i>&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;<i class="fas fa-reply"></i>');

                        $div1.append($img);

                        // $div2.append($p.html(anchorTagGenerator(data.clist[i].mccontent)))
                        $div2.append($p.text(data.clist[i].mccontent))
                            .append($span.text(data.clist[i].mcdate));

                        if(data.clist[i].userno == loginUserNo){
                            $li.append($div1)
                                .append($div2)
                                .append($div3);
                        } else {
                            $li.append($div1)
                                .append($div2);
                        }

                        $('.commentList').append($li);

                    }

                    // 게시글 값 넣어주기
                    $('#mbno4Reply').val(mbno);

                    icon_event();

                },
                error : function (request) {
                    console.log("ajax 확인 바람");
                    console.log(request);
                }
            })
        };

        // 댓글 추가용 메소드
        function insertComment(){

            /*
            * 에이작스를 통하여 게시글 번호와 댓글 내용을 전달하고 게시글을 db에 성공적으로 저장하였을 경우
            * 화면에 태그를 작성한다.( 화면에만 찍어둠 실제 댓글은 새로 고쳐졌을 때 가져온다.)
            * */

            $.ajax({
                url : '${pageContext.request.contextPath}/insert.mc',
                type : 'post',
                data : {
                    mbno : $('#mbno4Reply').val(),
                    content : $('#myComment').val()
                },
                success : function(data){

                    // 댓글 한 개 담는 태그
                    var $li = $('<li id="' + data + '" class="' + loginUserNo + '">');

                    // 해당 댓글 작성자 사진
                    var $div1 = $('<div class="commenterImage">');
                    var $img = $('<img src="http://placekitten.com/50/50" />');

                    // 해당 댓글 내용
                    var $div2 = $('<div class="commentText">');
                    var $p = $('<p>');
                    var $span = $('<span class="date sub-text">');

                    // 해당 댓글 수정/삭제
                    var $div3 = $('<div><i class="fas fa-edit"></i><i class="fas fa-save"></i>&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;<i class="fas fa-reply"></i>');

                    $div1.append($img);
                    // $div2.append($p.html(anchorTagGenerator($('#myComment').val())))
                    $div2.append($p.text($('#myComment').val()))
                        .append($span.text('방금 전'));

                    $li.append($div1)
                        .append($div2)
                        .append($div3);

                    $('.commentList').append($li);

                    icon_event();

                    // 댓글 초기화
                    $('#myComment').val('');
                }, error : function(){
                    alert("댓글 작성 실패!");
                }
            });

        }

        /*
            anchor 사용시
        */
        /*
       function anchorTagGenerator(str){

           if(str.startsWith('@')){
               var anchor = str.substring(str.indexOf('@'), str.indexOf(' '));
               var content = str.substring(anchor.length+1);

               return "<a href='#" + anchor.substring(1) + "'>" + anchor  + "</a> " + content;
           } else {
               return str;
           }
       } */

        // 게시글 수정 삭제 등록 아이콘 호출
        function icon_event(){

            // @ anchor 적용
            $('.commentList').children().each(function(){
                $(this).on('click', function(){
                    $('#myComment').val('@'+$(this).attr('id') +" "+ $('#myComment').val());
                });
            });

            // 수정 창 열기
            $('.fa-edit').on('click',function(){
                var $commentArea = $(this).parents('li').children('div:nth-child(2)');
                var content = $commentArea.children('p').text();

                $commentArea.empty();
                $(this).css('display', 'none');
                $(this).siblings('.fa-save').css('display', 'inline');

                var $updateForm = $('<input class="form-control" name="updateComment" type="text" value="' + content + '" />');

                $commentArea.append($updateForm);

            });

            // 수정 완료 후 저장
            $('.fa-save').on('click',function(){
                $(this).css('display', 'none');
                $(this).siblings('.fa-edit').css('display', 'inline');

                var mcno = $(this).parents('li').attr('id');
                var $commentArea = $(this).parents('li').children('div:nth-child(2)');

                // 수정된 댓글
                var updateComment = $commentArea.children('input:text').val();
                $.ajax({
                    url : '${pageContext.request.contextPath}/update.mc',
                    type : 'post',
                    data : {
                        mcno : mcno,
                        content : updateComment
                    }, success : function(data){

                        if(data == 1){

                            // 해당 댓글 내용
                            var $p = $('<p>');
                            var $span = $('<span class="date sub-text">');

                            $commentArea.empty();

                            $commentArea.append($p.text(updateComment))
                                .append($span.text('방금 전 수정됨'));
                        } else {
                            alert("에러 발생~!!");
                        }
                    }, error : function(){
                        console.log("에러 발생~!!");
                    }
                });
            });

            // 삭제
            $('.fa-trash-alt').on('click',function(){

                var mcno = $(this).parents('li').attr('id');

                $.ajax({
                    url : '${pageContext.request.contextPath}/delete.mc',
                    type : 'post',
                    data : { mcno : mcno },
                    success : function(data){
                        if(data == 1) {
                            $('li#'+mcno).remove();
                        } else {
                            alert("댓글 삭제 실패!");
                        }

                    }, error : function(){
                        alert("댓글 삭제 실패!(서버 문제)");
                    }
                });
            });
        }

    </script>

</section>

<c:import url="../common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>
</html>