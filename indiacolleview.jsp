<%-- 
    Document   : collegeview
    Created on : March 22, 2018, 6:50:55 AM
    Author     : Dream
--%>
<%@include  file="header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Colleges</h1>
        <ul class="list-group">
        <%
        
        String str="select * from tbl_colg where country_id ='999'";
        ResultSet rs=c.selectCommand(str);
        while(rs.next())
        {
            %>
            
            <li class="list-group-item">=><a  class="text-primary" href="collegeviewlink.jsp?cid=<%=rs.getString("colg_id")%>"><%=rs.getString("colg_name")%></li></a>
            <%
        }
             
        %>
          </ul>
 
    </body>
</html>
