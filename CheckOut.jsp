<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%String name=(String)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
<style type="text/css">
.check{
width:310px;
height:450px;
margin-top:160px;
background-color:gray;
margin-left:40%;
padding-left:20px;
box-shadow:inset -4px -4px rgba(0,0,0,0.5);
}
.check h3{
text-align:center;
}
.check input[type="text"],input[type="number"]{
width:200px;
height:35px;
border-radius:5px;
box-shadow:inset -4px -4px rgba(0,0,0,0.3);
margin-top:10px;
}
.check input[type="submit"],input[type="reset"]{
width:90px;
height:35px;
border-radius:5px;
margin-top:10px;
}
.check label{
margin-top:10px;
font-weight:bolder;
}
.check textarea{
width:200px;
height:80px;
margin-top:10px;
}
</style>
</head>
<body>
<%
String ss=request.getParameter("user");
String id=request.getParameter("id");
int quan=Integer.parseInt(request.getParameter("quan"));
String proname=request.getParameter("proname");
int checkoutm=Integer.parseInt(request.getParameter("checkoutm"));

if(ss!=null){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");		
		PreparedStatement ps=con.prepareStatement("Select * from user where username=?");
		ps.setString(1, ss);
		ResultSet rs=ps.executeQuery();
	if(rs.next()){
		%>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="check">
		<form action="CheckOut" method="post">
		
		<h3>Check Details</h3>
		<label>First Name</label><br>
		<input type="text" name="funam" value="<%= rs.getString("fname")%>" required><br>
		<label>Last Name</label><br>
		<input type="text" name="lunam" value="<%= rs.getString("lname")%>" required><br>
		
		<label>Mobile</label><br>
		<input type="number" name="num" value="<%= rs.getString("mnumber")%>" required><br>
		<label>Full Address</label><br>
		<textarea name="address" required><%=rs.getString("address")%></textarea><br>
		 <input type="hidden" name="id" value="<%=id%>">
	     <input type="hidden" name="user" value="<%=ss%>">
	      <input type="hidden" name="proname" value="<%=proname%>">
	       <input type="hidden" name="checkoutm" value="<%=checkoutm%>">
	    <input type="hidden" name="quan" value="<%=quan%>">
		<input type="submit" value="Continue"><input type="Reset" value="Reset">
		</form>
		</div>
		
		
		<%
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
}else{
	%>
	hii
<% 	
}

%>



</body>
</html>