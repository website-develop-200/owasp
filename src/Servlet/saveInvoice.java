package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/saveInvoice")
public class saveInvoice extends HttpServlet {
	void StringToInt(int size,String[] arrStr,int[] arrInt)
	{
      for(int i=0; i<size; i++) 
      {
         arrInt[i] = Integer.parseInt(arrStr[i]);
      }
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
	
		String email = (String) session.getAttribute("email");
		int size;
		int payed = 0;
		String invId="";
		String status = "Not Paid";
		String userId = (String) session.getAttribute("userId");
		String InvName=request.getParameter("name");
		String itemId[]=request.getParameterValues("itemId");
		String count[] = request.getParameterValues("count");
		size = itemId.length;
		int intItemId[] = new int [size];
		int intCount[] = new int [size];
		StringToInt(size,itemId,intItemId);
		StringToInt(size,count,intCount);
		/*for(int j=0;j<size;j++)
		{
			System.out.println(itemId[j]+"		"+intItemId[j]);
			System.out.println(count[j]+"		"+intCount[j]);
		}*/
		try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		Statement stmt=con.createStatement();
		ResultSet rs;
		int i;
		int rs1;
		String query;
		int indtotal[]  = new int [size] ,indId[] = new int [size],indCount[]  = new int [size],indPrice[]  = new int [size];
		int grandTotal=0;
		int k=0;
		for(i=0;i<size;i++)
		{
			if(intCount[i]>=1)
			{
				query="select SellingPrice from item where id ="+intItemId[i]+";";
				rs=stmt.executeQuery(query);
				rs.next();
				indtotal[k] = (rs.getInt(1) * intCount[i]);
				indCount[k] = intCount[i];
				indId[k] = intItemId[i];
				indPrice[k]=rs.getInt(1);
				grandTotal+=indtotal[k++];
				
			}
		}
		
	    invId=SaveToInvoice(InvName,grandTotal,payed,status,userId);
		System.out.println(invId);
		for(i=0;i<k;i++)
		{
		    query = "insert into invdet (invId,itemPrice,itemId,count,totalPrice) values("+invId+"," +indPrice[i]+"," +indId[i]+",'" +indCount[i]+"'," +indtotal[i] +");";
			rs1 = stmt.executeUpdate(query);
		}
	    con.close();
	    String url = "showInvoiceDetails.jsp?id="+ invId;
	    if(grandTotal==0)
		{
	    	logger("Invoice Not Created",email);
			url="errorPage.jsp";
		}
	    else
	    {
	    	logger("Invoice Created",email);
	    }
	    response.sendRedirect(url);
    	}
    	catch(Exception e)
    	{ 
    		System.out.println(e);  
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
	private String SaveToInvoice(String invName, int grandTotal, int payed, String status, String userId) {
		try
    	{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
		Statement stmt=con.createStatement();
		String query = "insert into invoice (name,total,payed,status,userId) values('"+invName+"'," +grandTotal+"," +payed+",'" +status+"'," +userId +");";
		int rs = stmt.executeUpdate(query);
		if (rs>= 1)
		{
			query = "select id from invoice where Id=(SELECT LAST_INSERT_ID()) ";
			ResultSet rs1 = stmt.executeQuery(query);
			rs1.next();
			return Integer.toString(rs1.getInt(1));
		}
    	}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return "false";
	}

}
