<%-- 
    Document   : joblist
    Created on : Feb 15, 2018, 12:09:42 PM
    Author     : jiji
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


     
        <form>
            <h1 align="center"><i><b>Job Vacancies</b></i></h1>
            <table border="1" align="center">
               
                <th>Company</th>
                
                <th>Job</th>
                
               
                <th> Closing Date</th>
              

                <%
                if(request.getParameter("did")!=null)
                {
                session.setAttribute("jobid", request.getParameter("did"));
                response.sendRedirect("jobapply.jsp");
                }
                    
                Date date = new Date();
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String d=dateFormat.format(date);
           
               
               
                    int i = 1;
                    String sel2 = "select * from tbl_job u, tbl_jobcatogory c,tbl_companies un where u.jobtype_id=c.jobtype_id and u.company_id=un.company_id and  last_date >='"+d+"'";
                    ResultSet rs2 = c.selectCommand(sel2);
                    while (rs2.next()) {
                %>
                <tr>


                    <td><%=rs2.getString("company_name")%></td>
                   
                    <td><%=rs2.getString("job_name")%></td>
                    
                    
                    <td><%=rs2.getString("last_date")%></td>
                   

                    <td><a href="joblist.jsp?did=<%=rs2.getString("job_id")%>">Apply</a></td>
                </tr>
                <%
                        i++;
                    }
                %>

            </table>
        </form>
    </body>
</html>
