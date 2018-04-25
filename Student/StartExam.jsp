<%-- 
    Document   : StartExam
    Created on : Mar 14, 2018, 2:19:53 PM
    Author     : jiji
--%>

<%@page import="java.util.ArrayList"%>
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

    
    function getQuestion()
            {
               count=parseInt(document.getElementById("hcount").value);
              // count=document.getElementById("hcount").value;
                totalcount=document.getElementById("htotalcount").value;
              
                count1 = count + 1;
             
                
                if(totalcount < count1)
                {
                   
                }
                else
                {
                   
                    document.getElementById("hcount").value=count1;
                    
                    
                     $.ajax(
                            
                             {
                                 url: "ajax_question.jsp?id="+count1,
                                 success: function(result)
                                 {
                                    $("#questions").html(result);
                                 }
                               }
                            );
            
                    
                }
                
                
            }
            function getPrev()
            {
                count=parseInt(document.getElementById("hcount").value);
               
                totalcount=document.getElementById("htotalcount").value;
                
                count1=count - 1;
                
                if(count1 < 0)
                {
                    
                }
                else
                {
                    document.getElementById("hcount").value=count1;
                   
                   
                     $.ajax(
                             
                            
                             { 
                                 url: "ajax_question.jsp?id="+count1,
                                 success: function(result)
                                 {
                                                                                                                 
                                 
                                    $("#questions").html(result); 
                                  
                                 }
                               }
                            );   
                }
                
                
            }
            
            
       
            function insertOptions()
            {
                
                var selectedAnswer=$("input[name=answer]:checked").val();//the previous answer is checked on the previous button 
                
                
                var qId=document.getElementById("quests").value;
//                var opt=document.getElementById("answer").value;

//                alert("opt"+selectedAnswer+"ques"+qId);
                 $.ajax(
                            
                             {
                                 url: "ajax_insert.jsp?id="+selectedAnswer+"&qid="+qId,
                                 success: function(result)
                                 {
//                                    getQuestion();
                                 }
                               }
                            );
                
            }
        </script>
    </head>
    <body onload="getQuestion()">
        
        <%
            
            
            ArrayList<Integer> QuestionID=new ArrayList<Integer>();
            
            String interestID="";
            
                
                String selQry1="select ques_id from tbl_question where coursetype_id='"+session.getAttribute("interest")+"' and class_id='"+session.getAttribute("class")+"'";
                System.out.println(selQry1);
                ResultSet rs1=obj.selectCommand(selQry1);
                while(rs1.next())
                {
                    QuestionID.add(rs1.getInt("ques_id"));
                }
            
            
               session.setAttribute("qId",QuestionID );
      
          
              int totalCount=5,Count=-1;
              
             session.setAttribute("totc", totalCount);
              
              int tc=totalCount+1;
              session.setAttribute("tc", tc);
        
        %>
        <div id="questions">
            
        </div>
        <div>
        <input type="hidden" name="hcount" value="<%=Count%>" id="hcount">
        <input type="hidden" name="htotalcount" value="<%=totalCount%>" id="htotalcount">
        
        
        
        
        
        
        <input type="submit" name="btnPrevious" value="PREVIOUS" onclick="getPrev()">
        <input type="submit" name="btnNext" value="NEXT" onclick="getQuestion()">
        <!--<input type="button" name="btnSubmit" value="SAVE" onclick="insertOptions(answer.value)">answer: radio button in ajax_question-->
        </div>

    </body>
</html>

