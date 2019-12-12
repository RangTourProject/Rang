<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>마이페이지</title>
    <c:import url="../common/commonUtil.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css"/>
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" /> 
  <style>
  .unfollow{
  	background : sandybrown;
  }
  
  .navbar-nav text-uppercase ml-auto{
  	width : 503.770px;
  	height : 49.688px;
  	margin-left : 4.805em;
  	}
  </style>
</head>
<body class="profile-page sidebar-collapse">


<c:import url="../common/nav.jsp"/>

	<!-- 내 마이페이지 일 때 -->
	<c:if test="${member.userNo eq mp.userNo}">
    <div class="wrapper">
    <div class="page-header clear-filter" filter-color="orange">
      <div class="page-header-image" data-parallax="true" style="background-image:url('https://images.unsplash.com/photo-1476984251899-8d7fdfc5c92c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3700&q=80');">
      </div>
      <div class="container">
        <div class="photo-container">
          <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/ryan.jpg" alt="">
        </div>
        <h3 class="title">${member.nickName }</h3>
        <p class="category" value="${member.nickName}"></p> <button type="button" onclick="location.href='${pageContext.request.contextPath}/views/myPage/updateForm.jsp';">정보 수정</button>
        <div class="content">
          <div class="social-description">
            <h2>5</h2>
            <p>Board</p>
          </div>
          <div class="social-description">
            <h2>${follower}</h2>
            <p>Follower</p>
          </div>
          <div class="social-description">
            <h2>${folling}</h2>
            <p>Following</p>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="button-container">
          <!-- <a href="#button" class="btn btn-primary btn-round btn-lg">Follow</a>
          <a href="#button" class="btn btn-default btn-round btn-lg btn-icon" rel="tooltip" title="Follow me on Twitter">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#button" class="btn btn-default btn-round btn-lg btn-icon" rel="tooltip" title="Follow me on Instagram">
            <i class="fab fa-instagram"></i>
          </a> -->
        </div>
        <h3 class="title">자기 소개글</h3>
        <h5 class="description">ㅎㅇ</h5>
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <h4 class="title text-center">내 게시글 목록</h4>
            <div class="nav-align-center">
              <ul class="nav nav-pills nav-pills-primary nav-pills-just-icons" role="tablist">
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#profile" role="tablist">
                    <i class="now-ui-icons design_image"></i>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home" role="tablist">
                    <i class="now-ui-icons location_world"></i>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#messages" role="tablist">
                    <i class="now-ui-icons sport_user-run"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <!-- Tab panes -->
          <div class="tab-content gallery">
            <div class="tab-pane active" id="home" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg1.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg3.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg8.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg7.jpg" alt="" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="profile" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg6.jpg" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg11.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg7.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="messages" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg3.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg7.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg6.jpg" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
     </div>
    </c:if>
    
    <!-- 내 마이페이지 아닐 때 -->
   
	<c:if test="${member.userNo ne mp.userNo}">
	<%-- <h1>${mp }</h1>
	<h1>${member }</h1> --%>
    <div class="wrapper">
    <div class="page-header clear-filter" filter-color="orange">
      <div class="page-header-image" data-parallax="true" style="background-image:url('https://images.unsplash.com/photo-1476984251899-8d7fdfc5c92c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3700&q=80');">
      </div>
      <div class="container">
        <div class="photo-container">
          <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/ryan.jpg" alt="">
        </div>
        <h3 class="title">${mp.nickName}</h3>
       
        <p class="category" value="${mp.nickName}"></p> <button type="button" onclick="location.href='updateForm.jsp'" style= "display : none;">정보 수정</button>
        <div class="content">
          <div class="social-description">
            <h2>5</h2>
            <p>Board</p>
          </div>
          <div class="social-description">
            <h2>${mpLower}</h2>
            <p>Follower</p>
          </div>
          <div class="social-description">
            <h2>${mpLowing}</h2>
            <p>Following</p>
          </div>
        </div>
      </div>
    </div>
   
    <div class="section">
      <div class="container">
        <div class="button-container">
        <c:if test="${followCheck eq 0 }">
        	<button type="button" class="btn btn-primary btn-round btn-lg btn-follow" name="follow" id="follow" onclick="follow();">Follow</button>
        </c:if>
        <c:if test="${followCheck ne 0 }">
        	<button type="button" class="btn btn-primary btn-round btn-lg btn-follow unfollow" name="follow" id="follow" onclick="follow();">Un Follow</button>
        </c:if>
          <!-- <a href="#button" class="btn btn-default btn-round btn-lg btn-icon" rel="tooltip" title="Follow me on Twitter">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#button" class="btn btn-default btn-round btn-lg btn-icon" rel="tooltip" title="Follow me on Instagram">
            <i class="fab fa-instagram"></i>
          </a> -->
        </div>
        <h3 class="title">자기 소개글</h3>
        <h5 class="description">ㅎㅇ</h5>
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <h4 class="title text-center">내 게시글 목록</h4>
            <div class="nav-align-center">
              <ul class="nav nav-pills nav-pills-primary nav-pills-just-icons" role="tablist">
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#profile" role="tablist">
                    <i class="now-ui-icons design_image"></i>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home" role="tablist">
                    <i class="now-ui-icons location_world"></i>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#messages" role="tablist">
                    <i class="now-ui-icons sport_user-run"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <!-- Tab panes -->
          <div class="tab-content gallery">
            <div class="tab-pane active" id="home" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg1.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg3.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg8.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg7.jpg" alt="" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="profile" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg6.jpg" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg11.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg7.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="messages" role="tabpanel">
              <div class="col-md-10 ml-auto mr-auto">
                <div class="row collections">
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg3.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg8.jpg" alt="" class="img-raised">
                  </div>
                  <div class="col-md-6">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg7.jpg" alt="" class="img-raised">
                    <img src="https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/img/bg6.jpg" class="img-raised">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
     </div>
    </c:if>
    
    <script>
    	function follow(){
    		$.ajax({
    			url : '${ pageContext.request.contextPath }/follow.mm',
    			data : { memno: ${member.userNo}, target_memno: ${mp.userNo}},
    			type : 'post',
    			success : function(data){
    				if(data.follow == 0) {
    					// follow 성공
    					alert("follow 성공");
    					$('.btn-follow').text('Un Follow');
    					$('.btn-follow').addClass('unfollow');
    				} else if(data.follow == 1) {
    					// follow 취소
    					alert("follow 취소");
    					$('.btn-follow').text('Follow');
    					$('.btn-follow').removeClass('unfollow');
    				} else {
    					alert("error");
    				}
    			}, error : function(){
    				alert("error");
    			}
    		});
    		
    	}
    </script>
    
    


<c:import url="../common/footer.jsp"/>

<!-- <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script> -->

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>
</html>