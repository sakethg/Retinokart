<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String name=(String)session.getAttribute("user"); %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<style type="text/css">


</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="dropdown">
 <span class="span">MORE</span>
  <div class="dropdown-content">
    <a href="addmoney.jsp">My Wallet</a><br><br>
     <a href="myorders.jsp">My Orders</a><br><br>
</div>
</div>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
PreparedStatement ps=con.prepareStatement("Select * from user where username=?");
ps.setString(1, name);
ResultSet rs=ps.executeQuery();
if(rs.next()){%>
	<div class="su">
<h2>Update Details</h2>
	<form action="Updateuser" method="post">
<label>User Name</label><br>
<input type="text" name="uname" placeholder="Enter User Name..." value=<%=rs.getString("username") %> readonly><br>
<label>First Name</label> <label style=margin-left:150px;>Last Name</label><br>
<input type="text" name="fname" placeholder="Enter Your First Name..." value=<%=rs.getString("fname") %> required>&nbsp; &nbsp;&nbsp;&nbsp;<input type="text" name="lname" placeholder="Enter Your Last Name..."value=<%=rs.getString("lname") %> required><br>




<label>Email</label><br>
<input type="email" name="email" placeholder="Enter Your Email Id..."value=<%=rs.getString("email") %> required><br>
<label>Mobile Number</label><br>
<input type="number" name="mnumber" placeholder="Enter Mobile Number..." value=<%=rs.getString("mnumber") %> required><br>
<label>PIN Code</label><br>
<input type="text" name="pin" placeholder="Enter Your Pin Code..."value=<%=rs.getString("pin") %> required><br>
<label>Address</label><br>
<textarea rows="4" cols="10"  placeholder="Enter Your Address..." name="address"  required><%=rs.getString("address") %></textarea><br>
<label>Password</label><br>
<input type="password" name="pass" placeholder="Enter password.."value=<%=rs.getString("pass") %> required>&nbsp; &nbsp;&nbsp;&nbsp;
<input type="submit" value="Update">
</form>
</div>
	
	
<%}
else{
	response.sendRedirect("index.jsp");
}
}catch(Exception e){
	e.printStackTrace();
}
%>




</body>
</html>