<%-- 
    Document   : owl
    Created on : 21 Feb, 2017, 6:26:49 AM
    Author     : K.SRINIVAS
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<h1>You are not logged in</h1><br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owl</title>
         <link rel="stylesheet" type="text/css" href="responsiveform.css">
        <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="responsiveform1.css" />
        <link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="responsiveform2.css" />
        <link rel="stylesheet" media="screen and (max-width: 350px)" href="responsiveform3.css" />
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
margin: 10px 0 0px 10%;
padding:10px 0;
border: 2px white;
border-radius:10px;
}
</style>
    </head>
    <body background="img/collage-2017-02-19(4).jpg">
       <img src="img/transparent_text_effect(2).png" width="950px"/>
        <%String d=request.getParameter("date");
        String d1=d+"%";%>
       <div class="menu">
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
            <form method="post" action="sync1.jsp" style="background-color:#ccccb3">
                <input type="hidden" value="hi" name="hide"/>
                <table width="70%" cellpadding="5" border="1" style="margin-left:30px ">
                <thead>
                <th colspan="6">uploaded files</th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                <center> <b> Mr-number </b> </center>
                        </td>
                       <td>
                <center> <b> Test-number </b> </center>
                        </td>
                        <td>
                <center> <b> Test-time </b> </center>
                        </td>
                        <td>
                <center> <b> left image </b> </center>
                        </td>
                        <td>
                <center> <b> right image </b> </center>
                        </td>  
                        <td>
                <center> <b> Sync </b> </center>
                        </td>   
                        
                    </tr>
                    <%Class.forName("com.mysql.jdbc.Driver");
                    String clientipAddress = request.getParameter("ipaddress");
                    session.setAttribute("ipaddr",clientipAddress);
                   /* if (clientipAddress == null) {
	            clientipAddress = request.getRemoteAddr();
                    }*/
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root", "password");
    Statement st = con.createStatement();
   
    out.println("<br><h3><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: "+d);
    session.setAttribute("t",d);
   // String s = "select * from oiolocal where currentdate like '"+ d +"' group by mrnumber";
   String s = "select distinct(mrnumber),testnumber,TIME_FORMAT(currentdate, '%h:%i %p') testtime,sno,leftimage,rightimage,flag from db1.oiolocal where currentdate like '"+ d1 +"' group by mrnumber,testnumber";
   ResultSet rs = st.executeQuery(s);
    if(!rs.isBeforeFirst())
    {%>
                    <tr>
                        <td colspan="6"><center><% out.print("no files"); %></center></td>
                    </tr>
                     <%
    }

    while(rs.next())
    {
                    %>
                    
                    <tr>
           
                <td><input type="checkbox" name="voucher"
                    value=<%= rs.getString("mrnumber")+"-"+rs.getString("testnumber") %> /><% out.println(rs.getString("mrnumber")); %></td>         
                        <td><center><% out.print(rs.getString("testnumber")); %></center></td>        
                        <td><center><% out.print(rs.getString("testtime")); %></center></td>
                        <td><center> <a href="showphoto?id=<% out.print(rs.getInt("sno")); %>">view </a> </center></td>
                        <td><center> <a href="showrightphoto?id=<% out.print(rs.getInt("sno")); %>">view </a> </center></td>
                        <td><center><% out.print(rs.getInt("flag")); %></center></td>
                    </tr>
                    <%
                    }
                    %>
                     </tbody>
            </table>
                     
                     <br><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Sync" id="submit"/>
            </form>
    </div>
       
        
    </body>
</html>
<%}%>