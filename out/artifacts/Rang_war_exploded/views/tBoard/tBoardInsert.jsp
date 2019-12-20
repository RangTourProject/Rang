
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시글 작성</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" href="../../resources/css/singUp.css">
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
    <div class="container">
        <div class="ml-auto">
            <div class="form-area">
                <form role="form"
                 action="${pageContext.request.contextPath }/insert.tb" 
               method="post" enctype="multipart/form-data">
                    <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">게시글 작성</h3>
                    <!-- 사진 -->
                    <div class="col-auto register-left">
                        <!-- 사진1 -->
                        <div class="d-inline-block align-top" style="margin-bottom: 10px">
                            <div class="image-container d-inline-block">
                                <img src="${pageContext.request.contextPath}/resources/images/noimage.jpeg" id="imgProfile1" style="width: 200px; height: 200px" class="img-thumbnail" />
                                <div class="middle">
                                    <input type="button" class="btn btn-secondary" id="btnChangePicture1" value="사진 등록">
                                    <input type="file" style="display: none;" id="profilePicture1" name="pPhoto">
                                </div>
                            </div>
                            <div class="ml-auto">
                                <input type="button" class="btn btn-primary d-none" id="btnDiscard1" value="사진 제거" />
                            </div>
                        </div>
                        
                    </div>

                    <!-- 텍스트 -->
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="userNo" name="userNo" placeholder="유저번호" value="${member.userNo}" >
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="bTitle" name="tbTitle" placeholder="제목" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="place" name="place" placeholder="장소(ex.도시, 지역, 국가)">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="writer" name="writer" value="${member.nickName}" placeholder="작성자" >
                    </div>
                    <div class="form-group">
                        <input type="number" min="1" max="8" class="form-control" id="maxmember" name="maxmember" placeholder="모집인원(최대 8명)">
                    </div>
                   
                    
                    
                   <!--  <div class="form-group">
							<h6>모집인원</h6>
							<select id="maxmember" name="maxmember">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
							</select>
                    </div> -->
                    
                    
                <!--     <div class="form-group">
                        <input type="text" class="form-control" id="totalCost" name="totalCost" placeholder="비용" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="hashTag" name="hashTag" placeholder="#태그" required>
                    </div> -->
                    
                    <div class="form-group">
                        <textarea class="form-control" type="textarea" id="tbcontent" name="tbContent" placeholder="글 내용" maxlength="1000" rows="7"></textarea>
                        <span class="help-block"><p id="characterLeft" class="help-block ">더 이상 작성할 수 없습니다.</p></span>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="submit" name="submit" class="btn btn-primary float-right">작성완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 최대글 작성 한도 스크립트 -->
    <script>
        $(document).ready(function(){
            $('#characterLeft').text('1000 자 작성가능');
            $('#tbcontent').keydown(function () {
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

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imgProfile1').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

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
                $('#btnChangePicture1').attr('value', 'Change');
                $('#btnDiscard1').addClass('d-none');
                $('#imgProfile1').attr('src', $imgSrc);
                $('#profilePicture1').val('');
                // }
            });
        });
        
                // }

       
    </script>

</section>