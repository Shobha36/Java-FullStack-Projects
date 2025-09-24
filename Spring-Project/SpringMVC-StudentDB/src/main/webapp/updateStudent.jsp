<%@page import="com.mvc.sdb.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Student</title>
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
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
    padding: 20px;
}

/* Form container */
form {
    background: rgba(255, 255, 255, 0.95);
    padding: 40px 30px;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    width: 100%;
    max-width: 450px;
    backdrop-filter: blur(8px);
    animation: fadeInUp 0.8s ease-out;
}

/* Heading */
h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2c3e50;
    font-size: 1.8em;
    font-weight: 600;
}

/* Input fields */
form input[type="text"],
form input[type="number"] {
    width: 100%;
    padding: 14px 16px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 10px;
    font-size: 15px;
    transition: all 0.3s ease;
}

form input:focus {
    border-color: #66a6ff;
    outline: none;
    box-shadow: 0 0 6px rgba(102,166,255,0.5);
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
    box-shadow: 0 10px 20px rgba(67,233,123,0.4);
}

/* Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Mobile responsive */
@media (max-width: 480px) {
    form {
        padding: 30px 20px;
    }

    h2 {
        font-size: 1.5em;
    }
}
</style>
</head>
<body>

<%
    Student student = (Student) request.getAttribute("key1");
%>

<form action="update-student" method="post">
    <h2>Update Student Details</h2>
    <input type="hidden" name="id" value="<%=student.getId()%>">
    <input type="text" value="<%=student.getFirstName()%>" name="firstName" placeholder="First Name" required>
    <input type="text" value="<%=student.getLastName()%>" name="lastName" placeholder="Last Name" required>
    <input type="text" value="<%=student.getEmail()%>" name="email" placeholder="Email" required>
    <input type="number" value="<%=student.getPhoneNo()%>" name="phoneNo" placeholder="Phone Number" required>
    <input type="text" value="<%=student.getCity()%>" name="city" placeholder="City" required>
    <input type="submit" value="Update Student">
</form>

</body>
</html>
