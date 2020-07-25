package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/newSignUp")
public class newSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public newSignUp() {
        super();
    }
    
    

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("Username");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String phone = request.getParameter("phone");
		String table = request.getParameter("table");
		String creditCardDetails = request.getParameter("creditCardDetails");
		String query= registerUser(username,email,pass,phone,creditCardDetails,table);
		//response.sendRedirect(query);
	}



	private String registerUser(String username, String email, String pass,String phone ,String creditCardDetails,String table) {
		
		Exception url;
		try
    	{
			
    	
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		System.out.println("Cleared");
		Statement stmt=con.createStatement();
		String query="insert into "+table+"(name,email,passcode,phone,creditCardDetails)values('" + username +  "','" + email +"','" + pass + "'," + phone +"," + creditCardDetails +");";
		int rs=stmt.executeUpdate(query);  
	    System.out.println(rs);
		con.close();  
		return "IndexLogin.jsp";
    	
    	}
    	catch(Exception e)
    	{ 
    		return "errorPage.jsp?error="+e;
    		
		}
		
	}

}
