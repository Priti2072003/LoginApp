<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");

    if (username == null || email == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f6fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 25px;
        }
        table {
            width: 100%;
            margin: 0 auto 20px auto;
            border-collapse: collapse;
        }
        td {
            padding: 10px 15px;
            text-align: left;
            font-weight: 500;
            color: #555;
        }
        td:first-child {
            font-weight: bold;
            color: #333;
            width: 40%;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }
        input[type="submit"]:hover {
            background-color: #b52a37;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Welcome, <%= username %>!</h2>
    <table>
        <tr>
            <td>Username:</td>
            <td><%= username %></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><%= email %></td>
        </tr>
    </table>

    <form action="logout" method="post">
        <input type="submit" value="Logout">
    </form>
</div>
</body>
</html>
