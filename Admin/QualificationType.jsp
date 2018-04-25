<%-- 
    Document   : QualificationType
    Created on : Feb 7, 2018, 2:55:48 PM
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
        String qId="",qType="";
        
    if(request.getParameter("btnsubmit")!=null)
    {
        if(!request.getParameter("hid").equals(""))
        {
           String type=request.getParameter("txtqualification");
           String upQuery="update tbl_qualtype set qualtype_name='"+type+"' where qualtype_id='"+request.getParameter("hid")+"'";
           boolean b=c.executeCommand(upQuery);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("QualificationType.jsp");
           }
           else
           {
               out.println("Failed");
           }  
        }  
        else
        {
                 
            String ctype=request.getParameter("txtqualification");
            String insqry="insert into tbl_qualtype (qualtype_name) values('"+ctype+"')";
            boolean b=c.executeCommand(insqry);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("QualificationType.jsp");
           }
           else
           {
               out.println("Failed");
           }
        }
        
    }
    if(request.getParameter("did") != null)
    {
      String del="delete from tbl_qualtype where qualtype_id='"+request.getParameter("did")+"'";
      boolean b=c.executeCommand(del);
      response.sendRedirect("QualificationType.jsp");      
    }
    if(request.getParameter("eid")!= null)
    {
        String selqry="select * from  tbl_qualtype where qualtype_id='"+request.getParameter("eid")+"'"; 
       ResultSet rs1=c.selectCommand(selqry);
       while(rs1.next())  
       {
        qId=rs1.getString("qualtype_id");
        qType=rs1.getString("qualtype_name");   
          
       } 
    }
       
      
      
        %>
     <body>
        <form method="post">
            <h1 align="center">QUALIFICATION TYPE</h1>
            <input type="hidden" name="hid" value="<%=qId%>">
            <table align="center">
                <tr>
                    <td>Qualification Type</td>
                    <td><input type="text" required="" pattern="[A-Za-z]{5,20}"  name="txtqualification" value="<%=qType%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>
                    
            </table>
            <table border="1" align="center">
                
                <th>Sl.No</th>  
            <th>Qualification</th>
                  <%
      int i=1;
      String sel="select * from tbl_qualtype";
      ResultSet rs=c.selectCommand(sel);
      while(rs.next())
      {    %>
                <tr>
                    <td><%=i%>                 
                    </td>
                    
                        <td><%=rs.getString("qualtype_name")%></td>
                    
                   <td><a href="QualificationType.jsp?eid=<%=rs.getString("qualtype_id")%>">EDIT</a></td><br>
                     <td><a href="QualificationType.jsp?did=<%=rs.getString("qualtype_id")%>">Delete</a></td>
                </tr>
                <%
                i++;
                }
      %>
            </table>
                   
               </form>
    </body>
</html>
