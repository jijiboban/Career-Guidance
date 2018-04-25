<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="c" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String cid=request.getParameter("id");
                            String str="select * from tbl_university where country_id="+cid;
                            ResultSet rs=c.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("university_id")%>">
                               <%=rs.getString("university_name")%>
                           </option>
                            <%
                            }
                            %>
