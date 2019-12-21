<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>메인 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>
<style>
    #map {
        /* 지도 크기 지정 */
        height: 400px;
        width: auto;
    }

/* 상세페이지 css 시작!! */
.navbar-nav {
  line-height: 30px;
}
.navbar-nav li{
  font-size: 1.1em;
}

nav .navbar-right li {
  font-size:1em;
}

.topbar-tweet-btn  {
  margin-top: 3px;
  backgroud-color:#1DA1F2;
  border-radius: 4px;
  color: #FACC2E;
  font-size: 2em;

}

.glyphicon-user {
  font-size: 1.5em;
}

.centerIcon i {
  font-size: 1.5em;
  color:#1DA1F2 ;
  padding-left: 160px;
}

.bodyContainer {

  width: 70%;
  margin: 0 auto;
  background-color: #F5F8FA;

}
.left-container {

  width: 20%;
  float:left;
}

.thumbnail1 {
  border: 1px solid #E1E8ED;
  padding:0px;
  border-radius: 4px;
  height: 240px;
}

.thumbnail1 {
  border: 1px solid #E1E8ED;
  padding:5px;
  border-radius: 4px;
  height: 150px;
}

.thumbnail img {
  width: 100%;
  height: 500;
  padding-right:5px;
  repeat: no-repeat;
  border-radius: 4px 4px 0 0;
}

.caption img {
  width: 60px;
  height: 60px;
  border: 4px solid #FFF;
  border-radius: 7px;
  border-top-left-radius: 7px;
  border-top-right-radius: 7px;
  border-bottom-right-radius: 7px;
  border-bottom-left-radius: 7px;
  position: absolute;
  z-index: 10;
  top: 67px;
  float:left;

}

.caption h3 {

  margin-top: 0px;
  margin-left: 90px;
  font-size: 0.8em;
}

.tag {
  font-size: .7em;
  color: #FACC2E;
  line-height: 4px;
  margin-top: 0px;
  margin-left: 90px;

}

.tweetContainer {
  line-height: 70%;
  text-transform: uppercase;
  padding-top: 5px;
}

.tweetCount {
  float:left;
  margin-left: 5px;
}

.following {
  float:left;
  margin-left: 20px;
}

.followers {
  float:left;
  margin-left: 20px;
}

.infoHead {
  font-size: .9em;
  color: #FACC2E;
}

.subHead {
  font-size: 1.0em;
  color: #FACC2E;
}

.trendingContainer {
  width:100%;
  height: auto;
  border: 1px solid #E1E8ED;
  border-radius: 4px;
  padding-left:10px;
}

.trendHeader h3 {
  font-size: 1.5em;
  color:black;
  font-family:'메이플스토리 OTF';
}

.smallFont {
  padding-left: 10px;
  font-size: .6em;
  font-weight:normal;
  color:#FACC2E;
}

.tagsContainer h5{
  font-size: 1.5em
  font-weight: bold;
  color: black;
  font-family:'메이플스토리 OTF';
}

.trendTags p {
  line-height: 4px;
  color: #FACC2E;
  padding-bottom: 10px;
}

.middleContainer {
  width: 45%;
  float:left;
  margin-left: 10px;

  border: 1px solid #E1E8ED;
  border-radius: 4px;
}

.update {
  padding: 0px 20px 15px 30px;
  background-color: #F2F5A9;
  height: 70px;
}

.update img {
  width: 40px;
  height:30px;
  border-radius: 4px;
  float:left;

}

.update input {
  border: 1px solid #E1E8ED;
  border-radius: 4px;
  width: 70%;
  margin-left: 5px;
  margin-top: 0px;
  height:40px;
}

.update button {
  display: inline-block;
  width: 20%;
}

.tweetContent {

}

.media img {
  width: 50px;
  height:50px;
  border-radius: 4px;
}

.media-body h3 {
  font-size: 1.5em;
  font-weight: bold;

}

.userFont {
  font-size: .8em;
  padding-left:5px;
  color: #F7D358;
  font-weight: normal;
}
#tweetInfo {
  background-color:white;
  height: 50px;

  border-bottom: 1px solid #E1E8ED;
/*   margin-left : ${(tbco.tclevel - 1) * 15}px;
  width : ${800 - ((tbco.tclevel - 1) * 15)}px; */
}

#tweetInfo:hover {
  cursor:pointer;
  background-color: #F5F8FA;
}

