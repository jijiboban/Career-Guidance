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

String id=request.getParameter("cid");
String str="select * from tbl_colg c,tbl_place p,tbl_university u where p.place_id=c.place_id and u.university_id=c.university_id and c.colg_id="+id ;
ResultSet rs=c.selectCommand(str);
if(rs.next())
{
    
}

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
            <tr><td colspan="2" align="center">
                    <h1 class="heading"><%=rs.getString("colg_name")%></h1></td></tr>
            <tr><td colspan="2" align="center"><%=rs.getString("colg_email")%></td></tr>
            
            <tr><td >Address:</td><td><%=rs.getString("colg_adrs")%></td></tr>
             <tr><td >Place:</td><td><%=rs.getString("place_name")%></td></tr>
            <tr><td >Contact:</td><td><%=rs.getString("colg_ph")%></td></tr>
            <tr><td >Category:</td><td><%=rs.getString("colg_category")%></td></tr>
       <tr><td >Run By:</td><td><%=rs.getString("colg_runby")%></td></tr>
       <tr><td >College Start Date:</td><td><%=rs.getString("colg_startdate")%></td></tr>
       <!--<tr><td >Place:</td><td><%=rs.getString("colg_place")%></td></tr>-->
       <tr><td >University:</td><td><%=rs.getString("university_name")%></td></tr>
        
        </table>
        <div class="row">
            <div class="col-md-4">
                    <table class="table table-responsive">
                    <tr><th >
                    <u>Courses Offered</u>
                </th></tr>
                <%
                String course="select distinct course_name from tbl_course c,tbl_colgcourse cg,tbl_colg cl where c.course_id=cg.course_id and cl.colg_id=cg.college_id and cl.colg_id="+rs.getString("colg_id") ;
                ResultSet rc=c.selectCommand(course);
                while(rc.next())
                {
                    %>
                
                <tr><td><%=rc.getString("course_name")%>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
                <%
                }
                %>
                </table>
            </div>
                </div>
      
            </div></div>
        
    </body>
</html>
