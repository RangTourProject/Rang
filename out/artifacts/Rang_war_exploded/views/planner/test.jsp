<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Planner</title>
    <c:import url="../../views/common/commonUtil.jsp"/>
    <style>
        /* 지도 사이즈 */
        #map {
            height: 400px;
            width: 300px;
        }
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #description {
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
        }
        /* 인포창 */
        #infowindow-content .title {
            font-weight: bold;
        }

        #infowindow-content {
            display: none;
        }

        #map #infowindow-content {
            display: inline;
        }

        /* 검색창 css */
        .pac-card {
            margin: 10px 10px 0 0;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            font-family: Roboto;
        }

        #pac-container {
            padding-bottom: 12px;
            margin-right: 12px;
        }

        .pac-controls {
            display: inline-block;
            padding: 5px 11px;
        }

        .pac-controls label {
            font-family: Roboto;
            font-size: 13px;
            font-weight: 300;
        }

        #pac-input {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 400px;
        }

        #pac-input:focus {
            border-color: #4d90fe;
        }

        #title {
            color: #fff;
            background-color: #4d90fe;
            font-size: 25px;
            font-weight: 500;
            padding: 6px 12px;
        }
        #target {
            width: 345px;
        }
    </style>
</head>
<body>
<c:import url="../../views/common/nav.jsp"/>
<section>
    <!-- 자동완성 검색창 -->
    <div style="display: none">
        <input id="pac-input"
               class="controls"
               type="text"
               placeholder="Enter a location">
    </div>
    <!-- 지도 -->
    <div id="map"></div>
    <!-- 인포 -->
    <div id="infowindow-content">
        <span id="place-name"  class="title"></span><br>
        <strong>Place ID</strong>: <span id="place-id"></span><br>
        <span id="place-address"></span>
    </div>

    <script>
        // This sample requires the Places library. Include the libraries=places
        // parameter when you first load the API. For example:
        // <script
        // src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

        function initMap() {
            var map = new google.maps.Map(
                document.getElementById('map'),
                {center: {lat: -33.8688, lng: 151.2195}, zoom: 13});

            var input = document.getElementById('pac-input');

            var autocomplete = new google.maps.places.Autocomplete(input);

            autocomplete.bindTo('bounds', map);

            // Specify just the place data fields that you need.
            autocomplete.setFields(['place_id', 'geometry', 'name', 'formatted_address']);

            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

            var infowindow = new google.maps.InfoWindow();
            var infowindowContent = document.getElementById('infowindow-content');
            infowindow.setContent(infowindowContent);

            var geocoder = new google.maps.Geocoder;

            var marker = new google.maps.Marker({map: map});

            marker.addListener('click', function() {

                infowindow.open(map, marker);
            });

            autocomplete.addListener('place_changed', function() {
                infowindow.close();
                var place = autocomplete.getPlace();

                if (!place.place_id) {
                    return;
                }

                geocoder.geocode({'placeId': place.place_id}, function(results, status) {
                    if (status !== 'OK') {
                        window.alert('Geocoder failed due to: ' + status);
                        return;
                    }

                    map.setZoom(11);
                    map.setCenter(results[0].geometry.location);

                    // place_id 와 로케이션 정보를 활용하여 마커 표시
                    marker.setPlace(
                        {placeId: place.place_id, location: results[0].geometry.location});

                    marker.setVisible(true);

                    // 인포 창에 정보 입력
                    infowindowContent.children['place-name'].textContent = place.name;
                    infowindowContent.children['place-id'].textContent = place.place_id;
                    infowindowContent.children['place-address'].textContent =
                        results[0].formatted_address;

                    // 인포창 열기
                    infowindow.open(map, marker);

                    // 도시 정보
                    console.log(results[0].formatted_address);
                    console.log(results[0]);
                    console.log(place.name);
                    console.log(results[0].geometry.location.lat());
                    console.log(results[0].geometry.location.lng());
                });
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3phkjHg5O4aOf3Scz99ZBCjg75C6MDnA&libraries=places&callback=initMap"
            async defer></script>
</section>

<!-- footer -->
<c:import url="../../views/common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>

</body>
</html>