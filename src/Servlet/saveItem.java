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

@WebServlet("/saveItem")
public class saveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

 	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
 	{
 	   HttpSession session=request.getSession(); 
 	   String email = (String) session.getAttribute("email");
		String item = request.getParameter("item");
		String cp = request.getParameter("cp");
		String sp = request.getParameter("sp");
		String quan = request.getParameter("quan");
		String type = request.getParameter("type"); 
		String userId = (String) session.getAttribute("userId");
		String Status = JDBCConnection(item,cp,sp,quan,type,userId);
		if(Status.contentEquals("true"))
		{
			logger("Item Created successful",email);
			response.sendRedirect("showItems.jsp");
		}
		else
		{
			logger("Item Not created",email);
		}
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
	private String JDBCConnection(String item, String cp, String sp, String quan, String type,String userId) {
		try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		System.out.println("Cleared");
		Statement stmt=con.createStatement();
		String query="insert into item(name,CostPrice,SellingPrice,quantity,userId,type)values('" + item +  "','" + cp +"','"+ sp +"','"+ quan +"','"+ userId +"','" + type + "');";
		int rs=stmt.executeUpdate(query);  
	    System.out.println(rs);
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
