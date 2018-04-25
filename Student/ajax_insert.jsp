<%-- 
    Document   : ajax_insert
    Created on : Mar 14, 2018, 2:20:40 PM
    Author     : jiji
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
<%
    String qid=request.getParameter("qid");
    String opt=request.getParameter("id");
    System.out.println("ques"+qid);
    System.out.println("opt"+opt);
    
    String examqid="";
    String sel="select examQ_id from tbl_examquestions where exam_id='"+session.getAttribute("ExamID")+"' and q_id='"+qid+"'";
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
        examqid=rs.getString("examQ_id");
        String update="update tbl_examquestions set opt_id='"+opt+"' where examQ_id="+examqid;
        obj.executeCommand(update);
        System.out.println(update);
    }
    else
    {
    
    
    String ins="insert into tbl_examquestions(exam_id,q_id,opt_id) values('"+session.getAttribute("ExamID")+"','"+qid+"','"+opt+"')";
    System.out.println(ins);
    obj.executeCommand(ins);
    }

%>
        
        
        
        
        
        
        
        
        
        
        
