<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@page import="java.util.regex.*,com.backend.applicationdb.*"%>
</head>
<body>
	<%
	String fName = request.getParameter("fname");
	String lName = request.getParameter("lname");
	String section = request.getParameter("sec");
	String dob = request.getParameter("d");
	String gender = request.getParameter("rb");
	String gName = request.getParameter("gname");
	String city = request.getParameter("ct");
	String mail = request.getParameter("email");
	String mob = request.getParameter("numb");
	String cat = request.getParameter("cat");
	
	
	String pass = request.getParameter("pwd");
	
	
	if (fName.equals("") || lName.equals("") || section.equals("Choose Class") || dob.equals("") || gender.equals("")
			|| gName.equals("") || city.equals("") || mail.equals("") || mob.equals("") ||cat.equals("Choose Category")|| pass.equals("")) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>Filed can not be empty");
	return;
	}

	Pattern p = Pattern.compile("[^A-za-z]");
	Matcher m = p.matcher(fName);
	if (m.find()) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>First Name doesnot Contain any white Space And Special Character");
	return;
	}
	Pattern p1 = Pattern.compile("[^A-za-z]");
	Matcher m1 = p1.matcher(lName);
	if (m1.find()) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>Last Name doesnot Contain any white Space And Special Character");
	return;
	}
	Pattern p2 = Pattern.compile("[^A-za-z ]");
	Matcher m2 = p2.matcher(gName);
	if (m2.find()) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>Gurdian Name doesnot Contain any number And Special Character");
	return;
	}
	Pattern p3 = Pattern.compile("[^A-za-z, ]");
	Matcher m3 = p3.matcher(city);
	if (m3.find()) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>City doesnot Contain any number And Special Character");
	return;
	}

	Pattern p4 = Pattern.compile("[^0-9]");
	Matcher m4 = p4.matcher(mob);
	if (m4.find()) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>Number doesnot Contain any white Space And Special Character");
	return;
	}

	for (int i = 0; i < pass.length(); i++) {
	if (' ' == (pass.charAt(i))) {
	%>
	<jsp:include page="apply.html" />
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
	<jsp:include page="apply.html" />
	<%
	out.println("<center>Password requierd atleast 6 character.");
	return;
	}

	if (b1 == false && b2 == false && b3 == false) {
	%>
	<jsp:include page="apply.html" />
	<%
	out.println("<center>Atleast one Number/Special character/Uppercase is required for password");
	return;
	}

	ApplicationDb obj = new ApplicationDb();
	try {
	int i = obj.insertData(mob,fName, lName, section, dob, gender, gName, city, mail, pass, cat);
	if (i > 0) {
		%>
		<jsp:include page="success.jsp" />
		<%
	}
	} catch (Exception e) {
	%>
	<jsp:include page="apply.html" />
	<%
	//out.println(e);
	out.println("<center> Please check your details that you have entered.");
	}
	%>

</body>
</html>