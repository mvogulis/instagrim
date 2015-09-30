<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
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
                <h1 class="header-heading">Instagrim!</h1>	
                <h2>Your world in Black and White</h2>
            </div>
            <div class="nav-bar">
				<ul class="nav">

                    <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
                </ul>
            </div>

            <div class="content">
				<div class="main">
            <!--<article>-->
                <h3>Register as user</h3>
                <form method="POST"  action="Register">
                    <ul>
                        <li>User Name <input type="text" name="username"></li>
                        <li>Password <input type="password" name="password"></li>
                    </ul>
                    <!--<br/>-->
                    <input type="submit" value="Register"> 
                </form>

            <!--</article>-->
                                </div></div>
                <div class="footer">

                                   <a href="/Instagrim">Home</a>
                                    &COPY; Andy C
                            </div>

        </div>
    </body>
</html>
