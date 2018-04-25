<%-- 
    Document   : EntranceTest
    Created on : Mar 13, 2018, 10:11:59 AM
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
        String unID = "", unName = "",cId="",des="",ctypeId="",elig="" ;
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String name = request.getParameter("txtname");
                String description = request.getParameter("txtdesc");
                   String eligib = request.getParameter("txtelig");
                String upQry = "update tbl_entest set entest_name ='" + name + "',elig='"+eligib+"',en_desc='"+ description +"',coursetype_id='"+request.getParameter("course")+"',type_id='"+request.getParameter("type")+"' where entest_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("EntranceTest.jsp");
                } else 
                {
                    out.println("Failed");
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
                String Uelig = request.getParameter("txtelig");
               String Udesc = request.getParameter("txtdesc");
                String Uid = request.getParameter("course");
 String Utypeid = request.getParameter("type");
                String insQuery = "insert into tbl_entest (entest_name,coursetype_id,en_desc,type_id,elig) values ('" + Uname + "','" + Uid + "','"+Udesc+"','"+Utypeid+"','"+Uelig+"')";
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
                String del = "delete from tbl_entest where entest_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("EntranceTest.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_entest u inner join tbl_coursetype c on u.coursetype_id=c.coursetype_id inner join tbl_type t on t.type_id=u.type_id where u.entest_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = c.selectCommand(selq);

                while (rs2.next()) 
                {
                   unID = rs2.getString("entest_id");
                    unName = rs2.getString("entest_name");
                    cId = rs2.getString("coursetype_id");
                   des= rs2.getString("en_desc");
//                   out.println(des);
                     ctypeId = rs2.getString("type_id");
                      elig = rs2.getString("elig");
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">ENTRANCE EXAM DETAILS</h1>
        <input type="hidden" name="hid" value="<%=unID%>"/>
            <table align="center">
                
                
                <tr>
                    <td>
                        Course Type
                    </td>
                    <td>
                        <select name="course" required="" >
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_coursetype";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("coursetype_id")%>"  <% if(cId.equals(rs.getString("coursetype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("coursetype_name")%>
                                        </option>
                            

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        Degree Type
                    </td>
                    <td>
                        <select name="type" required="" >
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_type";
                                ResultSet rs1 = c.selectCommand(sel1);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("type_id")%>"  <% if(ctypeId.equals(rs1.getString("type_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("type_name")%>
                                        </option>
                            

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                
                <tr>
                <td> Exam Name:</td>
                <td><input type="text" required="" pattern="[A-Za-z\ ]{5,20}"  name="txtname" value="<%=unName%>" /></td>
                </tr>
                 <tr>
                <td> Description:</td>
                <td><textarea name="txtdesc"  required="" pattern="[A-Za-z\ ]{5,20}" ><%=des%></textarea></td>
                </tr>
                <tr>
                <td> Eligibility:</td>
                <td><textarea name="txtelig"  required="" ><%=elig%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>Exam Name</th>
                 <th>Course Type</th>
                 <th>Degree Type</th>
 <th>Description</th>
                    <th>Eligibility</th>
                <%
                    int i = 1;
                    String sel12 = "select * from tbl_coursetype u, tbl_entest c,tbl_type t where u.coursetype_id=c.coursetype_id and c.type_id=t.type_id";
                    ResultSet rs12 = c.selectCommand(sel12);
                    while (rs12.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs12.getString("entest_name")%></td>
                    
                    <td><%=rs12.getString("coursetype_name")%></td>
                     <td><%=rs12.getString("type_name")%></td>
                    <td><%=rs12.getString("en_desc")%></td>
                    <td><%=rs12.getString("elig")%></td>
                    <td><a href="EntranceTest.jsp?eid=<%=rs12.getString("entest_id")%>">EDIT</a></td><br>
                 
                     <td><a href="EntranceTest.jsp?did=<%=rs12.getString("entest_id")%>">Delete</a></td>

                    
                       

                    


                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
