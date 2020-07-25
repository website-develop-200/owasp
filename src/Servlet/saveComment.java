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

@WebServlet("/saveComment")
public class saveComment extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();  
		String comment = request.getParameter("comment");
		String id = (String) session.getAttribute("userId");
		String Status = JDBCConnection(id,comment);
			response.sendRedirect(Status);
		
	}

	private String JDBCConnection(String id, String comment) {
		try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		Statement stmt=con.createStatement();
		String query="insert into comments(id,Comment)values(" + id+  ",'" + comment + "');";
		//System.out.println(query);
		int rs=stmt.executeUpdate(query);  
	    System.out.println(rs);
		con.close(); 
		return "comments.jsp";
    	}
    	catch(Exception e)
    	{ 
    		return "Invalid Comment ";  
		}
		
	}

}
