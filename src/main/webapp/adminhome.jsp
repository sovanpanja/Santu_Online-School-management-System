<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.backend.facultydb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
    String uid = (String) session.getAttribute("username");
    FacultyDb obj = new FacultyDb();
    String f1 = null, f2 = null, f3 = null, f4 = null, f5 = null, f6 = null, f7 = null, f8 = null, f9 = null, f10 = null, f11=null, f12=null;
    try {
        java.util.Vector<String> v = obj.getDetails(uid);
        if (v.size() == 12) {
            f1 = v.get(0);
            f2 = v.get(1);
            f3 = v.get(2);
            f4 = v.get(3);
            f5 = v.get(4);
            f6 = v.get(5);
            f7 = v.get(6);
            f8 = v.get(7);
            f9 = v.get(8);
            f10 = v.get(9);
            f11=v.get(10);
            f12=v.get(11);
        }
    } catch (Exception e) {
        out.println(e);
    }
    String fullName = f2 + " " + f3;
%>

<!-- view -->
<nav class="navbar navbar-expand-lg bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="images/logo.png" alt="" width="150" height="100" class="source" />
        </a>
    </div>
</nav>

<ul class="nav nav-pills nav-fill mt-2">
    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
    <li class="nav-item"><a class="nav-link" href="viewfacultydetails.jsp">View Details</a></li>
    <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Manage Student
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="studentRegister.jsp">Add Student</a></li>
							<li><a class="dropdown-item" href="viewallstudent.jsp">View Student</a></li>
						</ul></li>
     <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Manage Faculty
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="facultyReg.html">Add Faculty</a></li>
							<li><a class="dropdown-item" href="viewAllFaculty.jsp">View Faculty</a></li>
						</ul></li>
						 <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Manage Course
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="uploadCourse.html">Add Course</a></li>
							<li><a class="dropdown-item" href="viewCourse.jsp">View Course</a></li>
						</ul></li>
     <li class="nav-item"><a class="nav-link" href="#">View Application</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Make Payment</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Generate Result</a></li>
</ul>
<hr />
<div class="m-2">
    <h2 class="text-success">
        Hello: <%= fullName %> /admin
    </h2>
    <p class="text-success">Welcome to: ABC Private School.</p>
</div>

<h4>
    <a href="facultychangepass.html">Change Password</a><br><br>
    <a href="logout.jsp">Log Out</a>
</h4>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>