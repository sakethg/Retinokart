<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String name=(String)session.getAttribute("check"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Products</title>
</head>
<body>
<%
if(name!=null && name.equalsIgnoreCase("admin")){
	%>
	<div style=margin-top:160px;>
<jsp:include page="adminheader.jsp"></jsp:include>

    <form name="f1" method="post" enctype="multipart/form-data" action="Addprduct">
    <h2>
        Add Product
    </h2>
    <table>
      <tr>
            <td>
               <table>
               <tr>
                        <td>Select Product Type:</td>
                        <td>
                        <select name="select">
                        <option value="mobile">Polarized</option>
                         <option value="laptop">Bifocals</option>                    
                           <option value="tv">Trifocals</option>
                            <option value="electother">SPECTACLES OTHERS</option>
                             <option value="mcloths">MEN-Spectacles</option>
                             <option value="mfoot">MEN-Shades</option>
                         <option value="msunglass">MEN-Sunglasses</option>
                          <option value="mwatches">MEN-Frames</option>
                           <option value="mother">MEN-OTHERS</option>
                           <option value="Wcloths">WOMEN-Spectacles</option>
                             <option value="Wfoot">WOMEN-Shades</option>
                         <option value="Wsunglass">WOMEN-SUNGLASS</option>
                          <option value="Wwatches">WOMEN-Frames</option>
                           <option value="Wother">WOMEN-OTHERS</option>
                           
                          <option value="kcloths">KID-Spectacles</option>
                         <option value="kfootwear">KID-Shades</option>
                         <option value="ktoys">KID-SUNGLASS</option>
                          <option value="kwatch">KID-Frames</option>
                           <option value="kothers">KID-OTHERS</option>
                           
                            <option value="books">Men-Shades</option>
                         <option value="musical">Women-Shades</option>
                         <option value="movies">Kids-Shades</option>
                          <option value="stationary">Other-Shades</option>
                           
                        
                        </select>
                        </td>
                    </tr>
               		<tr>
                        <td>Product Name:</td>
                        <td><input type="text" name="txtpro" value="" /></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input type="text" name="txtName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Offers in %:</td>
                        <td><input type="text" name="txtAddress" value="" /></td>
                    </tr>
                    <tr>
                        <td>About:</td>
                        <td><input type="text" name="txtSalary" value="" /></td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td><input type="file" name="flPhoto" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><input type="submit" value="Save" name="btnSave" /></td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td style="width: 450px; height: auto;">
                            <iframe name="ifs" src="DisplayData" style="width: 550px; height: 300px"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
    </div>
	
<% 	
}else{
	response.sendRedirect("index.jsp");
	
}

%>




</body>
</html>