<%@page import="com.dcl.player.model.Player"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Details</title>
<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9fafb;
        padding: 40px 20px;
    }

    h2 {
        text-align: center;
        color: #1a1a1a;
        margin-bottom: 30px;
        font-size: 28px;
    }

    table {
        width: 95%;
        margin: auto;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 20px;
        border-bottom: 1px solid #e0e0e0;
        text-align: center;
        font-size: 16px;
    }

    th {
        background-color: #4a90e2;
        color: #ffffff;
        font-weight: 600;
        text-transform: uppercase;
    }

    tr:nth-child(even) {
        background-color: #f4f6f8;
    }

    tr:hover {
        background-color: #e8f0fe;
        transition: 0.3s;
    }

    a {
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 5px;
        font-weight: 500;
        transition: 0.3s;
    }

    a.update {
        background-color: #f5a623;
        color: white;
    }

    a.update:hover {
        background-color: #d48806;
    }

    a.delete {
        background-color: #e94b3c;
        color: white;
    }

    a.delete:hover {
        background-color: #c0392b;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 30px;
        font-size: 18px;
        color: #4a90e2;
        font-weight: 500;
    }

    .back-link:hover {
        text-decoration: underline;
    }

    @media (max-width: 768px) {
        th, td {
            padding: 10px 8px;
            font-size: 14px;
        }
        h2 {
            font-size: 24px;
        }
    }
</style>
</head>
<body>
    <h2>Player Details</h2>
    <%
    List<Player> players = (List) request.getAttribute("PlayerList");
    %>

    <table>
        <tr>
            <th>Player ID</th>
            <th>Title</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Team</th>
            <th>Nationality</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
        for (Player player : players) {
        %>
        <tr>
            <td><%=player.getPlayerId()%></td>
            <td><%=player.getTitle()%></td>
            <td><%=player.getAge()%></td>
            <td><%=player.getSal()%></td>
            <td><%=player.getTeam()%></td>
            <td><%=player.getNationality()%></td>
            <td><a class="update" href="find-by-id?playerId=<%=player.getPlayerId()%>">UPDATE</a></td>
            <td><a class="delete" href="delete-by-id?playerId=<%=player.getPlayerId()%>">DELETE</a></td>
        </tr>
        <%
        }
        %>
    </table>

    <a class="back-link" href="index.jsp">Go back to Dashboard</a>
</body>
</html>
