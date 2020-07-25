<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.Connection" %>
    <%@page import="java.sql.DriverManager"%>
   	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="sidenav.css">
<script src="sidenav.js">
</script>
<style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<title>Items</title>
</head>
<body> 

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="dashboard.jsp?id=${sessionScope.userId }">Dashboard</a>
  <a href="showItems.jsp">Item</a>
  <a href="showInvoice.jsp">Invoices</a>
  </div>
  <div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;APP</span>
</div>
</div>
<div class="navbar">
  <a href="showItems.jsp">Items</a>
  <a href="CreateItem.jsp" style="text-align:left;">+Create Items</a>
  <a href="exit">Log Out</a>
</div>
 	
 	<hr>
 	<table>
 	<tr>
 		<th>Name</th>
 		<th>Type</th>
 		<th >Quantity</th>
 		<th>Options</th>
 	</tr>
 	<%
 	try
 	{
 	  Class.forName("com.mysql.cj.jdbc.Driver");
 	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/owasp","root","root");
 	  Statement stmt=con.createStatement();
 	  String userId = (String)session.getAttribute("userId");
 	  String query = "Select name , type ,quantity , id from item where userId="+userId;
 	  ResultSet rs = stmt.executeQuery(query);
 	  while(rs.next())
 	  {
 	   out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+ " " );
 	   out.print("<div class='dropdown'>");
 	  out.print("	     <button class='dropbtn'>More</button>");
 	 out.print("	  <div class='dropdown-content'>");
 	 out.print("	  <a href='ShowItemDetail.jsp?id="+rs.getInt(4)+"'>Show Item</a><a href='EditItem.jsp?id="+rs.getInt(4)+"'>Edit</a><a href='deleteItem?id="+rs.getInt(4)+"'>Delete</a></div>");
 	 out.print("	</div>");
 	   out.print("</td></tr>");
 	  }
 	}
 	catch(Exception e)
 	{
 		System.out.println(e);
 	}
 	%>
 	</table>
</body>
</html>