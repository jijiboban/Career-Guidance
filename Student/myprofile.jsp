<%-- 
    Document   : myprofile
    Created on : Feb 28, 2018, 8:45:16 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <form >
            
                   <table align="center" border="1">
      <%
          
        
        String Sel1="select * from tbl_studreg s inner join tbl_login l on s.login_id=l.login_id where s.stud_id='"+session.getAttribute("user_id") +"'";
                    ResultSet rs=c.selectCommand(Sel1);
                     while(rs.next())
                     {
                     %>
                     <tr>
                     <th>Student Name</th>
                     <td><%=rs.getString("stud_name")%></td>
                     </tr>
                     
                     <tr>
                          <th>Address</th>
                           <td><%=rs.getString("stud_adrs")%></td>
                     </tr>
                     
                     <tr>
                         <th>Contact</th>
                         <td><%=rs.getString("stud_contact")%></td>
                     </tr>
                     
                     <tr>
                         <th>Email</th>
                          <td><%=rs.getString("stud_email")%></td>
                     </tr>
                     
                   <tr>
                       <th>Age</th>
                   <td><%=rs.getString("stud_age")%></td>
                   </tr>
                   <tr>
                       <th>Gender</th>
                   <td><%=rs.getString("stud_gender")%></td>
                   </tr>
                   <tr>
                       <th>UserName</th>
                   <td><%=rs.getString("username")%></td>
                   </tr>
                   <tr>
                       <th>Password</th>
                   <td><%=rs.getString("password")%></td>
                   </tr>
                   
                  
                  <%
                              
                                  }
                  %>
       <td><a href="../Student/Studhome.jsp">Home<<</a></td>
                   </table>
    </form>
       
    </body>
</html>

