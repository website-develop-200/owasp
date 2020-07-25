package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/exit")
public class exit extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		 String email = (String) session.getAttribute("email");
		session.removeAttribute("id");
		logger("Logged Out",email);
		response.sendRedirect("IndexLogin.jsp");
	}
	private void logger(String logs,String email) {
		try
    	{
			
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		
		Statement stmt=con.createStatement();
		String query="insert into logs(id,logs)values('"+email+"','"+logs+"');";
		int rt=stmt.executeUpdate(query);
		System.out.println(rt);
	   }
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
