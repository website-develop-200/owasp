<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Item</title>
</head>
<body>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     <sql:query dataSource="${db}" var="rs">  SELECT name , CostPrice ,SellingPrice,quantity,type from item where id = ? <sql:param value="${param.id}" />    ; </sql:query>
<c:forEach var="table" items="${rs.rows}">
 <c:out value="${table.name}"/>
<div>
	<form action="editItem?id=${param.id}" method="post">
	
	Item Name<br><input type="text" name="item" value="<c:out value="${table.name}"/>" required><br>
	Cost Price<br><input  type="number" min="0.00" name="cp" value="<c:out value="${table.CostPrice}"/>" required><br>
	Selling Price<br><input  type="number" min="0.00" name="sp" value="<c:out value="${table.SellingPrice}"/>" required><br>
	Quantity<br><input type="number" min="1" name="quan"  value="<c:out value="${table.quantity}"/>" required><br>
	Type <br><select name="type" value="<c:out value="${table.type}"/>" required><option>Good</option><option>Service</option></select>
	<br>
	<br>
	<input type="submit" value="OK">
	</form>
</div>

</c:forEach>
</body>
</html>