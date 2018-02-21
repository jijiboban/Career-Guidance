<%-- 
    Document   : newjsp
    Created on : Feb 9, 2018, 10:26:56 AM
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
        String unID = "", unPlace = "", unMail = "", unCont = "", cId = "", unName = "";
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String name = request.getParameter("txtname");
                String place = request.getParameter("txtplace");
                String email = request.getParameter("txtemail");
                String contact = request.getParameter("txtcontact");

                String upQry = "update tbl_university set university_name ='" + name + "',university_place='" + place + "',university_email='" + email + "',university_contact='" + contact + "',country_id='"+request.getParameter("country")+"' where university_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("University.jsp");
                } else 
                {
                    out.println("Failed");
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
                String Uplace = request.getParameter("txtplace");
                String Uemail = request.getParameter("txtemail");
                String Ucontact = request.getParameter("txtcontact");
                String Uid = request.getParameter("country");

                String insQuery = "insert into tbl_university (university_name,country_id,university_place,university_contact,university_email) values ('" + Uname + "','" + Uid + "','" + Uplace + "','" + Ucontact + "','" + Uemail + "')";
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
                String del = "delete from tbl_university where university_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("University.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_university u inner join tbl_country c on u.country_id=c.country_id where u.university_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = c.selectCommand(selq);

                while (rs2.next()) 
                {
                   unID = rs2.getString("university_id");
                    unName = rs2.getString("university_name");
                    cId = rs2.getString("country_id");
                    unPlace = rs2.getString("university_place");
                    unMail = rs2.getString("university_email");
                    unCont = rs2.getString("university_contact");
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">UNIVERSITY</h1>
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
                <td> University Name:</td>
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


                <%
                    int i = 1;
                    String sel1 = "select * from tbl_university u, tbl_country c where u.country_id=c.country_id";
                    ResultSet rs1 = c.selectCommand(sel1);
                    while (rs1.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs1.getString("university_name")%></td>
                    <td><%=rs1.getString("university_place")%></td>
                    <td><%=rs1.getString("university_email")%></td>
                    <td><%=rs1.getString("university_contact")%></td>
                    <td><%=rs1.getString("country_name")%></td>
                    <td><a href="University.jsp?eid=<%=rs1.getString("university_id")%>">EDIT</a></td><br>
                 
                     <td><a href="University.jsp?did=<%=rs1.getString("university_id")%>">Delete</a></td>

                    
                       

                    


                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
