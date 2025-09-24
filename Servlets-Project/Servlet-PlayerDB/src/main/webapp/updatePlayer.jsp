<%@page import="com.dcl.player.model.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Player</title>
<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f8;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 40px;
        font-size: 28px;
    }

    form {
        background-color: #ffffff;
        padding: 30px 25px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        width: 350px;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    input[type="text"],
    input[type="number"] {
        padding: 12px 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="number"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        outline: none;
    }

    input[type="submit"] {
        padding: 12px;
        background-color: #3498db;
        color: #ffffff;
        font-size: 16px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
    }

    input[type="submit"]:hover {
        background-color: #ffffff;
        color: #3498db;
        border: 2px solid #3498db;
        transform: scale(1.05);
    }

    input[readonly] {
        background-color: #e9ecef;
        cursor: not-allowed;
    }

    @media (max-width: 400px) {
        form {
            width: 90%;
            padding: 25px 20px;
        }
    }
</style>
</head>
<body>
    <%
        Player player = (Player) request.getAttribute("PlayerObject");
    %>
    <form action="update-player" method="post">
        <h1>Update Player Details</h1>
        <input type="number" value="<%=player.getPlayerId()%>" name="playerId" readonly>
        <input type="text" value="<%=player.getTitle()%>" name="title" placeholder="Enter Title">
        <input type="number" value="<%=player.getAge()%>" name="age" placeholder="Enter Age">
        <input type="number" value="<%=player.getSal()%>" name="sal" placeholder="Enter Salary">
        <input type="text" value="<%=player.getTeam()%>" name="team" placeholder="Enter Team">
        <input type="text" value="<%=player.getNationality()%>" name="nationality" placeholder="Enter Nationality">
        <input type="submit" value="UPDATE PLAYER">
    </form>
</body>
</html>
