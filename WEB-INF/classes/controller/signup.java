package controller;
import javax.mail.MessagingException;
/**
*
* @author SAKETH G
*/
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

import business.*;
import utility.*;
@WebServlet("/signup")
public class signup  extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		Database db=new Database();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String mnumber=request.getParameter("mnumber");
		String pin=request.getParameter("pin");
		String address=request.getParameter("address");
		String pass=request.getParameter("pass");
		
		String utype="USER";
		  String url=null;   
		  //  String action = request.getParameter("action");
		    //   if (action.equals("email")) {
		            // get parameters from the request
		            
		           

		            // store data in User object
		                       // send email to user
		           // String to = "saketh.gourisetty537@gmail.com";
		  try{
				
				
				if(db.doesExist(uname)){
					out.println("<font color='green'>Sorry Username Already Exist/font>");
					RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
					rd.forward(request, response);
					
				}
				else {
				int i=db.ins( uname, fname, lname, gender, email, mnumber, pin, address, pass,utype);
				if(i==1){
					out.println("<font color='green'>You are Successfully Registerd</font>");
					RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
					
				}
				
		            String to=email;
		            String from = "saketh.gourisetty934@gmail.com";
		            String subject = "Welcome to RetinoKart online store";
		            String body = "Dear User\n"
		                    + "Thanks for visting Retinokart store and signing up with us. Hope you have an Awesome Experience "
		                    + "Please let us know about the experience ,so that we can improve from your feedback "
		                    + "Have a Great day";
		            boolean isBodyHTML = false;

		            try {
		                
		                Mailer.sendMail(to, from, subject, body, isBodyHTML);
		            } catch (Exception e) {
		                String errorMessage
		                        = "ERROR: Unable to send email. "
		                        + "Check Tomcat logs for details.<br>"
		                        + "NOTE: You may need to configure your system "
		                        + "as described in chapter 14.<br>"
		                        + "ERROR MESSAGE: " + e.getMessage();
		                request.setAttribute("errorMessage", errorMessage);
		                this.log(
		                        "Unable to send email. \n"
		                        + "Here is the email you tried to send: \n"
		                        + "=====================================\n"
		                        + "TO: " + email + "\n"
		                        + "FROM: " + from + "\n"
		                        + "SUBJECT: " + subject + "\n"
		                        + "\n"
		                        + body + "\n\n");
		            } 
		            request.setAttribute("uemail",email);

		
		
		/*try{
			
			
			if(db.doesExist(uname)){
				out.println("<font color='green'>Sorry Username Already Exist/font>");
				RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
				
			}
			else {
			int i=db.ins( uname, fname, lname, gender, email, mnumber, pin, address, pass,utype);
			if(i==1){
				out.println("<font color='green'>You are Successfully Registerd</font>");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
				
			}*/
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	
	}
}


	
	

