<%@ page import="java.sql.*" %> <% int
id=Integer.parseInt(request.getParameter("id")); String
name=request.getParameter("name"); String email=request.getParameter("email");
Class.forName("com.mysql.cj.jdbc.Driver"); Connection
con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb","root","Ssal_1568"); PreparedStatement
ps=con.prepareStatement( "UPDATE users SET name=?,email=? WHERE id=?");
ps.setString(1,name); ps.setString(2,email); ps.setInt(3,id);
ps.executeUpdate(); response.sendRedirect("view.jsp"); %>
