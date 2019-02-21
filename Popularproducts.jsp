<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <% String name=(String)session.getAttribute("check"); %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Popular</title>
<style type="text/css">
body{
background-image:url('images/images.jpg');
background-size:cover;
}
.nice{
border-radius:10px;
box-shadow:inset -4px -4px rgba(0,0,0,0.5);

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
<jsp:include page="adminheader.jsp"></jsp:include>
<div style=width:300px;height:150px;margin-top:260px;background-color:Teal;padding-left:20px;margin-left:40%; class="nice">
<h4 style=text-align:center>Add To popular List</h4>
<form action="popularentry" method="post">
<label>Product Id</label><br>
<input type="number" name="id" placeholder="Enter Valid Product Id" required><br>
<input type="submit" value="Submit">
</form>
</div>
<div style=width:300px;height:150px;margin-left:40%;background-color:Teal;padding-left:20px;margin-top:80px; class="nice">
<h4 style=text-align:center>Delete From popular List</h4>
<form action="populardelete" method="post">
<label>Product Id</label><br>
<input type="number" name="id" placeholder="Enter Valid Product Id" required><br>
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