<%-- 
    Document   : editProfile
    Created on : 13-Oct-2015, 10:15:12
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
                  <form method="POST"  action="Profile">
                        <ul>
                            <li>First name <input type="text" name="fName"></li>
                            <li>Last name <input type="text" name="lName"></li>
                        </ul>
                        <input type="submit" value="Save"> 
                    </form>
                </div>
            </div>             
            <div class="footer">
                <a href="/Instagrim">Home</a>
            </div>
        </div>
    </body>
</html>
