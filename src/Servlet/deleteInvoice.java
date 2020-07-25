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

@WebServlet("/deleteInvoice")
public class deleteInvoice extends HttpServlet {
	
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				 String id = request.getParameter("id");
		         String Status = JDBCConnection(id);
		         if(Status.contentEquals("true"))
		 		{
		 			response.sendRedirect("showInvoice.jsp");
		 		}
		}
		
		private String JDBCConnection(String id) {
			try
			{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
			Statement stmt=con.createStatement();
			String query="delete from invdet where invId ="+ id +";";
			int rs=stmt.executeUpdate(query);  
		    System.out.println(rs);
		    query = "delete from invoice where id ="+id+";";
		    rs=stmt.executeUpdate(query);
			con.close(); 
			return "true";
			}
			catch(Exception e)
			{ 
				System.out.println(e);  
			}
			
			return "false";
		}
		
	}


