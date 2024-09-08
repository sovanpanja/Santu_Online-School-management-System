<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>extract location</title>
</head>
<%@ page import="java.io.*, java.net.*, com.google.gson.*" %>
<body>

<%
    String mobileNumber = request.getParameter("mobileNumber");
    String apiKey = "YOUR_GEOLOCATION_SERVICE_API_KEY";
    String apiUrl = "https://api.geolocation.service/locate?number=" + URLEncoder.encode(mobileNumber, "UTF-8") + "&key=" + apiKey;

    URL url = new URL(apiUrl);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");

    BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    String inputLine;
    StringBuilder content = new StringBuilder();

    while ((inputLine = in.readLine()) != null) {
        content.append(inputLine);
    }
    in.close();
    connection.disconnect();

    Gson gson = new Gson();
    JsonObject json = gson.fromJson(content.toString(), JsonObject.class);
    String latitude = json.get("latitude").getAsString();
    String longitude = json.get("longitude").getAsString();

    request.setAttribute("latitude", latitude);
    request.setAttribute("longitude", longitude);

    request.getRequestDispatcher("showLocation.jsp").forward(request, response);
%>

</body>
</html>