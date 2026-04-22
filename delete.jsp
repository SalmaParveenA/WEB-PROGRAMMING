<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="java.sql.*" %> <% int id = Integer.parseInt(request.getParameter("id"));
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb","root","Ssal_1568"); PreparedStatement ps =
con.prepareStatement("DELETE FROM users WHERE id=?"); ps.setInt(1,id);
ps.executeUpdate(); response.sendRedirect("view.jsp"); %>
