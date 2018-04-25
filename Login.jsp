
<%-- 
    Document   : Login
    Created on : Feb 14, 2018, 9:36:57 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String type="",status="",uid="";
        if(request.getParameter("btnloginsubmit") !=null)
        {
            String uname=request.getParameter("txtusername");
             String password=request.getParameter("txtpassword");
             String selQuery="select * from tbl_login where username='"+uname+"' and password='"+password+"'";
             ResultSet rs=c.selectCommand(selQuery);
             if(rs.next())
             {
                uid=rs.getString("login_id");
                type=rs.getString("utype");
                if(type.equals("9"))
                {
                    response.sendRedirect("../Admin/HomePage.jsp");
                                       
                    
                }
                else if(type.equals("8"))
                {
                     String selQuery11="select * from coordinator where login_id='"+uid+"'";
                    ResultSet rs12=c.selectCommand(selQuery11);
                    if(rs12.next())
                    {
                        session.setAttribute("co_id",rs12.getString("co_id"));
                    response.sendRedirect("../CoOrdinator/HomePage.jsp");
                                       
                    }  
                }
                else if(type.equals("1"))
                {
                    String selQuery1="select * from tbl_studreg where login_id='"+uid+"' and approval_status=1";
                    ResultSet rs1=c.selectCommand(selQuery1);
                    if(rs1.next())
                    {
                        session.setAttribute("user_id",rs1.getString("stud_id"));
                        response.sendRedirect("../Student/Studhome.jsp");
                                         
                    }
                }
                    
                 else if(type.equals("7"))
                {
                    String selQuery4="select * from tbl_companies where login_id='"+uid+"' and approval=1";
                    ResultSet rs4=c.selectCommand(selQuery4);
                    if(rs4.next())
                    {
                        session.setAttribute("companyid",rs4.getString("company_id"));
                        response.sendRedirect("../company/companyHome.jsp");
                        
                        
                        
                    }
                }        
                
        }
else
             {
                 %>
                 <script>
                     alert("Unauthorized Access")
                     
                     </script>
                     <% 
                
             }
}
         %>
        <div class="row" style="margin-top: 100px">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="border-radius: 18px">
    <body>
    
        <h1 align="center">LOGIN</h1>
        <form class="form-group">
            <table align="center" class="table table-hover" >
                                <tr>
                                <td> User Name</td>
                                <td><input type="text" required="" class="form-control" name="txtusername"></td>
                                                </tr>
                                  <tr>
                                <td> Password</td>
                                <td><input type="password" required="" class="form-control" name="txtpassword"></td>
                                                </tr>
                                                <tr>
                                                   <td colspan="2" align="center"><input type="submit"  class="btn btn-success" name="btnloginsubmit" value="Login">                                                       
                                                     <input type="reset" name="btnrst" class="btn btn-danger" value="Cancel">
                                                    </td>
                                                </tr>
                                                <tr><td colspan="2" align="center"><span style="color: red"><%=status%></span></td></tr>
                        </table>
        </form>
        </body>
</html>


                                                              
                