<%@ page import="java.sql.*" %> <% String name=request.getParameter("name");
String email=request.getParameter("email");
Class.forName("com.mysql.cj.jdbc.Driver"); Connection
con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb","root","Ssal_1568"); PreparedStatement
ps=con.prepareStatement( "INSERT INTO users(name,email) VALUES(?,?)");
ps.setString(1,name); ps.setString(2,email); ps.executeUpdate();
response.sendRedirect("view.jsp"); %>
