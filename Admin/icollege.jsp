<%-- 
    Document   : icollege
    Created on : Feb 22, 2018, 11:48:28 AM
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
            function getDistrict(v)
            {
                       //  alert(v);
             $.ajax({url: "ajax_district.jsp?id="+v, success: function(result){
        $("#district").html(result);
    }});
            }
                </script>
           
           <script>
            function getPlace(d)
            {
//                     alert(d);
             $.ajax({url: "ajax_place.jsp?did="+d, success: function(result){
        $("#place").html(result);
    }});
            }
                </script>
            
        
        
        
        
        
    </head>
    
    <%
        String dId="",pId="",universityId = "", universityname = "" ;
        String unID = "", unPlace = "", unMail = "", unCont = "", cId = "", unName = "",Category="",runby="",startdate="",places="";
        if (request.getParameter("btnsub") != null) {

            if (!request.getParameter("hid").equals("")) {
                String university = request.getParameter("university");
                String name = request.getParameter("txtname");
                String place = request.getParameter("txtplace");
                String email = request.getParameter("txtemail");
                String contact = request.getParameter("txtcontact");
                String category=request.getParameter("txtcategory");
                String runBy=request.getParameter("txtrunby");
                 String start1=request.getParameter("txtstartdate");
                String place1=request.getParameter("place");
               
                String upQry = "update tbl_Colg set university_id='"+university+"',colg_name ='" + name + "',colg_adrs='" + place+ "',colg_email='" + email + "',colg_ph='" + contact + "',place_id='"+place1+"',colg_category='"+request.getParameter("category") + "',colg_runby= '"+runBy+"',colg_startdate='"+start1+"' where colg_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) {
                    out.println("Sucess");
                    response.sendRedirect("icollege.jsp");
                } else {
                    out.println(upQry);
                    
                }
            } else {
                String Uname = request.getParameter("txtname");
                String Uplace = request.getParameter("txtplace");
                String Uplaces = request.getParameter("place");
                String Ustartdate = request.getParameter("txtstartdate");
                String Uemail = request.getParameter("txtemail");
                String Ucontact = request.getParameter("txtcontact");
//                String Uid = request.getParameter("state");
                String Category1=request.getParameter("category");
                String runBy = request.getParameter("txtrunby");
                String University = request.getParameter("university");
                String insQuery = "insert into tbl_colg (university_id,colg_name,colg_adrs,colg_ph,colg_email,colg_category,colg_runby,place_id,colg_startdate) values ('" + University + "','" + Uname + "','" + Uplace + "','" + Ucontact + "','" + Uemail + "','"+Category1+"','"+runBy+"','"+Uplaces+"','"+Ustartdate+"')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) {
                    out.println("success");
                } else {
                    out.print(insQuery);
                    out.println("failed");
                }

            }
        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_colg where colg_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("icollege.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selq = "select * from tbl_colg u inner join tbl_place c on u.place_id=c.place_id where u.colg_id='" + request.getParameter("eid") + "'";

            ResultSet rs2 = c.selectCommand(selq);

            while (rs2.next()) {
                unID = rs2.getString("colg_id");
                unName = rs2.getString("colg_name");
//                cId = rs2.getString("state_id");
                unPlace = rs2.getString("colg_adrs");
                pId=rs2.getString("place_id");
                   universityname = rs2.getString("university_id");
                startdate=rs2.getString("colg_startdate");
                
                unMail = rs2.getString("colg_email");
                unCont = rs2.getString("colg_ph");
                Category=rs2.getString("colg_category");
                runby=rs2.getString("colg_runby");
            }
        }


    %>
    <body>

        <form method="post">
            <h1 align="center"> COLLEGE</h1>
            <input type="hidden" name="hid" value="<%=unID%>"/>
            <table align="center">


                <tr>
                    <td>
                      State
                    </td>
                    <td>
                        <select name="state" required="" onchange="getDistrict(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_state";
                                ResultSet rs = c.selectCommand(sel1);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("state_id")%>"  <% if(cId.equals(rs.getString("state_id")))
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
                    <td>
                      District
                    </td>
                    <td>
                        <select name="district" id="district" required="" onchange="getPlace(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_district";
                                ResultSet rs1 = c.selectCommand(sel);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("district_id")%>"  <% if(dId.equals(rs1.getString("district_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("district_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                      Place
                    </td>
                    <td>
                        <select name="place" required="" id="place">
                            <option>--select--</option>
                            <%                           
                                String sel21 = "select * from tbl_place";
                                ResultSet rs21 = c.selectCommand(sel21);
                                while (rs21.next()) {

                            %>
                            <option value="<%=rs21.getString("place_id")%>"  <% if(pId.equals(rs21.getString("place_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs21.getString("place_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                
                
                
                
                
                
                
                <tr>
                    <td>
                        Category
                    </td>
                    <td>
                        <select name="category"required="">
                            <option>--select--</option>
                            
                            <option value="Mixed" <% if(Category.equals("Mixed"))
                                        {%>selected="true" <%}   %>    >
                                            Mixed
                                        </option>
                            <option value="Womens" <% if(Category.equals("Womens"))
                                        {%>selected="true" <%}  
                          //  out.print("2");
                                        %>    >
                                            Womens
                            </option>
                            <option value="Mens" <% if(Category.equals("Mens"))
                                        {%>selected="true" <%}   %>    >
                                            Mens
                                        </option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>College Name:</td>
                    <td><input type="text" name="txtname"  required="" pattern="[A-Za-z]{5,20}" value="<%=unName%>" /></td>
                </tr>
                <tr>
                    <td>
                        University
                    </td>
                    <td>
                        <select name="university" required="">
                            <option>--select--</option>
                            <%                           
                                String sel12 = "select * from tbl_university where country_id=1";
                                ResultSet rs12 = c.selectCommand(sel12);
                                while (rs12.next()) 
                                {

                            %>
                            <option value="<%=rs12.getString("university_id")%>"  <% if(universityname.equals(rs12.getString("university_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs12.getString("university_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> Address:</td>
                    <td><textarea name="txtplace" required="" pattern="[A-Za-z]{5,20}"  value="<%=unPlace%>"></textarea></td>
                </tr>
                <tr>
                    <td> Start Date:</td>
                    <td><input type="date" name="txtstartdate" required="" value="<%=startdate%>"/></td>
                </tr>
                
                <tr>
                    <td> Email:</td>
                    <td><input type="email" name="txtemail" required="" value="<%=unMail%>" /></td>
                </tr>
                <tr>
                    <td> Contact Number:</td>
                    <td><input type="number" name="txtcontact"  required="" pattern="[0-9+]{10,13}"  value="<%=unCont%>" required=""></td>
                </tr>
                <tr>
                    <td> Owned By:</td>
                    <td><input type="text" name="txtrunby" required="" pattern="[A-Za-z]{5,20}"  value="<%=runby%>" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="2" align="center">
                <th>Sl No</th>
                <th>Name</th>
                <th>Address</th>
                <th>Start Date</th>
                <th>Place</th>
                <th>Email</th>
                <th>Contact</th>
                
                <th>Category</th>
                <th>Owned By</th>
                   <th> University</th>
                <%
                    int i = 1;
                    String sel24 = "select * from tbl_colg u, tbl_place c,tbl_university un where u.place_id=c.place_id and un.university_id=u.university_id ";
                    ResultSet rs24 = c.selectCommand(sel24);
                    while (rs24.next()) {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs24.getString("colg_name")%></td>
                    <td><%=rs24.getString("colg_adrs")%></td>
                    <td><%=rs24.getString("colg_startdate")%></td>
                    <td><%=rs24.getString("place_name")%></td>
                    <td><%=rs24.getString("colg_email")%></td>
                    <td><%=rs24.getString("colg_ph")%></td>
                    
                     <td><%=rs24.getString("colg_category")%></td>
                     <td><%=rs24.getString("colg_runby")%></td>
                     <td><%=rs24.getString("university_name")%></td>
                    <td><a href="icollege.jsp?eid=<%=rs24.getString("colg_id")%>">EDIT</a></td><br>

                <td><a href="icollege.jsp?did=<%=rs24.getString("colg_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
