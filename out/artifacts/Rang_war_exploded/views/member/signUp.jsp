<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>회원가입</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" href="../../resources/css/singUp.css">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <style>
    	.btnRegister.btnDisable {
    		background : gray;
    	}
    </style>
</head>
<body>
<%--<c:import url="../common/nav.jsp"/>--%>

<section>
    <div class="container register">
        <form id="insertForm" action="${pageContext.request.contextPath}/insert.me" method="post">
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
                    <h3>환영합니다.</h3>
                    <p>간단한 설명</p>
                </div>

                <div class="col-md-9 register-right" id="signUpForm">

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">회원가입</h3>

                            <div class="row register-form">
    <%--                                왼쪽 가입 폼 --%>
                                <div class="col-md-6">
    <%--                                    이메일 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                        </div>
                                        <input name="email" id="email" class="form-control" placeholder="이메일" type="text">
    <%--                                    이메일 중복확인 --%>
                                    	<button type="button" id="idCheck" style="margin: 0; padding: 0;">
                                        <span class="input-group-text" ><i class="fas fa-check"></i></span>
                                        </button>
                                    </div>
    <%--                                    이름 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                        </div>
                                        <input name="userName" id="userName" class="form-control" placeholder="이름" type="text">
                                    </div>
    <%--                                    비밀번호 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                        </div>
                                        <input name="password" id="password" class="form-control" placeholder="비밀번호 설정" type="password">
                                    </div>
    <%--                                    비밀번호 체크 유효성만 돌리기 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                        </div>
                                        <input name="password2" id="password2" class="form-control" placeholder="비밀번호 확인" type="password">
                                    </div>
    <%--                                    닉네임 --%>
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-id-card"></i> </span>
                                        </div>
                                        <input name="nickName" id="nickName" class="form-control" placeholder="별명" type="text">
                                    </div>
                                </div>
    <%--                                오른쪽 가입 폼 --%>
                                <div class="col-md-6">
                                    <%-- 생년 월일 폼 확인 --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-birthday-cake"></i> </span>
                                            </div>
                                            <input name="birthDate" id="birthDate" class="form-control" placeholder="생년월일 ex)19950915" type="text">
                                        </div>
                                        <%-- address number --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-map-marked-alt"></i> </span>
                                            </div>
                                            <input id="zipCode" name="zipCode" class="form-control" placeholder="우편번호" type="text">
                                            <button type="button" style="margin: 0; padding: 0;">
                                            <span class="input-group-text"><i class="fas fa-search" onclick="addrSearch()"></i></span>
                                            </button>
                                        </div>
                                        <%-- address --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-map-marked-alt"></i> </span>
                                            </div>
                                            <input id="address" name="address" class="form-control" placeholder="주소" type="text">
                                        </div>
                                        <%-- 전화 번호 --%>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                                            </div>
                                            <input name="phone" id="phone" class="form-control" placeholder="전화번호 '-'없이 입력" type="text">
                                        </div>

    <%--                                    <div class="form-group">--%>
    <%--                                        <select class="form-control">--%>
    <%--                                            <option class="hidden"  selected disabled>여행 취향을 골라주세요</option>--%>
    <%--                                            <option>What is your Birthdate?</option>--%>
    <%--                                            <option>What is Your old Phone Number</option>--%>
    <%--                                            <option>What is your Pet Name?</option>--%>
    <%--                                        </select>--%>
    <%--                                    </div>--%>
                                    <input type="button" class="btnRegister" value="회원가입" onclick="formSubmit(this);"/>
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
        // <!-- 이미지 미리보기 스크립트 -->
        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgProfile').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        // <!-- 이미지 변경시 효과 -->
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
    
    <!-- 아이디(이메일) 중복 확인 -->
    <script>
		var idCheck = false;
		$('#idCheck').click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/idDup.me",
				type : "post",
				data : { email : $('#email').val()},
				success : function(data){
					if(data == 'true' && $('#email').val() != '') {
						alert("사용 가능 ٩(๑>∀<๑)۶");
						//$('.btnRegister').removeClass('btnDisable');
						idCheck = true;
					} else {
						alert("사용 불가 º·(˚ ˃̣̣̥᷄⌓˂̣̣̥᷅ )‧º");
						$('#email').val('');
						//$('.btnRegister').addClass('btnDisable');
						idCheck = false;
					}
					
					
					console.log(data);
					
					
				}, error : function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
					
					console.log("에러 발생!!!");
				}
				
				
				
				
			});
		});
		
    </script>
    
    	<!-- 
    	모든 사항을 입력하지 않았을 때
    	비밀번호 확인이 일치하지 않을 때
    	이메일 중복확인을 하지 않았을 때
    	알람창을 띄우고 위에 조건들이 모두 충족되었을 때 회원가입 성공
    	 -->
	<script>
		function formSubmit(obj){
			var email = $("#email").val();
			var userName = $("#userName").val();
			var password = $("#password").val();
			var password2 = $("#password2").val();
			var nickName = $("#nickName").val();
			var birthDate = $("#birthDate").val();
			var zipCode = $("#zipCode").val();
			var address = $("#address").val();
			var phone = $("#phone").val();
			
			// 이메일이 입력되지 않았을 때
			if(email == "") {
				alert("이메일을 입력해주세요!");
			// 이름이 입력되지 않았을 때
			} else if(userName == "") {
				alert("이름을 입력해주세요!");
			// 비밀번호가 입력되지 않았을 때
			} else if(password == "") {
				alert("비밀번호를 입력해주세요!");
			// 비밀번호 확인이 입력되지 않았을 때
			} else if(password2 == "") {
				alert("비밀번호 확인을 입력해주세요!");
			// 비밀번호 확인이 일치하지 않을 때
			} else if (password != password2) {
				alert("비밀번호 확인 값과 다릅니다.");
			// 별명이 입력되지 않았을 때
			} else if(nickName == "") {
				alert("별명을 입력해주세요!");
			// 생년월일이 입력되지 않았을 때
			} else if(birthDate == "") {
				alert("생년월일을 입력해주세요!");
			// 우편번호가 입력되지 않았을 때
			} else if(zipCode == "") {
				alert("우편번호를 입력해주세요!");
			// 주소가 입력되지 않았을 때
			} else if(address == "") {
				alert("주소를 입력해주세요!");
			// 전화번호가 입력되지 않았을 때
			} else if(phone == "") {
				alert("전화번호를 입력해주세요!");
				
	        // 이메일 검사
	        // 4글자 이상(\w = [a-zA-Z0-9_], [\w-\.]) @가 나오고
	        // 1글자 이상(주소). 글자 가 1~3번 반복됨
			} else if(!(/^[\w]{4,}@[\w]+\.[\w-]{1,3}$/.test(email))) {
				alert("이메일 형식이 올바르지 않습니다.");
				
			// 이메일 중복확인을 하지 않았을 때
			} else if(idCheck == false){
				alert('이메일 중복 확인해주세요!');
			
	        // 이름 검사
	        // 2글자 이상의 한글
			} else if(!(/^[가-힣]{2,}$/.test(userName))) {
				alert("이름은 2글자 이상의 한글이어야합니다.")
			
			// 생년월일 검사
			// YYYY/MM/DD형식 >> 8자리 숫자
			} else if(!(/^\d{8}$/.test(birthDate))) {
				alert("생년월일 형식이 올바르지 않습니다.")
			
	        // 전화번호 검사
			} else if(!((/^\d{2,3}\d{3,4}\d{4}$/).test(phone))) {
				alert("전화번호 형식이 올바르지 않습니다.")
	 
			} else {
				
				alert("회원 가입 성공~!!\n환영합니다 °˖✧◝(⁰▿⁰)◜✧˖°");
				
				$('#insertForm').submit();
			}
		}
	</script>
</section>

<%--<c:import url="../common/footer.jsp"/>--%>

<script src="../../resources/js/scroll.js"></script>
</body>
</html>