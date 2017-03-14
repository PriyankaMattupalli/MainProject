<%-- 
    Document   : patientinsertion
    Created on : 10 Feb, 2017, 9:11:49 PM
    Author     : K.SRINIVAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String mrno = request.getParameter("mrno");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");   
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb2", "root", "password");
    Statement st = con.createStatement();
    out.println("<h1>connected</h1>");
    //ResultSet rs;
    int i=0;
    try{
       i = st.executeUpdate("insert into patients(mrnumber,firstname, lastname, gender, dob, email, phone, address) values ('" + mrno + "' ,'" + fname + "','" + lname + "','" + gender + "','"+dob+"','" + email + "','" + phone + "','" + address + "')");
    out.println("<h1>query executed</h1>");
    }
        catch(Exception ex) {
            out.println( "Error: " + ex.getMessage());
        }
    
   
    if (i > 0) {
        
         //out.println("<h1>into success</h1>");
        response.sendRedirect("patientadded.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
      //   out.println("<h1>into new patient</h1>");
      session.setAttribute("error", "failure");
      response.sendRedirect("addpatient.jsp");
    }
%>
