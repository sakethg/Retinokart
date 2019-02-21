package controller;

/**
*
* @author SAKETH G
*/

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import business.*;
import utility.*;
@WebServlet("/CheckOut")
public class CheckOut  extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		Database db=new Database();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("user");
		String id=request.getParameter("id");
		int quan=Integer.parseInt(request.getParameter("quan"));
		String proname=request.getParameter("proname");
		int checkoutm=Integer.parseInt(request.getParameter("checkoutm"));
		
		String funam=request.getParameter("funam");
		String lunam=request.getParameter("lunam");
		String num=request.getParameter("num");
		String address=request.getParameter("address");
		int cal=quan*checkoutm;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
			
			
			
			PreparedStatement ps=con.prepareStatement("Select * from paydetails where uname=?");
			ps.setString(1, name);
			ResultSet rs=ps.executeQuery();
		if(rs.next()){
			int dm=Integer.parseInt(rs.getString("dmoney"));
			
			if(cal<=dm && cal>=0){
				int minus=dm-cal;
				PreparedStatement ps2=con.prepareStatement("select * from products where id=?");
					ps2.setString(1, id);
					ResultSet rs1=ps2.executeQuery();
					if(rs1.next()){
						Blob img=rs1.getBlob("image");
						PreparedStatement ps1=con.prepareStatement("insert into userorders(uname,productname,price,quantity,paydetails,image,status,proid,fname,lname,number,address) values(?,?,?,?,?,?,?,?,?,?,?,?)");
						ps1.setString(1, name);	
						ps1.setString(2, proname);
						ps1.setInt(3, cal);
						ps1.setInt(4, quan);
						ps1.setString(5, "Paid");
						ps1.setBlob(6, img);
						ps1.setString(7, "Processing");
						ps1.setString(8, id);
						ps1.setString(9, funam);
						ps1.setString(10, lunam);
						ps1.setString(11, num);
						ps1.setString(12, address);
						int ib=ps1.executeUpdate();
						if(ib==1){
							PreparedStatement ps4=con.prepareStatement("update paydetails set dmoney=? where uname=?");
								ps4.setInt(1,minus );
								ps4.setString(2, name);
								int arvi=ps4.executeUpdate();
								if(arvi==1){	
									
									response.sendRedirect("successorder.jsp");
								}
						}else{
							response.sendRedirect("moneyerror.jsp");
						}
						
						
					}else{
						response.sendRedirect("moneyerror.jsp");
					}
					
					
					}else{
						response.sendRedirect("moneyerror.jsp");
					}
				
				
			
			
			
		}else{
			response.sendRedirect("moneyerror.jsp");
		}
			
			
			PreparedStatement ps1=con.prepareStatement("select * from paydetails where uname=?");	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}