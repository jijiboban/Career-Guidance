<%-- 
    Document   : companyApproval
    Created on : Feb 28, 2018, 8:11:38 PM
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
              String mails="select *  from tbl_companies where company_id='"+request.getParameter("aid")+"'";
           ResultSet rm=obj.selectCommand(mails);
              if(rm.next())
              {
                  too=rm.getString("company_mail");
                  //pass=rm.getString("passWord");
                  
              }
             String to[]={too};
              
             
              
             boolean bo=ma.sendMail(to, "Registration Approved...!!!!!", "Please Login to continue ....");
            
            out.println(request.getParameter("aid"));
          String del="update  tbl_companies set approval=1 where company_id='"+request.getParameter("aid")+"'";
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
              
              
              
              response.sendRedirect("companyApproval.jsp");
         }
              
     if(request.getParameter("did")!=null)
        {
//          
           String mails="select *  from tbl_companies where company_id='"+request.getParameter("did")+"'";
           ResultSet rm=obj.selectCommand(mails);
              if(rm.next())
              {
                  too=rm.getString("company_mail");
                  //pass=rm.getString("passWord");
                  
              }
             String to[]={too};
              
             
              
             boolean bo=ma.sendMail(to, "Sorry....Your Registration Is Rejected...!!!!!", "Please Try Again ....");
            if(bo==true)
            {
            out.println(request.getParameter("aid"));
          String del="update  tbl_companies set approval=2 where company_id='"+request.getParameter("did")+"'";
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
              
              
              
              response.sendRedirect("companyApproval.jsp");
         }
         %> 
        <h1 align="center">APPROVAL </h1>
          <form name="adminapprove" method="post">
            <table border="1" align="center" >
                 <tr><th>Sl.No</th>
                     <th>Company Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                   
                    
                    <th>Email</th>
                    
                    <th>Logo</th>
               <%int i=1;
                String sel="select * from tbl_companies where approval=0";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td>
                        <%=rs.getString("company_name")%>
                    </td>
                    <td><%=rs.getString("company_contact")%></td> 
                    <td><%=rs.getString("company_place")%></td> 
                    
                    
                     
                    <td><%=rs.getString("company_mail")%></td> 
                                        <td ><img style="width: 100px ; height: 100px " src="../company/Photo/<%=rs.getString("photo")%>"></td>

                    <td><a href="companyApproval.jsp?aid=<%=rs.getString("company_id")%>">APPROVE</a></td><br>
                 <td><a href="companyApproval.jsp?did=<%=rs.getString("company_id")%>">REJECT</td>
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
          </form>
    </body>
</html>