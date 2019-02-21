package controller;

/**
*
* @author SAKETH G
*/
/*This servlet adds the products from the products page to the cart page
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
@WebServlet("/Addcart")
public class Addcart extends HttpServlet {
   
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String id=request.getParameter("arvi");
    	HttpSession session=request.getSession();
    	String name=(String)session.getAttribute("user");
    	Connection con=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
   	      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
   	     PreparedStatement ps = con.prepareStatement("select * from products where id=? ");
   	     ps.setString(1, id);
   	     ResultSet rs=ps.executeQuery();
   	     if(rs.next()){
   	    	 String proname=rs.getString("productname");
   	    	 String price=rs.getString("price");
   	    	 String offer=rs.getString("offer");
   	    	 Blob image=rs.getBlob("image");
   	    	 PreparedStatement ps1=con.prepareStatement("select * from cart where usern=? and id=?");	
   	    	 ps1.setString(1, name);
   	    	 ps1.setString(2, id);
   	    	ResultSet rs1=ps1.executeQuery();
   	    	if(rs1.next()){
   	    		
   	    		RequestDispatcher rd=request.getRequestDispatcher("productadded.jsp");
   	    		rd.forward(request, response);
   	    		
   	    		
   	    	}else{
   	    	 PreparedStatement ps2=con.prepareStatement("insert into cart values(?,?,?,?,?,?)");
   	    		ps2.setString(1, name);
   	    		ps2.setString(2, id);
   	    		ps2.setString(3, proname);
   	    		ps2.setString(4, price);
   	    		ps2.setString(5, offer);
   	    		ps2.setBlob(6, image);
   	    		int i=ps2.executeUpdate();
   	    		if(i==1){
   	    			RequestDispatcher rd=request.getRequestDispatcher("productadded.jsp");
   	   	    		rd.forward(request, response);
   	   	    		
   	    		}else{
   	    			out.println("wrong");
   	    		}
   	    		
   	    	}
   	     }
    			
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
}