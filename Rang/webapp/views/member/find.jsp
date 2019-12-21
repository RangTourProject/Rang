<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Find id / password</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" type="text/css" href="../../resources/css/find.css">
</head>
<body>
<%--<c:import url="../../views/common/nav.jsp"/>--%>

<section>
        <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>아이디 찾기</h3>
                </div>
                <div class="card-body">
                    <form method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="userName" id="userName" class="form-control" placeholder="이름" type="text">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                            </div>
                            <input name="phone" id="phone" class="form-control" placeholder="전화번호" type="text">
                        </div>
                        <div class="form-group">
                            <input id="getId" type="button" value="확인" class="btn float-right submit_btn">
                        </div>
                    </form>
                </div>
                <div class="card-header">
                	<h3>비밀번호 찾기</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/pwdFind.me" method="post">
                        <div class="input-group form-group">
                             <div class="input-group-prepend">
                                 <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                             </div>
                             <input name="email" id="email" class="form-control" placeholder="이메일" type="text">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                            </div>
                            <input name="phone2" id="phone2" class="form-control" placeholder="전화번호" type="text">
                        </div>
                        <div class="form-group">
                            <input id="getPwd" type="button" value="확인" class="btn float-right submit_btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<%--<c:import url="../../views/common/footer.jsp"/>--%>

<script>
	var idCheck = false;
	$('#getId').click(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/idFind.me",
			type : "post",
			data : { 
				userName : $('#userName').val(),
				phone : $('#phone').val()
				},
			success : function(data){
				
				console.log(data);
				
				if(data.email != undefined) {
					alert("회원님의 이메일은 " + data.email + "입니다.");
					//$('.btnRegister').removeClass('btnDisable');
					idCheck = true;
				} else {
					alert("등록되어 있지 않은 회원정보입니다.");
					$('#userName').val('');
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
	
	$('#getPwd').click(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/pwdFind.me",
			type : "post",
			data : { 
				email : $('#email').val(),
				phone : $('#phone2').val()
				},
			async : false,
			success : function(data){
				
				console.log(data);
				
				if(data != '') {
					alert("회원님의 이메일로 임시 비밀번호를 전송하였습니다.");
					idCheck = true;
				} else {
					alert("이메일 정보가 올바르지 않습니다.");
					$('#email').val('');
					
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
<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
</body>
</html>