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

@WebServlet("/editItem")
public class editItem extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();
		String item = request.getParameter("item");
		String cp = request.getParameter("cp");
		String sp = request.getParameter("sp");
		String quan = request.getParameter("quan");
		String type = request.getParameter("type");
		String Itemid =  request.getParameter("id");
		String userId = (String) session.getAttribute("userId");
		//String id = request.getParameter("id");
		String Status = JDBCConnection(item,cp,sp,quan,type,Itemid,userId);
		if(Status.contentEquals("true"))
		{
			response.sendRedirect("showItems.jsp");
		}
		else
		{
			System.out.println("Error");
		}
	}

	private String JDBCConnection(String item, String cp, String sp, String quan, String type,String Itemid,String userId) {
		try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		System.out.println("Cleared");
		Statement stmt=con.createStatement();
		String query="update item set name = '" + item +"',CostPrice= "+ cp +",SellingPrice = "+ sp +",userId = " + userId +",quantity = " + quan + ",type ='"+ type +"' where id =" + Itemid +"";
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


