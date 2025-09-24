<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Profile</title>
<style>
/* Reset & font */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Body styling */
body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
	padding: 20px;
}

/* Form container */
form {
	background: rgba(255, 255, 255, 0.95);
	padding: 40px 30px;
	border-radius: 20px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
	width: 100%;
	max-width: 400px;
	backdrop-filter: blur(8px);
	text-align: center;
	animation: fadeInUp 0.8s ease-out;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* Heading */
h2 {
	text-align: center;
	margin-bottom: 10px;
	color: #2c3e50;
	font-size: 1.8em;
	font-weight: 600;
}

/* Student Id display */
.student-id {
	font-size: 1.4em;
	color: #555555;
	font-style: italic;
	margin-bottom: 20px;
}

/* Input fields */
form input[type="text"] {
	width: 100%;
	padding: 14px 16px;
	margin: 10px 0;
	border: 1px solid #ddd;
	border-radius: 10px;
	font-size: 15px;
	transition: all 0.3s ease;
}

form input[type="text"]:focus {
	border-color: #66a6ff;
	outline: none;
	box-shadow: 0 0 6px rgba(102, 166, 255, 0.5);
}

/* Submit button */
form input[type="submit"] {
	width: 100%;
	padding: 14px 16px;
	margin-top: 20px;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 600;
	background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
	color: white;
	cursor: pointer;
	transition: transform 0.2s, box-shadow 0.3s;
}

form input[type="submit"]:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 20px rgba(67, 233, 123, 0.4);
}

/* Back button inside form */
.back-button {
	display: inline-block;
	margin-top: 15px;
	width: 100%;
	padding: 12px 0;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-weight: 600;
	text-align: center;
	transition: transform 0.2s, box-shadow 0.3s;
}

.back-button:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
}

/* Animation */
@keyframes fadeInUp {
	from { opacity: 0; transform: translateY(30px); }
	to { opacity: 1; transform: translateY(0); }
}

/* Mobile responsive */
@media (max-width: 480px) {
	form {
		padding: 30px 20px;
	}
	h2 {
		font-size: 1.5em;
	}
	.student-id {
		font-size: 0.85em;
	}
	form input[type="text"],
	form input[type="submit"],
	.back-button {
		padding: 12px 14px;
		font-size: 14px;
	}
}
</style>
</head>
<body>
<%
	int studentId = 0;
	if (request.getAttribute("studentId") != null) {
		studentId = (Integer) request.getAttribute("studentId");
	} else if (request.getParameter("studentId") != null) {
		studentId = Integer.parseInt(request.getParameter("studentId"));
	}
%>

<form action="add-profile" method="post">
	<h2>Enter Profile Details</h2>
	<div class="student-id">Student Id: <strong><%=studentId%></strong></div>
	<input type="hidden" name="studentId" value="<%=studentId%>">
	<input type="text" placeholder="Enter Profile Name" name="profileName" required>
	<input type="text" placeholder="Enter URL" name="url" required>
	<input type="submit" value="Add Profile">
	<a class="back-button" href="find-all">Back to Students</a>
</form>

</body>
</html>
