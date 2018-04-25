<%-- 
    Document   : streamsubject
    Created on : Feb 26, 2018, 8:32:34 PM
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
        String streamId = "", streamName = "", streamsubjectId = "", streamsubjectName = "";
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String name = request.getParameter("txtname");
//                String du = request.getParameter("txtdu");

                String upQry = "update tbl_streamsubject set streamsubject_name ='" + name + "',stream_id='"+request.getParameter("streamId")+"' where streamsubject_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("streamsubject.jsp");
                } else 
                {
                    out.println(upQry);
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
//                String Udu = request.getParameter("txtdu");
//               
                String Uid = request.getParameter("streamId");

                String insQuery = "insert into tbl_streamsubject(streamsubject_name,stream_id) values ('" + Uname + "','" + Uid + "')";
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
                String del = "delete from tbl_streamsubject where streamsubject_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("streamsubject.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_streamsubject u inner join tbl_stream c on u.stream_id=c.stream_id where u.streamsubject_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = c.selectCommand(selq);

                while (rs2.next()) 
                {
                   streamsubjectId = rs2.getString("streamsubject_id");
                    streamsubjectName = rs2.getString("streamsubject_name");
                    streamName = rs2.getString("stream_id");
//                    duration=rs2.getString("duration");
                   
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">Stream Subject</h1>
        <input type="hidden" name="hid" value="<%=streamsubjectId%>"/>
            <table align="center">
                
                
                <tr>
                    <td>
                        Stream
                    </td>
                    <td>
                        <select name="streamId">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_stream";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                             %>
                            <option value="<%=rs.getString("stream_id")%>"  <% if(streamName.equals(rs.getString("stream_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("stream_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td> Stream Subject</td>
                <td><input type="text" name="txtname" value="<%=streamsubjectName%>" /></td>
                </tr>
                <tr>
               
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                
               
                <th>Stream </th>
                <th>Stream Subject</th>
                
                <%
                    int i = 1;
                    String sel1 = "select * from tbl_streamsubject u, tbl_stream c where u.stream_id=c.stream_id";
                    ResultSet rs1 = c.selectCommand(sel1);
                    while (rs1.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    
                   
                 
                    <td><%=rs1.getString("stream_name")%></td>
                       <td><%=rs1.getString("streamsubject_name")%></td>
                      
                    <td><a href="streamsubject.jsp?eid=<%=rs1.getString("streamsubject_id")%>">EDIT</a></td><br>
                 
                     <td><a href="streamsubject.jsp?did=<%=rs1.getString("streamsubject_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
