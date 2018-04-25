<%-- 
    Document   : changepassword
    Created on : Feb 28, 2018, 9:35:05 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        
    </head>
    <body>
        
        <%
            String current="";
            String newpwd="";
            String retype="";
            if(request.getParameter("btnsubmit")!=null)
            {
                current=request.getParameter("txtcpwd");
                newpwd=request.getParameter("txtnpwd");
                retype=request.getParameter("txtrpwd");
                if(newpwd.equals(retype))
                {
                   String sel="select l.login_id from tbl_login l inner join tbl_companies b on l.login_id=b.login_id where l.password='"+current+"' and b.company_id='"+session.getAttribute("companyid")+"'";
                   ResultSet rs=obj.selectCommand(sel);
                   if(rs.next())
                   {
                       String logid=rs.getString("l.login_id");
                       String update="update tbl_login set password='"+newpwd+"' where login_id="+logid;
                       
                       boolean b=obj.executeCommand(update);
                       if(b==true)
                       {
                            %>
                    <script>
                        alert("Password Changed");
                    </script>
                    <%
                       }
                   }
                   else
                   {
                        %>
                    <script>
                        alert("Current Password Missmatch");
                    </script>
                    <%
                   }
                }
                else
                {
                    %>
                    <script>
                        alert("New Password Missmatch");
                    </script>
                    <%
                }
            }
        
        %>
        
        
       <form>
             
            <br>
           
            
                <table align="center" border="1">
                <tr>
                    <th>Current Password</th>
                    <td><input type="text" name="txtcpwd" required="" pattern="[A-Za-z0-9]{5,10}" ></td>
                </tr>
                <tr>
                    <th>New Password</th>
                    <td><input type="password" name="txtnpwd" required="" pattern="[A-Za-z0-9]{5,10}" ></td>
                </tr>
                <tr>
                    <th>Retype Password</th>
                    <td><input type="password" name="txtrpwd" required="" pattern="[A-Za-z0-9]{5,10}" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Change">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
             <a href="../company/companyHome.jsp">My Home</a>
        </form>
   
    </body>
</html>
