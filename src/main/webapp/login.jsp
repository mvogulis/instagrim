<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>  
    <body>
        <div class="container">
            <div class="header">
                <h1 class="header-heading"><a href="/Instagrim">Instagrim!</a></h1>
                <h2>Your world in Black and White</h2>
            </div>
            <div class="nav-bar">
                <ul class="nav">
                    <li><a href="/Instagrim/Register">Register</a></li> 
                </ul>
            </div>
            <div class="content">
                <div class="main">
                    <h3>Login</h3>
                    <form method="POST"  action="Login">
                        <ul>
                            <li>User Name <input type="text" name="username" required></li>
                            <li>Password <input type="password" name="password" required></li>
                        </ul>
                        <br/>
                        <input type="submit" value="Login"> 
                    </form>

                </div>
            </div>
            <div class="footer"> 
                <a href="/Instagrim">Home</a>
            </div>
        </div>
    </body>
</html>
