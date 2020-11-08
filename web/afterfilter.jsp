<%@include file='aheader.jsp' %>
<%
    String sex = request.getParameter("gender");
    String qual = request.getParameter("qual");
    String special = request.getParameter("special");
    String percent = request.getParameter("percent");
    String year = request.getParameter("yop");
    String exp = request.getParameter("exp");

    String user2 = (String) session.getAttribute("usernameadmin");
    String pas2 = (String) session.getAttribute("password");

    if (user2 != null) { %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
    </head>
    <body>
            <center>
                <div>
                    <h2><B>SEARCH</B></h2></div>
                <div style="padding-top:30px">
                    <form action="afterfilter.jsp" method="get">


                        <div>

                            <table>

                                <tr>
                <td>GENDER </td>
                <td><input type="radio" value="male" name="gender" />Male
                    <input type="radio" value="female" name="gender" />Female</td>
            </tr>

                                <tr>
                                    <td>QUALIFICATION</td>
                                    <td><select name="qual" required>
                                            <option name="qual" ><%=qual%></option>
                                            <option name="one" value="3-YEARS DEGREE">3-YEARS DEGREE</option>
                                            <option name="two" value="B.TECH">B.TECH</option>
                                            <option name="three" value="MASTER OF COMPUTER APPLICATIONS">MASTER OF COMPUTER APPLICATIONS</option>
                                            <option name="four" value="MSC">MASTER OF SCIENCE</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>SPECIALIZATION</td>
                                    <td><select name="special" required>
                                            <option name="special"><%=special%></option>
                                            <option name="ekh" value="MATHEMATICS">MATHEMATICS</option>
                                            <option name="dho" value="STATASTICS">STATASTICS</option>
                                            <option name="theen" value="PHYSICS">PHYSICS</option>
                                            <option name="char" value="CHEMISTRY">CHEMISTRY</option>
                                            <option name="panch" value="COMPUTER SCIENCE">COMPUTER SCIENCE</option><select></td>
                                                </tr>
                                                <tr>
                                                    <td>PERCENTAGE</td>
                                                    <td><input type="number" id="percent" name="percent" value="<%=percent%>" required/></td>
                                                </tr>
                                                <tr>
                                                    <td>YEAR_OF_PASSING</td>
                                                    <td><input type="number" id="yop" name="yop" value="<%=year%>" required/></td>
                                                </tr>
                                                

                                                </table><br>

                                                </div>      
                                                <input style="background-color:green;color:white;" type="submit" value="SEARCH">
                                                </div>
            </form>
                                                <%
                                                    try {
                                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                                                        String query1 = "select * from STUDENT_DATA where (gender=? AND heighest_qualification=? AND specialization=? AND percentage>=? AND year_of_passing=?)";
                                                        PreparedStatement pst = con.prepareStatement(query1);
                                                        pst.setString(1, sex);
                                                        pst.setString(2, qual);
                                                        pst.setString(3, special);
                                                        pst.setString(4, percent);
                                                        pst.setString(5, year);
                                                        
                                                        ResultSet rs = pst.executeQuery();
                                                        %><div><table border="1">
                                                        <tr align="center">
                                                            <td>NAME OF THE STUDENT</td>
                                                            <td>MAIL ID</td>
                                                            <td>BRANCH</td>
                                                        </tr>
                                                    <%
                                                        while(rs.next()) {
                                                %>

                                                        <tr align="center">
                                                            <td><%=rs.getString(2)%></td>
                                                            <td><%=rs.getString(1)%></td>
                                                            <td><%=rs.getString(9)%></td>
                                                        </tr>
                                                <%
                                                 }
                                                %><tr><td colspan="3" align="center"><input type="button" value="DOWNLOAD"></input></td></tr></table></div><%
                                                    } catch (Exception e) {
out.println("error is : "+e);
                                                       
                                                    }


                                                %>
                                                <div>
                                                    <%    }
else {
 response.sendError(407, "Need Authentication...! Please Re-Login");
}
                                                    %>