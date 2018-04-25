<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="c" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String stateid=request.getParameter("id");
                            String str="select * from tbl_district where state_id="+stateid;
                            ResultSet rs=c.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("district_id")%>">
                               <%=rs.getString("district_name")%>
                           </option>
                            <%
                            }
                            %>
