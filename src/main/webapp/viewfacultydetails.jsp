<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user details</title>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	text-align: left;
}

#bcolor {
	background-color: beige;
}
</style>
</head>
<%@page import="com.backend.facultydb.*"%>
<body id="bcolor">
	<%
	String uid = (String) session.getAttribute("username");
	FacultyDb obj = new FacultyDb();
	String f1 = null,f2 = null, f3 = null, f4 = null, f5 = null, f6 = null, f7 = null, f8 = null,f9 = null, f10 = null, f11=null,f12=null;
	try {
		java.util.Vector<String> v = obj.getDetails(uid);
		if (v.size() == 12) {
			f1 = (String) v.get(0);
			f2 = (String) v.get(1);
			f3 = (String) v.get(2);
			f4 = (String) v.get(3);
			f5 = (String) v.get(4);
			f6 = (String) v.get(5);
			f7 = (String) v.get(6);
			f8 = (String) v.get(7);
			f9 = (String) v.get(8);
			f10 = (String) v.get(9);
			f11=(String)v.get(10);
			f12=(String)v.get(11);

		}
	} catch (Exception e) {

		out.println(e);
	}
	String fullName = f2 + " " + f3;
	%>
	<h1>
		Welcome:
		<%=fullName%></h1>
	<hr />
	<h4>Your Details</h4>
	<table>
		<tr>
			<th>Name</th>
			<th><%=fullName%></th>
		</tr>
		<tr>
			<td>User Id/Mobile No</td>
			<td><%=f1%></td>
		</tr>
		<tr>
			<td>Registration No</td>
			<td><%=f12%></td>
		</tr>
		<tr>
			<th>Category</th>
			<td><%=f11%></td>
		</tr>
		<tr>
			<td>Department</td>
			<td><%=f4%></td>
		</tr>
		<tr>
			<td>D.O.B</td>
			<td><%=f5%></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><%=f6%></td>
		</tr>
		<tr>
			<td>Guardian Name</td>
			<td><%=f7%></td>
		</tr>
		<tr>
			<td>City</td>
			<td><%=f8%></td>
		</tr>
		<tr>
			<td>Email Id</td>
			<td><%=f9%></td>
		</tr>
		<tr>
			<td>Date Of Joining</td>
			<td><%=f10%></td>
		</tr>
	</table>
	<hr />
	<h4>
		<a href="facultychangepass.html">Change Password</a> <br>
		<br> <a href="logout.jsp">Log Out</a>
	</h4>
</body>
</html>