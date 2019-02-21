<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String name=(String)session.getAttribute("check"); %>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Status</title>
<style type="text/css">
body{
background-image:url('images/p.jpg');
background-size:cover;
}
.nice{
border-radius:10px;
box-shadow:inset -4px -4px rgba(0,0,0,0.5);
padding-left:20px;
margin-left:40%;
}
.nice input[type="number"]{
border-radius:5px;

}

</style>
</head>
<body>
<%
if(name!=null && name.equalsIgnoreCase("admin")){
	%>
	<jsp:include page="adminheader.jsp"></jsp:include><br><br>
	<div style=width:300px;height:200px;margin-top:160px;background-color:teal; class="nice">
	<form action="ChangeStatus" method="post">
	<h4 style=text-align:center;>Change Order Status</h4>
	<label>Enter Order Id</label><br>
	<input type="number" name="id" placeholder="Enter Valid Order Id" required><br><br>
	<label>Select Status</label><br>
	<select name="select" required>
	<option value="processing">Processing</option>
	<option value="In-Progress..">In-Progress</option>
	<option value="Confirmed">Confirmed</option>
	<option value="Placed">Placed</option>
	<option value="Delivered">Delivered</option>
	<option value="Cancelled">Cancelled</option>
	</select><br><br>
	<input type="submit" value="Submit">
	</form>
	
	</div>
	
<% 	
}else{
	response.sendRedirect("index.jsp");
	}

%>


</body>
</html>