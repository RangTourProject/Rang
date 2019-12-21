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
</head>
<body class="profile-page sidebar-collapse">


<c:import url="../common/nav.jsp"/>
<section>
<!-- 내 마이페이지 일 때 -->
<c:if test="${member.userNo eq mp.userNo}">
  <div class="wrapper">
    <div class="page-header clear-filter" filter-color="orange">
      <div class="page-header-image" data-parallax="true" style="background-image:url('https://images.unsplash.com/photo-1476984251899-8d7fdfc5c92c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3700&q=80');">
    </div>
    <div class="container">
	<form action="${pageContext.request.contextPath }/changeImg.ci"
		      method="post" enctype="multipart/form-data">

      <div class="photo-container">
      	<img id="myPagePhoto" src="/Rang/resources/myPagePhoto/${clist.get(0).imgchangename}" onerror="defaultImg(this);" alt="">
        <div class="middle">
        	<input type="hidden" name="userNo"/>
          <input type="file" style="display: none;" id="profilePicture" onchange="LoadImg(this,1)" name="name" >
          <input type="submit" class="btn btn-outline-warning ml-auto" id="change" value="사진변경" />
        </div>
      </div>
		</form>
      <h3 class="title">${member.nickName }</h3>
      <p class="category">오늘도 유정훈 선생님은 옳았다.</p>
      <button type="button" class="btn btn-outline-warning ml-auto"
              onclick="location.href='${pageContext.request.contextPath}/views/myPage/updateForm.jsp';">정보 수정</button>
      <div class="content">
        <div class="social-description">
          <h2>${mBoardCount}</h2>
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

      <!-- <h3 class="title">자기 소개글</h3>
     <h5 class="description">ㅎㅇ</h5>  -->

      <div class="row">
        <div class="col-md-4 ml-auto mr-auto">
          <h4 class="title text-center">내 게시글 목록</h4>
          <div class="nav-align-center">
            <ul class="nav nav-pills nav-pills-primary nav-pills-just-icons" role="tablist">
              <!-- <li class="nav-item">
               <a class="nav-link" data-toggle="tab" href="#profile" role="tablist">
                 <i class="now-ui-icons design_image"></i>
               </a>
             </li>
             <li class="nav-item">
               <a class="nav-link active" data-toggle="tab" href="#home" role="tablist">
                 <i class="now-ui-icons location_world"></i>
               </a>
             </li> -->
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#messages" role="tablist">
                  <i class="now-ui-icons sport_user-run"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="tab-content gallery">
          <div class="tab-pane" id="messages" role="tabpanel">
            <div class="col-md-12 ml-auto mr-auto">
              <div class="row collections">
                <c:forEach var="mboard" items="${list}">

                  <div class="col-md-4">
                    <a class="mboard-link" data-toggle="modal" onclick="modalCall(${mboard.mbno});" href="#modal1">
                      <img class="img-fluid" src="/Rang/resources/mBoardPhoto/${mboard.mbfile}" alt="" style="width:1000px; height:400px; margin-top:2em;">
                    </a>
                  </div>

                </c:forEach>
              </div>
            </div>
          </div>

        </div>

        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="display:none;">
          <symbol id="close" viewBox="0 0 18 18">
            <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M9,0.493C4.302,0.493,0.493,4.302,0.493,9S4.302,17.507,9,17.507
			S17.507,13.698,17.507,9S13.698,0.493,9,0.493z M12.491,11.491c0.292,0.296,0.292,0.773,0,1.068c-0.293,0.295-0.767,0.295-1.059,0
			l-2.435-2.457L6.564,12.56c-0.292,0.295-0.766,0.295-1.058,0c-0.292-0.295-0.292-0.772,0-1.068L7.94,9.035L5.435,6.507
			c-0.292-0.295-0.292-0.773,0-1.068c0.293-0.295,0.766-0.295,1.059,0l2.504,2.528l2.505-2.528c0.292-0.295,0.767-0.295,1.059,0
			s0.292,0.773,0,1.068l-2.505,2.528L12.491,11.491z"/>
          </symbol>
        </svg>
      </div>
    </div>
  </div>
  </div>s
</c:if>

