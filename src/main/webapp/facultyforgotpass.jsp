<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>forgot</title>
</head>
<%@page import="com.backend.facultydb.*"%>
<body>
	<%
	String user = request.getParameter("u");
	if (user.equals("")) {
	%>
	<jsp:include page="facultyforgotpass.html" />
	<%
	out.println("<center>Field can not be empty.");
	return;
	}
	FacultyDb obj = new FacultyDb();
	try {
	String oldPassword = obj.getOldPassword(user);
	if (oldPassword == null) {
	%>
	<jsp:include page="facultyforgotpass.html" />
	<%
	out.println("<center> Invalid user id, Check your User Id.");
	return;
	} else {
	out.println("<center> Your Password is:" + oldPassword);
	return;
	}
	} catch (Exception e) {
	//out.println(e);
	%>
	<jsp:include page="facultyforgotpass.html" />
	<%
	out.println(e);
	//out.println("<center> Invalid user id, Check your User Id.");
	}
	%>
</body>
</html>