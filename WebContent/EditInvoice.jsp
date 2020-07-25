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
<title>Edit invoice</title>
</head>
<body>
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     	<sql:query dataSource="${db}" var="rs">  SELECT name from invoice where id = ? <sql:param value="${param.id}"></sql:param>; </sql:query>
 	<div>
 		Invoice
 		<form action="editInvoice" method="get">
 			<c:forEach var="table" items="${rs.rows}">
				 <input type="text" name="InvoiceName" value="<c:out value="${table.name}"/>"/>
 			</c:forEach>
 			<table>
 				<tr> 	 		
			 		<th>Name</th>
			 		<th>Quantity</th>
			 		<th>Selling Price</th>
			 		<th>Type</th>
			 	</tr>
				<sql:query dataSource="${db}" var="rs1">  SELECT id,name ,SellingPrice,type from item where UserId = ? <sql:param value="${sessionScope.userId }"></sql:param> ; </sql:query>
				<div>
				<label style="visibility: hidden;"> <input type="Checkbox" name="invId" value="<c:out value="${param.id}"/>"  checked/></label>
					<c:forEach var="table2" items="${rs1.rows}">
				 		<label style="visibility: hidden;"> <input type="Checkbox" name="itemId" value="<c:out value="${table2.id}"/>"  checked/></label>
						<tr>
							<td><c:out value="${table2.name}"/></td>
							<td><input type="number" min="0"name="count" value="0"/></td>
							<td><c:out value="${table2.sellingPrice}"/></td>
							<td><c:out value="${table2.type}"/></td>
						</tr>
					</c:forEach> 
					</table>
					<input type="submit" value="OK">
			</form>
	</div>
</body>
</html>