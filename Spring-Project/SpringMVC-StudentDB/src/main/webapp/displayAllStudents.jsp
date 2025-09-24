<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mvc.sdb.entity.Student"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Details</title>

<style>
/* Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Body background */
body {
	font-family: 'Poppins', 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
	min-height: 100vh;
	padding: 30px;
	color: #2d3436;
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

/* Main container */
.container {
	width: 100%;
	max-width: 1200px;
	background: rgba(255, 255, 255, 0.95);
	border-radius: 20px;
	box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
	padding: 40px;
	animation: fadeIn 0.8s ease-in-out;
}

/* Heading */
h2 {
	font-size: 2.5rem;
	text-align: center;
	margin-bottom: 40px;
	font-weight: 600;
	color: #222;
	position: relative;
	letter-spacing: 1px;
}

h2::after {
	content: '';
	width: 80px;
	height: 4px;
	background: linear-gradient(90deg, #06beb6, #48b1bf);
	display: block;
	margin: 12px auto 0;
	border-radius: 3px;
}

/* Table container */
.table-container {
	overflow-x: auto;
	border-radius: 15px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
}

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 15px;
	overflow: hidden;
}

/* Table header (columns) */
th {
	background: linear-gradient(135deg, #1d3557, #457b9d); /* Dark blue to teal */
	color: #fff;
	padding: 16px 14px;
	text-align: left;
	font-size: 14px;
	font-weight: 600;
	letter-spacing: 0.7px;
	text-transform: uppercase;
}

/* Table cells */
td {
	padding: 14px;
	border-bottom: 1px solid #f0f0f0;
	font-size: 14px;
	
	
}

/* Row styles */
tr:nth-child(even) {
	background: #fafbff;
}

/*tr:hover {
	background: #f1faff !important;
	transform: scale(1.005);
	transition: all 0.3s ease;
}
*/
/* Action buttons */

/* VIEW button */
td a[href*="find-all-profiles"] {
	background: linear-gradient(45deg, #06beb6, #48b1bf); /* Teal shades */
	color: white;
	border-radius: 10px;
	padding: 8px 14px;
	font-size: 12px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	text-decoration:none;
	transition:  0.3s ease;
}
td a[href*="find-all-profiles"]:hover {
	box-shadow: 0 6px 18px rgba(6, 190, 182, 0.4);
	transform: translateY(-2px);
}

/* UPDATE button */
td a[href*="find-by-id"] {
	background: linear-gradient(45deg, #1d976c, #93f9b9); /* Green gradient */
	color: white;
	text-decoration:none;
	border-radius: 8px;
	padding: 8px 14px;
	font-size: 12px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	
	transition: all 0.3s ease;
}
td a[href*="find-by-id"]:hover {
	box-shadow: 0 6px 18px rgba(29, 151, 108, 0.4);
	transform: translateY(-2px);
}

/* DELETE button */
td a[href*="delete-by-id"] {
	background: linear-gradient(45deg, #ff512f, #dd2476); /* Orange-pink gradient */
	color: white;
    text-decoration:none;
	border-radius: 8px;
	padding: 8px 14px;
	font-size: 12px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	transition: all 0.3s ease;
}
td a[href*="delete-by-id"]:hover {
	box-shadow: 0 6px 18px rgba(221, 36, 118, 0.4);
	transform: translateY(-2px);
  
}

/* Back button */
.back-link {
	text-align: center;
	margin-top: 40px;
}

.back-link a {
	display: inline-block;
	padding: 14px 28px;
	background: linear-gradient(135deg, #06beb6 0%, #48b1bf 100%);
	color: white;
	text-decoration: none;
	border-radius: 50px;
	font-size: 15px;
	font-weight: 600;
	transition: all 0.3s ease;
	box-shadow: 0 8px 22px rgba(6, 190, 182, 0.3);
}

.back-link a:hover {
	transform: translateY(-3px) scale(1.02);
	box-shadow: 0 12px 30px rgba(6, 190, 182, 0.45);
}

/* Responsive */
@media (max-width: 768px) {
	h2 {
		font-size: 2rem;
	}
	th, td {
		font-size: 12px;
		padding: 10px;
	}
	td a {
		padding: 6px 12px;
		font-size: 11px;
	}
}

@media (max-width: 480px) {
	.container {
		padding: 20px;
	}
	h2 {
		font-size: 1.6rem;
	}
}

/* Animation */
@keyframes fadeIn {
	from {
		opacity: 0;
		transform: translateY(20px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}
</style>
</head>
<body>
	<div class="container">
		<h2>Students Details</h2>
		<%
		List<Student> students = (List) request.getAttribute("StudentObjects");
		%>
		<div class="table-container">
			<table>
				<tr>
					<th>Student ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Phone No</th>
					<th>City</th>
					<th>Profiles</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
				<%
				for (Student student : students) {
				%>
				<tr>
					<td><%=student.getId()%></td>
					<td><%=student.getFirstName()%></td>
					<td><%=student.getLastName()%></td>
					<td><%=student.getEmail()%></td>
					<td><%=student.getPhoneNo()%></td>
					<td><%=student.getCity()%></td>
					<td><a href="find-all-profiles?studentId=<%=student.getId()%>">VIEW</a></td>
					<td><a href="find-by-id?studentId=<%=student.getId()%>">UPDATE</a></td>
					<td><a href="student/delete-by-id?studentId=<%=student.getId()%>">DELETE</a></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<div class="back-link">
			<a href="index.jsp">Go back to Student Dashboard</a>
		</div>
	</div>
</body>
</html>
