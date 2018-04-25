<%-- 
    Document   : optionDetails
    Created on : Feb 28, 2018, 12:18:22 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="jq.js" type="text/javascript"></script>
         <script>
            function getQuestion(v)
            {
                       //  alert(v);
             $.ajax({url: "ajax_question.jsp?id="+v, success: function(result){
        $("#question").html(result);
    }});
            }
                </script>
        
        
        
        
    </head>
    <%
        String qName="",optID="",Option="",isAns="",cId="",dId="";
        String intId="";
        if(request.getParameter("btnsubmit") != null)
            {
                if(!request.getParameter("hid").equals(""))
                {
                   
                    String optname=request.getParameter("txtoption");
                    String q=request.getParameter("selQuestion");
                    String answer=request.getParameter("isAnswer");
                    
                    String upQuery="update tbl_option set option_name='"+optname+"',ques_id='"+q+"',option_answer='"+answer+"'where option_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.executeCommand(upQuery);
                    
                    if(b == true)
                    {
                        response.sendRedirect("optionDetails.jsp");
                    }
                    else
                    {
                        out.println(upQuery);
                    }
                    
                }
                else
                {
                    String optName=request.getParameter("txtoption");
                    String qestion=request.getParameter("selQuestion");
                    String isAnswer=request.getParameter("isAnswer");

                    String insQuery="insert into tbl_option(option_name,ques_id,option_answer) values ('"+optName+"','"+qestion+"','"+isAnswer+"')";
                    boolean b=obj.executeCommand(insQuery);

                    if( b== true)
                    {
                        response.sendRedirect("optionDetails.jsp");
                    }
                    else
                    {
                        out.println(insQuery);
                    }
                }

        }
          if (request.getParameter("delid") != null)
          {
                  String del = "delete from tbl_option where option_id='" + request.getParameter("delid") + "'";
                  boolean b = obj.executeCommand(del);
                  response.sendRedirect("optionDetails.jsp");

           }
           if (request.getParameter("edid") != null) 
           {
                  String selQuery = "select * from tbl_option o inner join tbl_question q on q.ques_id=o.ques_id where option_id='" + request.getParameter("edid") + "'";

                  ResultSet rs1 = obj.selectCommand(selQuery);
                  if (rs1.next()) 
                  {
                      optID = rs1.getString("option_id");
                      
                      Option = rs1.getString("option_name");
                      qName = rs1.getString("ques_id");
                      isAns=rs1.getString("option_answer");
                      intId=rs1.getString("coursetype_id");

                  }

              }
    
        
    
    
    %>
    
    <body>
        <form method="post">
            <h2 align="center">Add options</h2>
            <input type="hidden" name="hid" value="<%=optID%>">
            <table align="center">
                
                
                  <tr>
                    <td>
                     Select Interest
                    </td>
                    <td>
                        <select name="interest" required="" onchange="getQuestion(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_coursetype";
                                ResultSet rs = obj.selectCommand(sel1);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("coursetype_id")%>"  <% if(intId.equals(rs.getString("coursetype_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("coursetype_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                
                
                 <tr>
                    <td>
                      Question
                    </td>
                    <td>
                        <select name="selQuestion" required="" id="question">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_question";
                                ResultSet rs1 = obj.selectCommand(sel);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("ques_id")%>"  <% if(qName.equals(rs1.getString("ques_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("ques_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                
                
                
                
                
                
                
                
                
                
                
               
                <tr>
                    <td>Option</td>
                    <td><textarea name="txtoption" required="" value="<%=Option%>"></textarea></td>
                </tr>
                <tr>
                    <td>Is answer?</td>
                    <td align="center">
                        <input type="radio" name="isAnswer" value="1" <%if(isAns.equals("1")) {%> checked="" <%}%> required=""/>Yes
                        <input type="radio" name="isAnswer" value="0"  <%if(isAns.equals("0")) {%> checked="" <%}%>/>No
                    </td>
                    
                </tr>
                 <tr>
                    <td align="center"><input align="center" type="submit" name="btnsubmit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
                </tr>
                        
            </table>
            <table border="1" align="center">
                
                <th>Sl.No</th>
                <!--<th>Interest</th>-->
                
                <th>Question</th>
                <th>Option</th>
                <th>IsAnswer</th>
                <% 
                 int i=1;
                 String sel222="select * from tbl_question q,tbl_option o where q.ques_id=o.ques_id";
                 ResultSet rs11=obj.selectCommand(sel222);
                 while(rs11.next())
                 {
                     String ans="",ansYesNo="";
                     
                     ans=rs11.getString("option_answer");
                     
                     if(ans.equals("1"))
                     {
                         ansYesNo="Yes";
                     }
                     else
                     {
                         ansYesNo="No";
                     }
                     
                             
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                       
                        <td><%=rs11.getString("ques_name")%></td>
                         <td><%=rs11.getString("option_name")%></td>
                        <td><%=ansYesNo%></td>
                        <td><a href="optionDetails.jsp?delid=<%=rs11.getString("option_id")%>">Delete</a></td>
                        <td><a href="optionDetails.jsp?edid=<%=rs11.getString("option_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
            
        </form>
    </body>
</html>
