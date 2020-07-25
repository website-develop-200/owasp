<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="sidenav.css">
<style>


</style>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body >

	
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
	
     <sql:query dataSource="${db}" var="rs1">  SELECT name  from admin where id = ? <sql:param value="${param.id}" />    ; </sql:query>
    <c:forEach var="table1" items="${rs1.rows}">
<div class="navbar">
  <a >Home</a>
  <a >Logged in As  <c:out value="${table1.name}"/></a>
  <a href="exit">Log Out</a>
</div>
	</c:forEach>
	<hr>
	<div id="over" style="align:left;">
	
	<div>
	<a href="showAdminDetails.jsp?id=${param.id}" /><span >Show Personel Details</span></a>
	</div>
	<div>
	<a href="showAllDetails.jsp?id=${param.id}" /><span >Show All Customer Details</span></a>
	</div>
	<div>
	<a href="logs.jsp" /><span >Show All Logs</span></a>
	</div>
	</div>
	
	</body>
	
</html>