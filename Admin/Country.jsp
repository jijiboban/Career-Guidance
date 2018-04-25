<%-- 
    Document   : country
    Created on : Feb 7, 2018, 2:11:32 PM
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
        String cId = "", country = "";

        if (request.getParameter("btnsubmit") != null) {
            if (!request.getParameter("hid").equals("")) {
                String type = request.getParameter("txtcountry");
                String upQuery = "update tbl_country set country_name='" + type + "' where country_id='" + request.getParameter("hid") + "'";
                boolean b = c.executeCommand(upQuery);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("Country.jsp");
                } else {
                    out.println("Failed");
                }
            } else {

                String ctype = request.getParameter("txtcountry");
                String insqry = "insert into tbl_country(country_name) values('" + ctype + "')";
                boolean b = c.executeCommand(insqry);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("Country.jsp");
                } else {
                    out.println("Failed");
                }
            }

        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_country where country_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("Country.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selqry = "select * from  tbl_country where country_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = c.selectCommand(selqry);
            while (rs1.next()) {
                cId = rs1.getString("country_id");
                country = rs1.getString("country_name");

            }
        }


    %>
    <body>
        <form method="post">
            <h1 align="center">COUNTRY</h1>
            <input type="hidden" name="hid" value="<%=cId%>">
            <table align="center">
                <tr>
                    <td>Country</td>
                    <td><input type="text" required="" pattern="[A-Za-z]{5,20}"  name="txtcountry" value="<%=country%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>

            </table>
            <table border="1" align="center">
                <th>Sl.No</th>  
                <th>Country</th>
                    <%
                        int i = 1;
                        String sel = "select * from tbl_country";
                        ResultSet rs = c.selectCommand(sel);
                        while (rs.next()) {%>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("country_name")%></td>

                    <td><a href="Country.jsp?eid=<%=rs.getString("country_id")%>">EDIT</a></td><br>
                <td><a href="Country.jsp?did=<%=rs.getString("country_id")%>">Delete</a></td>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

        </form>
    </body>
</html>
