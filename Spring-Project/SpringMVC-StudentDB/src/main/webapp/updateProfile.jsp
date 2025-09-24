<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mvc.sdb.entity.ProfileUrl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile</title>
<style>
/* Reset & font */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Body */
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
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
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

/* Back link */
.back-link {
    text-align: center;
    margin-top: 20px;
}

.back-link a {
    display: inline-block;
    padding: 12px 25px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-decoration: none;
    border-radius: 50px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.back-link a:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
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
    ProfileUrl profile = (ProfileUrl) request.getAttribute("profile");
    if (profile == null) {
%>
    <h3 style="text-align:center; color:red;">Error: Profile not found!</h3>
    <div class="back-link">
        <a href="find-all">Back to Student List</a>
    </div>
<%
    } else {
        Integer studentIdObj = (Integer) request.getAttribute("studentId");
        int studentId = (studentIdObj != null) ? studentIdObj : 0;
%>
<form action="update-profile" method="post">
    <h2>Update Profile Details</h2>
    <input type="hidden" name="profileId" value="<%=profile.getProfileId()%>" readonly>
    
    <label>Student Id:</label>
    <input type="number" name="studentId" value="<%=studentId%>" readonly>
    
    <label>Profile Name:</label>
    <input type="text" name="profileName" value="<%=profile.getProfileName()%>" required>
    
    <label>URL:</label>
    <input type="text" name="url" value="<%=profile.getUrl()%>" required>
    
    <input type="submit" value="Update Profile">

    <div class="back-link">
        <a href="find-all-profiles?studentId=<%=studentId%>">Back to Profiles</a>
    </div>
</form>
<% } %>
</body>
</html>
