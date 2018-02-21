<%-- 
    Document   : Approval
    Created on : Feb 14, 2018, 9:47:08 AM
    Author     : jiji
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
           if(request.getParameter("aid")!=null)
        {
          String del="update  tbl_studreg set approval_status=1 where stud_id='"+request.getParameter("aid")+"'";
          boolean b=obj.executeCommand(del);
          if(b==true)
          {
              
              
              
              response.sendRedirect("Approval.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
         if(request.getParameter("did")!=null)
        {
          String del="update  tbl_studreg set approval_status=2 where stud_id='"+request.getParameter("did")+"'";
          boolean b=obj.executeCommand(del);
          if(b)
          {
             
              
             
              
              response.sendRedirect("Approval.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
         %> 
          
    <body>
        <h1 align="center">APPROVAL </h1>
          <form name="adminapprove" method="post">
            <table border="1" align="center" >
                 <tr><th>Sl.No</th>
                     <th>Student Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Gender</th>
                    
                    <th>Email</th>
                   
               <%int i=1;
                String sel="select * from tbl_studreg where approval_status=0";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td>
                        <%=rs.getString("stud_name")%>
                    </td>
                    <td><%=rs.getString("stud_contact")%></td> 
                    <td><%=rs.getString("stud_adrs")%></td> 
                    <td><%=rs.getString("stud_gender")%></td> 
                    
                     
                    <td><%=rs.getString("stud_email")%></td> 
                    
                    <td><a href="Approval.jsp?aid=<%=rs.getString("stud_id")%>">APPROVE</a></td><br>
                 <td><a href="Approval.jsp?did=<%=rs.getString("stud_id")%>">REJECTED</td>
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
          </form>
    </body>
</html>