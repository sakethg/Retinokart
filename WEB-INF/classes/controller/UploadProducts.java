package controller;

/**
*
* @author SAKETH G
*/

import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/UploadProducts")
@MultipartConfig(maxFileSize = 16177215)

public class UploadProducts extends HttpServlet {
    private static final int BUFFER_SIZE = 4096;
    
    private String dbURL = "jdbc:mysql://localhost:3306/onlineshopping";
    private String dbUser = "root";
    private String dbPass = "Saketh16.";

    private Connection getConnection() {
        Connection conn = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        } catch (Exception e) {
            
            throw new RuntimeException("Failed to obtain database connection.", e);
        }
        return conn;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
      	String name=(String)session.getAttribute("user");
      	 String select=request.getParameter("select");
        String product = request.getParameter("pro");
        int price = Integer.parseInt(request.getParameter("price"));
        String offer = request.getParameter("offers");
         String about=request.getParameter("about");
        InputStream inputStream = null; 
        InputStream inputStream1 = null; 
        InputStream inputStream2 = null; 
        Part filePart = request.getPart("image");
        if (filePart != null) {
            
           
            inputStream = filePart.getInputStream();
            
        }
        Part filePart1 = request.getPart("image1");
        if (filePart1 != null) {
            
           
            inputStream1 = filePart1.getInputStream();
            
        }
        Part filePart2 = request.getPart("image2");
        if (filePart2 != null) {
            
           
            inputStream2 = filePart2.getInputStream();
            
        }

        Connection conn = null; 
        String message = null; 
        try {
           
            conn = getConnection();
          
          String sql = "INSERT INTO products (uname,productname, price, offer,about,image,image1,image2,protype) values (?, ?, ?,?,?,?,?,?,?)";
            
          PreparedStatement  pstmtSave = conn.prepareStatement(sql);
 
            pstmtSave.setString(1, name);
            pstmtSave.setString(2, product);
            pstmtSave.setInt(3, price);
            pstmtSave.setString(4, offer);
            pstmtSave.setString(5, about);
            pstmtSave.setString(9, select);
            if (inputStream != null) {
                
                pstmtSave.setBlob(6, inputStream);
                pstmtSave.setBlob(7, inputStream1);
                pstmtSave.setBlob(8, inputStream2);
            }
           
            int row = pstmtSave.executeUpdate();
            if (row > 0) {
              
               RequestDispatcher rd=request.getRequestDispatcher("products1.jsp");
               rd.include(request, response);
            }else{
            	
                RequestDispatcher rd=request.getRequestDispatcher("pro.jsp");
                rd.include(request, response);
            }
            
        } catch (SQLException ex) {
           
            ex.printStackTrace();
        } 
                     }
        
        
    }
