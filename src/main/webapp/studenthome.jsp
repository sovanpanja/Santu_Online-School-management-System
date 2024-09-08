<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.backend.studentdb.*" %>
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
    StudentDb obj = new StudentDb();
    String f1 = null, f2 = null;
    try {
        java.util.Vector<String> v = obj.getName(uid);
        if (v.size() == 2) {
            f1 = v.get(0);
            f2 = v.get(1);
        }
    } catch (Exception e) {
        out.println(e);
    }
    String fullName = f1 + " " + f2;
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
    <li class="nav-item"><a class="nav-link" href="viewstudentdetails.jsp">View Details</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Course Details</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Make Payment</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Result</a></li>
</ul>
<hr />
<div class="m-2">
    <h2 class="text-success">
        Hello: <%= fullName %></h2>
    <p class="text-success">Welcome to: ABC Private School.</p>
</div>

<h4>
    <a href="studchangepass.html">Change Password</a><br><br>
    <a href="logout.jsp">Log Out</a>
</h4>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>