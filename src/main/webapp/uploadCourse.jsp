<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>upload course</title>
</head>
<%@page import="java.util.regex.*,com.backend.course.*,java.sql.*"%>
<body>
	<%
	String cName = request.getParameter("cname");
	String duration = request.getParameter("cd");
	String fees = request.getParameter("fees");
	if (cName.equals("") || duration.equals("") || fees.equals("")) {
	%>
	<jsp:include page="uploadCourse.html" />
	<%
	out.println("<center> Field can not be empty");
	return;
	}
	Pattern p = Pattern.compile("[^A-za-z-]");
	Matcher m = p.matcher(cName);
	if (m.find()) {
	%>
	<jsp:include page="uploadCourse.html" />
	<%
	out.println("<center>Course Name doesnot Contain any number");
	return;
	}
	Pattern p1 = Pattern.compile("[^0-9]");
	Matcher m1 = p1.matcher(duration);
	if (m1.find()) {
	%>
	<jsp:include page="uploadCourse.html" />
	<%
	out.println("<center>Duration doesnot Contain any special character");
	return;
	}
	Pattern p2 = Pattern.compile("[^0-9]");
	Matcher m2 = p2.matcher(fees);
	if (m2.find()) {
	%>
	<jsp:include page="uploadCourse.html" />
	<%
	out.println("<center>Fees doesnot Contain any special character");
	return;
	}
	Course obj = new Course();
	try {
	int i = obj.insertData(cName, duration, fees);
	if (i > 0) {
	%>
	<jsp:include page="uploadCourse.html" />
	<%
	out.print("<center>Course Uploaded Successfully");
	}
	} catch (Exception e) {
	out.println(e);
	}
	%>
</body>
</html>