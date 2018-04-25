<%-- 
    Document   : Course
    Created on : Feb 14, 2018, 11:20:06 AM
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
        String cID = "", cname = "", cduration = "", cfees = "",cmark="", uId = "", unName = "",cTypeid="",cType="",utype="";
        if (request.getParameter("btnsub") != null) {

            if (!request.getParameter("hid").equals("")) {
                String name = request.getParameter("txtname");
                String duration = request.getParameter("txtduration");
                String fees = request.getParameter("txtfees");
//               String type = request.getParameter("txttype");
               

                String upQry = "update tbl_course set course_minimum_mark='"+ request.getParameter("txtmark") +"'  , course_name ='" + name + "',course_duration='" + duration+ "',course_fees='" + fees + "',type_id='" + request.getParameter("txttype") + "',coursetype_id='" + request.getParameter("coursetype") + "',university_id='"+ request.getParameter("university") + "' where course_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("Course.jsp");
                } else {
                    out.println(upQry);
                }
            } else {
                String Uname = request.getParameter("txtname");
                String Uduration = request.getParameter("txtduration");
                String Ufees = request.getParameter("txtfees");
                String Utype = request.getParameter("txttype");
                String Uid = request.getParameter("coursetype");
                String Unid = request.getParameter("university");
                String mark = request.getParameter("txtmark");
               
                String insQuery = "insert into tbl_course (course_name,coursetype_id,university_id,course_duration,course_fees,type_id,course_minimum_mark) values ('" + Uname + "','" + Uid + "','" + Unid + "','" + Uduration + "','" + Ufees + "','"+Utype+"','"+mark+"')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) {
                    out.println("success");
                } else {
                    out.println(insQuery);
                }

            }
        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_course where course_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("Course.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selq = "select * from tbl_course c inner join tbl_coursetype ct on c.coursetype_id=ct.coursetype_id inner join tbl_university u on c.university_id=u.university_id where c.course_id='" + request.getParameter("eid") + "'";

            ResultSet rs2 = c.selectCommand(selq);

            while (rs2.next()) {
                cID = rs2.getString("course_id");
                cname = rs2.getString("course_name");
                cduration = rs2.getString("course_duration");
                cmark=rs2.getString("course_minimum_mark");
               cfees = rs2.getString("course_fees");
               unName=rs2.getString("university_id");
                cType=rs2.getString("coursetype_id");
                utype=rs2.getString("type_id"); 
            }
            
        }


    %>
    <body>

        <form method="post">
            <h1 align="center">COURSE</h1>
            <input type="hidden" name="hid" value="<%=cID%>"/>
            <table align="center">

                 <tr>
                    <td>
                        University
                    </td>
                    <td>
                        <select name="university" required="">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_university";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("university_id")%>"  <% if(unName.equals(rs.getString("university_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("university_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course Type
                    </td>
                    <td>
                        <select name="coursetype" required="">
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_coursetype";
                                ResultSet rs1 = c.selectCommand(sel1);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("coursetype_id")%>"  <% if(cType.equals(rs1.getString("coursetype_id")))
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
                    <td>Course Name:</td>
                    <td><input type="text" name="txtname" required="" pattern="[A-Za-z\. ]{2,40}"  value="<%=cname%>" /></td>
                </tr>
                <tr>
                    <td>
                        Degree Type
                    </td>
                    <td>
                        <select name="txttype" required="">
                            <option>--select--</option>
                            <%                           
                                String sel12 = "select * from tbl_type";
                                ResultSet rs12 = c.selectCommand(sel12);
                                while (rs12.next()) {

                            %>
                            <option value="<%=rs12.getString("type_id")%>"  <% if(utype.equals(rs12.getString("type_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs12.getString("type_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> Duration:</td>
                    <td><input type="number" name="txtduration" required="" pattern="[0-7]{1}"  value="<%=cduration%>"/></td>
                </tr>
                <tr>
                    <td> Fees:</td>
                    <td><input type="number" required="" pattern="[0-9]{2,9}"  name="txtfees" value="<%=cfees%>" /></td>
                </tr>
                 <tr>
                    <td> Minimum Marks :</td>
                    <td><input type="number" required="" pattern="[0-9]{1,9}"  name="txtmark" value="<%=cmark%>" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>Name</th>
                <th>Duration</th>
                <th>Fees</th>
                <th>Marks</th>
                <th>University</th>
               <th>Course Type</th>
               
<th>Degree Type</th>

                <%
                    int i = 1;
                    String sel2 = "select * from tbl_course u, tbl_coursetype c,tbl_university un,tbl_type t where u.coursetype_id=c.coursetype_id and u.university_id=un.university_id and t.type_id=u.type_id";
                    ResultSet rs2 = c.selectCommand(sel2);
                    while (rs2.next()) {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs2.getString("course_name")%></td>
                    <td><%=rs2.getString("course_duration")%></td>
                    <td><%=rs2.getString("course_fees")%></td>
                    <td><%=rs2.getString("course_minimum_mark")%></td>
                    <td><%=rs2.getString("university_name")%></td>
                   <td><%=rs2.getString("coursetype_name")%></td>
                   <td><%=rs2.getString("type_name")%></td>
                    <td><a href="Course.jsp?eid=<%=rs2.getString("course_id")%>">EDIT</a></td><br>

                <td><a href="Course.jsp?did=<%=rs2.getString("course_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
