<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="c" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String id1=request.getParameter("id");
                            String str="select * from tbl_course where coursetype_id ="+id1;
                            System.out.println("Select course: "+str);
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
