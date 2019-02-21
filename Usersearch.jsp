<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String name=(String)session.getAttribute("check"); %>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Search</title>
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
if(name!=null && name.equalsIgnoreCase("admin")){
	%>
	<jsp:include page="adminheader.jsp"></jsp:include>
	<br>
<div style=margin-top:160px;>
<table>
<tr>
<th>Uname</th>
<th>Full Name</th>
<th>Gender</th>
<th>Email Id</th>
<th>Mobile Number</th>
<th>Pin</th>
<th>Address</th>
<th>User Type</th>
</tr>
<%
try{
	String uname=request.getParameter("search");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");		
		PreparedStatement ps=con.prepareStatement("Select * from user where username=?");
	 ps.setString(1, uname);
	 
		ResultSet rs=ps.executeQuery();
	if(rs.next()){
%>
<tr><td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%> <%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td style=color:green;><%=rs.getString(10)%></td>
</tr>

<%
	}else{
		%>
		<tr><th style=color:red>User Not Found</th></tr>
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