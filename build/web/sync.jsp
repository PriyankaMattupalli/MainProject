<%-- 
    Document   : sync
    Created on : 21 Feb, 2017, 6:37:20 PM
    Author     : K.SRINIVAS
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   String[] mrnos = request.getParameterValues("voucher");
   String s=request.getParameter("date");
   PrintWriter out1= response.getWriter();
   response.setContentType("text/html");
  
   if(mrnos!=null){
   for(int i = 0; i < mrnos.length; i++)
   {
      try{
       Class.forName("com.mysql.jdbc.Driver");
        String clientipAddress = request.getHeader("X-FORWARDED-FOR");
                    if (clientipAddress == null) {
	            clientipAddress = request.getRemoteAddr();
                    }    
       Connection con1 = DriverManager.getConnection("jdbc:mysql://"+clientipAddress+":3306/db1", "user1", "password");
       out.println("<h1>client connected</h1>");
       Statement st1 = con1.createStatement();
    
       Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb2", "root", "password");
       out.println("<h1>server connected</h1>");
       Statement st = con2.createStatement();
       
       Object t=session.getAttribute("t"); 
       String t1=t.toString();
   
       String query = "SELECT mrnumber,currentdate,leftimage,rightimage,flag FROM db1.oiolocal WHERE mrnumber= '"+ mrnos[i] +"' and currentdate like '"+t1+"'";
       ResultSet rs= st1.executeQuery(query);
       if(!rs.isBeforeFirst())
       {
          out.print("no files");
       }
       while(rs.next())
       {
          try
          {
            String s1=rs.getString("mrnumber");
            String d=t1;       
            Blob b1=rs.getBlob("leftimage");           
            Blob b2=rs.getBlob("rightimage");            
            PreparedStatement ps = con2.prepareStatement("insert into oiomain1(mrnumber,currentdate,leftimage,rightimage,flag) values('"+s1+"','"+d+"',?,?,0)");
            ps.setBinaryStream(1, b1.getBinaryStream(), (int) b1.length());
            ps.setBinaryStream(2, b2.getBinaryStream(), (int) b2.length());           
            // String q="insert into mydb2.oiomain1 (mrnumber,currentdate,leftimage,rightimage,flag) values('"+s1+"','"+d+"','"+b1+"','"+b2+"',0)";
            int j=ps.executeUpdate();
            if(j>0)
            {
               out.println("inserted");
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


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sync Page</title>
    </head>
    <body>
       
    </body>
</html>
