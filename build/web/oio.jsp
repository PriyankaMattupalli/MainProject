<%-- 
    Document   : oio
    Created on : 15 Feb, 2017, 3:38:46 PM
    Author     : K.SRINIVAS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<h1>You are not logged in</h1><br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>


<!DOCTYPE html>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Owl</title>
 <style>
.body{
background-repeat:no-repeat;
background-size:cover;
-webkit-background-size:cover;
-moz-background-size:cover;
-o-background-size:cover;
}
.menu nav{
background-color:#808080;
height:40px;
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
}

.menu nav ul{
list-style:none;
margin:0 auto;
}

.menu nav ul li{
float:right;
display:inline;
}

.menu nav a:link, .menu nav a:visited {
color:#fff;
display:inline-block;
padding:10px 25px;
height:20px;
text-decoration: none;
}

.menu nav a:hover, .menu nav a:active,
.menu nav .active a:link,.menu nav .active a:visited{
background-color:#cf5c3f;
text-shadow:none;
}

.menu nav ul a{
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
}

.oio{
width: 65%;
margin: 10px 0 0px 11%;
padding:10px 0;
border: 2px white;
border-radius:10px;
}



/*.menu{
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.menu a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.menu a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.menu .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .menu {padding-top: 15px;}
  .menu a {font-size: 18px;}
}
*/

@media only screen and (min-width: 150px) and (max-width: 650px)
{
.body{ 
width:90%;
font-size:95%;
}
.oio{
    width:fit-content;
}
.menu nav{
    height:240px
}
.menu nav ul{
padding-left:0;
align-items: right;
}

.menu nav ul li{
width:100%;
text-align:center;
}

.menu nav a:link, .menu nav a:visited {
padding:10px 25px;
height:20px;
display:block;
}

}
</style>

<link rel="stylesheet" type="text/css" href="responsiveform.css">
<link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="responsiveform1.css" />
<link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="responsiveform2.css" />
<link rel="stylesheet" media="screen and (max-width: 350px) and (min-width: 150px)" href="responsiveform3.css" />

 
 </head>

     <body background="img/collage-2017-02-19(4).jpg">   
        <img src="img/transparent_text_effect(2).png" width="950px"/>
      
       <div class="menu" id="menu">
         <nav>
             
         <ul>  
            <li><a href='logout.jsp'>Logout</a></li>
            <li><a href="">P+</a></li>
            <li><a href="">Pedi Peri</a></li>
            <li class="active"><a href="oio.jsp">OWL</a></li>
            <li><a href="addpatient.jsp">New Patient</a></li>    
            <li><a href='home.jsp'>Home</a></li>
         </ul>
         </nav>
       </div>
       
         <div class="oio">
            <form method="post" action="owl.jsp" style="background-color:#ccccb3">
            <header>
                <h2>Open Indirect Ophthalmoscope</h2>
                <p></p>
            </header><br><br>
               &nbsp;&nbsp;&nbsp;
                Ip Address :<br>
                <input type="text" name="ipaddress" id="ipaddress"><span id="ipaddress" style="color:red"></span><br><br>
     
               &nbsp;&nbsp;&nbsp;
                Date (yyyy-mm-dd) :<br>
                <input type="text" name="date" pattern="^([0-9]{4})-([0-9]{2})-([0-9]{2})$" id="date"><span id="date" style="color:red"></span><br><br>
   
                <input type="submit" value="Upload" id="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </form>
         </div>
       
     </body>
</html>
<%
    }
%>
