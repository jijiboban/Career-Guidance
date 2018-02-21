 
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String id=request.getParameter("id");
                            String str="select * from district where state_id="+id;
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("did")%>">
                               <%=rs.getString("dis_name")%>
                           </option>
                            <%
                            }
                            %>