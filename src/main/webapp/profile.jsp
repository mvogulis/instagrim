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
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
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
                    <% UserDetails ud = (UserDetails) request.getAttribute("details");
                       String user = ud.getUser();
                       String fName = ud.getFirstName();
                       String lName = ud.getLastName();
                    %>
                    <li><b>User:</b> <%=user%></li>
                    <li><b>First Name:</b> <%=fName%> </li>
                    <li><b>Last Name:</b> <%=lName%> </li>   
                </div>
            </div>               
            <div class="footer">
                <a href="/Instagrim">Home</a>
            </div>
        </div>
    </body>
</html>
