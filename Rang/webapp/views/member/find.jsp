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
                    <form action="${pageContext.request.contextPath}/findId.me" method="post">
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
                            <input type="submit" value="확인" class="btn float-right submit_btn">
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                	<h3>비밀번호 찾기</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/findPwd.me" method="post">
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
                            <input name="phone" id="phone" class="form-control" placeholder="전화번호" type="text">
                        </div>
                        <div class="form-group">
                            <input type="submit" value="확인" class="btn float-right submit_btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<%--<c:import url="../../views/common/footer.jsp"/>--%>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
</body>
</html>