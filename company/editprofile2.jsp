<%-- 
    Document   : editprofile2
    Created on : Feb 28, 2018, 9:34:48 PM
    Author     : jiji
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company:EditProfile</title>
    </head>
    <body>
                 <%
    
             String coId="" , cid=""; 
            String coName="" , cName="";
            
            String Contact="" , Cno="";
            String Email="" ,ema="";
//            String Logo="", logo="";
            String Address="", addr="",photo="";
//            String Proof="", pro=""; 
   
   

if (request.getParameter("btn_submit") != null) {
                
                coName=request.getParameter("txt_cname");
                Contact=request.getParameter("txt_cno");
                Email=request.getParameter("txt_email");
                Address=request.getParameter("txt_adds");
                photo=request.getParameter("txtphoto");
                 
   
    if(request.getParameter("hid")!=null)
    {
        String up="update tbl_companies set company_name='"+coName+"',company_place='"+Address+"',company_contact='"+Contact+"',company_mail='"+Email+"',photo='"+photo+"' where company_id='" +session.getAttribute("companyid") + "' ";
        boolean b = obj.executeCommand(up);
        if (b) {
            %>
         
            <script>
                alert("Profile Updated..");
            
                </script>
                <%
            response.sendRedirect("companyHome.jsp");
                
        %>
      
        <%
                       
                    } else {
                        out.println(up);
                    }

                } 
    
}
 String selQry11 = "select * from tbl_companies where company_id='" +session.getAttribute("company_id") + "'";
              
                        ResultSet rs11=obj.selectCommand(selQry11);
            if(rs11.next())
                {
  
                    
                  cName=rs11.getString("company_name");
                  addr=rs11.getString("company_place");
                 
                   Cno=rs11.getString("company_contact");
                  ema=rs11.getString("company_mail");
                   photo=rs11.getString("photo");
                  //logo=rs.getString("builders_logo");
                  
                  //pro=rs.getString("builders_proof"); 
 
}


   %>
        
        <h1><font color="blue"><center>Edit Profile</center></font></h1>
        
         <form name="frm_edit">
              <input type="hidden" name="hid" value="<%=cid%>">
            
            <table  align="center">
                
               
               
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="txt_cname" required="" pattern="[A-Za-z]{5,20}"  value="<%=cName%>" >
                    </td>
                </tr>
                <tr>
                    <td>Address</td><td>
                        <input type="text" name="txt_adds" required="" pattern="[A-Za-z]{5,20}"  value="<%=addr%>" > 
                    </td>
                </tr>
               <tr>
                    <td>Contact Number</td>
                    <td>
                        <input type="text" name="txt_cno" required="" pattern="[0-9]{10,13}"  value="<%=Cno%>" >
                    </td>
                </tr>
                <tr>
                    <td>Email:</td><td>
                        <input type="text" required="" name="txt_email" value="<%=ema%>"  >
                     </td>
                </tr>
               
                <tr>
                    <td>Logo:</td><td>
                    <td><input type="file" required="" name="txtphoto"></td>
                  
                </tr>
               
                
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SAVE">
                          <input type="submit"  formaction="companyHome.jsp" name="btn_reset" value="CANCEL">
                    </td>
                <a href="../company/companyHome.jsp">My Home</a>
                </tr>
               
                        </table>
        </form>
                    
    </body>
</html>


