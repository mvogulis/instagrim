<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
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
                <h1>InstaGrim ! </h1>
                <h2>Your world in Black and White</h2>
            </div>
            
           <div class="nav-bar">
				<ul class="nav">
                    <li class="nav"><a href="upload.jsp">Upload</a></li>
                    <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
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

                                </div></div>
            <div class="footer">
                
                    <a href="/Instagrim">Home</a>
                    &COPY; Andy C
            </div>
        </div>
    </body>
</html>
