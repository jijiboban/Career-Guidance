<%-- 
    Document   : AreaInterest
    Created on : Feb 7, 2018, 3:21:30 PM
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
        String iId = "", areainterest = "";

        if (request.getParameter("btnsubmit") != null) {
            if (!request.getParameter("hid").equals("")) {
                String type = request.getParameter("txtainterest");
                String upQuery = "update tbl_areainterest set interest_name='" + type + "' where interest_id='" + request.getParameter("hid") + "'";
                boolean b = c.executeCommand(upQuery);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("AreaInterest.jsp");
                } else {
                    out.println("Failed");
                }
            } else {

                String ctype = request.getParameter("txtainterest");
                String insqry = "insert into tbl_areainterest(interest_name) values('" + ctype + "')";
                boolean b = c.executeCommand(insqry);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("AreaInterest.jsp");
                } else {
                    out.println("Failed");
                }
            }

        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_areainterest where interest_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("AreaInterest.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selqry = "select * from  tbl_areainterest where interest_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = c.selectCommand(selqry);
            while (rs1.next()) {
                iId = rs1.getString("interest_id");
                areainterest = rs1.getString("interest_name");

            }
        }


    %>
    <body>
        <form method="post">
            <h1 align="center">INTERESTING AREA</h1>
            <input type="hidden" name="hid" value="<%=iId%>">
            <table align="center">
                <tr>
                    <td>Interesting Area</td>
                    <td><input type="text" name="txtainterest" value="<%=areainterest%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>

            </table>
            <table border="1" align="center">
                <th>Sl.No</th>  
                <th>Area Of Interesting</th>
                    <%
                        int i = 1;
                        String sel = "select * from tbl_areainterest";
                        ResultSet rs = c.selectCommand(sel);
                        while (rs.next()) {%>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("interest_name")%></td>

                    <td><a href="AreaInterest.jsp?eid=<%=rs.getString("interest_id")%>">EDIT</a></td><br>
                <td><a href="AreaInterest.jsp?did=<%=rs.getString("interest_id")%>">Delete</a></td>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

        </form>
    </body>
</html>
