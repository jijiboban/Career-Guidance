<%-- 
    Document   : place
    Created on : Feb 21, 2018, 2:42:21 PM
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
        String placeId = "", placeName = "", districtId = "", districtName = "";
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String name = request.getParameter("txtname");

                String upQry = "update tbl_place set place_name ='" + name + "',district_id='"+request.getParameter("districtId")+"' where place_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("place.jsp");
                } else 
                {
                    out.println(upQry);
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
//               
                String Uid = request.getParameter("districtId");

                String insQuery = "insert into tbl_place (place_name,district_id) values ('" + Uname + "','" + Uid + "')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) 
                {
                    out.println("success");
                } else 
                {
                    out.println(insQuery);
                }

            }
        }
            if (request.getParameter("did") != null) 
            {
                String del = "delete from tbl_place where place_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("place.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_place u inner join tbl_district c on u.district_id=c.district_id where u.place_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = c.selectCommand(selq);

                while (rs2.next()) 
                {
                   placeId = rs2.getString("place_id");
                    placeName = rs2.getString("place_name");
                    districtName = rs2.getString("district_id");
                   
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">Place</h1>
        <input type="hidden" name="hid" value="<%=placeId%>"/>
            <table align="center">
                
                
                <tr>
                    <td>
                        State
                    </td>
                    <td>
                        <select name="districtId">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_district";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                             %>
                            <option value="<%=rs.getString("district_id")%>"  <% if(districtName.equals(rs.getString("district_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("district_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td> Place</td>
                <td><input type="text" name="txtname" value="<%=placeName%>" /></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                
               
                <th>District</th>
                <th>Place</th>

                <%
                    int i = 1;
                    String sel1 = "select * from tbl_place u, tbl_district c where u.district_id=c.district_id";
                    ResultSet rs1 = c.selectCommand(sel1);
                    while (rs1.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    
                   
                 
                    <td><%=rs1.getString("district_name")%></td>
                       <td><%=rs1.getString("place_name")%></td>
                    <td><a href="place.jsp?eid=<%=rs1.getString("place_id")%>">EDIT</a></td><br>
                 
                     <td><a href="place.jsp?did=<%=rs1.getString("place_id")%>">Delete</a></td>

                    
                       

                    


                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
