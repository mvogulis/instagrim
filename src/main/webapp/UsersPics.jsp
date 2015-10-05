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
        
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
                </div>

            <div class="nav-bar">
				<ul class="nav">
                    <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                    <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
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
            <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/><%

                }
                }
            %>
                                </div></div>
             <div class="footer">
                
                    <a href="/Instagrim">Home</a>
               
            </div>
        </div>
    </body>
</html>
