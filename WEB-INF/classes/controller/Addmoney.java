package controller;

/**
*
* @author SAKETH G
*/

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import business.*;
import utility.*;
@WebServlet("/Addmoney")
public class Addmoney  extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		Database db=new Database();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("user");
		String cname=request.getParameter("cname");
		String cnumber=request.getParameter("cnumber");
		String month=request.getParameter("month");
		String year=request.getParameter("year");
		String pin=request.getParameter("pin");
		String add=request.getParameter("add");
		int sddq=Integer.parseInt(request.getParameter("add"));
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
			
		/*Retrieves the details from the user and updates the payments details */
		 
		 
			PreparedStatement ps1=con.prepareStatement("select * from paydetails where uname=?");	
			ps1.setString(1, name);
			ResultSet rs=ps1.executeQuery();
			if(rs.next()){
				int ii=rs.getInt("dmoney");
				int adall=sddq+ii;
				PreparedStatement ps2=con.prepareStatement("update paydetails set chname=?,cnumber=?,emonth=?,eyear=?,pin=?,dmoney=? where uname=?");	
				ps2.setString(1, cname);
				ps2.setString(2, cnumber);
				ps2.setString(3, month);
				ps2.setString(4, year);
				ps2.setString(5, pin);
				ps2.setInt(6, adall);
				ps2.setString(7, name);
				int al=ps2.executeUpdate();
				if(al==1){
					response.sendRedirect("addmoney.jsp");
				}else{
					out.println("something worng");
				}
			}else{
				
			/*Inserting the payment details to the database*/
				
			PreparedStatement ps=con.prepareStatement("insert into paydetails values(?,?,?,?,?,?,?)");	
			ps.setString(1, name);
			ps.setString(2, cname);
			ps.setString(3, cnumber);
			ps.setString(4, month);
			ps.setString(5, year);
			ps.setString(6, pin);
			ps.setString(7, add);
			
			int i=ps.executeUpdate();
			if(i==1){
				response.sendRedirect("addmoney.jsp");
			}else{
				out.println("something worng");
			}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}
	
	
}
