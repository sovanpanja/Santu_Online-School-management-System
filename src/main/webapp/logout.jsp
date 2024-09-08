<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>
</head>
<body>
	<%
	session = request.getSession(false);
	if (session == null) {
		response.sendRedirect("index.html");
	} else {
		session.invalidate();
		response.sendRedirect("index.html");
	}
	%>
</body>
</html>