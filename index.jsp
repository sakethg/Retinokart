<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<title>Retinokart</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <h3>Welcome user</h3>
<%
Connection con=null;
try {
	 Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
   PreparedStatement  ps = con.prepareStatement("select * from popular");
   ResultSet rs1=ps.executeQuery();
   out.println("<table style='width:100%; height:auto;'>");
   out.println("");
   while(rs1.next()){
	   int id = rs1.getInt(2); 
	   %>
	   <div class="image">
	       <% 
   PreparedStatement  stat = con.prepareStatement("select * from products where id=?");
    stat.setInt(1, id);
   ResultSet rs = stat.executeQuery();
  
  
   if (rs.next()) {
	   int idd = rs.getInt(1);
   
   
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


