<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<%@page import="java.util.regex.*,com.backend.studentdb.*"%>
<body>
	<%
	String fName = request.getParameter("fname");
	String lName = request.getParameter("lname");
	String dept = request.getParameter("dep");
	String dob = request.getParameter("d");
	String gender = request.getParameter("rb");
	String gName = request.getParameter("gname");
	String city = request.getParameter("ct");
	String mail = request.getParameter("email");
	String mob = request.getParameter("numb");
	String pass = request.getParameter("pwd");
	String sess = request.getParameter("ses");
	String cat = request.getParameter("cat");
	if (fName.equals("") || lName.equals("") || dept.equals("Select Department") || dob.equals("") || gender.equals("")
			|| gName.equals("") || city.equals("") || mail.equals("") || mob.equals("") || pass.equals("")
			|| sess.equals("Select session")) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>Filed can not be empty");
	return;
	}

	Pattern p = Pattern.compile("[^A-za-z]");
	Matcher m = p.matcher(fName);
	if (m.find()) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>First Name doesnot Contain any white Space And Special Character");
	return;
	}
	Pattern p1 = Pattern.compile("[^A-za-z]");
	Matcher m1 = p1.matcher(lName);
	if (m1.find()) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>Last Name doesnot Contain any white Space And Special Character");
	return;
	}
	Pattern p2 = Pattern.compile("[^A-za-z ]");
	Matcher m2 = p2.matcher(gName);
	if (m2.find()) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>Gurdian Name doesnot Contain any number And Special Character");
	return;
	}
	Pattern p3 = Pattern.compile("[^A-za-z, ]");
	Matcher m3 = p3.matcher(city);
	if (m3.find()) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>City doesnot Contain any number And Special Character");
	return;
	}

	Pattern p4 = Pattern.compile("[^0-9]");
	Matcher m4 = p4.matcher(mob);
	if (m4.find()) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>Number doesnot Contain any white Space And Special Character,can only contain 10 digits");
	return;
	}

	for (int i = 0; i < pass.length(); i++) {
	if (' ' == (pass.charAt(i))) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>no white space allowed in Password");
	return;
	}
	}
	boolean b1 = false, b2 = false, b3 = false;
	for (int i = 0; i < pass.length(); i++) {
	char ch = pass.charAt(i);
	if (Character.isDigit(ch)) {
	b1 = true;
	}
	if (Character.isUpperCase(ch)) {
	b2 = true;
	}
	}
	Pattern p5 = Pattern.compile("[^a-z0-9A-Z]");
	Matcher m5 = p5.matcher(pass);
	if (m5.find()) {
	b3 = true;
	}

	if (pass.length() < 6) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>Password requierd atleast 6 character.");
	return;
	}

	if (b1 == false && b2 == false && b3 == false) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println("<center>Atleast one Number/Special character/Uppercase is required for password");
	return;
	}

	StudentDb obj = new StudentDb();
	try {
	int i = obj.insertData(mob, fName, lName, dept, dob, gender, gName, city, mail, pass, sess,cat);
	if (i > 0) {
		%>
		<jsp:include page="success.jsp" />
		<%
	}
	} catch (Exception e) {
	%>
	<jsp:include page="studentRegister.jsp" />
	<%
	out.println(e);
	//out.println("<center> Please check your details that you have entered.");
	}
	%>
</body>
</html>