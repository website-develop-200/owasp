<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<title>Logs</title>
</head>
<body>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
 <sql:query dataSource="${db}" var="rs1">  SELECT id,logs from logs </sql:query>    
<table>
<tr>
<th>Email</th>
<th>Logs</th>
</tr>
    
<c:forEach var="table1" items="${rs1.rows}">

 	     <tr><td><c:out value="${table1.id}"/></td><td><c:out value="${table1.logs}"/></td></tr>
 	     
 	     </c:forEach>
 	     </table>
</body>
</html>