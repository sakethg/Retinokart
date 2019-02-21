package utility;
/**
*
* @author SAKETH G
*/
import java.sql.*;

import business.*;
public class Database {
	bean bs=new bean();
	 Connection conn=null;
public void connect(){	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
				
	}catch(Exception e){
		e.printStackTrace();
		
	}
}
	public int ins(String uname,String fname,String lname,String gender,String email,String mnumber,String pin,String address,String pass, String utype){
		int result=0;
		connect();
		try{
			PreparedStatement ps=conn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, uname);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, gender);
			ps.setString(5, email);
			ps.setString(6, mnumber);
			ps.setString(7, pin);
			ps.setString(8, address);
			ps.setString(9, pass);
			ps.setString(10, utype);
			int i=ps.executeUpdate();
			
			if(i==1){
				result=1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}return result;
		
		
	}
	public boolean doesExist(String uname){
		boolean status=false;
		try{
			connect();
			PreparedStatement ps=conn.prepareStatement("select * from user where username=?");
			ps.setString(1, uname);
			ResultSet rs=ps.executeQuery();
			status=rs.next();
		}catch(Exception e){
			e.printStackTrace();
		}return status;
			
		
	}
	
	public boolean login(String uname, String pass){
		boolean status=false;
		try{
			connect();
			PreparedStatement ps=conn.prepareStatement("select * from user where username=? and  pass=?");
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			status=rs.next();
		}catch(Exception e){
			e.printStackTrace();
		}return status;
			
		
	}
	public String utype(String uname){
		String status="index.jsp";
		try{
			PreparedStatement ps=conn.prepareStatement("select * from user where username=?");
			ps.setString(1, uname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				String ut=(String)rs.getString("utype");
				if(ut.equals("ADMIN")){
					status="admin.jsp";
				
				}else if(ut.equals("USER")){
					status="index.jsp";
				}
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}return status;
	}
	
}
	

