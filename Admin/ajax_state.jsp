<%-- 
    Document   : ajax_state
    Created on : Feb 22, 2018, 10:15:41 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String id=request.getParameter("id");
                            String str="select * from tbl_state where district_id="+id;
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("state_id")%>">
                               <%=rs.getString("state_name")%>
                           </option>
                            <%
                            }
                            %>