<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course details</title>
<style>
table {
	width: 50%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	text-align: left;
}

.bcolor {
	background-color: beige;
	possition: absolute;
}
</style>
</head>
<%@page import="com.backend.course.*,java.sql.*"%>
<body class="bcolor">
	<h3>Course list</h3>
	<table>
		<tr>
			<th>Course Name</th>
			<th>Duration</th>
			<th>Fees</th>
		</tr>

		<%
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "12345");
				ps = con.prepareStatement("Select * from course");
				rs = ps.executeQuery();
				while (rs.next()) {
			String c_name = rs.getString("c_name");
			String duration = rs.getString("duration");
			String fees = rs.getString("fees");
			out.println("<tr>");
			out.println("<td>" + c_name + "</td>");
			out.println("<td>" + duration + "</td>");
			out.println("<td>" + fees + "</td>");
			out.println("</tr>");
				}
			} finally {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</body>
</html>