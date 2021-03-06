import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.*;

/**
*
* @author SAKETH G
*/

@WebServlet("/retrieveImage1")
public class RetrieveImage1 extends HttpServlet {
 
    Connection con;
    PreparedStatement stat;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/jpeg");
        Blob ePhoto = null;
        byte[] rawBytes = null;
        ServletOutputStream out = response.getOutputStream();
        try {
            String id = request.getQueryString();
            String idd=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
               stat = con.prepareStatement("select image from products where id=?");
        stat.setString(1, id);
            ResultSet rs = stat.executeQuery();
            rs.next();
            rawBytes = rs.getBytes("image");
            out.write(rawBytes);
            out.flush();
            stat.close();
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            try {
                con.close();
                out.close();
            } catch (Exception ex) {
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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