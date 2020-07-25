<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="sidenav.css">
<script src="sidenav.js">
</script>
<style>
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
}</style>
<meta charset="ISO-8859-1">
<title>Show All Details</title>
</head>
<body>


<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <a href="dashboard.jsp?id=${param.id }">Dashboard</a>
  <a href="showItems.jsp">Item</a>
  <a href="showInvoice.jsp">Invoices</a>
  </div>
 
  </div>
  <div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;APP</span>
</div>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
 <sql:query dataSource="${db}" var="rs1">  SELECT name,email,phone from user </sql:query>    


    
<c:forEach var="table1" items="${rs1.rows}">
<table>
 	     <tr><td>Name</td><td><c:out value="${table1.name}"/></td></tr>
 	     <tr><td>Email</td><td><c:out value="${table1.email}"/></td></tr>
 	     <tr><td>Phone</td><td><c:out value="${table1.phone}"/></td></tr>
 	       </table>
 	       </c:forEach>
 	       <br>


 
</table>

</body>
</html>