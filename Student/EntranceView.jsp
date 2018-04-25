<%-- 
    Document   : EntranceView
    Created on : Apr 12, 2018, 2:15:27 PM
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
        String ctypeId="",typeId="";
    
   
    %>
    <body>
        <h1><b><center>ENTRANCE EXAM DIRECTORY</center></b></h1>
        <p><center>Information on Entrance Exam for Undergraduate and Postgraduate course in India</center></p>
<table align="center">
    <tr>
        <td>
            Choose Career
        </td>
        <td>
            <select name="coursetype">
                <option>---select---</option>
                <%                           
                                String sel1 = "select * from tbl_coursetype";
                                ResultSet rs1 = c.selectCommand(sel1);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("coursetype_id")%>"  <% if(ctypeId.equals(rs1.getString("coursetype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("coursetype_name")%>
                                        </option>
                            

                            <%
                                }


                            %>
            </select>
        </td>
    </tr>
     <tr>
        <td>
           Choosee degree
        </td>
        <td>
            <select name="type">
                <option>---select---</option>
                <%                           
                                String sel2 = "select * from tbl_type";
                                ResultSet rs2 = c.selectCommand(sel2);
                                while (rs2.next()) {

                            %>
                            <option value="<%=rs2.getString("type_id")%>"  <% if(typeId.equals(rs2.getString("type_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs2.getString("type_name")%>
                                        </option>
                            

                            <%
                                }


                            %>
            </select>
        </td>
    </tr>
    <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" value="Filter" ></td>
    </tr>
</table>
</body>
</html>
