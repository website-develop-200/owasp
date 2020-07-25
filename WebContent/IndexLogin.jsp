<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!Doctype html>
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
        <title>
            Login
        </title>
    </head>
    <body>
         <div>
             <img id="imageId" src="https://cdn.dribbble.com/users/4367813/screenshots/8499807/invoice.jpg" alt="logo" width="100px" height="100px" style="align-self:center;"><br>
             <b>Login using</b><br>
             <form method="get" action="LoginCheck">
                 Email<br>
                 <input type="email" name="email" required><br>
                 Password<br>
                 <input type="password" name ="password" required><br>
                 <input type="Submit" value="Login">
             </form>
              --or--<br>
             <a href="Signup.jsp"><button  value="SignUp">SignUp</button></a>
              <br>--or--<br>
             <a href="admin.jsp"><button  value="Log in as Admin">Log in as Admin</button></a>
         </div>
         
    </body>
</html>