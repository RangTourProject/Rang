<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시글 작성</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/singUp.css">

    <style>
        .red{
            color:red;
        }
        .form-area
        {
            background-color: #FAFAFA;
            padding: 10px 40px 60px;
            margin: 10px 0px 60px;
            border: 1px solid GREY;
        }
    </style>
</head>
<body>
<c:import url="../common/nav.jsp"/>

<section>
    <c:url var="path" value="resources/mBoardPhoto/" />

    <div class="container">
        <div class="ml-auto">
            <div class="form-area">
                <form role="form" action="${pageContext.request.contextPath}/update.mb" method="post" enctype="multipart/form-data">
                    <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">게시글 수장</h3>
                    <!-- 사진 -->
                    <div class="col-auto register-left">
                        <!-- 사진1 -->
                        <div class="d-inline-block align-top" style="margin-bottom: 10px">
                            <div class="image-container d-inline-block">
                                <img src="${path}${mAttachment[0].mchangeName}" id="imgProfile1" style="width: 200px; height: 200px" class="img-thumbnail" />
                                <div class="middle">
                                    <input type="button" class="btn btn-secondary" id="btnChangePicture1" value="사진 변경">
                                    <input type="file" style="display: none;" id="profilePicture1" name="img1" >
                                </div>
                            </div>
                            <div class="ml-auto">
                                <input type="button" class="btn btn-primary d-none" id="btnDiscard1" value="사진 제거" />
                            </div>
                        </div>

                        <!-- 사진2 -->
                        <div class="d-inline-block align-top" style="margin-bottom: 10px">
                            <div class="image-container d-inline-block">
                                <img src="${path}${mAttachment[1].mchangeName}" id="imgProfile2" style="width: 200px; height: 200px" class="img-thumbnail" />
                                <div class="middle">
                                    <input type="button" class="btn btn-secondary" id="btnChangePicture2" value="사진 변경">
                                    <input type="file" style="display: none;" id="profilePicture2" name="img2" >
                                </div>
                            </div>
                            <div class="ml-auto">
                                <input type="button" class="btn btn-primary d-none" id="btnDiscard2" value="사진 제거" />
                            </div>
                        </div>

                        <!-- 사진3 -->
                        <div class="d-inline-block align-top" style="margin-bottom: 10px">
                            <div class="image-container d-inline-block">
                                <img src="${path}${mAttachment[2].mchangeName}" id="imgProfile3" style="width: 200px; height: 200px" class="img-thumbnail" />
                                <div class="middle">
                                    <input type="button" class="btn btn-secondary" id="btnChangePicture3" value="사진 변경">
                                    <input type="file" style="display: none;" id="profilePicture3" name="img3" >
                                </div>
                            </div>
                            <div class="ml-auto">
                                <input type="button" class="btn btn-primary d-none" id="btnDiscard3" value="사진 제거" />
                            </div>
                        </div>

                        <!-- 사진4 -->
                        <div class="d-inline-block align-top" style="margin-bottom: 10px">
                            <div class="image-container d-inline-block">
                                <img src="${path}${mAttachment[3].mchangeName}" id="imgProfile4" style="width: 200px; height: 200px" class="img-thumbnail" />
                                <div class="middle">
                                    <input type="button" class="btn btn-secondary" id="btnChangePicture4" value="사진 변경">
                                    <input type="file" style="display: none;" id="profilePicture4" name="img4" >
                                </div>
                            </div>
                            <div class="ml-auto">
                                <input type="button" class="btn btn-primary d-none" id="btnDiscard4" value="사진 제거" />
                            </div>
                        </div>
                    </div>

                    <!-- 텍스트 -->
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="mbno" name="mbno" placeholder="" value="${mBoard.mbno}" required>
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="userNo" name="userNo" value="${member.userNo}" style="display: none">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="bTitle" name="mbtitle" placeholder="" value="${mBoard.mbtitle}" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="writer" name="writer" value="${member.nickName}" style="display: none">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="locationName" name="locationName" placeholder="여행지" value="${mBoard.locationname}" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="totalCost" name="totalCost" placeholder="비용" value="${mBoard.totalcost}" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="hashTag" name="hashTag" placeholder="#태그" value="${mBoard.hashtag}" required>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" type="textarea" id="mbcontent" name="mbcontent" placeholder="글 내용" maxlength="1000" rows="7">${mBoard.mbcontent}
                        </textarea>
                        <span class="help-block"><p id="characterLeft" class="help-block ">더 이상 작성할 수 없습니다.</p></span>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="submit" name="submit" class="btn btn-primary float-right">수정완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 최대글 작성 한도 스크립트 -->
    <script>
        $(document).ready(function(){
            $('#characterLeft').text('1000 자 작성가능');
            $('#mbcontent').keydown(function () {
                var max = 1000;
                var len = $(this).val().length;
                if (len >= max) {
                    $('#characterLeft').text('더 이상 작성할 수 없습니다.');
                    $('#characterLeft').addClass('red');
                    $('#btnSubmit').addClass('disabled');
                }
                else {
                    var ch = max - len;
                    $('#characterLeft').text(ch + ' 자 작성가능');
                    $('#btnSubmit').removeClass('disabled');
                    $('#characterLeft').removeClass('red');
                }
            });
        });
    </script>

    <!-- 이미지 관련 스크립트 -->
    <script>
        <%-- 사진 1--%>
        $(function () {

            $imgSrc = $('#imgProfile1').attr('src');
            <!-- 이미지 미리보기 스크립트 -->
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imgProfile1').attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            <!-- 이미지 변경시 효과 -->
            $('#btnChangePicture1').on('click', function () {
                if (!$('#btnChangePicture1').hasClass('changing')) {
                    $('#profilePicture1').click();
                }
                // else {
                //     // change
                // }
            });

            $('#profilePicture1').on('change', function () {
                readURL(this);
                $('#btnChangePicture1').addClass('changing');
                $('#btnChangePicture1').attr('value', '등록 완료');
                $('#btnDiscard1').removeClass('d-none');
                // $('#imgProfile').attr('src', '');
            });
            $('#btnDiscard1').on('click', function () {
                // if ($('#btnDiscard').hasClass('d-none')) {
                $('#btnChangePicture1').removeClass('changing');
                $('#btnChangePicture1').attr('value', '사진 등록');
                $('#btnDiscard1').addClass('d-none');
                $('#imgProfile1').attr('src', "");
                $('#profilePicture1').val('');
                // }
            });
        });

        <%-- 사진 2 --%>
        $(function () {

            $imgSrc = $('#imgProfile2').attr('src');
            <!-- 이미지 미리보기 스크립트 -->
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imgProfile2').attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            <!-- 이미지 변경시 효과 -->
            $('#btnChangePicture2').on('click', function () {
                if (!$('#btnChangePicture2').hasClass('changing')) {
                    $('#profilePicture2').click();
                }
                // else {
                //     // change
                // }
            });

            $('#profilePicture2').on('change', function () {
                readURL(this);
                $('#btnChangePicture2').addClass('changing');
                $('#btnChangePicture2').attr('value', '등록 완료');
                $('#btnDiscard2').removeClass('d-none');
                // $('#imgProfile').attr('src', '');
            });

            $('#btnDiscard2').on('click', function () {
                // if ($('#btnDiscard').hasClass('d-none')) {
                $('#btnChangePicture2').removeClass('changing');
                $('#btnChangePicture2').attr('value', '사진 등록');
                $('#btnDiscard2').addClass('d-none');
                $('#imgProfile2').attr('src', "");
                $('#profilePicture2').val('');
                // }
            });
        });

        <%-- 사진 3 --%>
        $(function () {

            $imgSrc = $('#imgProfile3').attr('src');
            <!-- 이미지 미리보기 스크립트 -->
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imgProfile3').attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            <!-- 이미지 변경시 효과 -->
            $('#btnChangePicture3').on('click', function () {
                if (!$('#btnChangePicture3').hasClass('changing')) {
                    $('#profilePicture3').click();
                }
                // else {
                //     // change
                // }
            });

            $('#profilePicture3').on('change', function () {
                readURL(this);
                $('#btnChangePicture3').addClass('changing');
                $('#btnChangePicture3').attr('value', '등록 완료');
                $('#btnDiscard3').removeClass('d-none');
                // $('#imgProfile').attr('src', '');
            });
            $('#btnDiscard3').on('click', function () {
                // if ($('#btnDiscard').hasClass('d-none')) {
                $('#btnChangePicture3').removeClass('changing');
                $('#btnChangePicture3').attr('value', '사진 등록');
                $('#btnDiscard3').addClass('d-none');
                $('#imgProfile3').attr('src', "");
                $('#profilePicture3').val('');
                // }
            });
        });

        <%-- 사진 4 --%>
        $(function () {

            $imgSrc = $('#imgProfile4').attr('src');
            <!-- 이미지 미리보기 스크립트 -->
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imgProfile4').attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            <!-- 이미지 변경시 효과 -->
            $('#btnChangePicture4').on('click', function () {
                if (!$('#btnChangePicture4').hasClass('changing')) {
                    $('#profilePicture4').click();
                }
                // else {
                //     // change
                // }
            });

            $('#profilePicture4').on('change', function () {
                readURL(this);
                $('#btnChangePicture4').addClass('changing');
                $('#btnChangePicture4').attr('value', '등록 완료');
                $('#btnDiscard4').removeClass('d-none');
                // $('#imgProfile').attr('src', '');
            });

            $('#btnDiscard4').on('click', function () {
                // if ($('#btnDiscard').hasClass('d-none')) {
                $('#btnChangePicture4').removeClass('changing');
                $('#btnChangePicture4').attr('value', '사진 등록');
                $('#btnDiscard4').addClass('d-none');
                $('#imgProfile4').attr('src', "");
                $('#profilePicture4').val('');
                // }
            });
        });
    </script>

</section>

<c:import url="../common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>
</html>