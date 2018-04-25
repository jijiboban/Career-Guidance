<%-- 
    Document   : CoOrdinatorRegistration
    Created on : Feb 28, 2018, 11:52:33 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script>
            function passcheck()
            {
                var a=document.getElementById("p1").value;
                 var b=document.getElementById("p2").value;
                 if(a==b)
                 {
                     return true;                       

                 }
                else
                {
                    alert("Password doesnt Match..!!");
                    document.getElementById("p1").focus();
                    return false;
                }
            }
            </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
         String login="";
        if (request.getParameter("btnstudsubmit") != null) 
        {
            String companyName = request.getParameter("txtstudname");
            String address = request.getParameter("txtaddress");
            String contact = request.getParameter("txtcontact");
            String email = request.getParameter("txtemail");
            String qual = request.getParameter("txtqual");
           
           
            String companyUname = request.getParameter("txtloginuname");
            String companyPassword = request.getParameter("txtloginpassword");
            String insQuery2 = "insert into tbl_login(username,password,utype) values('" + companyUname + "','" + companyPassword + "','8')";
              boolean b = c.executeCommand(insQuery2);
               if (b == true) 
               {
             String str="select max(login_id) as loginid from tbl_login";
            ResultSet rs=c.selectCommand(str);
            if(rs.next())
                {
                    login=rs.getString("loginid");
                    
                }

            String insQuery1 = "insert into coordinator(co_name,co_ph,co_email,co_adrs,co_qual,login_id) values ('" + companyName + "','" + contact + "','" + email + "','" + address + "','" + qual + "','"+login+"')";
            
                c.executeCommand(insQuery1);
                response.sendRedirect("CoOrdinatorRegistration.jsp");
            } 
            }

         if (request.getParameter("did") != null) {
      
           
            String sel1="select * from coordinator s inner join tbl_login l on s.login_id=l.login_id where s.co_id='" + request.getParameter("did") + "'";
             ResultSet rs11=c.selectCommand(sel1);
            if(rs11.next())
                {
                    login=rs11.getString("login_id");
                    out.println(login); 
                    String del1 = "delete from tbl_login where login_id='"+login+"'";
           
                  boolean b1 = c.executeCommand(del1); 
                  if(b1 == true)
                 {
              
              String del = "delete from coordinator where co_id='" + request.getParameter("did") + "'";
           
              boolean b2 = c.executeCommand(del);
               response.sendRedirect("CoOrdinatorRegistration.jsp");
                }
           
         }  
         }
         
    %>


    <body>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-6">
                
        <form method="post" class="form-group">
            <h1 align="center">COUNCILOR REGISTRATION</h1>
           
            <table align="center" class="table table-hover">
            <tr>
                <td>Name:</td>
                <td><input type="text" name="txtstudname" class="form-control" required="" pattern="[A-Za-z \.]{2,30}"></td>
            </tr>
            <tr>
                <td>Address :</td>
                <td><input type="text" name="txtaddress" class="form-control" required="" ></td>
            </tr>
             <tr>
                <td>Qualification:</td>
                <td><input type="text" name="txtqual" class="form-control" required=""></td>
            </tr>
            <tr>
                <td>Contact Number :</td>
                <td><input type="number" name="txtcontact" class="form-control" pattern="[0-9 +]{8,13} required=""></td>
            </tr>
            <tr>
                <td>Email </td>
                <td><input type="email" name="txtemail" class="form-control" required=""></td>
            </tr>           
              <tr>
                <td>User name</td>
                <td><input type="text"  name="txtloginuname" class="form-control" required=""></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" class="form-control" id="p1" name="txtloginpassword" required=""/></td>
            </tr>
             <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" class="form-control" id="p2" name="txtloginpassword1" required=""/></td>
                </tr>
                
                  <tr>
                    <td align="center"> <input type="submit" class="btn btn-success"  value="REGISTER"  name="btnstudsubmit" onclick="return passcheck()">
                    <input type="reset" class="btn btn-danger" value="CANCEL" name="btnstudsubmit"/></td>
                </tr>
                
            </table>
            <table border="1" align="center">
                <th>Sl.No</th>  
                <th>Name</th>
                 <th>Contact No.</th>
                  <th>Email</th>
                   <th>Qualification</th>
                    <th>Address</th>
                     
                    <%
                        int i = 1;
                        String sel = "select * from coordinator";
                        ResultSet rs = c.selectCommand(sel);
                        while (rs.next()) {%>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("co_name")%></td>
                    <td><%=rs.getString("co_ph")%></td>
                    <td><%=rs.getString("co_email")%></td>
                    <td><%=rs.getString("co_qual")%></td>
                    <td><%=rs.getString("co_adrs")%></td>
                   
                <td><a href="CoOrdinatorRegistration.jsp?did=<%=rs.getString("co_id")%>">Delete</a></td>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>
           
            
            
        </form>

</body>
</html>