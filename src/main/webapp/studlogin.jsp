<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<%@page import="com.backend.studentdb.*"%>
<body>
	<%
	String user = request.getParameter("u");
	String pass = request.getParameter("p");
	if (user.equals("") || pass.equals("")) {
	%>
	<jsp:include page="studlogin.html" />
	<%
	out.println("<center>Field can not be empty");
	return;
	}
	StudentDb obj = new StudentDb();
	try {
	boolean b = obj.checkLogin(user, pass);
	if (b) {
		session.setAttribute("username", user);
		//out.println("Welcome: " + user);
		response.sendRedirect("studenthome.jsp");
	} else {
	%>
	<jsp:include page="studlogin.html" />
	<%
	out.println("<center>wrong user id password");
	return;
	}
	} catch (Exception e) {
	%>
	<jsp:include page="studlogin.html" />
	<%
	out.println("<center>Enter valid id and password.");
	return;
	}
	%>
</body>
</html>