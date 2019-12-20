<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>회원정보수정</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" href="../../resources/css/singUp.css">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<c:import url="../common/nav.jsp"/>

<section>
    <div class="container register">
        <form action="${pageContext.request.contextPath}/update.me" method="post">
            <div class="row">
                <!-- 왼쪽 화면 프로필 사진과 간단한 설명등 -->
                <div class="col-md-3 register-left">
<%--                    <div class="image-container">--%>
<%--                        <img src="http://placehold.it/150x150" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />--%>
<%--                        <div class="middle">--%>
<%--                            <input type="button" class="btn btn-secondary" id="btnChangePicture" value="사진 등록">--%>
<%--                            <input type="file" style="display: none;" id="profilePicture" name="pPhoto">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="ml-auto">--%>
<%--                        <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="사진 제거" />--%>
<%--                    </div>--%>
                    <br>
                    <h3>수정페이지입니당.</h3>
                    <p>간단한 설명</p>
                </div>

                <div class="col-md-9 register-right">

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">정보수정</h3>

                            <div class="row register-form">
    <%--                                왼쪽 가입 폼 --%>
                                <div class="col-md-6">
    <%--                                    이메일 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                        </div>
                                        <input name="email" class="form-control" type="text" value="${member.email}">
                                    </div>
    <%--                                    이름 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                        </div>
                                        <input name="userName" class="form-control"  type="text" value="${member.userName}">
                                    </div>
    <%--                                    비밀번호 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                        </div>
                                        <input name="password" class="form-control" placeholder="Create password" type="password">
                                    </div>
    <%--                                    비밀번호 체크 유효성만 돌리기 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                        </div>
                                        <input name="" class="form-control" placeholder="Repeat password" type="password">
                                    </div>
    <%--                                    닉네임 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-id-card"></i> </span>
                                        </div>
                                        <input name="nickName" class="form-control" placeholder="Nick Name" type="text">
                                    </div>
                                </div>
    <%--                                오른쪽 가입 폼 --%>
                                <div class="col-md-6">
                                    <%-- 생년 월일 폼 확인 --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-birthday-cake"></i> </span>
                                            </div>
                                            <input type="hidden" name="userNo" class="form-control" value="${member.userNo}" />
                                            <input name="birthDate" class="form-control" type="text" value="${member.birthDate}">
                                        </div>
                                        <%-- address number --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-map-marked-alt"></i> </span>
                                            </div>
                                            <input id="zipCode" name="zipCode" class="form-control" placeholder="zipCode" type="text">
                                            <button type="button" style="margin: 0; padding: 0;">
                                            <span class="input-group-text"><i class="fas fa-search" onclick="addrSearch()"></i></span>
                                            </button>
                                        </div>
                                        <%-- address --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-map-marked-alt"></i> </span>
                                            </div>
                                            <input id="address" name="address" class="form-control" placeholder="address" type="text">
                                        </div>
                                        <%-- 전화 번호 --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                                            </div>
                                            <input name="phone" class="form-control" placeholder="Phone number" type="text">
                                        </div>

    <%--                                    <div class="form-group">--%>
    <%--                                        <select class="form-control">--%>
    <%--                                            <option class="hidden"  selected disabled>여행 취향을 골라주세요</option>--%>
    <%--                                            <option>What is your Birthdate?</option>--%>
    <%--                                            <option>What is Your old Phone Number</option>--%>
    <%--                                            <option>What is your Pet Name?</option>--%>
    <%--                                        </select>--%>
    <%--                                    </div>--%>
    								<div class="row">
    									<div class="col-md-4"></div>
    									<div class="col-md-8">
                                   			<input type="submit" class="btnRegister" value="수정완료"/>
    									</div>
    								</div>
    								<div class="row">
    									<div class="col-md-4"></div>
    									<div class="col-md-8">
                                    		<input type="button" class="btnRegister" value="탈퇴하기" onclick="deleteMember();"/>
    									</div>
    								</div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- 이미지 관련 스크립트 -->
    <script>
    $(function () {

        $imgSrc = $('#imgProfile').attr('src');
        <!-- 이미지 미리보기 스크립트 -->
        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgProfile').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        <!-- 이미지 변경시 효과 -->
        $('#btnChangePicture').on('click', function () {
            if (!$('#btnChangePicture').hasClass('changing')) {
                $('#profilePicture').click();
            }
            // else {
            //     // change
            // }
        });

        $('#profilePicture').on('change', function () {
            readURL(this);
            $('#btnChangePicture').addClass('changing');
            $('#btnChangePicture').attr('value', '등록 완료');
            $('#btnDiscard').removeClass('d-none');
            // $('#imgProfile').attr('src', '');
        });
        $('#btnDiscard').on('click', function () {
            // if ($('#btnDiscard').hasClass('d-none')) {
            $('#btnChangePicture').removeClass('changing');
            $('#btnChangePicture').attr('value', 'Change');
            $('#btnDiscard').addClass('d-none');
            $('#imgProfile').attr('src', $imgSrc);
            $('#profilePicture').val('');
            // }
        });
    });
    
		function deleteMember() {

			location.href = "${pageContext.request.contextPath}/delete.me?mid=${member.userNo}";
	
	}
    
</script>



    <!-- 다음 주소 Api -->
    <script>
        // 우편번호 검색
        function addrSearch() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용

                    $('#address').val(fullAddr);

                    // 커서를 상세주소 필드로 이동한다.
                    // $('#address2').focus();
                }
            }).open();
        }
    </script>
</section>

<c:import url="../common/footer.jsp"/>

<script src="../../resources/js/scroll.js"></script>
</body>
</html>