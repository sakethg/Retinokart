package controller;
/**
*
* @author SAKETH G
*/
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/populardelete")
public class populardelete extends HttpServlet {
   
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String id=request.getParameter("id");
    	HttpSession session=request.getSession();
    	String name=(String)session.getAttribute("user");
    	Connection con=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
   	      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
   	     PreparedStatement ps = con.prepareStatement("select * from popular where id=? ");
   	     ps.setString(1, id);
   	     ResultSet rs=ps.executeQuery();
   	     if(rs.next()){
   	      PreparedStatement ps1 = con.prepareStatement("delete from popular where id=?");
   	   	ps1.setString(1, id);
   	   	int i=ps1.executeUpdate();
   	   	if(i==1){
   	   	 RequestDispatcher rd1=request.getRequestDispatcher("Popularproducts.jsp");
			 rd1.include(request, response);
   	   	out.println("<font style='color:green;margin-top:150px;margin-left:40%;'>Product Deleted From Popular List</font>"); 	
   	   	}
}else{
	 RequestDispatcher rd=request.getRequestDispatcher("Popularproducts.jsp");
		 rd.include(request, response);
	 out.println("<font style='color:red;margin-top:150px;margin-left:40%;'>Searched Product Not Exist</font>"); }
}catch(Exception e){
	e.printStackTrace();
}
    }
    }