<%-- 
    Document   : view
    Created on : 21 Feb, 2017, 6:33:23 PM
    Author     : K.SRINIVAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view file</title>
    </head>
    <body>
        <%
            int sno=Integer.parseInt(request.getParameter("id"));
            out.println("sno : "+sno);
            Blob lfile=null;
           
           // String s = conso Blob rfile=null;
           // String s = console.log(searchParams.get("id"));

           byte[ ] lfileData = null ;
          

            try
            {    
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root", "password");
                out.println("connected");
                String sqlString = "SELECT leftimage FROM oiolocal WHERE sno = '"+sno+"'";
                Statement myStatement = con.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
                
                rs.next();
             
                    out.println("into left");
                    lfile = rs.getBlob("leftimage");
                 //   lfileData = lfile.getBytes(1,(int)lfile.length());
                    
                response.setContentLength( (int) lfile.length());
                 InputStream is = lfile.getBinaryStream();
                  //  out.println("file not found!");
                   // return;
                
               
                
                response.setContentType("application/pdf/image/jpg/docx");
                response.setHeader("Content-Disposition", "inline;filename=" +lfile);
               // response.setContentLength(lfileData.length);
               
                
                OutputStream output = response.getOutputStream();
                
                 byte buf[] = new byte[(int) lfile.length()];
            is.read(buf);
            output.write(buf);
            output.close();
                
                //output.write(lfileData);
               
                
                output.flush();
                
            } catch (SQLException ex) {Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);} 
            
            %>
    </body>
</html>
