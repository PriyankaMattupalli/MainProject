<%-- 
    Document   : registration
    Created on : 10 Feb, 2017, 11:01:17 AM
    Author     : K.SRINIVAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
    </body>
</html>-->

<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String cpwd = request.getParameter("cpass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String college = request.getParameter("colg");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb2", "root", "password");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i=0;
    if(pwd.equals(cpwd))
    {
        try{
       i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, phone, institute) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', '" + phone + "','" + college + "')");
    }
        catch(Exception ex) {
            out.println( "Error: username already exists--> " + ex.getMessage());
        }
    }
    else
    {
       out.println("password and confirm password did not match <a href='reg.jsp'>try again</a>");
    }
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