.tweetAction ul{
  list-style-type: none;
  margin:0px;
  padding:0px;
}

.tweetAction ul li {
  display:inline-block;
  padding-right: 50px;
  color: #aab8c2;
  font-size: 1.2em;

}

.tweetAction ul li:last-child {
  font-size: .5em;
}

.tweetAction ul li:hover {
  cursor: pointer;
}

.data {
  font-size: .75em;
  font-weight: bold;
}
.nestedMedia {
  border: 1px solid #E1E8ED;
  border-radius: 4px;
  padding: 5px;
  margin-bottom: 5px;
}

.nestedMedia:hover {
  border:1px solid #FACC2E;
}


.media-body img {
  width: auto%;
  height: 250px;
  border: 1px solid #E1E8ED;
  border-radius: 4px;
  margin-bottom: 5px;
}

/*-------------------
---Right Container---
-------------------*/

.rightContainer {
  float:right;
  width: 30%;
  border: 1px solid #E1E8ED;
  border-radius: 4px;
  margin-left:1px;



}
.followContainer {
  border-bottom: 1px solid #E1E8ED;
  padding-left: 10px;
}

.trendHeader h3 {
  font-size: 1.5em;
  color:black;
  padding-left:10px;
}

.btn {
  background-color: #FDFEFE;
  border: 1px solid #E1E8ED;
  font-weight: bold;
}

.btn i {
  color:#1DA1F2;
}

.btn:hover {
  background-color: #E7EDF0;
}

.atFont {
  font-size: .7em;
  padding-left: 3px;
  color:#FACC2E;
  font-family:'메이플스토리 OTF';
}

.media:last-child {
  margin-bottom: 10px;
}

.findPeople {
  padding: 5px;
  color:black;
  background-color:#F5F8FA;
  font-family:'메이플스토리 OTF';
}

.findPeople i {
  color: #1DA1F2;
}


/* - - - -댓글 css 부분 - - - - - - - - */
   .replyArea {
      width:400px;
      color:white;
      background:black;
      margin-left:auto;
      margin-right:auto;
      padding-bottom : 5px;
   }

   .rightContainer textarea {
      border-radius: 10px;
      resize: none;
        font-family:'메이플스토리 OTF';
   }

   .media-body textArea {
      border-radius: 10px;
      resize: none;
        font-family:'메이플스토리 OTF';
   }

   a:link {
       color: yellow;
   }
   a:active {
      color: aqua;
   }
   table[class*="replyList"] * {
      color: black;
   }

   .replyList1 td{   background : lavenderblush; }
   .replyList2 td{   background : honeydew; }
   .replyList3 td{ background : aliceblue; }

</style>
</head>
<body>
<c:import url="../common/nav.jsp"/>

