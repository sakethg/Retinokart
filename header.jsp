<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <% String name=(String)session.getAttribute("user"); %>
     <% String check=(String)session.getAttribute("check"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<title>Retinokart</title>
</head>
<body bgcolor=white><div id="b" style=background-image:url(images/55.jpg)>

<% if(name==null){%>
<a href="signup.jsp" class="span1" >SignUp</a>
<a href="login.jsp" class="span1">Login</a>
<%
	}
	else{%> <a href="logout.jsp" class="span1">Logout</a><%
	}%>

<%
if(check!=null && check.equalsIgnoreCase("admin")){
	%>
	<a href="admin.jsp" class="span1">Go Back</a>
	
	<% 
}
%>
<a href="contactus.jsp" class="span1">ContactUs</a>
<a href="aboutus.jsp" class="span1">AboutUs</a>
<a href="index.jsp" class="span1" >Home</a>

<H2> RETINOKART</H2>


<%
if(name!=null){%>
	
	<div class="user">
<a href="welcome.jsp"><img alt="" src="images/user.png"></a>
</div>
<%}
%>


<font ><p><b>&nbspFind Anything Related to your EYES!!!</b></p></font>

<br>
<br>


<div id="c">
<form action="cart.jsp" method="post">
<%
if(name==null){%>
<input type="submit" class="btn" value="CART(0) " style=margin-right:20px;>	
<% 	
}else{
Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
PreparedStatement  stat = con.prepareStatement("select count(*) from cart where usern=?");
stat.setString(1,name);
ResultSet rs=stat.executeQuery();
if(rs.next()){
	
	int result=rs.getInt(1);
	
	
%>
<input type="submit" class="btn" value="CART(<%=result%>) " style=margin-right:20px;><%
}
}
%>



</form>
<form action="searchproduct.jsp" method="post">
<input type="text" name="search" placeholder="Search....">


</form>


<div class="dropdown">
  <span class="span">SPECTACLES</span>
  <div class="dropdown-content">
    <a href="polarized.jsp">Polarized</a><br><br>
     <a href="bifocals.jsp">Bifocals</a><br><br>
     <a href="trifocal.jsp">Trifocals</a><br><br>
    <a href="eothers.jsp">Others</a>
  </div>
    
</div>
<div class="dropdown" style=margin-left:120px;>
<span class="span">MEN</span>
  <div class="dropdown-content">
    <a href="spects.jsp">Spectacles</a><br><br>
     <a href="shades.jsp">Shades</a><br><br>
     <a href="sunglasses.jsp">Sunglasses</a><br><br>
    <a href="frames.jsp">Frames</a><br><br>
    <a href="mothers.jsp">Others</a>
  </div>
</div>
<div class="dropdown" style=margin-left:170px;>
<span class="span">WOMEN</span>
  <div class="dropdown-content">
    <a href="wspects.jsp">Spectacles</a><br><br>
     <a href="wshades.jsp">Shades</a><br><br>
     <a href="wsunglasses.jsp">Sunglasses</a><br><br>
    <a href="wframes.jsp">Frames</a><br><br>
    <a href="wothers.jsp">Others</a>
  </div>
</div>
<div class="dropdown" style=margin-left:250px;>
<span class="span">KIDS</span>
  <div class="dropdown-content">
    <a href="kspects.jsp">Spectacles</a><br><br>
     <a href="kshades.jsp">Shades</a><br><br>
     <a href="ksunglasses.jsp">Sunglasses</a><br><br>
    <a href="kframes.jsp">Frames</a><br><br>
    <a href="kothers.jsp">Others</a>
  </div>
</div>
<div class="dropdown" style=margin-left:320px;>
<span class="span">SHADES</span>
  <div class="dropdown-content">
    <a href="menshades.jsp">Men</a><br><br>
     <a href="womenshades.jsp">Women</a><br><br>
     <a href="kidsshades.jsp">Kids</a><br><br>
    <a href="oshades.jsp">Others</a><br><br>
   
    
  </div>
</div>
</div>
</div>



</body>
</html>