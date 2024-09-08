<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<%@page import="com.backend.facultydb.*"%>
<body>
	<%
	String user = request.getParameter("u");
	String pass = request.getParameter("p");
	if (user.equals("") || pass.equals("")) {
	%>
	<jsp:include page="facultylogin.html" />
	<%
	out.println("<center>Field can not be empty");
	return;
	}
	FacultyDb obj = new FacultyDb();
	try {
	boolean b = obj.checkLogin(user, pass);
	if (b) {
		session.setAttribute("username", user);
		//out.println("Welcome: "+user);
		if (user.equals("8167415579")) {
			response.sendRedirect("adminhome.jsp");
		} else {
			response.sendRedirect("viewfacultydetails.jsp");
		}
	} else {
	%>
	<jsp:include page="facultylogin.html" />
	<%
	out.println("<center>wrong user id password");
	return;
	}
	} catch (Exception e) {
	%>
	<jsp:include page="facultylogin.html" />
	<%
	out.println("<center>Enter valid id and password.");
	return;
	}
	%>

</body>
</html>