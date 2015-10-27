<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
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
                        } else {
                        %>
                    <li><a href="/Instagrim/Register">Register</a></li>
                    <li><a href="/Instagrim/Login">Login</a></li>      
                        <%
                                         }%>
                </ul>
            </div>

            <div class="content">
                <div class="main">
                    <h1>Your Pics</h1>
                    <%
                        java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                        if (lsPics == null) {
                    %>
                    <p>No Pictures found</p>
                    <%
                    } else {
                        Iterator<Pic> iterator;
                        iterator = lsPics.iterator();
                        while (iterator.hasNext()) {
                            Pic p = (Pic) iterator.next();
                    %>
                    <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/>
                        <%
                            if (lg != null) {
                                String un = lg.getUsername();
                        %>
                    <form method="POST" action="/Instagrim/ImageDelete/<%=un%>">
                        <input type="hidden" value="<%=p.getSUUID()%>" name="pid"/>
                        <button>Delete</button>
                    </form>
                    <br/>
                    <%
                                    
                                }
                            }
                        }
                    %>
                </div>
            </div>
            <div class="footer"> 
                <a href="/Instagrim">Home</a>
            </div>
        </div>
    </body>
</html>
