<%-- 
    Document   : applyjob
    Created on : Mar 20, 2018, 2:30:06 PM
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
                  
     
            <table>
        
        <%
        
//         out.print(session.getAttribute("jobid"));
        
        String Sel1="select * from tbl_companies c inner join tbl_job j on c.company_id=j.company_id where j.job_id='"+session.getAttribute("jobid")+"'";
        ResultSet rs=c.selectCommand(Sel1);
        while(rs.next())
                     {
                         
                        
                     %>
                  
         
       
        
                     <tr>
                     <th>Name  :</th>
                     <td><%=rs.getString("company_name")%></td>
                     </tr>
                     
                     <tr>
                          <th>Address  :</th>
                       <td><%=rs.getString("company_place")%></td>
                     </tr>
                     
                     <tr>
                         <th>Contact  :</th>
               <td><%=rs.getString("company_contact")%></td>          
                     </tr>
                     
                     <tr>
                         <th>Email   :</th>
                           <td><%=rs.getString("company_mail")%></td>
                     </tr>
                     <tr>
                         <th>Minimum Qualification   :</th>
                         <td><%=rs.getString("min_qual")%></td>
                     </tr>
                     <tr>
                         <th>Salary   :</th>
                         <td><%=rs.getString("salary")%></td>
                     </tr>
                     <tr>
                         <th>Experience  :</th>
                      <td><%=rs.getString("exp")%></td>
                     </tr>
                     <%
                     }
                         %>
                         <tr>
                         <td>Please Send your Resume to our Email...... </td>
                         </tr>
            </table>  
                   
                
       
                   
                   
    </form>
       
    </body>
</html>

