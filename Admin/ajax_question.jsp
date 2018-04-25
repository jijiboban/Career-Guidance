<%-- 
    Document   : ajax_interest
    Created on : Feb 28, 2018, 12:26:38 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String id=request.getParameter("id");
                            String str="select * from tbl_question where coursetype_id="+id;
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("ques_id")%>">
                               <%=rs.getString("ques_name")%>
                           </option>
                            <%
                            }
                            %>