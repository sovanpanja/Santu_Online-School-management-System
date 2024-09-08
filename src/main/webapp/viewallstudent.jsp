<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student details</title>
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
<%@page import="com.backend.studentdb.*,java.sql.*"%>
<body id="bcolor">
	<h3>Student list</h3>
	<table>
	<tr>
						<th>FirstName</th>
						<th>LastName</th>
						<th>Category</th>
						<th>Section</th>
						<th>Registration No</th>
						<th>D.O.B</th>
						<th>Gender</th>
						<th>Guardian Name</th>
						<th>Address</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Session</th>
					</tr>
					
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
	try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "12345");
	ps = con.prepareStatement("Select * from student");
	rs = ps.executeQuery();
	while (rs.next()) {
		String mob=rs.getString("mobile");
		String fName=rs.getString("fName");
		String lName=rs.getString("lName");
		String dept=rs.getString("dept");
		String dob=rs.getString("dob");
		String gender=rs.getString("gender");
		String gname=rs.getString("gname");
		String addr=rs.getString("addr");
		String email=rs.getString("email");
		String sess=rs.getString("session");
		String cat=rs.getString("category");
		String reg=String.valueOf(rs.getInt("uid"));
		
		 out.println("<tr>");
		 out.println("<td>" + fName + "</td>");
		 out.println("<td>" + lName + "</td>");
		 out.println("<td>" + cat + "</td>");
		 out.println("<td>" + dept + "</td>");
		 out.println("<td>" + reg + "</td>");
		 out.println("<td>" + dob + "</td>");
		 out.println("<td>" + gender + "</td>");
		 out.println("<td>" + gname + "</td>");
		 out.println("<td>" + addr + "</td>"); 
		 out.println("<td>" + email + "</td>");
		 out.println("<td>" + mob + "</td>");
		 out.println("<td>" + sess + "</td>");
		 out.println("</tr>");
	}
	}
	finally{
		con.close();
		}
	}
catch(Exception e){
	e.printStackTrace();
}

%>	
	</table>
	<hr />
	<h4>
		<a href="logout.jsp">Log Out</a>
	</h4>
</body>
</html>