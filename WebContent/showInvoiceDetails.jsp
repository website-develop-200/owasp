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
<title>Invoice</title>
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
     <sql:query dataSource="${db}" var="rs">  SELECT name,status,total,payed,userId from invoice where id = ? <sql:param value="${param.id}" />    ; </sql:query>
<c:forEach var="table" items="${rs.rows}">
 <table>
 	     <tr><td>Invoice</td><td><c:out value="${table.name}"/></td></tr>
 	     <tr><td>Status</td><td><c:out value="${table.status}"/></td></tr>
 	     <tr><td>Total Amount</td><td><c:out value="${table.total}"/></td></tr>
 	     <tr><td>Balance</td><td><c:out value="${table.total - table.payed}"/></td></tr>
 	      <sql:query dataSource="${db}" var="rsUser">  SELECT name from user where id = ? <sql:param value="${table.userId}" />    ; </sql:query>
 	      <c:forEach var="tableUser" items="${rsUser.rows}">
 	      <tr><td>Created By</td><td><c:out value="${tableUser.name}"/></td></tr>
 	       </c:forEach>
 </table>
 </c:forEach>
   <sql:query dataSource="${db}" var="rs1">  SELECT  itemPrice ,itemId ,count ,totalPrice from invdet where invId = ? <sql:param value="${param.id}" />    ; </sql:query>
<table>
	<tr>
		<th>Item</th>
		<th>Quantity</th>
		<th>Selling Price</th>
		<th>Total</th>
			
	</tr>
<c:forEach var="table1" items="${rs1.rows}">

	<tr>
	<sql:query dataSource="${db}" var="rs2">  SELECT  name from item where id = ?  <sql:param value="${table1.itemId}" />   ; </sql:query>
	<c:forEach var="table2" items="${rs2.rows}">
		<td><c:out value="${table2.name}"/></td></c:forEach>
		<td><c:out value="${table1.count}"/></td>
		<td><c:out value="${table1.itemPrice}"/></td>
		<td><c:out value="${table1.totalPrice}"/></td>
	</tr>
 
  
 </c:forEach>
</table>

</body>
</html>