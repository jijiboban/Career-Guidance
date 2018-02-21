<%-- 
    Document   : CourseType
    Created on : Feb 7, 2018, 11:41:47 AM
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
        String ctypeId="",ctypeName="";
        
    if(request.getParameter("btnsubmit")!=null)
    {
        if(!request.getParameter("hid").equals(""))
        {
           String type=request.getParameter("txtctype");
           String upQuery="update tbl_coursetype set coursetype_name='"+type+"' where coursetype_id='"+request.getParameter("hid")+"'";
           boolean b=c.executeCommand(upQuery);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("CourseType.jsp");
           }
           else
           {
               out.println("Failed");
           }  
        }  
        else
        {
                 
            String ctype=request.getParameter("txtctype");
            String insqry="insert into tbl_coursetype(coursetype_name) values('"+ctype+"')";
            boolean b=c.executeCommand(insqry);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("CourseType.jsp");
           }
           else
           {
               out.println("Failed");
           }
        }
        
    }
    if(request.getParameter("did") != null)
    {
      String del="delete from tbl_coursetype where coursetype_id='"+request.getParameter("did")+"'";
      boolean b=c.executeCommand(del);
      response.sendRedirect("CourseType.jsp");      
    }
    if(request.getParameter("eid")!= null)
    {
        String selqry="select * from  tbl_coursetype where coursetype_id='"+request.getParameter("eid")+"'"; 
       ResultSet rs1=c.selectCommand(selqry);
       while(rs1.next())  
       {
        ctypeId=rs1.getString("coursetype_id");
        ctypeName=rs1.getString("coursetype_name");   
          
       } 
    }
       
      
      
        %>
     <body>
        <form method="post">
            <h1>Course Type</h1>
            <input type="hidden" name="hid" value="<%=ctypeId%>">
            <table>
                <tr>
                    <td>Course Type</td>
                    <td><input type="text" name="txtctype" value="<%=ctypeName%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>
                    
            </table>
            <table border="1" align=center">
                <th>Sl.No</th>  
                <th>Course Type</th>
                  <%
      int i=1;
      String sel="select * from tbl_coursetype";
      ResultSet rs=c.selectCommand(sel);
      while(rs.next())
      {    %>
                <tr>
                    <td><%=i%>                 
                    </td>
                    
                        <td><%=rs.getString("coursetype_name")%></td>
                    
                   <td><a href="CourseType.jsp?eid=<%=rs.getString("coursetype_id")%>">EDIT</a></td><br>
                     <td><a href="CourseType.jsp?did=<%=rs.getString("coursetype_id")%>">Delete</a></td>
                </tr>
                <%
                i++;
                }
      %>
            </table>
                   
               </form>
    </body>
</html>
