package controller;

/**
*
* @author SAKETH G
*/

import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.*;

import java.io.*;
@WebServlet("/login")
public class login extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		try{
			Database ds=new Database();
			
			if(ds.login(uname, pass)){
				HttpSession session=request.getSession();
    		     session.setAttribute("user", uname);
                
    		     
    		     try{
    		    	  Connection conn=null;
    		    	  Class.forName("com.mysql.jdbc.Driver");
    		  		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
    		  		
    		    	  
    		    	  PreparedStatement ps= conn.prepareStatement("Select * from user where username=?");
    		    	 ps.setString(1, uname);
    		    	 ResultSet rs=ps.executeQuery();
    		    	 if(rs.next()){
    		    		 String ut=(String)rs.getString("utype");
    		    		 HttpSession sess=request.getSession();
    	    		     session.setAttribute("check", ut);
    	               
    		    		 if(ut.equals("ADMIN")){
    		    			 RequestDispatcher rd=request.getRequestDispatcher("admin.jsp"); 
    		    			 rd.forward(request, response);
    		    		 }else{
    		    			 RequestDispatcher rd=request.getRequestDispatcher("userindex.jsp");
    		 				rd.forward(request, response);
    		    		 }
    		    		 
    		    	 }
    		    	  
    		      }catch(Exception e){
    		    	  e.printStackTrace();
    		    	  
    		      }
    		     
    	  
   
			}else{
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
				 out.println("<font style='color:red;margin-top:150px;margin-left:40%;'>Wrong UserName Or Password</font>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	
}
