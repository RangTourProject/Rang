<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Planner</title>
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
            <div class="col-md-4">

                <ul class="plan-info list-group" style="margin-bottom: 0;">
                    <li class="list-group-item">
                        <h3>${planner.title }</h3>
                        <span>여행 시작일 : ${fn:substring(planner.startD, 0,10)}</span>
                        <span>인원 : ${planner.people }</span>
                        <span>아이디 : ${planner.userNo }</span>
                        <span>플래너코드 : ${planner.plan_code }</span>
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
            <div class="col-md-8">

                <div class="contents">
                    <!-- 지도 호출 -->
                    <div id="map"></div>

                </div>
            </div>

        </div>
    </div>

    <!-- 모달 플래너 생성 파트 -->
    <div id="NewPlan" class="planModal">
        <div>
            <h2>새 플래너 생성</h2>
            <form name="planFrm" method="get" action="${pageContext.request.contextPath}/plan.do"> <!-- 서블릿으로 이동하여 저장 -->
                <input type="hidden" name="userNo" value="${member.userNo }"> <!-- 회원 번호 -->
                <div>
                    <label for="">플래너 이름</label>&nbsp;<input type="text" name="subject" id="subject" placeholder="" required>
                </div>
                <div>
                    <label for="">플래너 시작일</label>&nbsp;<input type="text" name="s_date" id="s_date" placeholder="" required>
                </div>
                <div>
                    <label for="">인원</label>&nbsp;<input type="text" name="people" id="people" placeholder="" required>
                </div>
                <p>
                    <input type="submit" value="planner 생성">
                    <input type="button" value="취소" onclick="history.go(-2);"> <!-- 뒤로가기 -->
                </p>
            </form>
        </div>
    </div>

    <!-- 플래너 생성 모달 호출
    기존 플랜과 회원 이라면 실행 -->
    <script>
        var plancode ='${plan.plan_code}';
        var userNo ='${member.userNo}';

        if(plancode =="" && userNo!=""){
            location.href = "#NewPlan";
        }
    </script>


    <!-- 지도 스크립트 -->
    <script>
        var map;

        // var linePath = new Array();//polyline 그릴 좌표 배열
        // var flightPath; //polyline
        var cList = new Array(); //JSON 형식받을 Array (도시들 의 정보)
        var infowindowCons = new Array(); // info 배열
        ${board.stadium}
        ${board.lat}
        ${board.lng}
        <c:forEach var="cityVo" items="${cityList}">//마커찍을 전체 도시들 정보 Array에 저장
            var cityVo = new Object();
            cityVo.city_name = "${cityVo.city_name}";
            cityVo.lat = "${cityVo.lat}";
            cityVo.lng = "${cityVo.lng}";
            cList.push(cityVo); // 반복하여 담기
        </c:forEach>

        function initMap() {

            // 기본 지도 정보 설정
            map = new google.maps.Map(document.getElementById('map'), {
                zoom : 4, // 줌
                center : new google.maps.LatLng(48, 16), // 기본 줌 위치
                mapTypeId : 'roadmap'
            });

            cList.forEach(function(cityVo) {
                var marker = new google.maps.Marker({
                    position : new google.maps.LatLng(cityVo.lat, cityVo.lng),
                    // icon : icon, //아이콘 경로
                    map : map, //어느 지도에 띄울지 지정
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

                infowindowCons.push(infowindowCon);
                //infowindowCons.lastIndexOf();
                //alert(infowindowCons.length);

                marker.addListener('click', function() {//마커마다 클릭이벤트
                    map.setCenter(marker.getPosition());
                    infowindowCon.open(map, marker);
                });
                // linePath.push(new google.maps.LatLng(cityDTO.lat,cityDTO.lng));
            });// CITY들 마커 띄우기 끝

        }

        //마커에서 추가버튼눌렀을떄 여행지 리스트에 추가
        function addCity(idx, ct_name, lat, lng) {

            var lis =  $('#ul').children();
            var daytoadd = 0;
            var s_date;
            var e_date;

            //alert(lis.length);
            <%--if (lis.length==0) {--%>
            <%--    s_date= '${fn:substring(article.s_date, 0,10)}';--%>
            <%--    e_date= moment("${article.s_date}").add('days', 1).format("YYYY-MM-DD").toString();--%>
            <%--    //alert("s_date = "+ s_date);--%>
            <%--} else {--%>
            <%--    lis.each(function(idx,li) {--%>
            <%--        //alert( $(this).find("#day option:selected").val());--%>
            <%--        daytoadd+=parseInt($(this).find("#day option:selected").val());--%>
            <%--        s_date=moment("${article.s_date}").add('days', daytoadd).format("YYYY-MM-DD").toString();--%>
            <%--        e_date=moment(s_date).add('days', 1).format("YYYY-MM-DD").toString();--%>
            <%--    });	//lis.each end--%>
            <%--}--%>

            // 테이블 추가 영역
            var $li = $('<li class="list-group-item" id="cityli">\n'+
                '<h3 class="root-city" id="ct_name">'+ct_name+'</h3>\n'+
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
                '<option value="9">9</option>\n'+
                '<option value="10">10</option>\n'+
                '</select>\n'+
                '박 &nbsp; \n '+
                '</span>\n'+
                '<span class="root-date">'+s_date+' ~ '+e_date+'</span><br />\n'+
                '<span class="root-transport">\n'+
                '<select id="trans">\n'+
                '<option value="tr">기차</option>\n'+
                '<option value="ap">항공</option>\n'+
                '<option value="bs">버스</option>\n'+
                '<option value="fr">보트</option>\n'+
                '<option value="et">기타</option>\n'+
                '</select>\n'+
                '</span>\n'+
                '<span>동행추천허용<input type="checkbox" id="rm_ok"></span>&nbsp;\n'+
                '<span id="lat" style="display: none;">'+lat+'</span>\n'+
                '<span id="lng" style="display: none;">'+lng+'</span>\n'+
                '<button onclick="delCP(this)">제거</button>'+
                '</li>');
            //alert(lat);
            //alert(lng);


            $("#ul").append($li);

            linePath.push(new google.maps.LatLng(lat, lng));
            //alert(linePath);
            addLine();

        }//addCity() end

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