<%-- 
    Document   : companyregistration
    Created on : Feb 15, 2018, 12:08:08 PM
    Author     : jiji
--%>

<%@include  file="header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script>
            function passcheck()
            {
                var a=document.getElementById("p1").value;
                 var b=document.getElementById("p2").value;
                 if(a==b)
                 {
                     return true;                       

                 }
                else
                {
                    alert("Password doesnt Match..!!");
                    document.getElementById("p1").focus();
                    return false;
                }
            }
            </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

   
   <body>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-6">
                
        <form method="post" action="CompanyUpload.jsp" method="post" enctype="multipart/form-data"  class="form-group">
            <h1 align="center">COMPANY REGISTRATION</h1>
           
            <table align="center" class="table table-hover">
            <tr>
                <td>Name:</td>
                <td><input type="text" name="txtstudname" class="form-control"  required="" pattern="[A-Za-z]{5,20}" ></td>
            </tr>
            <tr>
                <td>Address :</td>
                <td><textarea name="txtquery" name="txtaddress" class="form-control"  required="" pattern="[A-Za-z]{5,20}" ></textarea></td>
            </tr>
           
            <tr>
                <td>Email </td>
                <td><input type="email" name="txtemail" class="form-control"  required=""></td>
            </tr>  
             <tr>
                <td>Contact Number :</td>
                <td><input type="number" name="txtcontact" required="" pattern="[0-9]{10,13}" ></td>
            </tr>
              <tr>
                <td>User name</td>
                <td><input type="text"  name="txtloginuname" required="" pattern="[A-Za-z]{5,20}" ></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="p1" name="txtloginpassword" required="" pattern="[A-Za-z1-9]{5,20}" /></td>
            </tr>
             <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" id="p2" name="txtloginpassword1" required="" pattern="[A-Za-z1-9]{5,20}" /></td>
                </tr>
                <tr>
                <td>Upload Photo </td>
                <td><input type="file" name="txtphoto" required=""></td>
            </tr>
                
                  <tr>
                    <td align="center"> <input type="submit" class="btn btn-success" value="REGISTER" name="btnstudsubmit" onclick="return passcheck()">
                    <input type="reset" class="btn btn-danger" value="CANCEL" name="btnstudsubmit"/></td>
                </tr>
                
            </table>
            
           
            
            
        </form>

</body>
</html>