<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" 
    
    %>
    <%String name=(String)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ak Shopping</title>
<style type="text/css">
body{
background-color:white;
background-size:cover;
}
.image{
width:250px;
margin-left:20px;
float:left;
margin:;
margin-top:200px;
padding-left:20px;

}
.imag img{
width:150px;
height:150px;

}
.imag:hover img{
width:170px;
height:155px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String search=request.getParameter("search");
if(search==null){
	%>
	 <p style=color:red;margin-top:160px;>Please give Some Input To Search</p>
<% 	
}else{
	

Connection con=null;
try {
	 Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
   PreparedStatement  stat = con.prepareStatement("select * from products");
   ResultSet rs = stat.executeQuery();
  
   out.println("<table style='width:100%; height:auto;'>");
   out.println("");
   while (rs.next()) {
       
       String product=rs.getString("productname");
       String protype=rs.getString("protype");
       String about=rs.getString("about");
       if(product.toLowerCase().contains(search.toLowerCase()) ||protype.toLowerCase().contains(search.toLowerCase()) || about.toLowerCase().contains(search.toLowerCase())){
    	   int id = rs.getInt(1);
    	  
    	   
 %>
 <div class="image">
   
     <% 
   
  %>
  <form action="showproduct.jsp" method="post">
<button class="imag" style=border:0;background-color:Transparent;><img src=retrieveImage1?<%=id%>/></button>

    
  <br><br>
   <label style=margin-left:30%;font-weight:bolder;color:blue;>  <%=rs.getString("productname") %></label><br>
   <label style=margin-left:30%;>  <%=rs.getString("price") %> RS</label><br>
   <label style=margin-left:30%;color:green;> Flat <%=rs.getString("offer") %>% OFF</label>
  <input type="hidden" name="id" value="<%=rs.getString("id") %>">
  </form>
   </div>
   <%  
   }
       
   }
}catch(Exception e){
	e.printStackTrace();
}
}
%>


</body>
</html>