<%-- 
    Document   : ExamResult
    Created on : Mar 15, 2018, 3:54:36 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //select type_id from tbl_type t inner join tbl_class c on t.class_id=c.class_id where c.class_id=3
    
    String question="",option="",answer="";
    int count=0,qCount=0,tot=0,neg=0;
    
    
    
    String selQry1="select * from tbl_exam e inner join tbl_examquestions eq on e.exam_id=eq.exam_id where e.exam_id='"+session.getAttribute("ExamID")+"' and e.stud_id='"+session.getAttribute("user_id")+"'";
    ResultSet rs1=obj.selectCommand(selQry1);
    System.out.println(selQry1);
    while(rs1.next())
    {
        question=rs1.getString("q_id");
        qCount=qCount+1;
        
        
        String selQry2="select * from tbl_examquestions eq inner join tbl_option o on eq.opt_id=o.option_id where eq.q_id='"+question+"' and eq.exam_id='"+session.getAttribute("ExamID")+"'";
        ResultSet rs2=obj.selectCommand(selQry2);
        System.out.println(selQry2);
        if(rs2.next())
        {
           // option=rs2.getString("opt_id");
            answer=rs2.getString("option_answer");
            if(answer.equals("1"))
            {
                tot=tot+4;
                count=count+4;
            }
            else
            {
                neg=neg+1;
                count=count-1;
            }
            
            
            
            
        }
    }
   // out.println(count);
    
    
    String insQuery="update tbl_exam set exam_mark='"+count+"' where exam_id="+session.getAttribute("ExamID");
    boolean b=obj.executeCommand(insQuery);
    if(b == true)
    {
       // response.sendRedirect("Eresult.jsp");
    }
    else
    {
        out.println(insQuery);
    }
   


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2 align="center">RESULT</h2>
        
       
          
                <table align=center border="1" width="40%" cellpadding="8">
                  
                    <tr>
                        <td  width="40">No. of Questions Attended</td>
                        <td width="10"><%=qCount%></td>
                    </tr>
                    <tr>
                        <td width="40">Marks</td>
                        <td width="10"><%=tot%></td>
                    </tr>
                   <tr>
                        <td width="40">Negative mark</td>
                        <td width="10"><%=neg%></td>
                    </tr>
                    <tr>
                        <th width="40" style="color: blueviolet">Final Result</th>
                        <th width="10" style="color: blueviolet"><%=count%></th>
                    </tr>
                </table>
            
    </body>
</html>
