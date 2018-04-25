<%-- 
    Document   : editprofile
    Created on : Feb 28, 2018, 8:45:53 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student:EditProfile</title>
    </head>
    <body>
                 <%
    
             String studId="" , cid=""; 
            String studName="" , cName="";
            String age="", agee= "",qualtype="",qual="";
            String Contact="" , Cno="";
            String Email="" ,ema="";
//            String Logo="", logo="";
            String Address="", addr="";
//            String Proof="", pro=""; 
   
   

if (request.getParameter("btn_submit") != null) {
                
                coName=request.getParameter("txt_cname");
                Contact=request.getParameter("txt_cno");
                Email=request.getParameter("txt_email");
                Address=request.getParameter("txt_adds");
                qu=request.getParameter("txt_qual"); 
                 
   
    if(request.getParameter("hid")!=null)
    {
        String up="update coordinator set co_name='"+coName+"',co_adrs='"+Address+"',co_ph='"+Contact+"',co_email='"+Email+"',co_qual='"+qu+"' where co_id='" +session.getAttribute("co_id") + "' ";
        boolean b = obj.executeCommand(up);
        if (b) {
            %>
         
            <script>
                alert("Profile Updated..");
            
                </script>
                <%
            response.sendRedirect("HomePage.jsp");
                
        %>
      
        <%
                       
                    } else {
                        out.println(up);
                    }

                } 
    
}
 String selQry11 = "select * from tbl_studreg s,tbl_studqual st where s.stud_id=st.stud_id and s.stud_id='" +session.getAttribute("user_id") + "'";
              
                        ResultSet rs11=obj.selectCommand(selQry11);
            if(rs11.next())
                {
  
                    
                  cName=rs11.getString("co_name");
                  addr=rs11.getString("co_adrs");
                 
                   Cno=rs11.getString("co_ph");
                  ema=rs11.getString("co_email");
                   qual=rs11.getString("co_qual");
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
                        <input type="number" name="txt_cno" required="" pattern="[0-9]{10,13}"  value="<%=Cno%>" >
                    </td>
                </tr>
                 <tr>
                    <td>Age</td>
                    <td>
                        <input type="text"  required="" pattern="[0-9]{2}"  name="txt_cno" value="<%=Cno%>" >
                    </td>
                </tr>
                <tr>
                    <td>Email:</td><td>
                        <input type="email" required="" name="txt_email" value="<%=ema%>"  >
                     </td>
                </tr>
                 <tr>
                    <td>
                     Qualification Type
                    </td>
                    <td>
                        <select name="qualtype" required="" onchange="getStream(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_qualtype";
                                ResultSet rs = obj.selectCommand(sel1);
                                while (rs.next())
                                {

                            %>
                            <option value="<%=rs.getString("qualtype_id")%>"  <% if(studId.equals(rs.getString("qualtype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("qualtype_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SAVE">
                          <input type="submit"  formaction="HomePage.jsp" name="btn_reset" value="CANCEL">
                    </td></tr>
               
                        </table>
        </form>
                    
    </body>
</html>

