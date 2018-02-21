<%-- 
    Document   : College
    Created on : Feb 14, 2018, 10:33:46 AM
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
        String unID = "", unPlace = "", unMail = "", unCont = "", cId = "", unName = "",Category="",runby="";
        if (request.getParameter("btnsub") != null) {

            if (!request.getParameter("hid").equals("")) {
                String name = request.getParameter("txtname");
                String place = request.getParameter("txtplace");
                String email = request.getParameter("txtemail");
                String contact = request.getParameter("txtcontact");
                String category=request.getParameter("txtcategory");
                String runBy=request.getParameter("txtrunby");
                

                String upQry = "update tbl_colg set colg_name ='" + name + "',colg_adrs='" + place + "',colg_email='" + email + "',colg_ph='" + contact + "',country_id='" + request.getParameter("country") + "',category='"+request.getParameter("category") + "',runby='"+runBy+"' where colg_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("College.jsp");
                } else {
                    out.println("Failed");
                }
            } else {
                String Uname = request.getParameter("txtname");
                String Uplace = request.getParameter("txtplace");
                String Uemail = request.getParameter("txtemail");
                String Ucontact = request.getParameter("txtcontact");
                String Uid = request.getParameter("country");
                String Category1=request.getParameter("category");
                String runBy = request.getParameter("txtrunby");
                String insQuery = "insert into tbl_colg (colg_name,country_id,colg_adrs,colg_ph,colg_email,category,runby) values ('" + Uname + "','" + Uid + "','" + Uplace + "','" + Ucontact + "','" + Uemail + "','"+Category1+"','"+runBy+"')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) {
                    out.println("success");
                } else {
                    out.println("failed");
                }

            }
        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_colg where colg_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("College.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selq = "select * from tbl_colg u inner join tbl_country c on u.country_id=c.country_id where u.colg_id='" + request.getParameter("eid") + "'";

            ResultSet rs2 = c.selectCommand(selq);

            while (rs2.next()) {
                unID = rs2.getString("colg_id");
                unName = rs2.getString("colg_name");
                cId = rs2.getString("country_id");
                unPlace = rs2.getString("colg_adrs");
                unMail = rs2.getString("colg_email");
                unCont = rs2.getString("colg_ph");
                Category=rs2.getString("category");
                runby=rs2.getString("runby");
            }
        }


    %>
    <body>

        <form method="post">
            <h1 align="center">COLLEGE</h1>
            <input type="hidden" name="hid" value="<%=unID%>"/>
            <table align="center">


                <tr>
                    <td>
                        Country
                    </td>
                    <td>
                        <select name="country">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_country";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("country_id")%>"  <% if(cId.equals(rs.getString("country_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("country_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Category
                    </td>
                    <td>
                        <select name="category">
                            <option>--select--</option>
                            
                            <option value="1" <% if(Category.equals("1"))
                                        {%>selected="true" <%}   %>    >
                                            Mixed
                                        </option>
                            <option value="2" <% if(Category.equals("2"))
                                        {%>selected="true" <%}  
                          //  out.print("2");
                                        %>    >
                                            Womens
                            </option>
                            <option value="3" <% if(Category.equals("3"))
                                        {%>selected="true" <%}   %>    >
                                            Mens
                                        </option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>College Name:</td>
                    <td><input type="text" name="txtname" value="<%=unName%>" /></td>
                </tr>
                <tr>
                    <td> Place:</td>
                    <td><input type="text" name="txtplace" value="<%=unPlace%>"/></td>
                </tr>
                <tr>
                    <td> Email:</td>
                    <td><input type="email" name="txtemail" value="<%=unMail%>" /></td>
                </tr>
                <tr>
                    <td> Contact Number:</td>
                    <td><input type="text" name="txtcontact"  value="<%=unCont%>"></td>
                </tr>
                <tr>
                    <td> Owned By:</td>
                    <td><input type="text" name="txtrunby"  value="<%=runby%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>Name</th>
                <th>Place</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Country</th>
                <th>Category</th>
                <th>Owned By</th>

                <%
                    int i = 1;
                    String sel1 = "select * from tbl_colg u, tbl_country c where u.country_id=c.country_id";
                    ResultSet rs1 = c.selectCommand(sel1);
                    while (rs1.next()) {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs1.getString("colg_name")%></td>
                    <td><%=rs1.getString("colg_adrs")%></td>
                    <td><%=rs1.getString("colg_email")%></td>
                    <td><%=rs1.getString("colg_ph")%></td>
                    <td><%=rs1.getString("country_name")%></td>
                     <td><%=rs1.getString("category")%></td>
                     <td><%=rs1.getString("runby")%></td>
                    
                    <td><a href="College.jsp?eid=<%=rs1.getString("colg_id")%>">EDIT</a></td><br>

                <td><a href="College.jsp?did=<%=rs1.getString("colg_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
