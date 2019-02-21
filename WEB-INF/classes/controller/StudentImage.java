package controller;
/**
*
* @author SAKETH G
*/
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
@WebServlet("/StudentImage")
public class StudentImage extends HttpServlet {
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	String nm=request.getParameter("pro");
    	try{
    		 Class.forName("com.mysql.jdbc.Driver");
    	     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
    	     PreparedStatement ps = con.prepareStatement("select image from products where protype=? ");
    	    ps.setString(1, nm);
    	    
    	     ResultSet rs = ps.executeQuery();
    	     OutputStream os;
    	 while(rs.next()){
    	     Blob  b = rs.getBlob("image");
    	     response.setContentType("image/png");
    	     response.setContentLength( (int) b.length());
    	     InputStream is = b.getBinaryStream();
    	     os = response.getOutputStream();
    	     byte buf[] = new byte[(int) b.length()];
    	     is.read(buf);
    	     os.write(buf);
    	     os.close();
    	       
    	    	     }
    	  
    	
    	  
 		
    	}catch(Exception e){
    		e.printStackTrace();
    	}

   
    }
   
}
