<%-- 
    Document   : companyregistration
    Created on : Feb 15, 2018, 12:08:08 PM
    Author     : jiji
--%>


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

    <%
         String login="";
        if (request.getParameter("btnstudsubmit") != null) 
        {
            String companyName = request.getParameter("txtstudname");
            String address = request.getParameter("txtaddress");
            String contact = request.getParameter("txtcontact");
            String email = request.getParameter("txtemail");
           
           
            String companyUname = request.getParameter("txtloginuname");
            String companyPassword = request.getParameter("txtloginpassword");
            String insQuery2 = "insert into tbl_login(username,password,utype) values('" + companyUname + "','" + companyPassword + "','4')";
              boolean b = c.executeCommand(insQuery2);
               if (b == true) 
               {
             String str="select max(login_id) as loginid from tbl_login";
            ResultSet rs=c.selectCommand(str);
            if(rs.next())
                {
                    login=rs.getString("loginid");
                    
                }

            String insQuery1 = "insert into tbl_companies(company_name,company_place,company_contact,company_mail,approval,login_id) values ('" + companyName + "','" + address + "','" + contact + "','" + email + "','0','"+login+"')";
            
                c.executeCommand(insQuery1);
                response.sendRedirect("companyregistration.jsp");
            } 
            }

        


    %>


    <body>
        <h1 align="center">COMPANY REGISTRATION</h1>
        <form method="post">
        <table align="center">
            <tr>
                <td>Name:</td>
                <td><input type="text" name="txtstudname"></td>
            </tr>
            <tr>
                <td>Address :</td>
                <td><input type="text" name="txtaddress" ></td>
            </tr>
            <tr>
                <td>Contact Number :</td>
                <td><input type="number" name="txtcontact"></td>
            </tr>
            <tr>
                <td>Email </td>
                <td><input type="email" name="txtemail"></td>
            </tr>           
              <tr>
                <td>User name</td>
                <td><input type="text"  name="txtloginuname"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="p1" name="txtloginpassword"/></td>
            </tr>
             <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" id="p2" name="txtloginpassword1"/></td>
                </tr>
                
                  <tr>
                    <td align="center"> <input type="submit"  name="btnstudsubmit" onclick="return passcheck()">
                    <input type="reset" name="btnstudsubmit"/></td>
                </tr>
                
            </table>
            
           
            
            
        </form>

</body>
</html>