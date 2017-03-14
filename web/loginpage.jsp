<%-- 
    Document   : loginpage
    Created on : 19 Feb, 2017, 8:57:23 AM
    Author     : K.SRINIVAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
   
        <head>
            <style>
                .body{
                    background-repeat:no-repeat;
background-size:cover;
-webkit-background-size:cover;
-moz-background-size:cover;
-o-background-size:cover;
                }
                .body img{
width:10%;
height:auto;
margin: 2% 0;
}
@media only screen and (min-width: 150px) and (max-width: 600px)
{
.body{ 
width:100%;
font-size:95%;
padding :0;
margin:0;
}
}
            </style>
               
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link rel="stylesheet" type="text/css" href="responsiveform.css">
        <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="responsiveform1.css" />
        <link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="responsiveform2.css" />
        <link rel="stylesheet" media="screen and (max-width: 350px)" href="responsiveform3.css" />

        </head>
   <body background="img/collage-2017-02-19(4).jpg">
       <img src="img/transparent_text_effect(2).png" width="950px"/>
        <div id="envelope">
            
            <form id="form1" method="post" action="login.jsp" style="background-color:#ccccb3">
            <header>
                <h2>Login</h2>
                
            </header>
                
                 &nbsp;&nbsp;&nbsp;<%
                     String t=(String)session.getAttribute("errorMessage");
                     
                 if(t==null)
                 {
                     session.setAttribute("errorMessage", "**Enter Username and Password");
                 }
                 %><font color="red"><%                   
                 out.println(t);%></font>
                 <br><br>&nbsp;&nbsp;&nbsp;
        <label>UserName / LoginId</label><br>
        <input name="uname" placeholder="eg:srujana" type="text" width="100px;" required> 
        <br> &nbsp;&nbsp;&nbsp;
        <label>Password</label><br>
        <input name="pass" placeholder="" type="password" required><br>
        <input type="submit" value="Login" id="submit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="Reset" id="reset"/><br><br>
       
         &nbsp;&nbsp;&nbsp;Not Yet Registered!! <a href="reg.jsp">Register Here</a><br><br>
        </form>
            
        </div>
    </body>
    
</html>
