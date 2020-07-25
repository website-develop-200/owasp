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
import javax.servlet.http.HttpSession;

@WebServlet("/editInvoice")
public class editInvoice extends HttpServlet {
	
	void StringToInt(int size,String[] arrStr,int[] arrInt)
	{
      for(int i=0; i<size; i++) 
      {
         arrInt[i] = Integer.parseInt(arrStr[i]);
      }
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					HttpSession session=request.getSession();  
					String invId=request.getParameter("invId");
					String userId = (String) session.getAttribute("userId");
					String InvName=request.getParameter("InvoiceName");
					String itemId[]=request.getParameterValues("itemId");
					String count[] = request.getParameterValues("count");
					int size = itemId.length;
					int intItemId[] = new int [size];
					int intCount[] = new int [size];
					StringToInt(size,itemId,intItemId);
					StringToInt(size,count,intCount);
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
					SaveToInvoice(InvName,grandTotal,userId,invId);
					System.out.println(invId);
					query="delete from invdet where invId ="+invId+";";
					stmt.executeUpdate(query);
					for(i=0;i<k;i++)
					{
					    query = "insert into invdet (invId,itemPrice,itemId,count,totalPrice) values("+invId+"," +indPrice[i]+"," +indId[i]+",'" +indCount[i]+"'," +indtotal[i] +");";
						rs1 = stmt.executeUpdate(query);
					}
				    con.close(); 
				    response.sendRedirect("showInvoiceDetails.jsp?id="+ invId);
			    	}
			    	catch(Exception e)
			    	{ 
			    		System.out.println(e);  
					}
					
				}
				private String SaveToInvoice(String invName, int grandTotal, String userId,String invId) {
					try
			    	{
			    	Class.forName("com.mysql.cj.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");  
					Statement stmt=con.createStatement();
					String query = "update invoice set name = '"+invName +"',total="+grandTotal+",userId="+userId+" where id ="+invId+";";
					int rs = stmt.executeUpdate(query);
					return "true";
					}    	
					catch(Exception e)
					{
						System.out.println(e);
					}
					return "false";
				}

			}
	

