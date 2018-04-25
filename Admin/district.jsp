<%-- 
    Document   : district
    Created on : Feb 21, 2018, 12:33:26 PM
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
    </head>
    <script>
        function validate(){
    if (document.getElementById("stateId").selectedIndex == 0){
       alert("Select the State");
    }
    else {
//       alert("document.getElementById("stateId").options[document.getElementById("stateId").selectedIndex].value");
    }
}
    </script>
    <%
        String districtId = "", districtName = "", stateId = "", stateName = "";
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String name = request.getParameter("txtname");

                String upQry = "update tbl_district set district_name ='" + name + "',state_id='"+request.getParameter("stateId")+"' where district_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) 
                {
//                    out.println("Sucess");
                    response.sendRedirect("district.jsp");
                } 
                else 
                { 
                   out.println(upQry);
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
               
                String Uid = request.getParameter("stateId");

                String insQuery = "insert into tbl_district (district_name,state_id) values ('" + Uname + "','" + Uid + "')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) 
                {
//                    out.println("success");
                } 
                else 
                {
//                 out.println(insQuery);
                }

            }
        }
            if (request.getParameter("did") != null) 
            {
                String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("district.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_district u inner join tbl_state c on u.state_id=c.state_id where u.district_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = c.selectCommand(selq);

                while (rs2.next()) 
                {
                   districtId = rs2.getString("district_id");
                    districtName = rs2.getString("district_name");
                    stateName = rs2.getString("state_id");
                   
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">DISTRICT</h1>
        <input type="hidden" name="hid" value="<%=districtId%>"/>
            <table align="center">
                
                
                <tr>
                    <td>
                        State
                    </td>
                    <td>
                        <select name="stateId" id="stateId" required="">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_state";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                             %>
                            <option value="<%=rs.getString("state_id")%>"  <% if(stateName.equals(rs.getString("state_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("state_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td> District:</td>
                <td><input type="text" name="txtname" required="" pattern="[A-Za-z]{5,20}"  value="<%=districtName%>" /></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" onclick="javascript:validate();" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>State</th>
               
                <th>District</th>


                <%
                    int i = 1;
                    String sel1 = "select * from tbl_district u, tbl_state c where u.state_id=c.state_id";
                    ResultSet rs1 = c.selectCommand(sel1);
                    while (rs1.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    
                   
                    <td><%=rs1.getString("state_name")%></td>
                    <td><%=rs1.getString("district_name")%></td>
                    <td><a href="district.jsp?eid=<%=rs1.getString("district_id")%>">EDIT</a></td><br>
                 
                     <td><a href="district.jsp?did=<%=rs1.getString("district_id")%>">Delete</a></td>

                    
                       

                    


                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
