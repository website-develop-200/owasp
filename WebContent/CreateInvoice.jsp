<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
}
</style>
<title>Create a new invoice</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     <sql:query dataSource="${db}" var="rs">  SELECT id,name ,SellingPrice,type from item where userId = ?<sql:param value="${sessionScope.userId }"></sql:param> ; </sql:query>
 <div>
 	<table>
 	<tr> 	 		
 		<th>Name</th>
 		<th>Quantity</th>
 		<th>Selling Price</th>
 		<th>Type</th>
 		
 	</tr>

	<form action="saveInvoice" method="get">
	<div>
	Invoice <br>
	<input type="text" name="name" reqired>
	<c:forEach var="table" items="${rs.rows}">
	 <label style="visibility: hidden;"><input type="Checkbox" name="itemId" value="<c:out value="${table.id}" />" checked></label>
		<tr>
		    
			<td><c:out value="${table.name}"/></td>
			<td><input type="number" min="0"name="count" value="0"/></td>
			<td><c:out value="${table.sellingPrice}"/></td>
			<td><c:out value="${table.type}"/></td>
			
		</tr>
	</c:forEach> 
	</div> 
	<input type="submit" value="OK">
	</form>
</table>
</div>


</body>
</html>