<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard - Home</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    color: #333;
}

/* Main dashboard container */
.dashboard-container {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
    padding: 50px 40px;
    text-align: center;
    backdrop-filter: blur(10px);
    max-width: 600px;
    width: 100%;
    animation: fadeInUp 0.8s ease-out;
}

/* Welcome header */
h1 {
    color: #2c3e50;
    font-size: 2.8em;
    font-weight: 300;
    margin-bottom: 20px;
    position: relative;
}

h1::after {
    content: '';
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #667eea, #764ba2);
    display: block;
    margin: 15px auto 0;
    border-radius: 2px;
}

/* Navigation section */
.navigation {
    margin-top: 40px;
}

/* Menu links container */
.menu-links {
    display: flex;
    flex-direction: column;
    gap: 25px;
    align-items: center;
}

/* Individual menu link styling */
.menu-link {
    display: inline-block;
    padding: 20px 40px;
    text-decoration: none;
    border-radius: 50px;
    font-size: 18px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    position: relative;
    overflow: hidden;
    min-width: 280px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

/* Add Student link */
.add-student {
    background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
    color: white;
}

.add-student::before {
    margin-right: 10px;
    font-size: 16px;
}

.add-student:hover {
    transform: translateY(-5px) scale(1.05);
    box-shadow: 0 20px 40px rgba(40, 167, 69, 0.3);
}

/* View All Students link */
.view-all {
    background: linear-gradient(135deg, #007bff 0%, #6610f2 100%);
    color: white;
}

.view-all::before {
    
    margin-right: 10px;
    font-size: 16px;
}

.view-all:hover {
    transform: translateY(-5px) scale(1.05);
    box-shadow: 0 20px 40px rgba(0, 123, 255, 0.3);
}

/* Hover effect overlay */
.menu-link::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: left 0.5s ease;
}

.menu-link:hover::after {
    left: 100%;
}

/* Active/Focus states */
.menu-link:active {
    transform: translateY(-3px) scale(1.02);
}

.menu-link:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.3);
}

/* Decorative elements */
.dashboard-container::before {
    content: '';
    position: absolute;
    top: -50px;
    right: -50px;
    width: 100px;
    height: 100px;
    background: linear-gradient(45deg, #667eea, #764ba2);
    border-radius: 50%;
    opacity: 0.1;
    z-index: -1;
}

.dashboard-container::after {
    content: '';
    position: absolute;
    bottom: -30px;
    left: -30px;
    width: 60px;
    height: 60px;
    background: linear-gradient(45deg, #764ba2, #667eea);
    border-radius: 50%;
    opacity: 0.1;
    z-index: -1;
}

/* Responsive design */
@media (max-width: 768px) {
    .dashboard-container {
        padding: 40px 30px;
        margin: 10px;
    }
    
    h1 {
        font-size: 2.2em;
    }
    
    .menu-link {
        padding: 18px 35px;
        font-size: 16px;
        min-width: 250px;
    }
}

@media (max-width: 480px) {
    .dashboard-container {
        padding: 30px 20px;
    }
    
    h1 {
        font-size: 1.8em;
    }
    
    .menu-link {
        padding: 15px 25px;
        font-size: 14px;
        min-width: 200px;
    }
    
    .menu-links {
        gap: 20px;
    }
}

/* Animation keyframes */
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

/* Additional hover effects for enhanced interactivity */
@media (hover: hover) {
    .menu-link:hover {
        animation: pulse 1.5s infinite;
    }
}

@keyframes pulse {
    0% {
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }
    50% {
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    } 
    100% {
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }
}

/* Loading state for links */
.menu-link:active {
    position: relative;
}

.menu-link:active::before {
    animation: spin 0.5s linear;
}

@keyframes spin {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<h1>Welcome to Student Dashboard</h1>
		<div class="navigation">
			<div class="menu-links">
				<a href="addStudent.jsp" class="menu-link add-student">Add New Student</a>
				<a href="find-all" class="menu-link view-all">All Student Details</a>
			</div>
		</div>
	</div>
</body>
</html>
