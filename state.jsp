<%-- 
    Document   : state
    Created on : Feb 21, 2018, 12:20:53 PM
    Author     : jiji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
    <%
        String stateId = "", state = "";

        if (request.getParameter("btnsubmit") != null) {
            if (!request.getParameter("hid").equals("")) {
                String type = request.getParameter("txtstate");
                String upQuery = "update tbl_state set state_name='" + type + "' where state_id='" + request.getParameter("hid") + "'";
                boolean b = c.executeCommand(upQuery);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("state.jsp");
                } else {
                    out.println("Failed");
                }
            } else {

                String ctype = request.getParameter("txtstate");
                String insqry = "insert into tbl_state(state_name) values('" + ctype + "')";
                boolean b = c.executeCommand(insqry);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("state.jsp");
                } else {
                    out.println("Failed");
                }
            }

        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_state where state_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("state.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selqry = "select * from  tbl_state where state_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = c.selectCommand(selqry);
            while (rs1.next()) {
                stateId = rs1.getString("state_id");
                state = rs1.getString("state_name");

            }
        }


    %>
    <body>
        <form method="post">
            <h1 align="center">STATE</h1>
            <input type="hidden" name="hid" value="<%=stateId%>">
            <table align="center">
                <tr>
                    <td>STATE</td>
                    <td><input type="text" name="txtstate" value="<%=state%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>

            </table>
            <table border="1" align="center">
                <th>Sl.No</th>  
                <th>State</th>
                    <%
                        int i = 1;
                        String sel = "select * from tbl_state";
                        ResultSet rs = c.selectCommand(sel);
                        while (rs.next()) {%>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("state_name")%></td>

                    <td><a href="state.jsp?eid=<%=rs.getString("state_id")%>">EDIT</a></td><br>
                <td><a href="state.jsp?did=<%=rs.getString("state_id")%>">Delete</a></td>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

        </form>
    </body>
</html>
