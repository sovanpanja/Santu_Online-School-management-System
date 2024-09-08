<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY"></script>
    <script>
        function initMap() {
            var location = {
                lat: parseFloat('<%= request.getAttribute("latitude") %>'),
                lng: parseFloat('<%= request.getAttribute("longitude") %>')
            };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: location
            });
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
        }
    </script>
</head>
<body onload="initMap()">
    <h1>Location for Mobile Number</h1>
    <div id="map" style="height: 500px; width: 100%;"></div>
</body>
</html>