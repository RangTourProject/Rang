<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>메인 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>

    <style>
        #MOVE_TOP_BTN {
            position: fixed;
            right: 2%;
            bottom: 50px;
            display: none;
            z-index: 999;
        }
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
        .commentList > li[class] {
            margin-left : 20px;
        }

        #idid {
            display: flex;
            flex-direction: column;
            justify-content: center;

        }


        .unlike {
            color : red;

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
            <%--        </div>--%>

            <!-- 게시글 조회 -->
            <%--        <div class="row">--%>
            <c:forEach var="mboard" items="${list}">

                <!--modal에 id주기 -->
                <div class="col-md-4 col-sm-6 mboard-item" id="${mboard.mbno}">

                    <a class="mboard-link" data-toggle="modal" onclick="modalCall(${mboard.mbno});" href="#modal1">
                        <div class="mboard-hover">
                            <div class="mboard-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="/Rang/resources/mBoardPhoto/${mboard.mbfile}" alt="" onerror="defaultImg(this);">
                    </a>
                    <div class="mboard-caption">
                        <h4 class="d-block">${mboard.mbtitle}</h4>
                        <ul class="float-right d-inline-block">
                            <li style="display: inline-block; margin-right: 5px">
                                <i class="far fa-heart" style="margin-right: 5px; color:#fed136;"></i>${mboard.likecount}
                            </li>
                            <li style="display: inline-block; margin-right: 5px">
                                <i class="far fa-comment" style="margin-right: 5px; color:#fed136;"></i>${mboard.commentcount}
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
            <button id="MOVE_TOP_BTN" type="button" class="btn btn-outline-warning" onclick="location.href='${pageContext.request.contextPath}/views/mBoard/insertMBoard.jsp'">게시글 작성</button>
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
                                        <img class="d-block w-100" src="" onerror="defaultImg2(this);">
                                    </div>
                                    <div id="photo2" class="carousel-item">
                                        <img class="d-block w-100" src="" onerror="defaultImg2(this);">
                                    </div>
                                    <div id="photo3" class="carousel-item">
                                        <img class="d-block w-100" src="" onerror="defaultImg2(this);">
                                    </div>
                                    <div id="photo4" class="carousel-item">
                                        <img class="d-block w-100" src="" onerror="defaultImg2(this);">
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
                            <!-- 타이틀 제목 -->



                            <br>
                            <h2 class="h2-responsive" id="modalTitle">
                                <strong></strong>
                            </h2>
                            <h4 class="h4-responsive">
                            </h4>
                            <br>

                            <!-- 아코디언 효과 -->


                            <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">



                                <ul class="list-group">


                                    <li class="list-group-item" id="Writer"> Writer </li>

                                    <li class="list-group-item" style="height : 80px; vertical-align:top;" id="idid" > </li>
                                    <li class="list-group-item" style="height : 100px; vertical-align:top; overflow:scroll; " id="mbcontent"> mbcontent </li>

                                    <li class="list-group-item" style="overflow:scroll;" id="HashTag"> hashTag </li>
                                    <li class="list-group-item" id="mbdate"> 날짜 </li>



                                </ul>

                                <br/>

                                <!--            <ul class="list-group list-group-flush">

                                           <li class="list-group-item" id="mbdate"></li>

                                           </ul> -->

                                <br/>



                                <!-- 좋아요를 누른 상태인지 c:if로 구별해 색상을 바꾸기 위해서 나누었습니다  -->
                                <c:if test="${result.myLikeCheck eq 0}">
                                    <button id="mbLike" type="button" class="btn btn-secondary btn-myLike" onclick="mylike();"><i class="fas fa-heart"></i></button>
                                </c:if><c:if test="${result.myLikeCheck ne 0}">
                                <button id="mbLike" type="button" class="btn btn-secondary btn-myLike unLike" onclick="mylike();" ><i class="fas fa-heart"></i></button>
                            </c:if>

                                <input type="hidden" id="mbnoVal" value=""/>

                                <!-- 좋아요 개수 -->
                                <!-- 현재 목록을 가지고온상태, 모달을 가지고 왔을때 mbno가 생겨야함 -->
                                <input type="text" class="col-2" id="mbcount" value="" />

                                <!-- 게시글 수정 및 삭제 -->
                                <div>
                                    <%--                                            <c:if test="${member.userNo ne MBoard.userno}">--%>
                                    <%--                                             ${member.userNo ne MBoard.userno}--%>
                                    <button id="updateBoard" type="button" class="btn btn-secondary" onclick="updateBoard();">게시글 수정</button>
                                    <button id="deleteBoard" type="button" class="btn btn-secondary" onclick="deleteBoard();">게시글 삭제</button>
                                    <%--                                            </c:if>--%>
                                </div>


                                <!--  <button id="deleteBoard" type="button" class="btn btn-secondary" data-dismiss="modal" value="" onclick="deleteBoard(this);">게시글 삭제</button> -->



                                <!-- 이중모달 공사중 -->
                                <!-- Small modal -->
                                <!--  data target 에서 이름을 이미 줌  -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".likelist-modal-sm" onclick="likelist();">Like list</button>



                                <!-- List group -->

                                <!-- 아코디언 card-->



                                <!-- Accordion card -->

                            </div>
                            <!-- Accordion wrapper -->

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

                                    <!-- 댓글 리스트 영역 -->
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

                                    <!-- 댓글 입력 창 -->
                                    <form class="form-inline" role="form">
                                        <div class="form-group">
                                            <input type="hidden" id="mbno4Reply" name="mbno" value="" />
                                            <input type="hidden" id="clevelCo" name="clevelCo" value="0" />
                                            <input type="text" class="form-control" id="myComment" placeholder="Your comments" />
                                            <input type="hidden" >
                                        </div>

                                        <!--  댓글 작성 버튼  -->
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

    <!-- 이중모달 공사중 -->
    <!-- Small modal -->

    <div class="modal fade likelist-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">좋아요 list</h5>
                </div>

                <div class="modal-body" id="likeList">
                </div>

                <div class="modal-footer">

                    <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                </div>
            </div>
        </div>
    </div>

     <!-- 스크롤 -->

    <script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

    <!-- 이중모달 공사중 -->



    <!-- 모달 ajax -->



    <script>

        // 무한스크롤 각 페이지 계산할 전역변수
        var currentPage = 1;

        // 스크롤이 내려가는것을 감지하는 함수 (공식)
        $(function(){
            window.onscroll = function(){
                var pageEnd = $('body').get(0).scrollHeight - $(window).scrollTop() /*- $(window).height()*/;

                if (pageEnd <= 696){
                    $.ajax({
                        url : "${pageContext.request.contextPath}/InfinityPaging.mb",
                        type : "get",
                        data : {currentPage : ++currentPage },
                        success : function(data) {

                            if ( data.length == 0 ) {
                                alert("더이상 가져올 글이 없습니다.");

                            } else {
                                for(var i in data) {

                                    $('#mboard').find('.row').append('<div class="col-md-4 col-sm-6 mboard-item" id="' + data[i].mbno + '">'
                                        + '<a class="mboard-link" data-toggle="modal" onclick="modalCall(' + data[i].mbno + ');" href="#modal1">'
                                        + ' <div class="mboard-hover"> '
                                        +'        <div class="mboard-hover-content">'
                                        +'           <i class="fas fa-plus fa-3x"></i> '
                                        +'        </div>'
                                        +'     </div>'
                                        +'   <img class="img-fluid" src="/Rang/resources/mBoardPhoto/' + data[i].mbfile +'" alt="" onerror="defaultImg(this);">'
                                        +' </a>'
                                        +' <div class="mboard-caption">'
                                        +'   <h4 class="d-block">' + data[i].mbtitle + '</h4>'
                                        +'   <ul class="float-right d-inline-block">'
                                        +'      <li style="display: inline-block; margin-right: 5px">'
                                        +'          <i class="far fa-heart" style="margin-right: 5px; color:#fed136;"></i>' + data[i].likeCount // 이부분 수정 하세요
                                        +'       </li>'
                                        +'       <li style="display: inline-block; margin-right: 5px">'
                                        +'          <i class="far fa-comment" style="margin-right: 5px; color:#fed136;"></i>' +data[i].commentCount // 이부분 수정 하세요
                                        +'       </li>'
                                        +'      <li style="display: inline-block; margin-right: 5px">'
                                        +'          <i class="fas fa-map-marked-alt" style="margin-right: 5px; color:#fed136;"></i>' + data[i].locationname
                                        +'       </li>'
                                        +'   </ul>'
                                        +'   <p class="text-muted txt_post d-inline-block">' + data[i].mbcontent
                                        +'    </p>'
                                        +'</div>'
                                        +'</div>');

                                }
                            }
                        }, error : function(data) {
                            console.log(data);
                        }
                    });
                }
            }
        });

        loginUserNo = '${member.userNo}';

        // 리스트 기본 이미지 불러오기
        function defaultImg(obj){
            $(obj).attr('src','${pageContext.request.contextPath}/resources/images/noimage2.png');
        }

        // 모달 기본 이미지
        function defaultImg2(obj){
            $(obj).attr('src','${pageContext.request.contextPath}/resources/images/noimage.jpeg');
        }

        // 이미지와 게시글 내용 불러오기
        function modalCall(mbno){
            // 캐러셀 초기화
            $('.carousel').carousel(0);

            $.ajax({
                url : '${pageContext.request.contextPath}/selectOne.mb?mbno='+ mbno,
                type : 'post',
                success : function (data) {

                    console.log(data);

                    // 게시글 이미지 & 텍스트 불러오기
                    var $title = $('#modalTitle > strong');
                    /*   	var $location = $('#locationName').text(data.mBoard.locationname); */
                    var $photo1 = $('#photo1 > img');
                    var $photo2 = $('#photo2 > img');
                    var $photo3 = $('#photo3 > img');
                    var $photo4 = $('#photo4 > img');

                    var $Writer = $('#Writer').text(data.mBoard.writer);
                    var $mbcontent = $('#mbcontent').text(data.mBoard.mbcontent);
                    var $HashTag = $('#HashTag').text(data.mBoard.hashtag);
                    var $mbdate = $('#mbdate').text(data.mBoard.mbdate);


                    // 1번째 : 유저닉네임, location

                    $('#idid').empty();

                    if (data != 0) {

                        $('#idid').append( /* data.mBoard.writer + "<br>" +   */'Location : ' + data.mBoard.locationname + "<br>" + 'Cost : ' + data.mBoard.totalcost + ' 원' );

                    } else {

                    };


                    /*

                     // 게시글 수정 & 삭제버튼 안보이게
                    if(loginUserNo == data.mBoard.userNo){

                           $('#updateBoard').append;
                           $('#deleteBoard');

                    } else {

                        $('#updateBoard').hidden.append;
                             $('#deleteBoard').hidden;

                    };



  var button1 = $('<button id="updateBoard" type="button" class="btn btn-secondary" onclick="updateBoard();">'게시글 수정'</button>');
    var button2 = $('<button id="deleteBoard" type="button" class="btn btn-secondary" onclick="deleteBoard();">'게시글 삭제'</button>');
    */

                    var $likeCount = $('#mbcount');
                    $likeCount.val(data.likeCount);
                    //console.log("좋아요 수 : " + data.likeCount );

                    // like

                    // 값 저장해두기
                    var $updateBoard = $('#updateBoard');
                    var $mboardLike = $('#mboardLike');
                    var $deleteBoard = $('#deleteBoard');
                    $('#deleteBoard').val(mbno);
                    // var $mbLike = $('#mbLike');
                    $('#mbnoVal').val(mbno);
                    $('#likeList').val(mbno);





                    $photo1.attr('src', "");
                    $photo2.attr('src', "");
                    $photo3.attr('src', "");
                    $photo4.attr('src', "");

                    $title.text(data.mBoard.mbtitle);
                    // $location.html(data.mBoard.locationname + "<i class=\"fas fa-angle-down rotate-icon\"></i>");
                    $updateBoard.attr('onclick', "updateBoard(" + data.mBoard.mbno + ");");
                    $deleteBoard.attr('onclick', "deleteBoard(" + data.mBoard.mbno + ");");
                    $mboardLike.attr('onclick', "mboardLike(" + data.mBoard.mbno + ");");

                    //onclick="updateBoard();
                    for(var i in data.mAttachment){
                        $photo1.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[0].mchangeName);
                        $photo2.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[1].mchangeName);
                        $photo3.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[2].mchangeName);
                        $photo4.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[3].mchangeName);
                    }
                    // 게시글 이미지 & 텍스트 불러오기 끝


                    if(loginUserNo != data.mBoard.userno) {
                        $('#updateBoard').css('display', 'none');
                        $('#deleteBoard').css('display', 'none');
                    }

                    // 댓글 불러오기
                    // 댓글 초기화
                    $('.commentList').empty();

                    for(var i in data.clist){

                        // 댓글 한 개 담는 태그
                        var $li;

                        if (data.clist[i].mclevel == 0) {
                            $li = $('<li id="' + data.clist[i].mcno + '">' + data.clist[i].nickName);


                        } else {
                            $li = $('<li id="' + data.clist[i].mcno + '" class="'  + data.clist[i].nickName + '">');
                        }

                        // 해당 댓글 작성자 사진
                        var $div1 = $('<div class="commenterImage">');
                        var $img = $('<img src="http://placekitten.com/50/50" />');

                        // 해당 댓글 내용
                        var $div2 = $('<div class="commentText">');
                        var $p = $('<p>');
                        var $span = $('<span class="date sub-text">');

                        // 해당 댓글 수정/삭제
                        var $div3 = $('<div><i class="fas fa-edit"></i><i class="fas fa-save"></i>&nbsp;<i class="fas fa-trash-alt"></i>');


                        $div1.append($img);

                        $div2.append($p.html(anchorTagGenerator(data.clist[i].mccontent)));
                        $div2.append($p.text(data.clist[i].mccontent))
                            .append($span.text(data.clist[i].nickName + " : " + data.clist[i].mcdate));

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
                    content : $('#myComment').val(),
                    mclevel : $('#clevelCo').val()
                },
                success : function(data){

                    console.log(data);
                    // var a; : 자바스트립트 변수. 흔히 아는 방식으로 스크립트만 사용가능
                    // var $a; : 제이쿼리에서 사용하는 내장함수들을 모두 사용O
                    //         .css(), .hide(), .show()등 모든 스크립트 사용이 가능함

                    // li태그로 클래스주고 정렬(은 자동으로 DAO에서 하게끔)
                    // 그냥 lv만 따로 빼서 묶기


                    // 댓글 한 개 담는 태그
                    var $li;

                    var $appender;

                    // ref_mcno 가 없으므로 주석하고 새로 갱신
                    // if (ref_mcno == '' || ref_mcno == undefined ) {
                    // $li = $('<li id="' + data + '" class= originCo"' + loginUserNo + '">');
                    if($('#clevelCo').val() == 0) {
                        $li = $('<li id="' + data + '">');
                        $appender = $('.commentList');

                    } else {
                        // 참조한 댓글의 레벨 답댓글
                        //var clevel = Number($(obj).siblings('input[name=clevel]').val()) +1
                        // $li = $('<li class = "'  + (Number($(obj).siblings('input[name=clevel]').val()) +1) + '>');
                        $li = $('<li id="' + data + '" class = "'  + $('#clevelCo').val() + '">');
                        var str = $('#myComment').val();
                        var anchor = str.substring(str.indexOf('@'), str.indexOf(' '));
                        $appender = $('#'+anchor.substring(1));
                    }



                    // 주석부분1
                    // 해당 댓글 작성자 사진
                    var $div1 = $('<div class="commenterImage">');
                    var $img = $('<img src="http://placekitten.com/50/50" />');


                    // 주석 부분2
                    // 해당 댓글 내용
                    var $div2 = $('<div class="commentText">');
                    var $p = $('<p>');
                    var $span = $('<span class="date sub-text">');

                    // 해당 댓글 수정/삭제
                    var $div3 = $('<div><i class="fas fa-edit"></i><i class="fas fa-save"></i>&nbsp;<i class="fas fa-trash-alt"></i>');

                    // append() 현재 선택된 문서요소의 마지막 자식으로 새로운 문서 요소를 추가
                    // insert() 현재 선택된 문서요소의 지정된 요소 앞에 새로운 문서 요소를 추가


                    $div1.append($img);

                    // 해당 댓글유저
                    $div2.append($p.html(anchorTagGenerator($('#myComment').val())))
                    $div2.append($p.text($('#myComment').val()))
                        .append($span.text('방금 전'));

                    $li.append($div1)
                        .append($div2)
                        .append($div3);

                    if($('#clevelCo').val() == 0){
                        /*       console.log($li);
                              console.log($appender); */
                        $appender.append($li);
                    } else {
                        /*      console.log($li);
                             console.log($appender); */
                        $li.insertAfter($appender);
                    }


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

        function anchorTagGenerator(str){

            if(str.startsWith('@')){
                var anchor = str.substring(str.indexOf('@'), str.indexOf(' '));
                var content = str.substring(anchor.length+1);

                return "<a href='#" + anchor.substring(1) + "'>" + anchor  + "</a> " + content;
            } else {
                return str;
            }
        }

        // 댓글 수정 및 삭제 등록 아이콘 호출
        function icon_event(){

            // @ anchor 적용
            // clevel 클래스 값에 + 1 해주기
            $('.commentList').children().each(function(){

                $(this).on('click', function(){
                    $('#myComment').val("");
                    $('#myComment').val('@'+$(this).attr('id') +" ");
                    console.log($(this).attr('class'));
                    if($(this).attr('class') == undefined) {
                        $('#clevelCo').val(1);
                    } else {
                        $('#clevelCo').val(parseInt($(this).attr('class')) + 1);
                    }

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

            // 댓글삭제
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




        // 게시글 수정
        function updateBoard(mbno) {

            location.href = "${pageContext.request.contextPath}/mUpView.mb?mbno="+mbno;
        }

        // 게시글 삭제
        function deleteBoard(mbno){

            location.href = "${pageContext.request.contextPath}/delete.mb?mbno="+mbno;


            /*
            // 게시글 삭제시 참조할 번호
            var mbno = $(obj).val();

            $.ajax({
              url : "delete.mb",
              type : "post",
              data : {mbno : mbno},
              success : function(data) {

                  if (data > 0 ) {

                      alert ("게시글이 삭제되었습니다.");
                      $('div#'+mbno).remove();

                  } else {

                      alert("failed");
                  }

              },error : function(){
                   alert("error 발생")
              }

            });*/
        }


        // 메인 게시글 좋아요 스크립트
        function mylike(){

            $.ajax({
                url : '${pageContext.request.contextPath}/like.mb',
                type : 'post',
                data : {memno : '${member.userNo}',
                    mbno : $('#mbnoVal').val()},
                success : function(data) {
                    if(data.myLike == 0){
                        // 좋아요 성공
                        console.log(data);
                        alert("좋아요 성공 !");
                        $('.btn-myLike').addClass('unLike');
                        $('#mbcount').val(parseInt($('#mbcount').val()) + 1);

                    } else if(data.myLike == 1) {
                        // 좋아요 취소
                        alert("좋아요 취소 !");
                        $('.btn-myLike').removeClass('unLike');
                        $('#mbcount').val(parseInt($('#mbcount').val()) - 1);
                    }
                }, error : function(){
                    alert("좋아요 실패");
                }
            });
        }


        // 좋아요 누른 회원 list
        function likelist(){


            $.ajax({

                url : '${pageContext.request.contextPath}/likeList.mb',
                type : 'post',
                data : {

                    mbno : $('#mbnoVal').val()

                }, success : function(data) {

                    console.log(data);

                    $('#likeList').empty();

                    for(var i in data){

                        // 회원 한명 닉네임 담는 태그
                        var $li;

                        if (data != 0) {
                            $li = $('<li style="list-style : none; ">'+data[i].nickName+'</li> <br>');

                            $('#likeList').append($li);

                            // 데이터가 없으면 "좋아요를 누른 회원이 없습니다"
                        } else {
                            alert("아직 좋아요가 없네요ㅠ_");
                        }

                    }
                }
            });
        }
    </script>

    <script>
        $(function() {
            $(window).scroll(function() {
                if ($(this).scrollTop() > 500) {
                    $('#MOVE_TOP_BTN').fadeIn();
                } else {
                    $('#MOVE_TOP_BTN').fadeOut();
                }
            });

            $("#MOVE_TOP_BTN").click(function() {
                $('html, body').animate({
                    scrollTop : 0
                }, 400);
                return false;
            });
        });
    </script>

</section>

<c:import url="../common/footer.jsp"/>

<!— 스크롤 관련 스크립트 —>
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>
</html>