<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String name=(String)session.getAttribute("check"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<title>ADMIN PAGE</title>
</head>
<body bgcolor=white >
<%
if(name!=null && name.equalsIgnoreCase("admin")){
	%>
	<div id="b" style=background-image:url(images/55.jpg)>

	<% if(name==null){%>
	<a href="login.jsp" class="span1">Login</a>
	<%
		}
		else{%> <a href="logout.jsp" class="span1">Logout</a><%
		}%>

	<a href="index.jsp" class="span1" >Use as User</a>
<a href="admin.jsp" class="span1">Home</a>
	<h2>RETINOKART</h2>
	<p ><b style=text-color:white;>WELCOME ADMIN </b></p>

	<div id="c" style=margin-right:50px;>
	<form action="Usersearch.jsp" method="post">
	<input type="text" name="search" placeholder="User">
	</form>
	<div style=float:left;>
	<a href="changeStatus.jsp" style=color:white;>Change Order Status</a>
	<a href="showorders.jsp" style=color:white;>Show Orders</a>
	<a href="Popularproducts.jsp" style=color:white;>Add Popular Products</a>
<a href="products.jsp" style=color:white;>Add Products</a>
</div>
	</div>
	<div style=height:20px;>
	
	
	</div>
	
	</div>
<% 
	
}else{
	response.sendRedirect("index.jsp");
}

%>


</body>
</html>