<section>
<div class="container"> <!-- container 시작 -->
   <div class="left-container">
      <div class="profile">
          <div class="row">
            <div class="col-sm-12 col-md-12">
               <div class="left2Container">
                  <div class="trendHeader">
                     <h3><a href="#" class="smallFont"><br></a></h3>
                   </div>
   <!-- 왼쪽 개인프로필 만들기  시작-->
                  <div class="followContainer">
                     <div class="media">
                        <div class="media-left media-middle">
                        <a href="#">
   <!--       <img class="media-object" src="" alt="..."> --><!-- 프로필 받아오기 미구현 -->
                        <i class="fas fa-user-circle fa-3x" style="color: #fed136;" aria-hidden="true"></i>
                        </a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading" style="font-family:'메이플스토리 OTF';">&nbsp;&nbsp;${stb.writer}<span class="atFont"></span></h3>
                            &nbsp;&nbsp;&nbsp;
                           <button class="btn"><i class="fa fa-user-plus" aria-hidden="true" ></i>follow</button>
                        </div>
                     </div>
                  </div>

                   <!-- Button trigger modal -->
                   <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModalScrollable">
                       지도 열기
                   </button>


   <!-- 왼쪽 개인프로필 만들기  끝-->
                  <div class="findPeople">
               <form action="${pageContext.request.contextPath}/party.tb" method="get">
                    <div>
               <input id="tbno" name="tbno" type="hidden" value="${stb.tbno}" >
                    <c:choose>
                  <c:when test="${member.nickName eq stb.writer}">
                          <button disabled="disabled" class="btn btn-outline"><i class="fa fa-user-plus" aria-hidden="true"></i>참여하기</button>
                       </c:when>
                       <c:when test="${check ne 1 }">
                          <button type="submit" class="btn btn-outline-warning"><i class="fa fa-user-plus" aria-hidden="true"></i>참여하기</button>
                       </c:when>
                       <c:otherwise>
                          <button disabled="disabled" class="btn btn-outline"><i class="fa fa-user-plus" aria-hidden="true"></i>참여하기</button>
                       </c:otherwise>
                    </c:choose>
                  </div>
                   </form>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div><!-- End of leftContainer -->

   <div class="middleContainer"> <!-- 가운데 제목 사진 게시글 받아오기 시작 -->
      <div class="trendingContainer">
          <div class="trendHeader">
            <h3>${stb.tbTitle}</h3>
         </div><hr />
         <div class="thumbnail">

            <img src="/Rang/resources/tBoardPhoto/${stb.tbfile }" alt=""
            onerror="defaultImg(this);">
         </div>
         <div class="tagsContainer">
            <div class="trendTags">
               <hr />
               <h5>${stb.tbContent}</h5>
            </div>
         </div>

         <!-- 수정 삭제 버튼 넣기 -->
         <c:choose>
         <c:when test="${!empty member and member.nickName eq stb.writer}">
              <c:url var="boardUpdate" value="updateView.tb">
                  <c:param name="tbno" value="${stb.tbno}"/>
               </c:url>

              <c:url var="boardDelete" value="del.tb">
                  <c:param name="tbno" value="${stb.tbno}"/>
               </c:url>
               <hr />
               <button class="btn btn-outline-warning" onclick="location.href='${boardUpdate}'" style="font-family:'메이플스토리 OTF';">수정하기</button>
               <button class="btn btn-outline-warning" onclick="location.href='${boardDelete}'" style="font-family:'메이플스토리 OTF';">삭제하기</button>
            </c:when>
            <c:otherwise>
               <button disabled="disabled" class="btn btn-outline">수정하기</button>
               <button disabled="disabled" class="btn btn-outline">삭제하기</button>
            </c:otherwise>
         </c:choose>
      </div>
   </div><!-- 가운데 제목 사진 게시글 받아오기 끝 -->

<div class="rightContainer"> <!-- 댓글 만들기 시작!!! -->
   <div class="update"> <!-- 댓글 입력 창 시작!!!-->
      <div class="replyWriteArea">
          <%-- <img src="${pageContext.request.contextPath}/resources/images/RangLogo.jpg" alt="user image"> --%>
         <form action="${pageContext.request.contextPath }/tboardInsertComment.tb" method="post">
            <input type="hidden" name="writer"  value="${ member.nickName }"/>
            <input type="hidden" name="tbno" value="${stb.tbno}" />
            <input type="hidden" name="userno" value="${member.userNo }" />
            <input type="hidden" name="reftcno" value="0" />
            <input type="hidden" name="tclevel" value="1" />

            <table align="center">
               <tr><td>
                  <textArea id="tccontent" name="tccontent" placeholder="댓글 달아주세용"></textArea>
                  </td>
                  <td><button class="btn" type="submit" id="button">◀ </button></td>
                  <br />
               </tr>
            </table>
         </form>
      </div>
