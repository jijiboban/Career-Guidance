<%-- 
    Document   : PostQuery
    Created on : Mar 12, 2018, 11:24:00 AM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        
    if (request.getParameter("btnsub") != null) {
                     
//                out.print(dateFormat.format(date));

        String Pques = request.getParameter("txtquery");
        
         
           String insQuery = "insert into tbl_post (pques_date,stud_id,question,status) values (curdate(),'" +session.getAttribute("user_id") + "','"+Pques+ "','0')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) {
//                    out.println("success");
                } else {
                    out.print(insQuery);
                    out.println("failed");
                }

            }
    if(request.getParameter("eid")!= null){
     response.sendRedirect("ViewReplay.jsp");
    }
    
    
    
    %>
    <body>
   <form method="post">
            <h1 align="center">POST QUERY</h1>

            
             <table align="center" cellpadding="8" bgcolor="#f111" width="70%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
              
              <%
      int i=1;
      String sel="select * from tbl_post p inner join tbl_studreg s on p.stud_id=s.stud_id";
      ResultSet rs=c.selectCommand(sel);
      while(rs.next())
      {    %>
                <tr>
               
                    <td><%=rs.getString("stud_name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><%=rs.getString("question")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Posted On<%=rs.getString("pques_date")%>
               <br><%=rs.getString("replay")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Replayed On<%=rs.getString("pques_date")%></td>
                        
                   
                     
                </tr>
                <%
                i++;
                }
      %>
               </table>
             
            
            
              <table align="center">
             
            <tr>
                <td>
                    Query
                </td>
                <td><textarea name="txtquery" required="" ></textarea></td>
            </tr>
             <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
             </table>
        
               </form> 
         
         
    </body>
</html>
