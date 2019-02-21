<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%String name=(String)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<title>Add Money</title>
<style type="text/css">
.addmoney{
margin:0 auto;
margin-top:150px;
width:450px;
height:480px;
background-color:gray;
border-radius:15px;
box-shadow:inset -5px -5px rgba(0,0,0,0.5); 
padding-left:25px;
}
.addmoney h3{
color:white;
font-weight:bolder;
text-align:center;
}
.addmoney label{

color:white;
}
.addmoney input[type="text"]{
width:200px;
height:30px;
padding-left:10px;
border-radius:5px;
}
.addmoney input[type="number"]{
width:200px;
height:30px;
padding-left:10px;
border-radius:5px;
}
.addmoney input[type="password"]{
width:200px;
height:30px;
padding-left:10px;
border-radius:5px;
}
.addmoney input[type="submit"]{
width:80px;
height:30px;
font-weight:bolder;
border-radius:5px;
margin-left:20px;
}
.addmoney input[type="reset"]{
width:80px;
height:30px;
font-weight:bolder;
border-radius:5px;
margin-left:20px;
}
</style>
<script>
function click1(){
	if(document.frm.cnumber.value==""){
	alert("Enter valid Card number");
	return false;
	}
}


<script>
function click1(){
	if(document.frm.cnumber.value==""){
	alert("Enter valid Card number");
	return false;
	}
}


</script>


</head>
<body>
<%
if(name!=null){
	%>
<jsp:include page="header.jsp"></jsp:include>

<div class="addmoney">
<form action="Addmoney" method="post" name="frm" onsubmit="return click1();">
<h3>Add Money</h3><br>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
	PreparedStatement ps=con.prepareStatement("select * from paydetails where uname=?");	
ps.setString(1,name);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	%>
	<p style=float:right;padding-right:5px;color:orange;font-weight:bolder;>Balance: <%=rs.getString("dmoney")%> $</p>
<% 	
}else{
	%>
<p style=float:right;padding-right:5px;color:orange;font-weight:bolder;>Balance: 0 $</p>
<% 	
}
	
}catch(Exception e){
	e.printStackTrace();
}
%>

<label>Card Holder Name </label><br>
<input type="text" name="cname" placeholder="Card Holder Name" autofocus required><br>
<label>Card Number</label><br>
<input type="number" name="cnumber" placeholder="Enter 16 Digit Card Number"  maxlength="16" ><br>
<label>Expiry Date</label><br>
<input type="number" placeholder="Enter Month" name="month" maxlength="2" required> <input type="number" placeholder="Enter Year" name="year" maxlength="4" required>  <br><br>
<label>PIN</label><br>
<input type="password" placeholder="Enter Pin Code" name="pin" maxlength="4"  required><br><br>
<label>Deposit Money</label><br>
<input type="number" placeholder="Add Money" name="add" maxlenght="6" required><br><br>

<input type="submit" value="Add">  <input type="reset" value="Reset">
</form>
</div>


<% 	
}else{
	response.sendRedirect("login.jsp");
}

%>

</body>
</html>