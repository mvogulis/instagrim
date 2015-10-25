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
                        <li><a href="/Instagrim/Images/<%=UserName%>">Your Images</a></li>
                        <li><a href="/Instagrim/Logout">Logout</a></li>
                        <li><a href="/Instagrim/Upload">Upload</a></li>
                        <li><a href="/Instagrim/Profile/<%=UserName%>">Profile</a></li>
                        <li><a href="/Instagrim/editProfile.jsp">edit prof</a></li>
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
                    <img src="http://keithecker.com/wordpress/wp-content/uploads/2013/07/BlackWhite.gif" alt="image not found" style="width:504px;height:228px;">
                </div>
            </div>     
            <div class="footer">
                &COPY; Andy C and Mantas V
            </div>
        </div>
    </body>
</html>
