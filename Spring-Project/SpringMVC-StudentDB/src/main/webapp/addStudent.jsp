<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
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
    animation: fadeInUp 0.8s ease-out;
}

/* Form heading */
form h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2c3e50;
    font-size: 1.8em;
    font-weight: 600;
}

/* Input fields */
form input[type="text"],
form input[type="email"],
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
    border-color: #74ebd5;
    outline: none;
    box-shadow: 0 0 6px rgba(116, 235, 213, 0.5);
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
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.3s;
}

form input[type="submit"]:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.4);
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

    form h2 {
        font-size: 1.5em;
    }
}
</style>
</head>
<body>
  <form action="add-student" method="post">
    <h2>Add New Student</h2>
    <input type="text" placeholder="Enter First Name" name="firstName" required>
    <input type="text" placeholder="Enter Last Name" name="lastName" required>
    <input type="email" placeholder="Enter Email" name="email" required>
    <input type="number" placeholder="Enter Phone No" name="phoneNo" required>
    <input type="text" placeholder="Enter City" name="city" required>
    <input type="submit" value="Add Student">
  </form>
</body>
</html>
