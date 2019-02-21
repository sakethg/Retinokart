<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
    String name=(String)session.getAttribute("user");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Show products</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#showbut").click(function(){
        $("#show").hide();
        $("#hide").show();
    });
    $("#hidebut").click(function(){
        $("#hide").hide();
        $("#show").show();
    });
});
</script>
<style type="text/css">
body{
background-color:gray;
background-size:cover;
}
.tim{
font-size: 18px;
border:  ;

width: 90px;
height: 35px; background-image: url(images/order.gif);
}
h3{
text-shadow: 2px 2px 8px #FF0000;
font-weight:bolder;
color:lightered;

}
p{
color:black;
}
input[type="submit"]{
border-radius:3px;
}
input[type="submit"]:hover{
border-radius:4px;
color:green;
}
button{
border:0;
background-color:Transparent;
color:green;
}
button:hover{
font-weight:bolder;
}
</style>

</head>
<body >
<jsp:include page="header.jsp"></jsp:include>

<table id="keywords" cellspacing="0" cellpadding="0" style=margin-top:150px;margin-left:100px>
<%
String nm=request.getParameter("id");
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
	PreparedStatement ps=con.prepareStatement("select * from products where id=?");
	ps.setString(1, nm);
	 ResultSet rs=ps.executeQuery();
    if(rs.next()){%>
    
    	<tr>
         <th><label><%=rs.getString("productname") %></label></th>
         <td><input type="hidden" value="<%=rs.getString("id")%>"></td>
</tr>

<tr>
<td><img alt="" src="SearchedResult?pro=<%=request.getParameter("id") %>" width=300 height=300><br>

</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td> 
<h3>PRICE</h3><br>
<%
int result;
int pric=rs.getInt("price");
int offer=rs.getInt("offer");
if(offer<=0){%>

	<p><%=rs.getInt("price") %> Rs</p>	
<% 	
}else{
	int cal=pric*offer/100;
	 result=pric-cal;
	%>
	<p><strike><%=rs.getInt("price") %></strike> Rs</p> 
	<p><%=result%> Rs</p> 
<%}
%>

</td>
<td> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td>
<h3>OFFERS</h3>
<p><%=rs.getString("offer")%>% Off</p>
</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
if(name!=null){%>
	<td>
	<label>Quantity</label>
	<input type="number" name="quan" min="1" value="1"  style=width:30px;  id="quann" required><br><br>&nbsp;&nbsp;


<form action="Addcart" method="post">
<input type="hidden" name="arvi" value="<%=rs.getString("id")%>">
<input type="submit" value="Add To CART">
</form>

</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>


</td>


<% }else{%>
<td>
	<font color="blue"><strong>To Order <%=rs.getString("productname")%>  You have to Login First</strong></font>
	</td>
<%}
%>

</tr>
<tr>
<td>
</td>
</tr>
</table>
</table>
<div>


</div>
<div id="show">
<button id="showbut" style=align:right;>Full Specification</button>
</div>

<div id="hide" style=display:none;><br><br>
<table style=padding-left:50px;>


<tr>
<th>PRODUCT NAME:</th><td>&nbsp;&nbsp;</td>
<td><%=rs.getString("productname") %></td>
</tr>
<tr>
<th>PRODUCT Price:</th><td>&nbsp;&nbsp;</td>
<td><%=rs.getString("price") %></td>
</tr>
<tr>
<th>About Product:</th><td>&nbsp;&nbsp;</td>
<td style=width:400px;><%=rs.getString("about") %></td>
</tr>
<tr>
<td>
<button id="hidebut" style=text-align:right;>Hide Specification</button>
</td>
</tr>
</table>
</div>


   <%}
}catch(Exception e){
	e.printStackTrace();
}


%>




<script type="text/javascript">
$(document).ready(function() {
    $('#quann').keypress(function(key) {
        if(key.charCode < 48 || key.charCode > 57) return false;
    
    });})
</script>
    
</body>
</html>