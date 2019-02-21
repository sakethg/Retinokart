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
import java.sql.*;
import javax.servlet.annotation.*;
@WebServlet("/Displaypopular")
public class Displaypopular extends HttpServlet {
 
    Connection con;
    PreparedStatement stat;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        	 Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","Saketh16.");
              stat = con.prepareStatement("select * from popular");

            ResultSet rs = stat.executeQuery();
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DisplayData</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<table style='width:100%; height:auto;'>");
            out.println("<thead><td>ID</td><td>ProductName</td><td>price</td><td>Offer</td><td align='center'>Photo</td></thead>");
            while (rs.next()) {
                int id = rs.getInt(1);
                out.println("<td>" + id + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td>");
                out.println("<td>" + rs.getString(4) + "</td>");
                out.println("<td style='width:150px; height:125px;'><img src='" + "Popularsearch?" + id + "' style='width:150px; height:125px;'/></td></tr>");
            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        } finally {
            try {
                con.close();
                out.close();
            } catch (SQLException ex) {
                out.println(ex.getMessage());
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