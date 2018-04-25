<%-- 
    Document   : Approval
    Created on : Feb 14, 2018, 9:47:08 AM
    Author     : jiji
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="ma" class="mail1.mailconnection"></jsp:useBean>

<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 
          
    <body>
            <%
          String too="",pass="";
           if(request.getParameter("aid")!=null)
        {
           
   //String too[]={};
              String mails="select *  from tbl_studreg where stud_id='"+request.getParameter("aid")+"'";
           ResultSet rm=obj.selectCommand(mails);
              if(rm.next())
              {
                  too=rm.getString("stud_email");
                  //pass=rm.getString("passWord");
                  
              }
             String to[]={too};
              
             
              
             boolean bo=ma.sendMail(to, "Registration Approved...!!!!!", "Please Login to continue ....");
            
            out.println(request.getParameter("aid"));
          String del="update  tbl_studreg set approval_status=1 where stud_id='"+request.getParameter("aid")+"'";
          boolean b=obj.executeCommand(del);
//          out.print(del);
          if(b)
          {
                %>
              <script>
                    alert("Registration Approved");
                </script>
               <%
            }
            else
                
            {
               %>
               
              <script>
                    alert("fail");
                </script> 
             <%
          
                   
            }
              
              
              
              response.sendRedirect("Approval.jsp");
         }
              
     if(request.getParameter("did")!=null)
        {
//          
           String mails="select *  from tbl_studreg where stud_id='"+request.getParameter("did")+"'";
           ResultSet rm=obj.selectCommand(mails);
              if(rm.next())
              {
                  too=rm.getString("stud_email");
                  //pass=rm.getString("passWord");
                  
              }
             String to[]={too};
              
             
              
             boolean bo=ma.sendMail(to, "Sorry....Your Registration Is Rejected...!!!!!", "Please Try Again ....");
            if(bo==true)
            {
            out.println(request.getParameter("aid"));
          String del="update  tbl_studreg set approval_status=2 where stud_id='"+request.getParameter("did")+"'";
          boolean b=obj.executeCommand(del);
//          out.print(del);
                %>
              <script>
                    alert("Send mail");
                </script>
               <%
            }
            else
                
            {
               %>
               
              <script>
                    alert("fail");
                </script> 
             <%
            }
                   
             System.out.print(bo);
              
              
              
              response.sendRedirect("Approval.jsp");
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
                    <th>Qualification Type</th>
                   
               <%int i=1;
                String sel="select * from tbl_studreg s,tbl_qualtype q where approval_status=0 and s.qualtype_id=q.qualtype_id";
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
                    <td><%=rs.getString("qualtype_name")%></td> 
                    
                    <td><a href="Approval.jsp?aid=<%=rs.getString("stud_id")%>">APPROVE</a></td><br>
                 <td><a href="Approval.jsp?did=<%=rs.getString("stud_id")%>">REJECT</td>
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
          </form>
    </body>
</html>