<%-- 
    Document   : Colgcourse
    Created on : Feb 14, 2018, 9:13:04 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
           String colgcourseId = "",colgId="", collegename = "", courseId = "", coursename = "";
        
        if (request.getParameter("btnsub") != null) 
        {
            

            if (!request.getParameter("hid").equals("")) 
            {
                String college = request.getParameter("college");
                String course = request.getParameter("coursetype");
                
                String upQry = "update tbl_colgcourse set course_id='"+course+"',college_id='"+college+"' where colgcourse_id='" + request.getParameter("eid")+"'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("Colgcourse.jsp");
                } else
                {
                    out.println("Failed");
                }
            } 
            else 
            {
                String Ucolg = request.getParameter("college");
                String Ucourse = request.getParameter("coursetype");
                             
                
                String insQuery = "insert into tbl_colgcourse (course_id,college_id) values ('" + Ucourse + "','" + Ucolg+ "')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) 
                {
                    out.println("success");
                    response.sendRedirect("Colgcourse.jsp");
                } else 
                {
                    out.println(insQuery);
                }

            }
        }
        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_colgcourse where colgcourse_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("Colgcourse.jsp");
        }
  

        if (request.getParameter("eid") != null) 
        {
            //out.print(request.getParameter("eid"));
            String selq ="select * from tbl_colgcourse where colgcourse_id="+request.getParameter("eid");

            ResultSet rs2 = c.selectCommand(selq);

            while (rs2.next())
            {
                colgcourseId=rs2.getString("colgcourse_id");
               collegename= rs2.getString("college_id");
               coursename = rs2.getString("course_id");
               
            }
            
        }

    %>
    <body>

        <form method="post">
            <h1 align="center"> College Course</h1>
            <input type="hidden" name="hid" value="<%=colgcourseId%>">
            <table align="center">

                 <tr>
                    <td>
                        College
                    </td>
                    <td>
                        <select name="college">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_colg";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("colg_id")%>"  <% if(collegename.equals(rs.getString("colg_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("colg_name")%>,<%=rs.getString("colg_adrs")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course
                    </td>
                    <td>
                        <select name="coursetype">
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_course";
                                ResultSet rs1 = c.selectCommand(sel1);
                                while (rs1.next()) 
                                {

                            %>
                            <option value="<%=rs1.getString("course_id")%>"  <% if(coursename.equals(rs1.getString("course_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("course_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                               <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>College</th>
              
                <th> Course</th>
                


                <%
                    int i = 1;
                    String sel2 = "select clg.colg_id,clg.colg_adrs , cou.course_id, clg.colg_name, cou.course_name, cc.colgcourse_id from tbl_colg clg inner join tbl_course cou inner join tbl_colgcourse cc where clg.colg_id=cc.college_id and cou.course_id=cc.course_id ";
                    ResultSet rs2 = c.selectCommand(sel2);
                    while (rs2.next()) {
                %>
                <tr>                   <td><%=i%></td>

                    <td><%=rs2.getString("colg_name")%>,<%=rs2.getString("colg_adrs") %></td>
                    <td><%=rs2.getString("course_name")%></td>
                   
                    <td><a href="Colgcourse.jsp?eid=<%=rs2.getString("colgcourse_id")%>">EDIT</a></td><br>

                <td><a href="Colgcourse.jsp?did=<%=rs2.getString("colgcourse_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
