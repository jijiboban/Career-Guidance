<%-- 
    Document   : Studhome
    Created on : Feb 14, 2018, 8:29:58 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    
    <body>
        <table>
        <tr>
            <td><a href="../Student/myprofile.jsp">My Profile||</a></td
               <td><a href="../Student/editprofile.jsp">Edit Profile||</a></td>
               <td><a href="../Student/changepassword.jsp">Change Password||</a></td>
               <td><a href="../Student/studentQualification.jsp">Qualification Details||</a></td>
               <td><a href="../Student/PostQuery.jsp">Post Query||</a></td>
               <td><a href="../Student/Interest.jsp">Exam</a></td>
                <td><a href="../Student/joblist.jsp">View Job Vacancies</a></td>
        </tr>
        </table>
    </body>
</html>

