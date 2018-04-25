<%-- 
    Document   : questionDetails
    Created on : Feb 28, 2018, 11:28:45 AM
    Author     : jiji
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String interestName="",qID="",Question="",qualtype="";
        if(request.getParameter("btnsubmit") != null)
            {
                if(!request.getParameter("hid").equals(""))
                {
                    String interestname=request.getParameter("interest");
                    String q=request.getParameter("txtquestion");
                     String qual=request.getParameter("qualtype");
                    
                    String upQuery="update tbl_question set ques_name='"+q+"',coursetype_id='"+interestname+"',class_id='"+qual+"' where ques_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.executeCommand(upQuery);
                    
                    if(b == true)
                    {
                        response.sendRedirect("questionDetails.jsp");
                    }
                    else
                    {
                        out.println(upQuery);
                    }
                    
                }
                else
                {
                    String tName=request.getParameter("interest");
                    String question=request.getParameter("txtquestion");
                    String que=request.getParameter("qualtype");

                    String insQuery="insert into tbl_question(ques_name,coursetype_id,class_id) values ('"+question+"','"+tName+"','"+que+"')";
                    boolean b=obj.executeCommand(insQuery);

                    if( b== true)
                    {
                        response.sendRedirect("questionDetails.jsp");
                    }
                    else
                    {
                        out.println(insQuery);
                    }
                }

        }
          if (request.getParameter("delid") != null)
          {
                  String del = "delete from tbl_question where ques_id='" + request.getParameter("delid") + "'";
                  boolean b = obj.executeCommand(del);
                  response.sendRedirect("questionDetails.jsp");

           }
           if (request.getParameter("edid") != null) 
           {
                  String selQuery = "select * from tbl_question where ques_id='" + request.getParameter("edid") + "'";

                  ResultSet rs1 = obj.selectCommand(selQuery);
                  if (rs1.next()) 
                  {
                      qID = rs1.getString("ques_id");
                      
                      interestName = rs1.getString("coursetype_id");
                      Question = rs1.getString("ques_name");
                       qualtype = rs1.getString("class_id");

                  }

              }
    
        
    
    
    %>
    
    <body>
        <form method="post">
            <h2 align="center">Add Question</h2>
            <input type="hidden" name="hid" value="<%=qID%>">
            <table align="center">
                <tr>
                    <td>Interest</td>
                    <td>
                        <select name="interest" required="">

                            <option>--Select--</option>

                            <%
                                String selq2 = "select * from tbl_coursetype";
                                ResultSet rs3 = obj.selectCommand(selq2);
                                while (rs3.next()) 
                                {
                            %>
                            <option value="<%=rs3.getString("coursetype_id")%>" <% if (interestName.equals(rs3.getString("coursetype_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs3.getString("coursetype_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Course Type</td>
                    <td>
                        <select name="qualtype" required="">

                            <option>--Select--</option>

                            <%
                                String selq21 = "select * from tbl_class";
                                ResultSet rs31 = obj.selectCommand(selq21);
                                while (rs31.next()) 
                                {
                            %>
                            <option value="<%=rs31.getString("class_id")%>" <% if (qualtype.equals(rs31.getString("class_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs31.getString("class")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Question</td>
                    <td><textarea name="txtquestion" required="" value="<%=Question%>"></textarea></td>
                </tr>
                 <tr>
                    <td><input align="center" type="submit" name="btnsubmit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
                </tr>
                        
            </table>
            <table border="1" align="center">
                
                <th>Sl.No</th>
                <th>Interest</th>
                 <th>Course Type</th>
                <th>Question</th>
                <% 
                 int i=1;
                 String sel="select * from tbl_question q,tbl_coursetype t,tbl_class qu where q.coursetype_id=t.coursetype_id and q.class_id=qu.class_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("coursetype_name")%></td>
                         <td><%=rs.getString("class")%></td>
                        <td><%=rs.getString("ques_name")%></td>
                        <td><a href="questionDetails.jsp?delid=<%=rs.getString("ques_id")%>">Delete</a></td>
                        <td><a href="questionDetails.jsp?edid=<%=rs.getString("ques_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
            
        </form>
    </body>
</html>

