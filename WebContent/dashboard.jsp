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
<title>Dashboard</title>
</head>
<body >
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     <sql:query dataSource="${db}" var="rs">  SELECT name  from user where id = ? <sql:param value="${param.id}" />    ; </sql:query>
    <c:forEach var="table" items="${rs.rows}">
<div class="navbar">
  <a >Home</a>
  <a href="" >Logged in As  <c:out value="${table.name}"/></a>
  <a href="exit">Log Out</a>
</div>
	
	<hr>
	<div id="over" style="align:left;">
	<div>
	<a href="showItems.jsp"><span >Items</span></a>
	</div>
	<div>
	<a href="showDetails.jsp?id=${param.id}" /><span >Show Personel Details</span></a>
	</div>
	<div>
	<a href="showInvoice.jsp"><span >Invoices</span></a>
	
	</div>
	<div>
	<a href="comments.jsp?id=${param.id}&redirectUrl='Login'"><span >Chat Portion</span></a>
	
	</div>
	<div>
	<a href="delete_account"><span >Delete my Account</span></a>
	
	</div>
	<div>
	<a href="xmlParser?xml=%3Cperson%3E${table.name} %3C%2Fperson%3E"><span >XML</span></a>
	
	</div>
	</div>
	</c:forEach>
	
	
	
   
	
</html>