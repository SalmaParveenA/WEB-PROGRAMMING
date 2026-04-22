<html>
<head>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
<h2> Are you sure you want to delete?</h2>

<a class="delete" href="delete.jsp?id=<%=request.getParameter("id")%>">YES, DELETE</a>

<br><br>

<a href="view.jsp">CANCEL</a>

</div>

</body>
</html>