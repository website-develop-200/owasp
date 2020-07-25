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
<title>Item</title>
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

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     <sql:query dataSource="${db}" var="rs">  SELECT name , CostPrice ,SellingPrice,quantity,type,userId from item where id = ? <sql:param value="${param.id}" />    ; </sql:query>
<c:forEach var="table" items="${rs.rows}">
 <c:out value="${table.name}"/>
 <table>
 		<tr><td>Item Name</td><td><c:out value="${table.name}"/></td></tr>
 		<tr><td>Cost Price</td><td><c:out value="${table.CostPrice}"/></td></tr>
 		<tr><td>Selling Price</td><td><c:out value="${table.SellingPrice}"/></td></tr>
 		<tr><td>Initial Quantity</td><td><c:out value="${table.quantity}"/></td></tr>
 		<sql:query dataSource="${db}" var="rs1">  SELECT name from user where id = ? <sql:param value="${table.userId}" />   ; </sql:query>
        <c:forEach var="table1" items="${rs1.rows}">
 		
 		<tr><td>Last Modified by</td><td><c:out value="${table1.name}"/></td></tr>
 		</c:forEach>
 </table>
 </c:forEach>
<table>
</table>
</body>
</html>