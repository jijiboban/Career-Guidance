<%-- 
    Document   : ajax_checkuname
    Created on : Mar 12, 2018, 2:38:32 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%
    String count="";
String username=request.getParameter("id");
String sel="select count(*) as count from tbl_login where username='"+username+"'";
ResultSet rs=c.selectCommand(sel);
if(rs.next())
{
 count=rs.getString("count"); 
 
}
if (count.equals("0"))
{
    out.println("y");
}
else
{
out.println("n");
}
%>