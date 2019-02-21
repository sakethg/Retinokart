<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String name=(String)session.getAttribute("check"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">

</head>
<body>
<%
if(name!=null && name.equalsIgnoreCase("admin")){
	%>
	<jsp:include page="adminheader.jsp"></jsp:include>
	
	<%
	
}else{
	response.sendRedirect("index.jsp");
}
	%>





</body>
</html>