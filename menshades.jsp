<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>MEN SHADES</title>
<style type="text/css">
body{
background-color:white;
background-size:cover;
}
.image{
margin-left:20px;
float:left;
margin:;
margin-top:90px;
padding-left:20px;
width:250px;
height:250px;
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
<div style=margin:auto;width:950px;height:auto;position:absolut;right:0;margin-top:160px;>


<%
Connection con=null;
try {
	 Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
   PreparedStatement  stat = con.prepareStatement("select * from products where protype=?");
    stat.setString(1, "books");
   ResultSet rs = stat.executeQuery();
  
   out.println("<table style='width:100%; height:auto;'>");
   out.println("");
   while (rs.next()) {
       int id = rs.getInt(1);
    %>
 <div class="image">
   
     <% 
   
  %>
  <form action="showproduct.jsp" method="post">
<button class="imag" style=border:0;background-color:Transparent;><img src=retrieveImage1?<%=id%>/></button>

    
  <br><br>
   <label style=margin-left:20%;font-weight:bolder;color:blue;>  <%=rs.getString("productname") %></label><br>
   <label style=margin-left:20%;>  <%=rs.getString("price") %> RS</label><br>
   <label style=margin-left:20%;color:green;> Flat <%=rs.getString("offer") %>% OFF</label>
  <input type="hidden" name="id" value="<%=rs.getString("id") %>">
  </form>
   </div>
   <%  
   }
   out.println("</table>");
   
} catch (ClassNotFoundException ex) {
   out.println(ex.getMessage());
} catch (SQLException ex) {
   out.println(ex.getMessage());
} 

%>


</div>
</body>
</html>


