<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a new item</title>
</head>
<body>
<div>
	<form action="saveItem" method="post">
	Item Name<br><input type="text" name="item" required><br>
	Cost Price<br><input  type="number" min="0.00" name="cp" required><br>
	Selling Price<br><input  type="number" min="0.00" name="sp" required><br>
	Quantity<br><input type="number" min="1" name="quan" required><br>
	Type <br><select name="type" required><option>Good</option><option>Service</option></select>
	<br>
	<br>
	<input type="submit" value="OK">
	</form>
</div>
</body>
</html>