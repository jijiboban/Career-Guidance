<%-- 
    Document   : stream
    Created on : Feb 26, 2018, 7:15:00 PM
    Author     : jiji
--%>



<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String streamId = "", streamName = "", qualId = "", qualName = "",duration="";
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String name = request.getParameter("txtname");
                
                String du = request.getParameter("duration");
                String upQry = "update tbl_stream set stream_name ='" + name + "',qualtype_id='"+request.getParameter("qualId")+"',duration='"+ du +"' where stream_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("stream.jsp");
                } else 
                {
                    out.println(upQry);
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
//               
                String Uid = request.getParameter("qualId");
                String Udu = request.getParameter("duration");
                String insQuery = "insert into tbl_stream(stream_name,qualtype_id,duration) values ('" + Uname + "','" + Uid + "','" + Udu + "')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) 
                {
//                    out.println("success");
                } else 
                {
                    out.println(insQuery);
                }

            }
        }
            if (request.getParameter("did") != null) 
            {
                String del = "delete from tbl_stream where stream_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("stream.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_stream u inner join tbl_qualtype c on u.qualtype_id=c.qualtype_id where u.stream_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = c.selectCommand(selq);

                while (rs2.next()) 
                {
                   streamId = rs2.getString("stream_id");
                    streamName = rs2.getString("stream_name");
                    qualName = rs2.getString("qualtype_id");
                   duration = rs2.getString("duration");
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">Stream</h1>
        <input type="hidden" name="hid" value="<%=streamId%>"/>
            <table align="center">
                
                
                <tr>
                    <td>
                        Qualification Type
                    </td>
                    <td>
                        <select name="qualId">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_qualtype";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                             %>
                            <option value="<%=rs.getString("qualtype_id")%>"  <% if(qualName.equals(rs.getString("qualtype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("qualtype_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td> Stream</td>
                <td><input type="text" name="txtname" value="<%=streamName%>" /></td>
                </tr>
                <tr>
                <td> Duration</td>
                <td><input type="text" name="duration" value="<%=duration%>" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                
               
                <th>Qualification Type</th>
                <th>Stream</th>
                <th>Duration</th>
                <%
                    int i = 1;
                    String sel1 = "select * from tbl_stream u, tbl_qualtype c where u.qualtype_id=c.qualtype_id";
                    ResultSet rs1 = c.selectCommand(sel1);
                    while (rs1.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    
                   
                 
                    <td><%=rs1.getString("qualtype_name")%></td>
                       <td><%=rs1.getString("stream_name")%></td>
                        <td><%=rs1.getString("duration")%></td>
                    <td><a href="stream.jsp?eid=<%=rs1.getString("stream_id")%>">EDIT</a></td><br>
                 
                     <td><a href="stream.jsp?did=<%=rs1.getString("stream_id")%>">Delete</a></td>

                    
                       

                    


                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
