<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
</head>

<body>

<div class="container">
<h1>Student List</h1>

<a href="add.jsp"> Add Student</a>

<br><br>

<table>
<tr>
<th>ID</th><th>Name</th><th>Email</th><th>Action</th>
</tr>

<%
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb","root","Ssal_1568");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM users");

while(rs.next()) {
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td>
<a class="edit" href="edit.jsp?id=<%=rs.getInt("id")%>">Edit</a>
<a class="delete" href="confirmDelete.jsp?id=<%=rs.getInt("id")%>">Delete</a>
</td>
</tr>

<% } %>

</table>

</div>

</body>
</html>