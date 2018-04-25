<%-- 
    Document   : job
    Created on : Feb 27, 2018, 8:42:05 PM
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
        String jobID = "", companyName = "", cjob = "", cqual = "",csalary="",cdate = "", cType = "",cexp= "";
        if (request.getParameter("btnsub") != null) 
        {
            //out.println(request.getParameter("hid"));

           if (!request.getParameter("hid").equals("")) 
           {
                String name = request.getParameter("txtjob");
                String qual = request.getParameter("txtqual");
                String date = request.getParameter("txtdate");
                String salary = request.getParameter("txtsalary");
                String exp = request.getParameter("txtexp");
               

                String upQry = "update tbl_job set job_name ='" + name + "',salary='" + salary+ "',min_qual='" + qual + "',exp='" + exp + "',last_date='" + date + "',jobtype_id='" + request.getParameter("jobcategory") + "',company_id='"+ session.getAttribute("companyid") + "' where job_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("job.jsp");
                } 
                else 
                {
                    out.println(upQry);
                }
            } 
           else 
           {
                String Uname = request.getParameter("txtjob");
                String Uqual = request.getParameter("txtqual");
                String Ufees = request.getParameter("txtsalary");
                String Udate = request.getParameter("txtdate");
                String Uexp = request.getParameter("txtexp");
                String Uid = request.getParameter("jobcategory");
                
                String insQuery = "insert into tbl_job (job_name,jobtype_id,company_id,salary,min_qual,last_date,exp) values('" + Uname + "','" + Uid + "','" + session.getAttribute("companyid") + "','" + Ufees + "','" + Uqual + "','" + Udate + "','" + Uexp + "')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) 
                {
                    //out.println("success");
                    response.sendRedirect("job.jsp");
                } else 
                {
                    out.println(insQuery);
                }

            }
        }
        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_job where job_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("job.jsp");
        }
        if (request.getParameter("eid") != null) 
        {
            String selq = "select * from tbl_job c inner join tbl_jobcatogory ct on c.jobtype_id=ct.jobtype_id inner join tbl_companies u on c.company_id=u.company_id where c.job_id='" + request.getParameter("eid") + "'";

            ResultSet rs3 = c.selectCommand(selq);

            while (rs3.next()) 
            {
                jobID = rs3.getString("job_id");
                cjob = rs3.getString("job_name");
                cqual= rs3.getString("min_qual");
                csalary= rs3.getString("salary");
                cdate= rs3.getString("last_date");
                cType=rs3.getString("jobtype_id");
                cexp=rs3.getString("exp");
                
            }
            
        }


    %>

    
    <body>

        <form method="post">
            <h1 align="center">Job</h1>
            <input type="hidden" name="hid" value="<%=jobID%>">
              <td><a href="companyHome.jsp">Back</a></td>
            <table align="center">

                
                <tr>
                    <td>
                        Job Category:
                    </td>
                    <td>
                        <select name="jobcategory" required="" >
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_jobcatogory";
                                ResultSet rs1 = c.selectCommand(sel1);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("jobtype_id")%>"  <% if(cType.equals(rs1.getString("jobtype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("jobtype_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Job:</td>
                    <td><input type="text" name="txtjob" required="" pattern="[A-Za-z ]{5,20}"  value="<%=cjob%>" /></td>
                </tr>
                <tr>
                    <td> Minimum Qualification:</td>
                    <td><input type="text" name="txtqual" required="" pattern="[A-Za-z]{2,20}"  value="<%=cqual%>"/></td>
                </tr>
                <tr>
                    <td> Experience:</td>
                    <td><input type="text" name="txtexp" required="" pattern="[A-Za-z0-9]{2,20}"  value="<%=cexp%>"/></td>
                </tr>
                <tr>
                    <td> Salary:</td>
                    <td><input type="text" name="txtsalary" required="" pattern="[0-9]{3,9}"  value="<%=csalary%>" /></td>
                </tr>
                <tr>
                    <td> Last Date:</td>
                    <td><input type="date" name="txtdate" required="" value="<%=cdate%>" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                
                <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                
                <th>Job Category</th>
                <th>Job</th>
                <th>Minimum Qualification</th>
                <th>Salary</th>
                <th>Date</th>
                <th>Experience</th>

                <%
                    int i = 1;
                    String sel2 = "select * from tbl_job u, tbl_jobcatogory c,tbl_companies un where u.jobtype_id=c.jobtype_id and u.company_id=un.company_id";
                    ResultSet rs2 = c.selectCommand(sel2);
                    while (rs2.next()) {
                %>
                <tr>
                    <td><%=i%></td>

                    
                    <td><%=rs2.getString("jobtype_name")%></td>
                    <td><%=rs2.getString("job_name")%></td>
                    <td><%=rs2.getString("min_qual")%></td>
                    <td><%=rs2.getString("salary")%></td>
                    <td><%=rs2.getString("last_date")%></td>
                    <td><%=rs2.getString("exp")%></td>
                   
                    <td><a href="job.jsp?eid=<%=rs2.getString("job_id")%>">EDIT</a></td><br>

                <td><a href="job.jsp?did=<%=rs2.getString("job_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
