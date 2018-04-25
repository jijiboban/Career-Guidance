<%-- 
    Document   : Interest
    Created on : Mar 14, 2018, 3:00:05 PM
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
        <script src="jq.js" type="text/javascript"></script>
        <script>
            function getField(a)
            {
              //  alert(a);
                $.ajax(
                        {
                            url: "AjaxSelectInterest.jsp?id="+a,
                            success: function (result) {
                                
                                $("#interest").html(result);
                        
                    }
                        });
                
            }
        </script>
    </head>
    <%
        String iname="";
        if(request.getParameter("btnsubmit") != null)
        {
            //String interest=request.getParameter("interest");
            session.setAttribute("interest", request.getParameter("interest"));
            session.setAttribute("class", request.getParameter("class"));
            
            String eid="";
            String insQuery="insert into tbl_exam (stud_id,exam_date,coursetype_id)values('"+session.getAttribute("user_id")+"',curdate(),'"+request.getParameter("interest")+"')";
             out.println(insQuery);
            boolean b=obj.executeCommand(insQuery);
           
            if(b == true)
            {
                String selqry="select max(exam_id) as examid from tbl_exam";
                ResultSet rs=obj.selectCommand(selqry);
                out.println(selqry);
                if(rs.next())
                {
                    eid=rs.getString("examid");
                    session.setAttribute("ExamID", eid);
                   
                    response.sendRedirect("StartExam.jsp");
                }
                
            }
            
            
        }
    
    
    
    %>
    <body>
        <h1 align="center">Please choose your interest</h1>
        <form method="post">
            <table align="center">
                       <tr>
                    <td>
                       Completed Course
                    </td>
                    <td>
                        <select name="class" required="" onchange="getField(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel121 = "select * from tbl_class";
                                ResultSet rs121 = obj.selectCommand(sel121);
                                while (rs121.next()) 
                                {

                            %>
                            <option value="<%=rs121.getString("class_id")%>" >
                                            <%=rs121.getString("class")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                       Interest
                    </td>
                    <td>
                        <select name="interest" required="" id="interest">
                            <option>--select--</option>
                            <%                           
                                String sel12 = "select * from tbl_coursetype";
                                ResultSet rs12 = obj.selectCommand(sel12);
                                while (rs12.next()) 
                                {

                            %>
                            <option value="<%=rs12.getString("coursetype_id")%>"     >
                                            <%=rs12.getString("coursetype_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
         
                <tr>
                    <td><input type="submit" name="btnsubmit" value="submit"></td>
                </tr>
            </table>
            
        </form>
    </body>
</html>
