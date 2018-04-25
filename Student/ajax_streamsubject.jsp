<%-- 
    Document   : ajax_subject
    Created on : Mar 2, 2018, 11:24:23 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="c" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    //String stateid=request.getParameter("sid");
       String streamid=request.getParameter("did");
                            String str="select * from tbl_course where type_id="+streamid+"";
                            ResultSet rs=c.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("course_id")%>">
                               <%=rs.getString("course_name")%>
                           </option>
                            <%
                            }
                            %>