<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Planner</title>
    <script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
    <c:import url="../../views/common/commonUtil.jsp"/>
    <style>
    #map {
        /* 지도 크기 지정 */
        height: 80vh;
        width: 100%;
    }
    </style>
</head>
<body>
<c:import url="../../views/common/nav.jsp"/>

<!-- 플랜 파트 -->
<section>

    <div class="container-fluid">
        <div class="row">

            <!-- 플래너 영역 -->
            <div class="col-md-3">

                <ul class="plan-info list-group" style="margin-bottom: 0;">
                    <li class="list-group-item">
                        <h3> 플래너 타이틀 : ${plan.planner.title}</h3>
                        <span>여행 시작일 : ${fn:substring(plan.planner.startday, 0,10)}</span>
                        <span>인원 : ${plan.planner.people}</span>
                        <br>
                        <span>닉네임 : ${member.nickName}</span>
                        <span>플래너 번호 : ${plan.planner.plan_code}</span>
                    </li>
                </ul>

                <!-- 플래너 리스트 영역 -->
                <div class="">
                    <ul class="root-info list-group"  id="ul">
                        <!-- 저장된 도시계획 리스트 -->

                    </ul>
                </div>
            </div>

            <!-- 지도 영역 -->
            <div class="col-md-9">

                <div class="contents">
                    <!-- 지도 호출 -->
                    <div id="map"></div>

                    <div id="floating-panel">
                        <input onclick="removeLine();" type="button" value="경로 제거">
                        <input onclick="addLine();" type="button" value="경로 생성">
                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- 모달 플래너 생성 파트 -->
    <div id="NewPlan" class="planModal">
        <div>
            <h2>새 플래너 생성</h2>
            <form name="planFrm" method="get" action="${pageContext.request.contextPath}/newplan.do"> <!-- 서블릿으로 이동하여 저장 -->
                <input type="hidden" name="userNo" value="${member.userNo }"> <!-- 회원 번호 -->
                <div>
                    <label for="">플래너 이름</label>&nbsp;<input type="text" name="title" id="subject" placeholder="" required>
                </div>
                <div>
                    <label for="">플래너 시작일</label>&nbsp;<input type="text" name="startday" id="startday" placeholder="예) 2019-05-01" required>
                </div>
                <div>
                    <label for="">인원</label>&nbsp;<input type="text" name="people" id="people" placeholder="" required>
                </div>
                <p>
                    <input type="submit" value="planner 생성">
                    <input type="button" value="취소" onclick="history.go(-1);"> <!-- 뒤로가기 -->
                </p>
            </form>
        </div>
    </div>

    <!-- 플래너 생성 모달 호출
    플래너 정보가 없고 회원 이라면 실행 -->
    <script>
        var userno = '${member.userNo}';
        if (userno != null && userno != ''){
            $.ajax({
                url : "${pageContext.request.contextPath}/plancheck.do", // 기존 플래너 채크
                type : "get",
                data : { userno : userno },
                success : function(data){
                    if (data > 0 ) {
                        alert("ajax 실행 성공");
                        // 갯수를 가져왔다는 가정 하에
                        console.log(data);

                    } else {
                       // 등록된 플랜이 없다면 모달창 오픈
                        location.href = "#NewPlan";
                    }
                }, error : function( ){
                    alert("ajax 실행 실패")
                }
            });
        } else {
            alert("비회원 상태에서는 경로만 확인 가능합니다.");
        }
    </script>


    <!-- 지도 스크립트 -->
    <script>
        var map;
        var linePath = new Array();
        var flightPath;
        var cList = new Array(); //JSON 형식받을 Array (도시들 의 정보)
        var infowindowCons = new Array(); // info 배열
        var image = "${pageContext.request.contextPath}/resources/images/icon.png";

        <c:forEach var="cityVo" items="${plan.cityList}"> // 마커찍을 전체 도시들 정보 Array에 저장
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

                var content = cityVo.city_name
                    + '<br/> <input type="button" value="도시 추가" onclick="addCity(\''
                    + infowindowCons.length + '\',\'' +  cityVo.city_name + '\',\'' + cityVo.lat
                    + '\',\'' + cityVo.lng+ '\');" />';

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
                });

            });// CITY들 마커 띄우기 끝

        } // 지도 관련 끝

        // 라인 생성용 스크립트
        function addLine() {
            if (linePath.length>=2) {
                removeLine();
            }

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

        // 라인 제거
        function removeLine() {
            flightPath.setMap(null);
        }

        // 플래너 계획 추가
        //마커에서 추가버튼눌렀을떄 좌측 리스트에 추가
        function addCity(idx, ct_name, lat, lng) {

            var lis =  $('#ul').children();
            var daytoadd = 0;
            var startday;
            var endday;

        <%--<span>여행 시작일 : ${fn:substring(plan.planner.startday, 0,10)}</span>--%>

            // moment.js 를 활용하여 날짜 처리
            if (lis.length==0) {
                startday= '${fn:substring(plan.planner.startday, 0,10)}';
                endday= moment("${plan.planner.startday}").add('days', 1).format("YYYY-MM-DD").toString();
            } else {
                lis.each(function(idx,li) {
                    daytoadd+=parseInt($(this).find("#day option:selected").val());
                    startday = moment('${plan.planner.startday}').add('days', daytoadd).format("YYYY-MM-DD").toString();
                    endday = moment(startday).add('days', 1).format("YYYY-MM-DD").toString();
                });
            }

            var $li = $('<li class="list-group-item" id="cityli">\n'+
                '<h4 class="root-city" id="ct_name">'+ct_name+'</h4>\n'+
                '<span class="root-day">\n'+
                '<select id="day" class="daySelector" onchange="changeCP()">\n'+
                '<option value="1">1</option>\n'+
                '<option value="2">2</option>\n'+
                '<option value="3">3</option>\n'+
                '<option value="4">4</option>\n'+
                '<option value="5">5</option>\n'+
                '<option value="6">6</option>\n'+
                '<option value="7">7</option>\n'+
                '<option value="8">8</option>\n'+
                '</select>\n 박 &nbsp; \n '+
                '</span>\n'+
                '<span class="root-date">'+startday+' ~ </span><br />\n'+
                '<span class="root-transport">\n'+
                '<select id="trans">\n'+
                '<option value="train">열차</option>\n'+
                '<option value="airplain">항공</option>\n'+
                '<option value="bus">버스</option>\n'+
                '<option value="ship">배</option>\n'+
                '<option value="etc">기타</option>\n'+
                '</select>\n'+
                '</span>\n'+
                '<span id="lat" style="display: none;">'+lat+'</span>\n'+
                '<span id="lng" style="display: none;">'+lng+'</span>\n'+
                '<button onclick="deleteCp(this)">제거</button>'+
                '</li>');

            $("#ul").append($li);

            linePath.push(new google.maps.LatLng(lat, lng)); // 라인 경로에 값 푸쉬

            addLine(); // 마커 클릭 이벤트 마다 라인 추가

        }
        // 플래너 계획 추가 끝

        // 삭제 관련 스크립트
        function deleteCp(btn) {

            console.log(btn.parentElement); // 위치 체크

            if (btn.parentElement.children[7].childNodes[0].nodeValue=="제거") {
                alert("경로가 목록에서 제거 되었습니다.");
                btn.parentElement.remove();
            }
            else{
                // ajax로 제거?
                <%--var cp_code = btn.parentElement.children[9].childNodes[0].nodeValue;--%>
                <%--var answer = confirm("정말 제거 하시겠습니까?");--%>
                <%--if (answer==true) {--%>
                <%--    $.ajax({--%>
                <%--        url: "${pageContext.request.contextPath}/plan/delCP.do",--%>
                <%--        type:'POST',--%>
                <%--        //dataType:"JSON",--%>
                <%--        data: {cp_code:cp_code},--%>
                <%--        success:function(result){--%>
                <%--            if (result==1) {--%>
                <%--                alert("제거 되었습니다.");--%>
                <%--            }else{--%>
                <%--                alert("제거에 실패 하였습니다.");--%>
                <%--            }--%>
                <%--        },--%>
                <%--        error:function(jqXHR, textStatus, errorThrown){--%>
                <%--            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);--%>
                <%--        }--%>
                <%--    });--%>
                <%--    btn.parentElement.remove();--%>
                <%--}--%>
            }
            changeCP();
        }
        // 삭제 관련 스크립트 끝

        // 플랜 변경 관련 함수
        function changeCP() {

            removeLine(); // 경로 비우기

            linePath = new Array(); // 경로 담을 배열 준비

            var startday;
            var endday;
            var endcnt=0;
            var day;

            <%--<span>여행 시작일 : ${fn:substring(plan.planner.startday, 0,10)}</span>--%>

            var lis =  $('#ul').children();
            lis.each(function(idx,li) {

                console.log($(this).children()); // 자식 체크용

                linePath.push(new google.maps.LatLng($(this).children().eq(5).text(), $(this).children().eq(6).text())); // Lat,lng 위치 찾아서 경로 푸시
                day= parseInt($(this).find("#day option:selected").val());
                if (idx==0) {
                    startday= '${fn:substring(plan.planner.startday, 0,10)}';
                    endday= moment("${plan.planner.startday}").add('days', day).format("YYYY-MM-DD").toString();
                    endcnt+=day;
                    $(this).children().eq(2).text(startday+' ~ '+endday);

                }else{
                    startday=moment("${plan.planner.startday}").add('days', endcnt).format("YYYY-MM-DD").toString();
                    endday=moment("${plan.planner.startday}").add('days', endcnt+day).format("YYYY-MM-DD").toString();
                    endcnt += day
                    $(this).children().eq(2).text(startday+' ~ '+endday);
                }
            });
            addLine(); // 비웠던 라인 다시
        }// 플랜 변경 관련 함수 끝
    </script>

    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <!-- 지도 api & key -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3phkjHg5O4aOf3Scz99ZBCjg75C6MDnA&callback=initMap"
            async defer></script>



</section>

<!-- footer -->
<c:import url="../../views/common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>
</html>