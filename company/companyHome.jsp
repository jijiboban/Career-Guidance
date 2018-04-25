<%-- 
    Document   : companyHome
    Created on : Feb 21, 2018, 10:17:29 AM
    Author     : jiji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type = "text/javascript" >

            function preventBack() {
                window.history.forward();
            }

            setTimeout("preventBack()", 0);

            window.onunload = function() {
                null
            };

        </script>
    </head>
    <body>
        <table>
        <tr>
        <td><a href="../company/myprofile2.jsp">My Profile</a></td>
               <td><a href="../company/editprofile2.jsp">Edit Profile</a></td>
               <td><a href="../company/changepassword2.jsp">Change Password</a></td>
                         <td><a href="job.jsp">Add Jobs</a></td>
                                   
        </tr>
        </table>
    </body>
</html>
