<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%String name=(String)session.getAttribute("user"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

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
background-color:lightblue;
background-size:cover;
}
.main{
margin-top:160px;
}
.cart{
margin-top:30px;
width:100%;
height:300px;
background-color:white;
padding-left:30px;
padding-top:10px;
border-radius:8px;
box-shadow:inset -4x -4px rgba(0,0,0,0.9);
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
	  <p><%=rs.getString("price") %> $</p>
	  
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
		    <p><%=rs.getString("price")%> $</p>
		 <%  
		 
	   }else{
		   %>
		    <p><%=result%> $</p>
		   <%
	   }
	   %>
	   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	   <td>
	   </td>
	   
	   <% 
	   
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
	     <input type="hidden" name="user" value="<%=rs.getString("usern")%>">
	      <input type="hidden" name="proname" value="<%=rs.getString("productname")%>">
	        <input type="hidden" name="image" value="<%=rs.getBlob("image")%>">
	    <input type="number" name="quan" min="1" value="1"  style=width:30px;  id="quann" required>
	    <%
	    if(offer==0){
	    %>
	    <input type="hidden" name="checkoutm" value="<%=rs.getString("price")%>">
	    <%
	    }else{
	    	%>
	    	<input type="hidden" name="checkoutm" value="<%=result%>">
	    <% 
	    }
	    %>
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
<script type="text/javascript">
$(document).ready(function() {
    $('#quann').keypress(function(key) {
        if(key.charCode < 48 || key.charCode > 57) return false;
    
    });})
</script>

</body>
</html>


