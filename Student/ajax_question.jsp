<%-- 
    Document   : ajax_question
    Created on : Mar 14, 2018, 2:20:22 PM
    Author     : jiji
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.ConnectionClass" id="obj"></jsp:useBean>
    <script src="jq.js" type="text/javascript"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    ArrayList<Integer> a=(ArrayList<Integer>)session.getAttribute("qId");//convert qId of type string to atrraylist of integer
    
    
    int id,qids;
    String question="";
    System.out.println("qusid"+request.getParameter("id"));
    String aa=request.getParameter("id");
    
    id=Integer.parseInt(aa);
      
   
   
   
   Object qqs=session.getAttribute("totc");
  int qno=id+1;
Object qq=(Object)qno;
System.out.println("id"+qq);
System.out.println("tot"+qqs);
    if(qq==qqs)
    {
        %>
        <h1 align="center" style="color: green">Exam Completed..Click Finish Exam Link to see your Result</h1>
        <h1 align="center" style="color: Red"><a href="Eresult.jsp">Finish Exam</a></h1>
          <%
    }
    
    else
    {
    qids=a.get(id);  
    
    String selQry="select * from tbl_question where ques_id='"+qids+"'";
    System.out.println(selQry);
    ResultSet rs=obj.selectCommand(selQry);
    if(rs.next())
    {
        question=rs.getString("ques_name");
        
    }
    


%>
<input type="hidden" id="quests" name="quests" value="<%=qids%>">
<table align="center">
    <tr>
    
        <td><%=qno%>. <%=question%></td>
    </tr>
    <%
        String optMarked="";
        String select="select opt_id from tbl_examquestions eq inner join tbl_exam e on eq.exam_id=e.exam_id  where eq.q_id='"+qids+"' and e.exam_id="+session.getAttribute("ExamID");
       System.out.println(select);
        ResultSet rss=obj.selectCommand(select);
        if(rss.next())
        {
            optMarked=rss.getString("opt_id");
            System.out.println(optMarked+"Previous");
        }
    
    
    
    
    
    
        String optId="";
        String sel="select option_id,option_name from tbl_option where ques_id='"+qids+"'";
        System.out.println(sel);
        ResultSet rs1=obj.selectCommand(sel);
        while(rs1.next())
        { 
            optId=rs1.getString("option_id");
            System.out.println(optId);
        
          %>
          <tr>
              <td><input type="radio" name="answer" onclick="insertOptions()" id="answer" <%if(optMarked.equals(optId)) {%>checked="checked" <%}%> value="<%=rs1.getString("option_id")%>" > <%=rs1.getString("option_name")%></td>
          </tr>
          
    
    
    
    <%
        }
    }
    %>
</table>

