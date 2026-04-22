<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb","root","Ssal_1568");

PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<html>
<head>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
<h1> Edit Student</h1>

<form action="update.jsp" method="post">

<input type="hidden" name="id" value="<%=id%>">

Name:
<input type="text" name="name" value="<%=rs.getString("name")%>">

Email:
<input type="text" name="email" value="<%=rs.getString("email")%>">

<button type="submit">Update</button>

</form>

<a href="view.jsp"> Back</a>

</div>

</body>
</html>