<!-- 모달 -->
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
                        소셜 기능 <i class="fas fa-angle-down rotate-icon"></i>
                      </h5>
                    </a>
                  </div>

                  <!-- Card body -->
                  <div id="collapseThree5" class="collapse" role="tabpanel" aria-labelledby="headingThree5"
                       data-parent="#accordionEx">
                    <div class="card-body">
                      <!-- 좋아요를 누른 상태인지 c:if로 구별해 색상을 바꾸기 위해서 나누었습니다  -->
                      <c:if test="${result.myLikeCheck eq 0}">
                        <button id="mbLike" type="button" class="btn btn-secondary btn-myLike" onclick="mylike();"><i class="fas fa-heart"></i></button>
                        <input type="hidden" id="mbval" value=""/>
                        <!-- 좋아요  -->    <input type="text"  class="col-2" id="mbcount" value="" />
                        <input type="hidden" id="mbnoVal" value="${mBoard.mbno }">
                      </c:if>
                      <c:if test="${result.myLikeCheck ne 0}">
                        <button id="mbLike" type="button" class="btn btn-secondary btn-myLike unLike" onclick="mylike();" ><i class="fas fa-heart"></i></button>
                        <input type="hidden" id="mbval" value=""/>
                        <!-- 좋아요  -->    <input type="text"  class="col-2" id="mbcount" value="" />
                        <input type="hidden" id="mbnoVal" value="${mBoard.mbno }">
                      </c:if>

                      <button id="updateBoard" type="button" class="btn btn-secondary" onclick="updateBoard();" >게시글 수정</button>
                      <button id="deleteBoard" type="button" class="btn btn-secondary" onclick="deleteBoard();" >게시글 삭제</button>
                    </div>
                  </div>

                </div>
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
          <img src="" onerror="defaultImg(this);" alt="">
        </div>
        <h3 class="title">${mp.nickName}</h3>

        <p class="category" value="${mp.nickName}"></p> <button type="button" onclick="location.href='updateForm.jsp'" style= "display : none;">정보 수정</button>
        <div class="content">
          <div class="social-description">
            <h2>${mBoardCount}</h2>
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
        </div>

        <div class="row">
          <div class="col-md-4 ml-auto mr-auto">
            <h4 class="title text-center"> 게시글 목록</h4>
            <div class="nav-align-center">
              <ul class="nav nav-pills nav-pills-primary nav-pills-just-icons" role="tablist">

                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#messages" role="tablist">
                    <i class="now-ui-icons sport_user-run"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="tab-content gallery">
            <div class="tab-pane" id="messages" role="tabpanel">
              <div class="col-md-12 ml-auto mr-auto">
                <div class="row collections">
                  <c:forEach var="list" items="${list}">

                    <div class="col-md-4">
                      <a class="mboard-link" data-toggle="modal" onclick="modalCall(${list.mbno});" href="#modal1">
                        <img class="img-fluid" src="/Rang/resources/mBoardPhoto/${list.mbfile}" alt="" style="width:1000px; height:400px; margin-top:2em;">
                      </a>
                    </div>

                  </c:forEach>
                </div>
              </div>
            </div>

          </div>

          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="display:none;">
            <symbol id="close" viewBox="0 0 18 18">
              <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M9,0.493C4.302,0.493,0.493,4.302,0.493,9S4.302,17.507,9,17.507
			S17.507,13.698,17.507,9S13.698,0.493,9,0.493z M12.491,11.491c0.292,0.296,0.292,0.773,0,1.068c-0.293,0.295-0.767,0.295-1.059,0
			l-2.435-2.457L6.564,12.56c-0.292,0.295-0.766,0.295-1.058,0c-0.292-0.295-0.292-0.772,0-1.068L7.94,9.035L5.435,6.507
			c-0.292-0.295-0.292-0.773,0-1.068c0.293-0.295,0.766-0.295,1.059,0l2.504,2.528l2.505-2.528c0.292-0.295,0.767-0.295,1.059,0
			s0.292,0.773,0,1.068l-2.505,2.528L12.491,11.491z"/>
            </symbol>
          </svg>
        </div>
      </div>
    </div>
  </div>
</section>
</c:if>


<!-- 스크립트 부분 -->

