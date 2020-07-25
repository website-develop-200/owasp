package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;


@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HttpHeaders = null;
    public LoginCheck() {
        super();   
    }
    
    private String JDBCConnecion(Map<String, String> map) 
    {
    	String email = map.get("email");
    	String pass = map.get("pass");
    	try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		System.out.println("Cleared");
		Statement stmt=con.createStatement();
		String query="select name ,id,email from user where email = '" + email +"'and passcode = '"+pass+"';";
		System.out.println(query);
		ResultSet rs=stmt.executeQuery(query);
		String name="Error";
		String id="Error";
		if(rs.next())  
		{
			name = rs.getString(1);
		    id =  rs.getString(2);
		}
	    if(name.contentEquals("Error"))
	    {
	    	return "false";
    	}
    	
	    
	    map.put("name", name);
	    map.put("id", id);
	    map.put("email",email);
	    con.close();
	    return "true"; 
    	}
    	catch(Exception e)
    	{ 
    		System.out.println(e);  
		}
    	return "fail";
    }
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    Map<String,String> map=new HashMap<String,String>();
		    
		    String email = request.getParameter("email");
	        String Pass  = request.getParameter("password");
	        String url = "errorPage.jsp";
	       // email="p1@m.c";
	        //Pass="qwe";
	        HttpSession session=request.getSession();
	        map.put("email", email);
	        map.put("pass", Pass);
	        String status = JDBCConnecion(map);
	        String name = map.get("name");
 	        String id = map.get("id");
	        if(status.contentEquals("true"))
	        {
	        	 
	 	       Cookie ck=new Cookie("userId",id);//creating cookie object  
			    response.addCookie(ck);
	 	        session.setAttribute("userId",id);
	 	        session.setAttribute("email", email);
	 	        System.out.println("Logged In");
	 	        url ="dashboard.jsp?id="+id;
	 	      logger("Success Login",email);   
	        		
	        }
	        else
	        {
	        	System.out.println("Error");
	        	logger("Unsuccessful Login",email);
	        }
	        	response.sendRedirect(url);
	        
	}

	public void logger(String logs,String email) 
	{
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
