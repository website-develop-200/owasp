<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chats</title>
</head>
<body>
<h1>Common Chat Place</h1>
		 <label id="image"><img src="https://cdn.dribbble.com/users/4367813/screenshots/8499807/invoice.jpg" alt="logo" width="100px" height="100px" style="align-self:center;"><br>
		  </label>  <a href="createComments.jsp">Add Chat</a><br>
			<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
			     <sql:query dataSource="${db}" var="rs">  SELECT id,Comment from comments  ; </sql:query>
			<c:forEach var="table" items="${rs.rows}">
			
			<sql:query dataSource="${db}" var="rs1">  SELECT name from user where id =? <sql:param value = "${table.id}"></sql:param> ; </sql:query>
			<c:forEach var="table1" items="${rs1.rows}">
			  <c:out value ="${table1.name}"/></c:forEach>
			   ${table.Comment}
			  
			
			<hr>
			</c:forEach>

</body>
</html>