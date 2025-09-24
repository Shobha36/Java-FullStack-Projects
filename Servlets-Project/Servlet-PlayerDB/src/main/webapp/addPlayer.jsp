<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Player</title>
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

    .container {
        background-color: #ffffff;
        padding: 30px 25px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        width: 350px;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .container:hover {
        transform: translateY(-5px);
    }

    h1 {
        color: #2c3e50;
        margin-bottom: 25px;
        font-size: 28px;
    }

    form {
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
        border: none;
        border-radius: 10px;
        background-color: #3498db;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
    }

    input[type="submit"]:hover {
        background-color: #ffffff;
        color: #3498db;
        border: 2px solid #3498db;
        transform: scale(1.05);
    }

    @media (max-width: 400px) {
        .container {
            width: 90%;
            padding: 25px 20px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Enter Player Details</h1>
        <form action="add-player" method="post">
            <input type="text" placeholder="Enter player Title" name="title" required>
            <input type="number" placeholder="Enter player Age" name="age" required>
            <input type="number" placeholder="Enter player Salary" name="sal" required>
            <input type="text" placeholder="Enter player Team" name="team" required>
            <input type="text" placeholder="Enter player Nationality" name="nationality" required>
            <input type="submit" value="ADD PLAYER">
        </form>
    </div>
</body>
</html>
