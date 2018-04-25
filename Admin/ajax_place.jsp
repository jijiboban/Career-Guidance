<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="c" class="db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    //String stateid=request.getParameter("sid");
       String districtid=request.getParameter("did");
                            String str="select * from tbl_place where district_id="+districtid+"";
                            ResultSet rs=c.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("place_id")%>">
                               <%=rs.getString("place_name")%>
                           </option>
                            <%
                            }
                            %>