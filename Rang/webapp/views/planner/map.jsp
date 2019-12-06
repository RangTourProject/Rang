<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Planner</title>
    <c:import url="../../views/common/commonUtil.jsp"/>
    <style>
    #map {
        /* 지도 크기 지정 */
        height: 400px;
        width: 100%;
    }
    </style>
</head>
<body>
<c:import url="../../views/common/nav.jsp"/>
<section>

    <!-- 검색창 -->
    <div id="search-panel">
        <input id="address" type="text" placeholder="검색할 위치를 입력하세요." />
        <button id="submit" type="button" value="Geocode">지도 검색</button>
    </div>

    <!-- 지도 호출 -->
    <div id="map"></div>

    <script>
        /**
         * Google Map API 주소의 callback 파라미터와 동일한 이름의 함수이다.
         * Google Map API에서 콜백으로 실행시킨다.
         */
        function initMap() {
            console.log('Map is initialized.');

            /*
             * 기본 맵을 설정.
             * 1번째 파라미터 : 구글 맵을 표시할 위치. 여기서는 #map
             * 2번째 파라미터 : 맵 옵션.
             *      ㄴ zoom : 맵 확대 정도
             *      ㄴ center : 맵 중심 좌표 설정
             *              ㄴ lat : 위도 (latitude)
             *              ㄴ lng : 경도 (longitude)
             */

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12.5,
                center: {
                    lat: -34.397,
                    lng: 150.644
                }
            });

            /**
             * Google Geocoding. Google Map API에 포함되어 있다.
             */
            var geocoder = new google.maps.Geocoder();

            // submit 버튼 클릭 이벤트 실행
            document.getElementById('submit').addEventListener('click', function() {
                console.log('submit 버튼 클릭 이벤트 실행');

                // 여기서 실행
                geocodeAddress(geocoder, map);
            });

            /*
             * geocodeAddress
             *
             * 입력한 주소로 맵의 좌표를 바꾼다.
             */
            function geocodeAddress(geocoder, resultMap) {
                console.log('geocodeAddress 함수 실행');

                /*
                * 지오코드로 부터 입력받은 주소 저장
                */
                var address = document.getElementById('address').value;

                /**
                 * 입력받은 주소로 좌표에 맵 마커를 찍는다.
                 * 1번째 파라미터 : 주소 등 여러가지.
                 *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
                 *
                 * 2번째 파라미터의 함수
                 *      ㄴ result : 결과값
                 *      ㄴ status : 상태. OK가 나오면 정상.
                 */
                geocoder.geocode({'address': address}, function(result, status) {
                    console.log(result);
                    console.log(status);

                    if (status === 'OK') {
                        // 맵의 중심 좌표를 설정한다.
                        resultMap.setCenter(result[0].geometry.location);
                        // 맵의 확대 정도를 설정한다.
                        resultMap.setZoom(18);
                        // 맵 마커
                        var marker = new google.maps.Marker({
                            map: resultMap,
                            position: result[0].geometry.location
                        });

                        // 도시 주소
                        console.log(result[0].formatted_address);
                        // 위도
                        console.log('위도(latitude) : ' + marker.position.lat());
                        // 경도
                        console.log('경도(longitude) : ' + marker.position.lng());
                    } else {
                        alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                    }
                });
            }
        }
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