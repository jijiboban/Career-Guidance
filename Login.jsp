<%-- 
    Document   : Login
    Created on : Feb 14, 2018, 9:36:57 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                if(type.equals("2"))
                {
                    response.sendRedirect("../Admin/HomePage.jsp");
                                       
                    
                }
                else if(type.equals("3"))
                {
                    response.sendRedirect("../CoOrdinator/HomePage.jsp");
                                       
                    
                }
                else if(type.equals("1"))
                {
                    String selQuery1="select * from tbl_studreg where login_id='"+uid+"'";
                    ResultSet rs1=c.selectCommand(selQuery1);
                    if(rs1.next())
                    {
                        session.setAttribute("user_id",rs1.getString("stud_id"));
                        response.sendRedirect("../Student/Studhome.jsp");
                        
                        
                        
                    }
                }
                    
                 else if(type.equals("4"))
                {
                    String selQuery1="select * from tbl_companies where login_id='"+uid+"'";
                    ResultSet rs1=c.selectCommand(selQuery1);
                    if(rs1.next())
                    {
                        session.setAttribute("user_id",rs1.getString("company_id"));
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
        <body>
        <form method="post">
                <h1 align="center">Login</h1>
                        <table align="center">
                                <tr>
                                <td> User Name</td>
                                        <td><input type="text" name="txtusername"></td>
                                                </tr>
                                  <tr>
                                <td> Password</td>
                                        <td><input type="password" name="txtpassword"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><input type="submit" name="btnloginsubmit">                                                        
                                                    </td>
                                                </tr>
                        </table>
        </form>
        </body>
</html>
                                                              
                