<%-- 
    Document   : College
    Created on : Feb 14, 2018, 10:33:46 AM
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
            function getUniversity(v)
            {
//                        alert(v);
             $.ajax({url: "ajax_university.jsp?id="+v, success: function(result){
        $("#university").html(result);
    }});
            }
                </script>
           
           
    </head>
    <%
        String unID = "",universityId = "", universityname = "", unPlace = "", unMail = "", unCont = "", cId = "", unName = "",Category="",runby="",startdate="",places="";
        if (request.getParameter("btnsub") != null) {

            if (!request.getParameter("hid").equals("")) {
                String name = request.getParameter("txtname");
                String place = request.getParameter("txtquery");
                
           
                String email = request.getParameter("txtemail");
                String contact = request.getParameter("txtcontact");
                String category=request.getParameter("txtcategory");
                String runBy=request.getParameter("txtrunby");
                 String start1=request.getParameter("txtstartdate");
               String place1=request.getParameter("txtplace");
                             String university = request.getParameter("university");
                String upQry = "update tbl_Colg set university_id='"+university+"',colg_name ='" + name + "',colg_adrs='" + place+ "',colg_email='" + email + "',colg_ph='" + contact + "',country_id='" + request.getParameter("country") + "',colg_category='"+request.getParameter("category") + "',colg_runby='"+runBy+"',colg_place='"+place1+"',colg_startdate='"+start1+"' where colg_id='" + request.getParameter("hid") + "'";

                boolean b = c.executeCommand(upQry);
                if (b == true) {
//                    out.println("Sucess");
                    response.sendRedirect("College.jsp");
                } else {
                    out.println(upQry);
                    
                }
            } else {
                String University = request.getParameter("university");
                             
                String Uname = request.getParameter("txtname");
                String Uplace = request.getParameter("txtquery");
                System.out.println("Address:"+Uplace);
                String Uplaces = request.getParameter("txtplaces");
                String Ustartdate = request.getParameter("txtstartdate");
                String Uemail = request.getParameter("txtemail");
                String Ucontact = request.getParameter("txtcontact");
                String Uid = request.getParameter("country");
                String Category1=request.getParameter("category");
                String runBy = request.getParameter("txtrunby");
                String insQuery = "insert into tbl_colg (university_id,colg_name,country_id,colg_adrs,colg_ph,colg_email,colg_category,colg_runby,colg_place,colg_startdate) values ('" + University + "','" + Uname + "','" + Uid + "','" + Uplace + "','" + Ucontact + "','" + Uemail + "','"+Category1+"','"+runBy+"','"+Uplaces+"','"+Ustartdate+"')";
//         System.out.println("INSERT\t"+insQuery);
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
            response.sendRedirect("College.jsp");
        }
        if (request.getParameter("eid") != null) {
            String selq = "select * from tbl_colg u inner join tbl_country c on u.country_id=c.country_id where u.colg_id='" + request.getParameter("eid") + "'";

            ResultSet rs2 = c.selectCommand(selq);

            while (rs2.next()) {
                unID = rs2.getString("colg_id");
                unName = rs2.getString("colg_name");
                cId = rs2.getString("country_id");
                unPlace = rs2.getString("colg_adrs");
                places=rs2.getString("colg_place");
                startdate=rs2.getString("colg_startdate");
                
                unMail = rs2.getString("colg_email");
                unCont = rs2.getString("colg_ph");
                Category=rs2.getString("colg_category");
                runby=rs2.getString("colg_runby");
                 universityname = rs2.getString("university_id");
               
            }
        }


    %>
    <body>

        <form method="post">
            <h1 align="center">COLLEGE</h1>
            <input type="hidden" name="hid" value="<%=unID%>"/>
            <table align="center">


                <tr>
                    <td>
                        Country
                    </td>
                    <td>
                        <select name="country" required="" onchange="getUniversity(this.value)">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_country where country_id !='1'";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("country_id")%>"  <% if(cId.equals(rs.getString("country_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("country_name")%>
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
                        <select name="category" required="">
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
                    <td><input type="text" name="txtname" required="" pattern="[A-Za-z.\ ]{5,20}" value="<%=unName%>" /></td>
                </tr>
                <tr>
                    <td>
                        University
                    </td>
                    <td>
                        <select name="university" id="university" required="" >
                            <option>--select--</option>
                            <%                           
                                String sel1 = "select * from tbl_university";
                               
                                ResultSet rs1 = c.selectCommand(sel1);
                                while (rs1.next()) 
                                {

                            %>
                            <option value="<%=rs1.getString("university_id")%>"  <% if(universityname.equals(rs1.getString("university_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs1.getString("university_name")%>
                                        </option>

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td>Address :</td>
                <td><textarea name="txtquery" required="" pattern="[A-Za-z\ ]{1,50}"><%=unPlace%> </textarea></td>
            </tr>
                
                <tr>
                    <td> Start Date:</td>
                    <td><input type="date" name="txtstartdate" required=""  value="<%=startdate%>"/></td>
                </tr>
                <tr>
                    <td> Place:</td>
                    <td><input type="text" name="txtplace" required="" pattern="[A-Za-z\ +]{2,20}"  value="<%=places%>"/></td>
                </tr>
                <tr>
                    <td> Email:</td>
                    <td><input type="email" name="txtemail" required=""  value="<%=unMail%>" /></td>
                </tr>
                <tr>
                    <td> Contact Number:</td>
                    <td><input type="number" name="txtcontact"  rrequired="" pattern="[0-9+]{10,13}"  value="<%=unCont%>"></td>
                </tr>
                <tr>
                    <td> Owned By:</td>
                    <td><input type="text" name="txtrunby" required="" pattern="[A-Za-z.\ ]{5,20}"   value="<%=runby%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>Name</th>
                <th>Address</th>
                <th>Start Date</th>
                <th>Place</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Country</th>
                <th>Category</th>
                <th>Owned By</th>
                 <th> University</th>
                <%
                    int i = 1;
                    String sel33 = "select * from tbl_colg u, tbl_country c,tbl_university un  where u.country_id=c.country_id and un.university_id=u.university_id";
                    ResultSet rs13 = c.selectCommand(sel33);
                    while (rs13.next()) {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs13.getString("colg_name")%></td>
                    <td><%=rs13.getString("colg_adrs")%></td>
                    <td><%=rs13.getString("colg_startdate")%></td>
                    <td><%=rs13.getString("colg_place")%></td>
                    <td><%=rs13.getString("colg_email")%></td>
                    <td><%=rs13.getString("colg_ph")%></td>
                    <td><%=rs13.getString("country_name")%></td>
                     <td><%=rs13.getString("colg_category")%></td>
                     <td><%=rs13.getString("colg_runby")%></td>
                     <td><%=rs13.getString("university_name")%></td>
                    <td><a href="College.jsp?eid=<%=rs13.getString("colg_id")%>">EDIT</a></td><br>

                <td><a href="College.jsp?did=<%=rs13.getString("colg_id")%>">Delete</a></td>

                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