<script>
	var userNo = ${member.userNo};
  function follow(){
    $.ajax({
      url : '${ pageContext.request.contextPath }/follow.mm',
      data : { memno: ${member.userNo}, target_memno: ${mp.userNo}} ,
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

<!-- 기본 사진 script -->
<script>
function defaultImg(obj){
    $(obj).attr('src','/Rang/resources/myPagePhoto/defaultimg.jpg');
 }
</script>

<!-- 사진 바꾸기 script -->
<script>
	$(function(){


		  $('#myPagePhoto').click(() => {
				$('#profilePicture').click();
			});
		   $('#profilePicture').change(() => {
				$('#change').click();
			});

	});
		  function LoadImg(value, num) {
				if(value.files && value.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e){
						switch(num){
						case 1: $('#myPagePhoto').attr('src', e.target.result);
							break;

						}
					}
					reader.readAsDataURL(value.files[0]);
				}
			}


</script>

<!-- 모달 ajax -->
<script>
  loginUserNo = '${member.userNo}';

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
        var $location = $('#locationName > a > h5');
        var $photo1 = $('#photo1 > img');
        var $photo2 = $('#photo2 > img');
        var $photo3 = $('#photo3 > img');
        var $photo4 = $('#photo4 > img');

        /*  var $likeCount = $('#mbcount');
         $likeCount.attr('value',data.mboard.likeCount) */

        // mbno 값 저장해두기
        var $updateBoard = $('#updateBoard');
        var $mbLike = $('#mbLike');

        $photo1.attr('src', "");
        $photo2.attr('src', "");
        $photo3.attr('src', "");
        $photo4.attr('src', "");

        $title.text(data.mBoard.mbtitle);
        $location.html(data.mBoard.locationname + "<i class=\"fas fa-angle-down rotate-icon\"></i>");
        $updateBoard.attr('onclick', "updateBoard(" + data.mBoard.mbno + ");");
        $mbLike.attr('onclick', "mylike(" + data.mBoard.mbno + ");");

        //onclick="updateBoard();
        for(var i in data.mAttachment){
          $photo1.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[0].mchangeName);
          $photo2.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[1].mchangeName);
          $photo3.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[2].mchangeName);
          $photo4.attr('src', "/Rang/resources/mBoardPhoto/"+data.mAttachment[3].mchangeName);
        }
        // 게시글 이미지 & 텍스트 불러오기 끝

        // 댓글 불러오기
        // 댓글 초기화
        $('.commentList').empty();

        for(var i in data.clist){

          // 댓글 한 개 담는 태그
          var $li;

          if (data.clist[i].mclevel == 0) {
            $li = $('<li id="' + data.clist[i].mcno + '">');
          } else {
            // 참조한 댓글의 레벨 답댓글
            //var clevel = Number($(obj).siblings('input[name=clevel]').val()) +1
            $li = $('<li id="' + data.clist[i].mcno + '" class="'  + data.clist[i].mclevel + '">');
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
        // 댓글 한 개 담는 태그

        // var a; : 자바스트립트 변수. 흔히 아는 방식으로 스크립트만 사용가능
        // var $a; : 제이쿼리에서 사용하는 내장함수들을 모두 사용O
        //         .css(), .hide(), .show()등 모든 스크립트 사용이 가능함

        // li태그로 클래스주고 정렬(은 자동으로 DAO에서 하게끔
        // 그냥 lv만 따로 뺴서 묶기

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

        /* 댓글 실험중 */
        // 해당 댓글 작성자 사진
        // 주석부분1
        var $div1 = $('<div class="commenterImage">');
        var $img = $('<img src="http://placekitten.com/50/50" />');

        // 해당 댓글 내용
        // 주석 부분2
        var $div2 = $('<div class="commentText">');
        var $p = $('<p>');
        var $span = $('<span class="date sub-text">');

        // 해당 댓글 수정/삭제
        var $div3 = $('<div><i class="fas fa-edit"></i><i class="fas fa-save"></i>&nbsp;<i class="fas fa-trash-alt"></i>');

        // append() 현재 선택된 문서요소의 마지막 자식으로 새로운 문서 요소를 추가
        // insert() 현재 선택된 문서요소의 지정된 요소 앞에 새로운 문서 요소를 추가

        $div1.append($img);
        $div2.append($p.html(anchorTagGenerator($('#myComment').val())))
        $div2.append($p.text($('#myComment').val()))
                .append($span.text('방금 전'));

        $li.append($div1)
                .append($div2)
                .append($div3);

        if($('#clevelCo').val() == 0){
          console.log($li);
          console.log($appender);
          $appender.append($li);
        } else {
          console.log($li);
          console.log($appender);
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

  // 게시글 수정 삭제 등록 아이콘 호출
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

  // 게시글 수정
  function updateBoard(mbno) {
    location.href = "${pageContext.request.contextPath}/mUpView.mb?mbno="+mbno;
  }

  // 메인 게시글 좋아요 스크립트
  function mylike(mbno){
    $.ajax({
      url : '${pageContext.request.contextPath}/like.mb',
      type : 'post',
      data : { memno : ${member.userNo},
        mbno : mbno },
      success : function(data) {
        if(data.myLike == 0){
          // 좋아요 성공
          console.log(data);
          alert("좋아요 성공 !");
          $('.btn-myLike').addClass('unLike');

        } else if(data.myLike == 1) {
          // 좋아요 취소
          alert("좋아요 취소 !");
          $('.btn-myLike').removeClass('unLike');
        }
      },
      error : function(){
        alert("좋아요 실패");
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