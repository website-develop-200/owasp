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


@WebServlet("/Payment")
public class Payment extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		float payment = Float.parseFloat(request.getParameter("payment"));
		
		try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		Statement stmt=con.createStatement();
		String query = "select total,payed,status from invoice where id ="+id +";";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		float total = rs.getFloat(1);
		float payed = rs.getFloat(2);
		String status = rs.getString(3);
		float newPayment = (payed + payment);
		String newStatus="";
		int rs1=0;
		float balanceAmount = total - newPayment ;
		if(total==newPayment)
		{
			newStatus = "Paid";
		}
		if(balanceAmount>0 && balanceAmount<total)
		{
			newStatus = " Partly Paid";
		}
		if(balanceAmount==total)
		{
			newStatus = "Not Paid ";
		}
		System.out.println(payment);
		 query = "update invoice set payed="+newPayment+",status='"+newStatus+"' where id ="+id+";";
		rs1 = stmt.executeUpdate(query);
		if(rs1>=1)
		{
			response.sendRedirect("showInvoice.jsp");
		}
    	}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
