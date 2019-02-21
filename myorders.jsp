<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String name=(String)session.getAttribute("user"); %>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My orders</title>
<style type="text/css">
body{
background-color:white;
background-size:cover;
}
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
}

</style>
</head>
<body>
<%
if(name!=null){
	%>
	<jsp:include page="header.jsp"></jsp:include><br>
<div style=margin-top:160px;>
<table>
<tr>
<th>Product Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Order Id</th>
<th>Name</th>
<th>Number</th>
<th>Placed Address</th>
<th>Status</th>
</tr>
<%
try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");		
		PreparedStatement ps=con.prepareStatement("Select * from userorders where uname=?");
		ps.setString(1, name);
		ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr><td><%=rs.getString("productname")%></td>
<td><%=rs.getString("price")%></td>
<td><%=rs.getString("quantity")%></td>
<td><%=rs.getString("orderid")%></td>
<td><%=rs.getString("fname")%> <%=rs.getString("lname")%></td>
<td><%=rs.getString("number")%></td>
<td><%=rs.getString("address")%></td>
<td style=color:green;><%=rs.getString("status")%></td>
</tr>

<%
	}
	
	
}catch(Exception e){
	e.printStackTrace();
}

%>
</table>
</div>
	
	
<% 	
}else{
	
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>