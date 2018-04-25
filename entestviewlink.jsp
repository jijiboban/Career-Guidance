<%-- 
    Document   : college
    Created on : Nov 22, 2017, 7:33:00 AM
    Author     : Dream
--%>

<%@include  file="header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

//String id=request.getParameter("cid");
//String str="select * from tbl_entest e, tbl_course c where e.course_id=c.course_id and c.course_id="+id ;
//ResultSet rs=c.selectCommand(str);
//if(rs.next())
//{

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <table class="table table-hover">   
                    <%               
                        String id = request.getParameter("cid");
                       // System.out.println(id);
                        String str = "select * from tbl_entest e, tbl_course c where e.coursetype_id=c.course_id and e.coursetype_id='"+id+"'";
                        ResultSet rs = c.selectCommand(str);
                        if (rs.next()) {
                    %>

                    <tr><td colspan="2" align="center">
                    <tr><td><h1 class="heading"  align="center"><%=rs.getString("course_name")%></h1></td></tr>
                    <tr><td colspan="2" align="center"><%=rs.getString("entest_name")%></td></tr>
                    <tr><td colspan="2" align="center"><%=rs.getString("en_desc")%></td></tr>
                        <%

                            }
                        %>    
                </table>


            </div>
        </div>
    </body>
</html>
