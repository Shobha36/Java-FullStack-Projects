<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Project Dashboard</title>
<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f0f4f8;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        padding: 20px;
    }

    h1 {
        color: #2c3e50;
        margin-bottom: 50px;
        font-size: 36px;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }

    .dashboard {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 25px;
    }

    .card {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        min-width: 200px;
    }

    .card a {
        display: inline-block;
        text-decoration: none;
        color: #ffffff;
        background-color: #3498db;
        padding: 12px 25px;
        border-radius: 10px;
        font-size: 18px;
        transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
    }

    .card a:hover {
        background-color: #ffffff;
        color: #3498db;
        border: 2px solid #3498db;
        transform: scale(1.05);
    }

    @media (max-width: 500px) {
        .card {
            min-width: 90%;
        }
    }
</style>
</head>
<body>
    <h1>Welcome to Player Dashboard</h1>
    <div class="dashboard">
        <div class="card">
            <a href="addPlayer.jsp">Add New Player</a>
        </div>
        <div class="card">
            <a href="display-all-players">Display All Players</a>
        </div>
    </div>
</body>
</html>
