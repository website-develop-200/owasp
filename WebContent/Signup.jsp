<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
div
{
    border: 2px solid Black;
    padding:4%;
    width: 300px;
    align-items: center;
    
}
</style>
<meta charset="ISO-8859-1">
<title>SignUp</title>
</head>
<body>
<div>
	<form action="newSignUp" method="get">
	Username<br>
	<input type="text" name="Username" required><br>
	Phone<br>
	<input type="number" name="phone" required><br>
	Credit Card details<br>
	<input type="number" name="creditCardDetails" value='0'><br>
	Email<br><input type="email" name="email"required>
	<br>
	Password<br>
	<input type="password" name="pass" required><br>
	<input type="hidden" name="table" value="user"/>
	<input type="Submit" value="Register"><br>
	</form>
</div>

</body>
</html>