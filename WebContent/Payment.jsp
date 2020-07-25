<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
</head>
<body>
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  url="jdbc:mysql://localhost/owasp"  user="root"  password="root"/>
     	<sql:query dataSource="${db}" var="rs">  SELECT total,payed from invoice where id = ? <sql:param value="${param.id}"></sql:param>; </sql:query>
		<c:forEach var="table" items="${rs.rows}">
		Total Amount = <c:out value="${table.total}"></c:out><br>
		Balance = <c:out value="${table.total - table.payed}"></c:out><br>
		<form action="Payment" method="get">
		<label style="visibility:hidden;"><input name="id" type="text" value="${param.id}"/></label><br>
		Amount<br>
		
		<input type="number" min="0" name="payment" value="${table.total - table.payed}" max="${table.total - table.payed}" /><br>
		<input type="submit" value="Make Payment"/>
		</form>
		</c:forEach> 





</body>
</html>