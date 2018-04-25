<%-- 
    Document   : AssignClassCourse
    Created on : Apr 19, 2018, 11:47:38 AM
    Author     : jiji
--%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign courses to class</title>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="jq.js" type="text/javascript"></script>
         <script>
            function getCourse(v)
            {
        //                alert(v);
             $.ajax({url: "ajax_course.jsp?id="+v, success: function(result){
        $("#course").html(result);
    }});
            }
                </script>
    </head>
    
           
    <%
        String coursetype="",classname="", courseid="";
        
        
    if(request.getParameter("btnsubmit")!=null)
    {
        
             courseid = request.getParameter("course");   
             classname=request.getParameter("ddlclass");
             coursetype=request.getParameter("ddlcoursetype");
            String insqry="insert into tbl_classcoursetype(coursetype_id,class_id,course_id) values('"+coursetype+"','"+classname+"','"+courseid+"')";
            boolean b=obj.executeCommand(insqry);
            if(b==true)
           {
              out.println("Sucess");
              response.sendRedirect("AssignClassCourse.jsp");
           }
           else
           {
               out.println("Failed");
           }
        }
        %>
    <body>
        <form method="POST">
            <br>
            <br>
            <table align="center">
                 <tr>
                    <td>Select Class</td>
                    <td>
                        <select name="ddlclass" required="">
                            <option value="">--select--</option>
                            <%
                            String sele="select * from tbl_class";
                            ResultSet rss=obj.selectCommand(sele);
                            while(rss.next())
                            {
                                %>
                                <option value="<%=rss.getString("class_id")%>"  <% if(classname.equals(rss.getString("class_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rss.getString("class")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                 </tr>
                 <tr>
                    <td>Select Course Type</td>
                    <td>
                        <select name="ddlcoursetype" required="" onchange="getCourse(this.value)">
                            <option value="">--select--</option>
                            <%
                            String sel="select * from tbl_coursetype";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("coursetype_id")%>"  <% if(coursetype.equals(rs.getString("coursetype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("coursetype_name")%>

                            <%
                                }


                            %>
                        </select>
                    </td>
                 </tr>
                 <tr>
                    <td>Select Course</td>
                    <td>
                        <select name="course" required="" id="course">
                            <option value="">--select--</option>
                            
                        </select>
                    </td>
                 </tr>
                  <tr>
                    <td><input type="submit" name="btnsubmit"></td>
                </tr>
                    
            </table>
        </form>
    </body>
</html>
