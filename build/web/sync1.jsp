<%-- 
    Document   : sync1
    Created on : 23 Feb, 2017, 12:24:10 PM
    Author     : K.SRINIVAS
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Sync</title>
<style>
body{
background-color:#ccccb3;
background-repeat:no-repeat;
background-size:cover;
-webkit-background-size:cover;
-moz-background-size:cover;
-o-background-size:cover;
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
    background-color:#ccccb3;
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
line-height:25px;

}

.content{
    background-color:#ccccb3;
    height:200px;
width:100%;
float:left;
margin-top:2%;
}

.topcontent{
background-color:#ccccb3;
border-radius:5px;
-noz-border-radius:5px;
-webkit-border-radius:5px;
padding:3% 5%;
margin-top:2%;
}

}

</style>
  <!--<link rel="stylesheet" href="Untitled2.css" type="text/css"/>-->
 </head>
 <body background="img/collage-2017-02-19(4).jpg">
<!--<img src="img/transparent_text_effect(2).png" width="950px"/>-->
<div class="maincontent" style="background-color: #ccccb3;width:600px"><br><br>
      <!--<br><h1>&nbsp;&nbsp;Patient added Successfully.</h1>
  &nbsp;&nbsp;&nbsp;&nbsp;Go To Home <a href='home.jsp'>Home</a><br><br>-->
     <%
   String[] mrnos = request.getParameterValues("voucher");
   String s=request.getParameter("date");
   PrintWriter out1= response.getWriter();
   response.setContentType("text/html");
  
   if(mrnos!=null){
   for(int i = 0; i < mrnos.length; i++)
   {
        String mrnotestno = mrnos[i]; //mrnumber-testnumber
       String[] parts = mrnotestno.split("-");
       String mrnumber = parts[0]; // 1234567
       String testnumber = parts[1]; // 1
      try{
       Class.forName("com.mysql.jdbc.Driver");
       Object cli=session.getAttribute("ipaddr");
        String clientipAddress = cli.toString();
               /*     if (clientipAddress == null) {
	            clientipAddress = request.getRemoteAddr();
                    }    */
       Connection con1 = DriverManager.getConnection("jdbc:mysql://"+clientipAddress+":3306/db1", "root", "password");
       out.println("<h1>client connected</h1>");
       Statement st1 = con1.createStatement();
    
       Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb2", "root", "password");
       out.println("<h1>server connected</h1>");
       Statement st = con2.createStatement();
       Object t=session.getAttribute("t"); 
       String t1=t.toString();
       String t2=t1+"%";
    
        String path=getServletContext().getRealPath("/");

    File f=new File(path + File.separator + "images");
    if(!f.exists())f.mkdir();
     // String datepath=path+"/images";
    File datefile=new File(f.getAbsolutePath()+File.separator +t1);
    if(!datefile.exists())datefile.mkdir();
    
    File mrnofile=new File(datefile.getAbsolutePath()+File.separator +mrnumber);
    if(!mrnofile.exists())mrnofile.mkdir();
    
    File testfile=new File(mrnofile.getAbsolutePath()+File.separator +mrnumber+"_"+testnumber);
    if(!testfile.exists())testfile.mkdir();
        String query = "SELECT mrnumber,testnumber,currentdate,leftimage,rightimage,flag FROM db1.owllocal WHERE mrnumber= '"+ mrnumber +"' and testnumber='"+testnumber+"' and currentdate like '"+t2+"'";
   
         ResultSet rs= st1.executeQuery(query);
       if(!rs.isBeforeFirst())
       {
          out.print("no files");
       }
       int c1=1;
       int c2=1;
      while(rs.next())
       {
          try
          {
            String s1=rs.getString("mrnumber");
            String tn=rs.getString("testnumber");
            String d=t1; 
             
            File lefteyefile=new File(testfile.getAbsolutePath()+File.separator +"left_eye");
             if(!lefteyefile.exists())lefteyefile.mkdir();
          
             Blob b1=rs.getBlob("leftimage");           
            byte buf[] = b1.getBytes(1,(int)b1.length());
         
          File savedFile =new File(lefteyefile.getAbsolutePath()+File.separator+"leftimage_"+Integer.toString(c1)+".jpg");
          FileOutputStream fos=new FileOutputStream(savedFile);                  
          fos.write(buf);
          
          fos.flush();
          fos.close();
          c1++;
          
           
           File righteyefile=new File(testfile.getAbsolutePath()+File.separator +"right_eye");
          if(!righteyefile.exists())righteyefile.mkdir();
          
          Blob b2=rs.getBlob("rightimage");
          byte buf1[] = b2.getBytes(1,(int)b2.length());
         
          File savedFile1 =new File(righteyefile.getAbsolutePath()+File.separator+"rightimage_"+Integer.toString(c2)+".jpg");
          FileOutputStream fos1=new FileOutputStream(savedFile1);
   
          fos1.write(buf1);
          
          fos1.flush();
          fos1.close();
          c2++;
            String p1=savedFile.getPath();
          String p2=savedFile1.getPath();      
            
          String q="insert into owlmain(mrnumber,testnumber,testdate,leftimagepath,rightimagepath,flag) values('"+s1+"','"+tn+"','"+d+"','"+p1+"','"+p2+"',1)";
       
            
            PreparedStatement ps = con2.prepareStatement("insert into oiomain1(mrnumber,currentdate,leftimage,rightimage,flag) values('"+s1+"','"+d+"',?,?,0)");
            ps.setBinaryStream(1, b1.getBinaryStream(), (int) b1.length());
            ps.setBinaryStream(2, b2.getBinaryStream(), (int) b2.length());           
            // String q="insert into mydb2.oiomain1 (mrnumber,currentdate,leftimage,rightimage,flag) values('"+s1+"','"+d+"','"+b1+"','"+b2+"',0)";
            int j=ps.executeUpdate();
             int k=st.executeUpdate(q);
            if(j>0)
            {
               out.println("inserted");
            }
             if(k>0)
          {
              out.println("<h1>Done!!!</h1>");
          }
          
          }
          catch(Exception e)
          {
             out.println("error-------->"+e.getMessage());
          }
        }
        out.println("inserted row with mrno value = "+mrnos[i]); 
     }
     catch(Exception ex)
     {
        out.println( "Error --> " + ex.getMessage());
     }      
   }
   }
 %>
    <br><br>
  </div>



 </body>
</html>