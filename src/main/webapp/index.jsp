<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

        <body>
            <div class="container">
			<div class="header">
				<h1 class="header-heading">Instagrim!</h1>
                                <h2>Your world in black and white</h2>
			</div>
			<div class="nav-bar">
				<ul class="nav">
					<li><a href="upload.jsp">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                                        <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                    <%}
                            }else{
                                %>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="login.jsp">Login</a></li>
                                         <%
                                        
                            
                    }%>
				</ul>
			</div>
			<div class="content">
				<div class="main">

					
					<hr>
				</div>
			</div>
			<div class="footer">
                            <a href="/Instagrim">Home</a>
				&COPY; Andy C

			</div>
		</div>
        </body>
</html>
