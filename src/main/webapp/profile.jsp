<%-- 
    Document   : profile
    Created on : 07-Oct-2015, 15:29:42
    Author     : Mantis
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
                <h1 class="header-heading"><a href="/Instagrim">Instagrim!</a></h1>
                <h2>Your world in black and white</h2>
            </div>
            
            <div class="nav-bar">
                <ul class="nav">
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                        <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                        <li><a href="/Instagrim/Logout">Logout</a></li>
                        <li><a href="/Instagrim/Upload">Upload</a></li>
                        <li><a href="/Instagrim/profile.jsp">Profile</a></li>
                    <%}
                            }else{
                                %>
                                    <li><a href="/Instagrim/Register">Register</a></li>
                                    <li><a href="/Instagrim/Login">Login</a></li>
                                    
                                     <%
                    }%>
                </ul>     
            </div>
            <div class="content">
                <div class="main">	
                    <p>yep</p>
                </div>
            </div>
                
            <div class="footer">
                <a href="/Instagrim">Home</a>
            </div>
        </div>
    </body>
</html>
