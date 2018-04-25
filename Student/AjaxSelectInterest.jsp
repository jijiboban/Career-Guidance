<%-- 
    Document   : AjaxSelectInterest
    Created on : Apr 19, 2018, 11:25:48 AM
    Author     : jiji
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
    <option>--select--</option>
<%
    
    String id=request.getParameter("id");
    String sel="select cct.coursetype_id,coursetype_name from tbl_coursetype ct inner join tbl_classcoursetype cct on ct.coursetype_id=cct.coursetype_id where class_id="+id;
    System.out.println(sel);
    ResultSet rs=obj.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("coursetype_id")%>"><%=rs.getString("coursetype_name")%></option>
        <%
        
    }
    
%>
