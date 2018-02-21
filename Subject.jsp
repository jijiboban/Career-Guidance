<%-- 
    Document   : Subject
    Created on : Feb 7, 2018, 3:09:18 PM
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
        String sId="",subject="";
        
    if(request.getParameter("btnsubmit")!=null)
    {
        if(!request.getParameter("hid").equals(""))
        {
           String type=request.getParameter("txtsubject");
           String upQuery="update tbl_subject set sub_name='"+type+"' where sub_id='"+request.getParameter("hid")+"'";
           boolean b=c.executeCommand(upQuery);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("Subject.jsp");
           }
           else
           {
               out.println("Failed");
           }  
        }  
        else
        {
                 
            String ctype=request.getParameter("txtsubject");
            String insqry="insert into tbl_subject(sub_name) values('"+ctype+"')";
            boolean b=c.executeCommand(insqry);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("Subject.jsp");
           }
           else
           {
               out.println("Failed");
           }
        }
        
    }
    if(request.getParameter("did") != null)
    {
      String del="delete from tbl_subject where sub_id='"+request.getParameter("did")+"'";
      boolean b=c.executeCommand(del);
      response.sendRedirect("Subject.jsp");      
    }
    if(request.getParameter("eid")!= null)
    {
        String selqry="select * from  tbl_subject where sub_id='"+request.getParameter("eid")+"'"; 
       ResultSet rs1=c.selectCommand(selqry);
       while(rs1.next())  
       {
        sId=rs1.getString("sub_id");
        subject=rs1.getString("sub_name");   
          
       } 
    }
       
      
      
        %>
     <body>
        <form method="post">
            <h1 align="center">SUBJECT</h1>
            <input type="hidden" name="hid" value="<%=sId%>">
            <table align="center">
                <tr>
                    <td>Subject</td>
                    <td><input type="text" name="txtsubject" value="<%=subject%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>
                    
            </table>
                
            <table border="1" align="center">
                <th>Sl.No</th>  
                <th>Subject</th>
                  <%
      int i=1;
      String sel="select * from tbl_subject";
      ResultSet rs=c.selectCommand(sel);
      while(rs.next())
      {    %>
                <tr>
                    <td><%=i%>                 
                    </td>
                    
                        <td><%=rs.getString("sub_name")%></td>
                    
                   <td><a href="Subject.jsp?eid=<%=rs.getString("sub_id")%>">EDIT</a></td><br>
                     <td><a href="Subject.jsp?did=<%=rs.getString("sub_id")%>">Delete</a></td>
                </tr>
                <%
                i++;
                }
      %>
            </table>
                   
               </form>
    </body>
</html>
