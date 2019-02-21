package controller;
/**
*
* @author SAKETH G
*/

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.servlet.annotation.*;
import javax.servlet.annotation.MultipartConfig;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet("/popular")
public class popular extends HttpServlet {
 
	String id;
    String name, add,uname;
    String salary,select;
    FileItem flItem = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement stat = null;
        try {
            long maxFileSize = (2 * 1024 * 1024);
            int maxMemSize = (2 * 1024 * 1024);

            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (isMultiPart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                
                while (iter.hasNext()) {
                    FileItem fileItem = iter.next();
                    if (fileItem.isFormField()) {
                        processFormField(fileItem);
                    } else {
                        flItem = fileItem;
                    }
                }
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
                stat = con.prepareStatement("insert into popular(productname,price,offer,image,protype,id) values(?,?,?,?,?,?)");
               
                stat.setString(1,id);
                stat.setString(2, name);
                stat.setString(3, add);
                stat.setString(4, salary);
                stat.setBinaryStream(5, flItem.getInputStream(), (int) flItem.getSize());
                stat.setString(6, select);
              
                int rows = stat.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("products.jsp");
                } else {
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Error Adding Employee</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h2>Error Adding Employee Data</h2>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            try {
                con.close();
                stat.close();
                out.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    private void processFormField(FileItem item) {
        //String na = item.getFieldName();
    	if (item.getFieldName().equals("txtpro")) {
    		 id = item.getString();
    	}
            else if (item.getFieldName().equals("txtName")){ 
            name = item.getString();
   
            } else if (item.getFieldName().equals("txtAddress")) {
            add = item.getString();
        } else if (item.getFieldName().equals("txtSalary")) {
            
            salary = item.getString();
           
        }else if (item.getFieldName().equals("select")) {
            
            select = item.getString();
           
        }
    	 
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}