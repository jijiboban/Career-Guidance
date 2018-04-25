<%-- 
    Document   : ajax_stream
    Created on : Mar 2, 2018, 11:24:06 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="c" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String qualtypeid=request.getParameter("id");
                            String str="select * from tbl_type where type_id="+qualtypeid;
                            ResultSet rs=c.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("type_id")%>">
                               <%=rs.getString("type_name")%>
                           </option>
                            <%
                            }
                            %>