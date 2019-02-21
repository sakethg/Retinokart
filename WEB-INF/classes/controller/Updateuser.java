package controller;

/**
*
* @author SAKETH G
*/
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import utility.*;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Updateuser")
public class Updateuser  extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		Database db=new Database();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("user");
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String mnumber=request.getParameter("mnumber");
		String pin=request.getParameter("pin");
		String address=request.getParameter("address");
		String pass=request.getParameter("pass");
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
			PreparedStatement ps=con.prepareStatement("update user set fname=?,lname=?,email=?,mnumber=?,pin=?,address=?,pass=? where username=?");
		ps.setString(1, fname);
		ps.setString(2, lname);
		
		ps.setString(3, email);
		ps.setString(4, mnumber);
		ps.setString(5, pin);
		ps.setString(6, address);
		ps.setString(7, pass);
		ps.setString(8, name);
		int i=ps.executeUpdate();
		if(i==1){
			out.println("<font color='green'>Your Account is Successfully Updated</font>");
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
			rd.include(request, response);	
		}else{
			out.println("<font color='green'>Something Wrong</font>");
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
			rd.include(request, response);	
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
		
		
		
	
	}	
}
