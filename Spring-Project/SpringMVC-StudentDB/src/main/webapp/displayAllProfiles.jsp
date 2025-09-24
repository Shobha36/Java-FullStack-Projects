<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mvc.sdb.entity.ProfileUrl"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>List of Profiles</title>
<style>
/* Body */
body {
    background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
    min-height: 100vh;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    font-family: 'Segoe UI', sans-serif;
}

/* Container */
.container {
    max-width: 900px;
    width: 100%;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 15px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
    padding: 30px;
    backdrop-filter: blur(10px);
    animation: fadeIn 0.8s ease-out;
}

/* Heading */
h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
    font-size: 2em;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 20px;
}

th {
    background: #4a69bd;
    color: #fff;
    padding: 15px;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
    text-align: left;
}

td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
    color: #333;
}

tr:nth-child(even) {
    background-color: #f1f3f6;
}

tr:nth-child(odd) {
    background-color: #ffffff;
}


/* Links in table */
td a {
    display: inline-block;
    padding: 6px 12px;
    text-decoration: none;
    border-radius: 25px;
    font-size: 12px;
    font-weight: 600;
    transition: all 0.3s ease;
    margin: 2px;
}

/* Preserve case for URL links */
td.url a {
    text-transform: none;   
    font-size:16px;
    font-weight: normal;  
    color: #0066cc;         
}


/* Update Button */
td a[href*="find-profile-by-id"] {
    background: linear-gradient(45deg, #007bff, #6610f2);
    color: white;
}

/* Delete Button */
td a[href*="delete-by-id"] {
    background: linear-gradient(45deg, #dc3545, #e83e8c);
    color: white;
}

/* Action Buttons (Add / Back) */
.actions {
    text-align: center;
    margin-top: 20px;
}

.actions a {
    display: inline-block;
    margin: 5px 10px;
    padding: 12px 20px;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 600;
    color: white;
    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
    transition: transform 0.2s, box-shadow 0.3s;
}

.actions a.view-all {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

/* Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px);}
    to { opacity: 1; transform: translateY(0);}
}

/* Responsive */
@media (max-width: 768px) {
    th, td { font-size: 12px; padding: 10px; }
    .actions a { padding: 10px 16px; font-size: 12px; }
}

@media (max-width: 480px) {
    th, td { font-size: 11px; padding: 8px; }
    .actions a { padding: 8px 12px; font-size: 11px; }
}
</style>
</head>
<body>
<div class="container">
    <h2>Profile Details</h2>
    <%
        List<ProfileUrl> profiles = (List) request.getAttribute("ProfilesOfStudent");
        int studentId = (Integer) request.getAttribute("studentId");
    %>

    <table>
        <tr>
            <th>Profile.No</th>  
            <th>Profile Name</th> 
            <th>URL</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
            int counter = 1;
            if (profiles != null) {
                for(ProfileUrl profile : profiles){
        %>
        <tr>
            <td><%= counter %></td>
            <td><%= profile.getProfileName() %></td>
           <td class="url"><a href="<%= profile.getUrl() %>" target="_blank"><%= profile.getUrl() %></a></td>
            <td><a href="find-profile-by-id?profileId=<%=profile.getProfileId()%>&studentId=<%=studentId%>">UPDATE</a></td>
            <td><a href="delete-by-id?profileId=<%=profile.getProfileId()%>&studentId=<%=studentId%>">DELETE</a></td>
        </tr>
        <%
                    counter++;
                }
            }
        %>
    </table>

    <div class="actions">
        <a href="addNewProfile.jsp?studentId=<%=studentId%>">Add New Profile</a>
        <a href="find-all" class="view-all">All Student Details</a>
    </div>
</div>
</body>
</html>
