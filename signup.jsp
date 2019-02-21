<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/css.css">
<style type="text/css">
body{
background-image:url('images/abu.jpg');
background-size:cover;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="su">
<h2>SignUp</h2>
<form action="signup" method="post">
<label>User Name</label><br>
<input type="text" name="uname" placeholder="Enter User Name..." required><br>
<label>First Name</label> <label style=margin-left:150px;>Last Name</label><br>
<input type="text" name="fname" placeholder="Enter Your First Name..." required>&nbsp; &nbsp;&nbsp;&nbsp;<input type="text" name="lname" placeholder="Enter Your Last Name..." required><br>


<label>Gender</label><br>
<select name="gender">
<option value="male">Male</option>
<option value="female">Female</option>
<option value="other">Other</option>
</select>
<br>
<label>Email</label><br>
<input type="email" name="email" placeholder="Enter Your Email Id..." required><br>
<label>Mobile Number</label><br>
<input type="number" name="mnumber" placeholder="Enter Mobile Number..." required><br>
<label>PIN Code</label><br>
<input type="text" name="pin" placeholder="Enter Your Pin Code..." required><br>
<label>Address</label><br>
<textarea rows="4" cols="10" placeholder="Enter Full Address.." name="address" required></textarea><br>
<label>Password</label><label style=margin-left:170px;>Confirm Password</label><br>
<input type="password" name="pass" placeholder="Enter password.." required>&nbsp; &nbsp;&nbsp;&nbsp;
<input type="password" name="cpass" placeholder="Confirm password.." required><br><br>
<input type="submit" value="SignUp">
</form>
</div>
</body>
</html>