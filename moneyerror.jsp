<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String name=(String)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%if(name!=null){%>
<jsp:include page="header.jsp"></jsp:include><br><br><br>
<p style=color:red;font-weight:bolder;margin-top:160px;>You Have Not Enough Balance Add Money <a href="addmoney.jsp">From Here</a></p>	
<% 	
}else{
	response.sendRedirect("login.jsp");
	
}
	%>
</body>
</html>