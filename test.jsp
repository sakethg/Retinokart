<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%String name=(String)session.getAttribute("user"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%
if(name==null){
	%>
	<title>CART</title>	
	<% 
}else{
	%>
	<title><%=name %> CART</title>
	<% 
}
%>

<style type="text/css">
body{
background-image:url('images/shopping.jpg');
background-size:cover;
}
.main{
margin-top:200px;
}
.cart{
margin-top:30px;
width:100%;
height:300px;
background-color:lightgray;
padding-left:30px;
padding-top:10px;
}
.cart img{
width:200px;
height:200px;
}
.cart input[type="submit"]{
border:0;
width:auto;
height:30px;
background-color:lightblue;
border-radius:3px;
box-shadow:inset -4px -4px rgba(0,0,0,0.4);
font-weight:bolder;
}
.cart input[type="submit"]:hover{
color:green;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="main">
<%
Connection con=null;
if(name!=null){
	try {
		 Class.forName("com.mysql.jdbc.Driver");
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
	   PreparedStatement  stat = con.prepareStatement("select * from cart where usern=?");
	    stat.setString(1, name);
	   ResultSet rs = stat.executeQuery();
	  
	   while (rs.next()) {
	       int id = rs.getInt(2);
	       int price=rs.getInt("price");
	       int offer=rs.getInt("offer");
	       int cal=price*offer/100;
	       int result=price-cal;
	      %> 
	     <div class="cart">
	     <form action=""></form>
	     <table>
	     <tr>
	     <th><%=rs.getString("productname") %></th>
	     </tr>
	     <tr>
	     <td>
	     <img src=retrieveImage1?<%=id%>/>
	    
	     </td>
	  <td>
	  <h3>Original Price</h3>
	  <p><%=rs.getString("price") %> RS</p>
	  
	  </td>
	  <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td>
	  <h3>Offer</h3>
	   <p><%=rs.getString("offer")%>% OFF</p>
	 
	  </td>
	  <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td>
	   <h3>Offered Price</h3>
	   <%if(offer==0){
		   %>
		    <p><%=rs.getString("offer")%> RS</p>
		 <%  
	   }else{
		   %>
		    <p><%=result%> RS</p>
		   <%
	   }
		   %>
	  
	  
	 
	  
	  </td>
	  
	     </tr>
	     
	    <tr>
	    <td>
	    <form action="showproduct.jsp" method="post">
	    <input type="hidden" name="id" value="<%=id%>">
	    <input type="submit" value="Show Details">
	    </form>
	    </td>
	    <td>
	     <form action="RemoveCart" method="post">
	    <input type="hidden" name="user" value="<%=rs.getString("usern")%>">
	    <input type="hidden" name="id" value="<%=id%>">
	    <input type="submit" value="Remove">
	    </form>
	    </td>
	     <td>
	     <form action="CheckOut.jsp" method="post">
	    <input type="hidden" name="id" value="<%=id%>">
	    <input type="submit" value="CheckOut">
	    </form>
	    </td>
	    </tr>
	     </table>
	     
	     </div>  
	       
	   <%
	   }  
	} catch (ClassNotFoundException ex) {
	   out.println(ex.getMessage());
	} catch (SQLException ex) {
	   out.println(ex.getMessage());
	} 

	
	
	
	
	
}else{
	%>
	<p style=color:blue;font-weight:bolder;margin-top:180px;>You Are Not Logged in To See Your Cart Please<a href="login.jsp">Login Now</a></p>
	
<%	
}

%>
</div>


</body>
</html>


