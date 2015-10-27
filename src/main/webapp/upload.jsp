<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                        <li><a href="/Instagrim/EditProfile">Edit profile</a></li>
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
                    <h3>File Upload</h3>
                    <form method="POST" enctype="multipart/form-data" action="Image">
                        File to upload: <input type="file" name="upfile"><br/>
                        <br/>
                        <input type="submit" value="Press"> to upload the file!
                    </form>
                </div>
            </div>
            <div class="footer">
                <a href="/Instagrim">Home</a>
            </div>
        </div>
    </body>
</html>
