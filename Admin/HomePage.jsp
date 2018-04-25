<%-- 
    Document   : HomePage
    Created on : Feb 14, 2018, 2:57:26 PM
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
            <td><a href="../Admin/Approval.jsp">Approve Students||</a></td
               <td><a href="../Admin/companyApproval.jsp">Approve Companies||</a></td>
               <td><a href="../Admin/AreaInterest.jsp">Add Interest||</a></td>
              
        </tr>
        </table>
    </body>
</html>

