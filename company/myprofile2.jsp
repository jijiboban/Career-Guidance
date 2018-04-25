<%-- 
    Document   : myprofile2
    Created on : Feb 28, 2018, 9:34:26 PM
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
        
        <form>
                   <table align="center" border="1">
      <%
          
        
        String Sel1="select * from tbl_companies s ,tbl_job j where s.company_id=j.company_id and j.company_id='"+session.getAttribute("companyid") +"'";
                    ResultSet rs=c.selectCommand(Sel1);
                     while(rs.next())
                     {
                     %>
                     <tr>
                     <th>Name:</th>
                     <td><%=rs.getString("company_name")%></td>
                     </tr>
                     
                     <tr>
                          <th>Address:</th>
                           <td><%=rs.getString("company_place")%></td>
                     </tr>
                     
                     <tr>
                         <th>Contact:</th>
                         <td><%=rs.getString("company_contact")%></td>
                     </tr>
                     
                     <tr>
                         <th>Email:</th>
                          <td><%=rs.getString("company_mail")%></td>
                     </tr>
                     
                   
                   
                   <tr>
                      
                   <td colspan="2" align="center"><img style="width: 100px ; height: 100px " src="../company/Photo/<%=rs.getString("photo")%>"></td>
                   </tr>
                   
                  <%
                              
                                  }
                  %>
       
                   </table>
                   <a href="../company/companyHome.jsp">My Home</a>
    </form>
       
    </body>
</html>

