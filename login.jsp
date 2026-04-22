<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String error = "";

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/testdb",
            "root",
            "Ssal_1568"
        );

        ps = con.prepareStatement(
            "SELECT * FROM login WHERE username=? AND password=?"
        );

        ps.setString(1, username);
        ps.setString(2, password);

        rs = ps.executeQuery();

        if (rs.next()) {
            // login success
            session.setAttribute("user", username);
            response.sendRedirect("view.jsp");
            return;
        } else {
            error = "Invalid username or password!";
        }

    } catch (Exception e) {
        error = "Something went wrong!";
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>
<div class="container">

    <h2>Login</h2>

    <form method="post" action="login.jsp">

        <label>Username:</label>
        <input type="text" id="username" name="username"><br><br>

        <label>Password:</label>
        <input type="password" id="password" name="password"><br><br>

        <input type="submit" value="Login">
    </form>

    <p style="color:red;"><%= error %></p>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $("form").submit(function(event) {
        var username = $("#username").val();
        var password = $("#password").val();

        if (username === "" || password === "") {
            alert("Please fill in all fields.");
            event.preventDefault();
        }
    });
});
</script>

</body>
</html>