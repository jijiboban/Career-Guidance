<%-- 
    Document   : studentQualification
    Created on : Mar 2, 2018, 11:01:41 AM
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
        <script src="jq.js" type="text/javascript"></script>
        <script>
            function getStream(v)
            {
                       //alert(v);
             $.ajax({url: "ajax_stream.jsp?id="+v, success: function(result){
        $("#stream").html(result);
    }});
            }
                </script>
           
           <script>
            function getStreamsubject(d)
            {
//                     alert(d);
             $.ajax({url: "ajax_streamsubject.jsp?did="+d, success: function(result){
        $("#streamsubject").html(result);
    }});
            }
                </script>
            
        
        
        
        
        
    </head>
    <%
        String pId="",dId="";
    if (request.getParameter("btnsub") != null) {
        String Uname = request.getParameter("txtname");
         String Uregno = request.getParameter("txtregno");
         String Umark = request.getParameter("txtmarks");
         String Uper = request.getParameter("txtper");
          String stream=request.getParameter("stream");
//          String qtype=request.getParameter("qualtype");
          
          String streamsubject=request.getParameter("streamsubject");
           String insQuery = "insert into tbl_studqual (stud_id,studqual_institute,studqual_regno,studqual_total,studqual_percentage,class_id,course_id) values ('" +session.getAttribute("user_id") + "','"+Uname+ "', '" + Uregno + "','" + Umark + "','" + Uper + "','"+stream+"','"+streamsubject+"')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) {
                    out.println("success");
                } else {
                    out.print(insQuery);
                    out.println("failed");
                }

            }
//            cId = request.getParameter("qtype_id"); 
//            pId= request.getParameter("stream_id");
//            dId= request.getParameter("streamsubject_id");
    %>
    <body>

        <form method="post">
            <h1 align="center">QUALIFICATION DETAILS</h1>
            <input type="hidden" name="hid" />
            <table align="center">


               
                
                
                
                 <tr>
                    <td>
                     Stream
                    </td>
                    <td>
                        <select name="stream" id="stream" onchange="getStreamsubject(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_type";
                                ResultSet rs1 = c.selectCommand(sel);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("type_id")%>"  <% if(dId.equals(rs1.getString("type_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("type_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    Subject
                    </td>
                    <td>
                        <select name="streamsubject" id="streamsubject">
                            <option>--select--</option>
                            <%                           
                                String sel21 = "select * from tbl_course";
                                ResultSet rs21 = c.selectCommand(sel21);
                                while (rs21.next()) {

                            %>
                            <option value="<%=rs21.getString("course_id")%>"  <% if(pId.equals(rs21.getString("course_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs21.getString("course_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                
                 <tr>
                    <td>Institution Name:</td>
                    <td><input type="text" name="txtname"/></td>
                </tr>
                <tr>
                    <td> Register Number:</td>
                    <td><input type="text" name="txtregno" ></td>
                </tr>
                <tr>
                    <td> Total Marks:</td>
                    <td><input type="text" name="txtmarks" ></td>
                </tr>
                
                <tr>
                    <td> Percentage</td>
                    <td><input type="text" name="txtper" ></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                    
                </tr>
            </table>
            
                    

               

           

        </form>
    </body>
</html>

