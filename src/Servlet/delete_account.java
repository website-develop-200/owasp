package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.parser.Cookie;


@WebServlet("/delete_account")
public class delete_account extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		javax.servlet.http.Cookie[] ck=request.getCookies();  
		String id="";
		for(int i=0;i<ck.length;i++)
		{  
		 if(ck[i].getName().contentEquals("userId"))
			 {
			 id = ck[i].getValue();
			 }
		} 
		String status = jdbcConnection(id);
		response.sendRedirect(status);
	}

	private String jdbcConnection(String idStr) {
		int id =  Integer.parseInt(idStr);
		String queryLast = "delete from user where id = "+id+ ";";
		try
		{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		Statement stmt=con.createStatement();
		
		String querySelectUser = "select id from invoice where userId ="+id+";";
		ResultSet rs = stmt.executeQuery(querySelectUser);
		ArrayList<String> invId = new ArrayList<String>();
		while(rs.next())
		{
		invId.add(rs.getString(1));
		}
		for(int i=0;i<invId.size();i++)
		{
			String invIdInv=invId.get(i);
			String deleteInvdet ="delete from invdet where invId="+invIdInv+";";
			int rs8 =stmt.executeUpdate(deleteInvdet);
		}
		String queryInv="delete from invoice where userId ="+ id +";";
		System.out.println("Runned");
		String queryItem="delete from item where userId ="+ id +";";
		int rs0 =stmt.executeUpdate(queryInv);
		int rs1 =stmt.executeUpdate(queryItem);
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		int rsLast=stmt.executeUpdate(queryLast);  
	    System.out.println(rsLast);
		con.close();  
		return "IndexLogin.jsp";
    	
    	}
    	catch(Exception e)
    	{ 
    		return "errorPage.jsp?error="+e;
    		
		}
	}

	
}
