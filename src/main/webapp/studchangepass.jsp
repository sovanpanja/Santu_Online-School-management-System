<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>change</title>
</head>
<%@page import="com.backend.studentdb.*"%>
<body>
	<%
	String oldPass = request.getParameter("op");
	String newPass = request.getParameter("np");
	String confirmPass = request.getParameter("cp");
	session = request.getSession(false);
	if (session == null) {
	%>
	<jsp:include page="index.html" />
	<%
	}
	String uid = (String) session.getAttribute("username");
	StudentDb obj = new StudentDb();
	try {
	String oldPass1 = obj.getOldPassword(uid);
	if (oldPass.equals(oldPass1)) {
		if (newPass.equals(confirmPass)) {
			int i = obj.changePassword(oldPass, newPass);
			if (i > 0) {
	%>
	<jsp:include page="studchangepass.html" />
	<%
	out.println("<center><b> Password change successfully </b>");
	return;
	}
	} else {
	%>
	<jsp:include page="studchangepass.html" />
	<%
	out.println("<center><b> Worng confirm password </b>");
	return;
	}
	} else {
	%>
	<jsp:include page="studchangepass.html" />
	<%
	out.println("<center><b> Your old password is wrong </b>");
	return;
	}
	} catch (Exception e) {
	%>
	<jsp:include page="studchangepass.html" />
	<%
	out.println(e);
	}
	%>
</body>
</html>