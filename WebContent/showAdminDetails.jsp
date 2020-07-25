<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css">
<link rel="stylesheet" type="text/css" href="sidenav.css">
<script src="sidenav.js">
</script>
<meta charset="ISO-8859-1">
<title>Admin Details</title>
</head>
<body>


 	<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="admindashboard.jsp?id=${sessionScope.userId}">Dashboard</a>
  <a href="exit">Log out</a>
 
  </div>
  <div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;APP</span>

 </div>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     <sql:query dataSource="${db}" var="rs">  SELECT name , email,creditCardDetails from admin where id = ? <sql:param value="${param.id}" />    ; </sql:query>
<c:forEach var="table" items="${rs.rows}">

 <table>
 
 		<tr><td>Name</td><td><c:out value="${table.name}"/></td></tr>
 		<tr><td>Email</td><td><c:out value="${table.email}"/></td></tr>
 		<tr><td>Credit Card Details</td><td><c:out value="${table.creditCardDetails}"/></td></tr>
 	
 		</c:forEach>
 </table>

</body>
</html>