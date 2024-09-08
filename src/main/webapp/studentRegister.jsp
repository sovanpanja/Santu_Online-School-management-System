<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Registration form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link rel="stylesheet" href="style.css" />
<style>
/* Importing fonts from Google */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap')
	;

/* Reseting */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: beige;
	min-height: 100vh;
}

/* body::-webkit-scrollbar {
    display: none;
} */
.wrapper {
	max-width: 800px;
	margin: 40px auto;
	padding: 30px 45px;
}

.wrapper label {
	display: block;
	padding-bottom: 0.2rem;
}

.wrapper .form .row {
	padding: 0.6rem 0;
}

.wrapper .form .row .form-control {
	box-shadow: none;
}

.wrapper .form .option {
	position: relative;
	padding-left: 20px;
	cursor: pointer;
}

.wrapper .form .option input {
	opacity: 0;
}

.wrapper .form .checkmark {
	position: absolute;
	top: 1px;
	left: 0;
	height: 20px;
	width: 20px;
	border: 1px solid #bbb;
	border-radius: 50%;
}

.wrapper .form .option input:checked ~.checkmark:after {
	display: block;
}

.wrapper .form .option:hover .checkmark {
	background: #f3f3f3;
}

.wrapper .form .option .checkmark:after {
	content: "";
	width: 10px;
	height: 10px;
	display: block;
	background: beige;
	position: absolute;
	top: 50%;
	left: 50%;
	border-radius: 50%;
	transform: translate(-50%, -50%) scale(0);
	transition: 300ms ease-in-out 0s;
}

#sub {
	display: block;
	width: 100%;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
	color: #333;
}

#sub:focus {
	outline: none;
}

@media ( max-width : 768.5px) {
	.wrapper {
		margin: 30px;
	}
	.wrapper .form .row {
		padding: 0;
	}
}

@media ( max-width : 400px) {
	.wrapper {
		padding: 25px;
		margin: 20px;
	}
}
</style>
</head>
<%@page import="com.backend.course.*,java.sql.*"%>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src="images/logo.png"
				alt="" width="150" height="100" class="source" /></a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.html">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="wrapper rounded bg-white">
		<div class="h3">Student Registration Form</div>
		<form action="studreg.jsp" method="post">
			<div class="row">
				<div class="col-md-6 mt-md-0 mt-3">
					<label>First Name</label> <input type="text" name="fname"
						class="form-control" />
				</div>
				<div class="col-md-6 mt-md-0 mt-3">
					<label>Last Name</label> <input type="text" name="lname"
						class="form-control" />
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 mt-md-0 mt-3">
					<label>Category</label> <select id="sub" name="cat">
						<option>Choose Category</option>
						<option value="general">General</option>
						<option value="obc">OBC</option>
						<option value="sc">SC</option>
						<option value="others">Others</option>
					</select>
				</div>

				<div class="col-md-6 mt-md-0 mt-3">
					<label>Enter D.O.B</label> <input type="date" name="d"
						class="form-control" />
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 mt-md-0 mt-3">
					<label>Gender</label>
					<div class="d-flex align-items-center mt-2">
						<label> <input type="radio" name="rb" value="Male" />Male
							<span class="checkmark"></span>
						</label> <label class="ms-4"> <input type="radio" name="rb"
							value="Female" />Female <span class="checkmark"></span>
						</label>
					</div>
				</div>
				<div class="col-md-6 mt-md-0 mt-3">
					<label>Class</label> <select id="sub" name="dep">
						<option>Select Department</option>
						<%
						Connection con = null;
						PreparedStatement ps = null;
						ResultSet rs = null;

						try {
							Class.forName("com.mysql.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "12345");
							ps = con.prepareStatement("SELECT c_name FROM course");
							rs = ps.executeQuery();
							while (rs.next()) {
								String cName = rs.getString("c_name");
						%>
						<option value="<%=cName%>"><%=cName%></option>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						try {
						con.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						}
						%>
					</select>
				</div>

				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Guardian Name</label> <input type="text" name="gname"
							class="form-control" />
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Enter City</label> <input type="text" name="ct"
							class="form-control" />
					</div>

				</div>

				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Enter Email</label> <input type="email" name="email"
							class="form-control" />
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Enter Phone Number</label> <input type="tel" name="numb"
							class="form-control" />
					</div>

				</div>
				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Academic Session</label> <select id="sub" name="ses">
							<option>Select Session</option>
							<option value="2022-23">2022-23</option>
							<option value="2023-24">2023-24</option>
							<option value="2024-25">2024-25</option>
							<option value="2025-26">2025-26</option>
						</select>
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Enter Password</label> <input type="password" name="pwd"
							class="form-control" />
						<p>(Note: Password must contain atleast one
							UpperCase,LowerCase,number & length should be greater than 6.)</p>
					</div>
				</div>
				<button type="submit" class="btn btn-success">Register</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
