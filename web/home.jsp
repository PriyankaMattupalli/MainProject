<%-- 
    Document   : home
    Created on : 19 Feb, 2017, 8:44:11 AM
    Author     : K.SRINIVAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<h1>You are not logged in</h1><br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>home</title>
<style>
body{
background-color:#ccccb3;
background-repeat:repeat;
background-size:cover;
-webkit-background-size:cover;
-moz-background-size:cover;
-o-background-size:cover;
background-size:cover;
font-size:87.5%;
font-family:arial;
line-height:1.5;
text-align:left;
}

a{
  text-decoration:none;
}
a:link,a:visited {
color:#cf5c3f;
}

a:hover,a:active{
background-color:#cf5c3f;
color:#ffffff;
}

.body{
margin: 0 auto;
width: 70%;
clear:both;
}

.mainheader img{
width:80%;
height:auto;
margin: 0;
}

.mainheader nav{
background-color:#808080;
height:40px;
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;

}

.mainheader nav ul{
list-style:none;
margin:0 auto;
}

.mainheader nav ul li{
float:right;
display:inline;
}

.mainheader nav a:link, .mainheader nav a:visited {
color:#fff;
display:inline-block;
padding:10px 25px;
height:20px;
}

.mainheader nav a:hover, .mainheader nav a:active,
.mainheader nav .active a:link,.mainheader nav .active a:visited{
background-color:#cf5c3f;
text-shadow:none;
}

.mainheader nav ul a{
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
}

.maincontent {
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
line-height:25px;

}

.content{
width:70%;
float:left;
}

/*.topcontent{
background-color:#fff;
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
padding:3% 5%;
margin-top:2%;
}*/

@media only screen and (min-width: 150px) and (max-width: 600px)
{
.body{ 
width:90%;
font-size:95%;
}
.mainheader img{
width:100%;
}
.mainheader nav{
height:200px;
}

.mainheader nav ul{
padding-left:0;
align-items: right;
}

.mainheader nav ul li{
width:100%;
text-align:center;
}

.mainheader nav a:link, .mainheader nav a:visited {
padding:10px 25px;
height:20px;
display:block;
}

.maincontent {
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
line-height:25px;

}

.content{
width:100%;
float:left;
margin-top:2%;
}

/*.topcontent{
background-color:#fff;
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
padding:3% 5%;
margin-top:2%;
}*/

}

</style>
  <!--<link rel="stylesheet" href="Untitled2.css" type="text/css"/>-->
 </head>
 <body background="img/collage-2017-02-19(4).jpg">
<header class="mainheader">
 <!-- <img src="img/transparent_text_effect(2).png"/>-->
  <nav>
    <ul>  
        <li><a href='logout.jsp'>Logout</a></li>
 <li><a href="">P+</a></li>
  <li><a href="">Pedi Peri</a></li>
  <li><a href="oio.jsp">OWL</a></li>
  <li><a href="addpatient.jsp">New Patient</a></li>
      
      <li class="active"><a href='home.jsp'>Home</a></li>
    </ul>
  </nav>
 </header> 
  <div class="maincontent">
  <div class="content">
     <article class="topcontent">
	   <header>
	     
             
	   </header>

	   <footer>
         
	   </footer>
     
	 </article>
  </div>
  </div>



 </body>
</html>
<%
    }
%>