<!-- 댓글 입력 창 끝!!!-->

        <div class="tweetContent" id="replySelectArea">
        <c:if test="${ !empty tclist }">
          <c:forEach var="tbco" items="${ tclist }">

            <table id="tweetInfo"
                  style="margin-left : ${(tbco.tclevel - 1) * 15}px;
                            width : ${405 - ((tbco.tclevel - 1) * 15)}px;"
                       class="replyList${tbco.tclevel}" >

               <tbody>
                    <tr>
                       <td rowspan="3"> </td>
                     <td align=left style="cols:40">

                         <!-- 대댓글 창 -->
                         <div class="media-body">
                             <h5 class="media-heading" style="font-family:'메이플스토리 OTF';">${member.nickName}가<span class="userFont">${tbco.tcdate}에 씀</span></h5>
                             <textarea class="reply-content" cols="40" rows="1.5"
                                       readonly="readonly">${tbco.tccontent}</textarea>


                        <c:if test="${member.userNo eq tbco.userno }">


                        </div>
                        <input type="hidden" name="tcno" value="${tbco.tcno}"/>

                        <button type="button" class="updateBtn btn btn-primary "
                              onclick="updateReply(this);" style="font-family:'메이플스토리 OTF';">고침</button>

                        <button type="button" class="updateConfirm btn btn-primary"
                              onclick="updateConfirm(this);"
                              style="display:none;" style="font-family:'메이플스토리 OTF';">고침끗</button> &nbsp;&nbsp;

                        <button type="button" class="updateConfirm btn btn-primary"
                              onclick="deleteReply(this);" style="font-family:'메이플스토리 OTF';">지움</button> &nbsp;&nbsp;
                        </c:if>
                        <!-- lt뒤에 숫자만큼 댓글 더달수있음 ㅎㅎㅎ 이거 알아냄 ㅎㅎ -->
                        <c:if test="${ tbco.tclevel lt 10 }">
                        <input type="hidden" name="userno" value="${member.userNo}"/>
                        <input type="hidden" name="reftcno" value="${tbco.tcno}" />
                        <input type="hidden" name="tclevel" value="${tbco.tclevel}" />
                        <button type="button" class="updateConfirm btn btn-primary"
                               onclick="reComment(this);" style="font-family:'메이플스토리 OTF';">댓글</button>&nbsp;&nbsp;

                        <button type="button" class="insertConfirm btn btn-primary"
                           onclick="reConfirm(this);"
                           style="display:none;" style="font-family:'메이플스토리 OTF';">완료</button>

                        </c:if>

                        <c:if test="${tbco.tclevel ge 3}">
                           <span style="color:red; font-family:'메이플스토리 OTF';"> 고마해라.</span>
                        </c:if>
                     </td>
                  </tr>
                  <tr class="media replyList${tbco.tclevel}" >
                     <div class="media-left">
                         <a href="#">
                         <!-- 프로필사진 받아오고싶당 -->
                           <%-- <img class="media-object" src="${pageContext.request.contextPath}/resources/images/RangLogo.jpg" alt="..."> --%>
                           <i class="fas fa-user-circle fa-3x" style="color: #fed136;" aria-hidden="true"></i>
                         </a>
                     </div>
                  </tr>
               </tbody>
            </table>
         </c:forEach>
      </c:if>
      </div>
   </div>
</div> <!-- 댓글 만들기 끝!! -->
</div>   <!-- Container 끝! -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalScrollableTitle">지도 플랜</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="map"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

<script>
function defaultImg(obj){
    $(obj).attr('src','/Rang/resources/tBoardPhoto/마블리6.jpeg');
}

// 게시글 번호를 전달할 전역 변수 생성
var tbno = ${stb.tbno};

// 댓글 수정 함수
function updateReply(obj){
   // 현재 위치와 가장 가까운 textarea 가져오기 수정해야함@@
   $(obj).parent().find('textarea').removeAttr('readonly');

   // 수정 완료 버튼 보여주기
   $(obj).siblings('.updateConfirm').css('display', 'inline');

   // 수정 하기는 숨기기
   $(obj).css('display', 'none');
}

// 수정 완료 기능 구현 함수
function updateConfirm(obj) {
   // 댓글 내용 가져오기

   var tccontent
       = $(obj).parent().find('textarea').val();

   // 댓글 번호 가져오기
   var tcno = $(obj).siblings('input').val();

   location.href="/Rang/tboardUpdateComment.tb?tcno="+tcno+"&tbno="+tbno
              +"&tccontent=" + tccontent;
}

// 댓글 삭제 함수
function deleteReply(obj){

   var tcno = $(obj).siblings('input').val();

   location.href="/Rang/tboardDeleteComment.tb?tcno="+tcno+"&tbno="+tbno;
}

// 대댓글 기능 구현 함수
function reComment(obj){

   // 추가 완료 기능 버튼 보이게 하기
   $(obj).siblings('.insertConfirm').css('display', 'inline');

   // 현재 버튼은 숨기기
   $(obj).css('display', 'none');

   // 내용 입력 공간 만들기
   // $(obj).parents('table').append(htmlCode);
   var htmlCode =
      '<tr class="comment"> <td></td>'
     + '<td colspan="5" style="background: transparent;">'
     + '<textarea class="reply-content" style="background:#ffc;"'
     + '  cols="40" rows="1"></textarea>'
     + '</td></tr>';

    // 대댓글 기능 추가시 댓글작성창 보이게 하기
     $('#replySelectArea').append(htmlCode);
}

