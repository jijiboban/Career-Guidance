<%-- 
    Document   : jobcategory
    Created on : Feb 7, 2018, 2:39:28 PM
    Author     : jiji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String jobtypeId="",jobtypeName="";
        
    if(request.getParameter("btnsubmit")!=null)
    {
        if(!request.getParameter("hid").equals(""))
        {
           String type=request.getParameter("txtjtype");
           String upQuery="update tbl_jobcatogory set jobtype_name='"+type+"' where jobtype_id='"+request.getParameter("hid")+"'";
           boolean b=c.executeCommand(upQuery);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("Jobcategory.jsp");
           }
           else
           {
               out.println("Failed");
           }  
        }  
        else
        {
                 
            String ctype=request.getParameter("txtjtype");
            String insqry="insert into tbl_jobcatogory(jobtype_name) values('"+ctype+"')";
            boolean b=c.executeCommand(insqry);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("Jobcategory.jsp");
           }
           else
           {
               out.println("Failed");
           }
        }
        
    }
    if(request.getParameter("did") != null)
    {
      String del="delete from tbl_jobcatogory where jobtype_id='"+request.getParameter("did")+"'";
      boolean b=c.executeCommand(del);
      response.sendRedirect("Jobcategory.jsp");      
    }
    if(request.getParameter("eid")!= null)
    {
        String selqry="select * from  tbl_jobcatogory where jobtype_id='"+request.getParameter("eid")+"'"; 
       ResultSet rs1=c.selectCommand(selqry);
       while(rs1.next())  
       {
        jobtypeId=rs1.getString("jobtype_id");
        jobtypeName=rs1.getString("jobtype_name");   
          
       } 
    }
       
      
      
        %>
     <body>
        <form method="post">
            <h1 align="center">JOB CATEGORY</h1>
            <input type="hidden" name="hid" value="<%=jobtypeId%>">
            <table align="center">
                <tr>
                    <td>Job Category</td>
                    <td><input type="text" required="" pattern="[A-Za-z]{5,20}"  name="txtjtype" value="<%=jobtypeName%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>
                    
            </table>
            <table border="1" align="center">
                <th>Sl.No</th>  
                <th>Job Category</th>
                  <%
      int i=1;
      String sel="select * from tbl_jobcatogory";
      ResultSet rs=c.selectCommand(sel);
      while(rs.next())
      {    %>
                <tr>
                    <td><%=i%>                 
                    </td>
                    
                        <td><%=rs.getString("jobtype_name")%></td>
                    
                   <td><a href="Jobcategory.jsp?eid=<%=rs.getString("jobtype_id")%>">EDIT</a></td><br>
                     <td><a href="Jobcategory.jsp?did=<%=rs.getString("jobtype_id")%>">Delete</a></td>
                </tr>
                <%
                i++;
                }
      %>
            </table>
                   
               </form>
    </body>
</html>
