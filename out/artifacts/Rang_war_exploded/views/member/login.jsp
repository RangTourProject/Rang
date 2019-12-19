<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Login Page</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" type="text/css" href="../../resources/css/login.css">
</head>
<body>
<%--<c:import url="../../views/common/nav.jsp"/>--%>

<section>
        <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>로그인</h3>
<%--                    <div class="d-flex justify-content-end social_icon">--%>
<%--                        <span><i class="fab fa-facebook-square"></i></span>--%>
<%--                        <span><i class="fab fa-google-plus-square"></i></span>--%>
<%--                        <span><i class="fab fa-twitter-square"></i></span>--%>
<%--                    </div>--%>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/login.me" method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input name="email" type="text" class="form-control" placeholder="사용자 이메일">

                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input name="password" type="password" class="form-control" placeholder="비밀번호">
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox">Remember Me
                        </div>
                        <div class="form-group">
                            <input type="submit" value="로그인" class="btn float-right login_btn">
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        계정이 없으신가요? &nbsp;<a href="signUp.jsp">회원가입</a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="find.jsp">아이디 / 비밀번호 찾기</a>
                    </div>
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