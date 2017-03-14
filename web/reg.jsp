<%-- 
    Document   : reg
    Created on : 10 Feb, 2017, 10:59:32 AM
    Author     : K.SRINIVAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration</title>
       
         <link rel="stylesheet" type="text/css" href="responsiveform.css">
        <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="responsiveform1.css" />
        <link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="responsiveform2.css" />
        <link rel="stylesheet" media="screen and (max-width: 350px)" href="responsiveform3.css" />
     <script tyep="text/javascript">
     function validate()
     {
     var fname=document.form1.fname.value; 
     var lname=document.form1.lname.value; 
     var email=document.form1.email.value; 
     var uname=document.form1.uname.value; 
     var pass=document.form1.pass.value; 
     var cpass=document.form1.cpass.value; 
     var phone=document.form1.phone.value; 
     var colg=document.form1.colg.value; 
     //var status=false;  
     var atposition=email.indexOf("@");  
     var dotposition=email.lastIndexOf(".");  
    if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){  
        document.getElementById("email").innerHTML=" **Please enter a valid e-mail address";  
        return false;  
    }  
    if(pass!=cpass){ 
         document.getElementById("pswd").innerHTML=" **password and confirm password didn't match"; 
      return false;  
    }   
    
    }
    </script>
    <style>
        .body{
                    background-repeat:no-repeat;
background-size:cover;
-webkit-background-size:cover;
-moz-background-size:cover;
-o-background-size:cover;
                }
    </style>
    </head>
    <body background="img/collage-2017-02-19(4).jpg">
       <img src="img/transparent_text_effect(2).png" width="950px"/>
        <div id="envelope">
     <form method="post" name="form1" onsubmit="return validate()" action="registration.jsp" style="background-color:#ccccb3">
            <header>
                <h2>Registration</h2>
                
            </header><br><br>
          
            &nbsp;&nbsp;&nbsp;
            <label>First Name </label><span id="firstname" style="color:red"></span><br>
        <input name="fname" placeholder="eg:srujana" type="text" width="100px" required>
       <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Last Name</label><span id="lastname" style="color:red"></span><br>
        <input name="lname" placeholder="eg:srujana" type="text" width="100px">
       <br>  &nbsp;&nbsp;&nbsp;&nbsp;<label>Email Address</label><span id="email" style="color:red"></span><br>
        <input name="email" placeholder="eg:srujana@gmail.com" type="text" width="100px" required>
        <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>User Name/Login Id</label><span id="username" style="color:red"></span><br>
        <input name="uname" placeholder="eg:srujana" type="text" width="100px" required>
       <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Password</label><span id="pswd" style="color:red"></span><br>
        <input name="pass" placeholder="" type="password" required>
       <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Confirm Password</label><span id="cpswd" style="color:red"></span><br>
        <input name="cpass" placeholder="" type="password" required>
       <br> &nbsp;&nbsp;&nbsp;&nbsp;<label>Phone Number</label><span id="phoneno" style="color:red"></span><br>
        <input name="phone" placeholder="eg:1234567890" type="text" width="100px" pattern="^\d{10}$" required>
        <br>&nbsp;&nbsp;&nbsp;&nbsp;<label>Institute/College/School Name</label><span id="institute" style="color:red"></span><br>
        <input name="colg" placeholder="eg:srujana" type="text" width="100px" required><br>
      
        <input type="submit" value="Register" id="submit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="Reset" id="reset"/><br><br>&nbsp;&nbsp;&nbsp;
        Already registered!! <a href="loginpage.jsp">Login Here</a><br><br>
       
            
        </form>
        </div>
    </body>
</html>
