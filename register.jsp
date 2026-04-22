<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String message = "";

// Run only when form is submitted
if (request.getMethod().equalsIgnoreCase("POST")) {

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Load MySQL driver (important)
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/testdb",
            "root",
            "Ssal_1568"
        );

        ps = con.prepareStatement(
            "INSERT INTO login (username, email, password) VALUES (?, ?, ?)"
        );

        ps.setString(1, username);
        ps.setString(2, email);
        ps.setString(3, password);

        int i = ps.executeUpdate();

        if (i > 0) {
            response.sendRedirect("login.jsp");
            return;
        }

    } catch (Exception e) {
        message = "Registration failed!";
        e.printStackTrace();
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
</head>

<body>
<div class="container">

    <h2>Register</h2>


    <form method="post" action="register.jsp">

        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>

    <p style="color:red;"><%= message %></p>

    <p>Already have an account? <a href="login.jsp">Login here</a></p>

</div>
</body>
</html>