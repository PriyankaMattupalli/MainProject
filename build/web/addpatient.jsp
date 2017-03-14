<%-- 
    Document   : addpatient
    Created on : 21 Feb, 2017, 5:54:31 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddPatient</title>
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

</style>
<script tyep="text/javascript">
     function validate()
     {   
     var email=document.form1.email.value; 
     var mrnumber=document.form1.mrno.value; 
    if(mrnumber.length<7 || mrnumber.length>8){  
     document.getElementById("mrno").innerHTML="  **Invalid MrNumber";  
      return false;  
    }    
     var atposition=email.indexOf("@");  
     var dotposition=email.lastIndexOf(".");  
    if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){  
        document.getElementById("email").innerHTML=" **Please enter a valid e-mail address";  
        return false;  
    }  
    }
    </script>
    </head>
    <body background="img/collage-2017-02-19(4).jpg">
     <!--  <img src="img/transparent_text_effect(2).png" width="950px"/>-->
       <div class="menu">
       <nav>
    <ul>  
        <li><a href='logout.jsp'>Logout</a></li>
 <li><a href="">Pupil+</a></li>
  <li><a href="">Pediatric Perimeter</a></li>
  <li><a href="oio.jsp">Open Indirect Ophthalmoscope</a></li>
  <li class="active"><a href="addpatient.jsp">New Patient</a></li>
      
      <li><a href='home.jsp'>Home</a></li>
    </ul>
  </nav>
       </div>
       
        <div id="envelope">
            <form method="post" name="form1" onsubmit="return validate()" action="patientinsertion.jsp" style="background-color:#ccccb3">
            <header>
                <h2>Patient Information</h2>
                <p></p>
            </header><br>
           &nbsp;&nbsp; <%  
                String t=(String)session.getAttribute("error");
               if(t==null){
                   session.setAttribute("error", "**Enter Details");
               }
           %><font color="red"><%          
                 out.println(t);%></font>
                 <br><br>
              &nbsp;&nbsp;&nbsp;&nbsp;<label>First Name </label><span id="firstname" style="color:red"></span><br>
              <input name="fname" placeholder="eg:srujana" type="text" width="100px" required>
         <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Last Name</label><span id="lastname" style="color:red"></span><br>
        <input name="lname" placeholder="eg:srujana" type="text" width="100px">
		<br> &nbsp;&nbsp;&nbsp;&nbsp;<label>MR Number </label><span id="mrno" style="color:red"></span><br>
        <input name="mrno" placeholder="" type="text" width="100px" required>
        <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Gender </label><span id="gender" style="color:red"></span><br>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="gender" value="male" checked> Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="gender" value="female"> Female<br><br>
		<br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Date of Birth (yyyy-mm-dd) </label><span id="dob" style="color:red"></span><br>
            <input name="dob" placeholder="eg:1996-05-27" type="date" pattern="^([0-9]{4})-([0-9]{2})-([0-9]{2})$" width="100px" required>
      <br>   &nbsp;&nbsp;&nbsp;&nbsp;<label>Email Address</label><span id="email" style="color:red"></span><br>
            <input name="email" placeholder="eg:srujana@gmail.com" type="text" width="100px">
       <br>  &nbsp;&nbsp;&nbsp;&nbsp;<label>Phone Number </label><span id="phoneno" style="color:red"></span><br>
            <input name="phone" placeholder="eg:1234567890" pattern="^\d{10}$" type="text" width="100px" required>
      <br>   &nbsp;&nbsp;&nbsp;&nbsp;<label>Postal Address </label><span id="addr" style="color:red"></span><br>
            <input name="address" placeholder="" type="text" width="100px" required>
      
      <br>  <input type="submit" value="Add" id="submit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="Reset" id="reset"/><br><br>
       
            
        </form>

        </div>
    </body>
</html>
<%}%>