// 대댓글 작성 완료 시 동작할 함수
function reConfirm(obj){
   // 참조한 댓글의 정보 가져오기

   // 참조한 원본 댓글의 번호
    var reftcno = $(obj).siblings('input[name=reftcno]').val();
   // 참조한 댓글의 레벨 + 1
    var tclevel = Number($(obj).siblings('input[name=tclevel]').val()) + 1;

    console.log(reftcno + " : " + tclevel);

/*     var parent = $(obj).parent();
   var grandParent = parent.parent();
   var siblingsTR = grandParent.siblings().last();

   var tccontent = siblingsTR.find("textarea").val(); */

   console.log($(obj).parents('table').next().find('textarea').val());

    var tccontent = $(obj).parents('table').next().find('textarea').val();


   location.href='/Rang/tboardInsertComment.tb?'
         + 'tbno=' + tbno
         + '&userno=${member.userNo}'
         + '&tccontent=' + tccontent
         + '&tclevel=' + tclevel
         + '&reftcno=' + reftcno;
}
</script>
    <section></section>
    <section></section>
    <section></section>

    <script>

        var map;
        var linePath = new Array();
        var flightPath;
        var cList = new Array(); //JSON 형식받을 Array (도시들 의 정보)
        var infowindowCons = new Array(); // info 배열
        var image = "${pageContext.request.contextPath}/resources/images/marker2.png";

        var prev_infowindow =false;

        <c:forEach var="cityVo" items="${cityList}"> // 마커찍을 전체 도시들 정보 Array에 저장
        var cityVo = new Object();
        cityVo.city_name = "${cityVo.city_name}";
        cityVo.lat = "${cityVo.lat}";
        cityVo.lng = "${cityVo.lng}";
        cList.push(cityVo); // 반복하여 담기
        </c:forEach>

        function initMap() {

            // 기본 지도 정보 설정
            map = new google.maps.Map(document.getElementById('map'), {
                zoom : 5, // 줌
                center : new google.maps.LatLng(45.761283,  4.839263), // 기본 줌 위치
            });

            cList.forEach(function(cityVo) {
                var marker = new google.maps.Marker({
                    position : new google.maps.LatLng(cityVo.lat, cityVo.lng),
                    map : map, //어느 지도에 띄울지 지정
                    // icon: { // 아이콘 모양 설정
                    //     path: google.maps.SymbolPath.CIRCLE,
                    //     scale: 4,
                    //     strokeColor: 'red'
                    // },
                    icon : image,
                    info : cityVo.city_name // 이름
                });

                var content = cityVo.city_name;

                // infoWindow 오픈
                var infowindowCon = new google.maps.InfoWindow({
                    content : content
                });

                // 마커 인포창 저장
                infowindowCons.push(infowindowCon);

                // 마커 클릭 이벤트
                marker.addListener('click', function() {
                    map.setCenter(marker.getPosition());
                    infowindowCon.open(map, marker);

                    // 현재 클릭한 마커 제외 인포창 닫기
                    if( prev_infowindow ) {
                        prev_infowindow.close();
                    }

                    prev_infowindow = infowindowCon;
                    infowindowCon.open(base.map, marker);

                });

            });// CITY들 마커 띄우기 끝

            // 푸쉬
            <c:forEach var="cp" items="${cp}">
            linePath.push(new google.maps.LatLng(${cp.lat}, ${cp.lng}));
            addLine();
            </c:forEach>

        } // 지도 관련 끝

        // 라인 생성용 스크립트
        function addLine() {

            var lineSymbol = {
                path: google.maps.SymbolPath.FORWARD_OPEN_ARROW
                // 라인 심볼 모양 설정
            };

            flightPath = new google.maps.Polyline({
                path : linePath, // 그릴 라인의 경로(위도, 경도)
                strokeColor : "red", // 색상
                strokeOpacity : 1, // 라인 투명도
                strokeWeight : 2, // 두께
                icons: [{
                    icon: lineSymbol, // 라인 심볼 모양 설정
                    offset: '100%'
                }]
            });
            flightPath.setMap(map);
        }
    </script>

<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
</script>
<!-- 지도 api & key -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3phkjHg5O4aOf3Scz99ZBCjg75C6MDnA&callback=initMap" async defer></script>

<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>


<c:import url="../common/footer.jsp"/>
</body>
</html>