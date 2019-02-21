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
@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {
   
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	HttpSession session=request.getSession();
    	String name=(String)session.getAttribute("user");
    	String id=(String)request.getParameter("id");
    	Connection con=null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
   	      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
   	     PreparedStatement ps = con.prepareStatement("delete from cart where usern=? and id=? ");
   	     ps.setString(1, name);
   	     ps.setString(2, id);
   	    int i=ps.executeUpdate();
   	    if(i==1){
   	    	RequestDispatcher rd=request.getRequestDispatcher("cart.jsp");
   	    	rd.forward(request, response);
   	    }
    	}catch(Exception e){
    		e.printStackTrace();
    		
    	}
    }
}
