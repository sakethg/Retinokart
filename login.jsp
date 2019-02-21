<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<style type="text/css">
body{
background-image:url('images/q3.jpg');
background-size:cover;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>
<br>
<div class="aa">
<form action="login" method="post">
<h2>Login</h2>
<input type="text" placeholder="Enter User Name..." name="uname" required><br><br>
<input type="password" placeholder="Enter Password..." name="pass" required><br><br>
<input type="submit" value="Login">
</form>
</div>
</body>
</html>