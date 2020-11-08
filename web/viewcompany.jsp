<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
    </head>
    <body>
        <%@include file='aheader.jsp' %>
            <%
                String viewcompany = request.getParameter("id");
                String user2 = (String) session.getAttribute("usernameadmin");
                String pas2 = (String) session.getAttribute("password");  
                if(user2!=null)
                {
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from RECRUITER_DATA where COMPANY_MAIL=?";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1,viewcompany);
                        ResultSet rs = pst2.executeQuery();
                        while(rs.next())
                        {
                            String a = rs.getString("COMPANY_MAIL");
                    %>
                    <div>
                        <ul>
                            <li><a href="recruiter2_mydrives.jsp?id=<%=a%>">DRIVES OF THE COMPANY</a></li>
                        </ul>
                    </div>
                    <center>
                    <div>
                        <center><h2><b><%=rs.getString("COMPANY_NAME")%></b></h2></center>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td>NAME OF THE COMPANY : </td>
                                <td><%=rs.getString("COMPANY_NAME")%></td>
                            </tr>
                            <tr>
                                <td>MAIL ID OF THE COMPANY : </td>
                                <td><%=rs.getString("COMPANY_MAIL")%></td>
                            </tr>
                            <tr>
                                <td>NAME OF THE H.R : </td>
                                <td><%=rs.getString("HR_NAME")%></td>
                            </tr>
                            <tr>
                                <td>ID OF THE H.R : </td>
                                <td><%=rs.getString("HR_ID")%></td>
                            </tr>
                            <tr>
                                <td>ADDRESS OF THE COMPANY : </td>
                                <td><%=rs.getString("COMPANY_ADDRESS")%></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><a href="deleterecruiter.jsp?id=<%=a%>"><input type="button" value="DELETE"></a></td>
                            </tr>
                        </table>
                    </div>
                    <table>
                    </center>
                    <%
                        }
                        }
                        catch(Exception e) {
                                out.println("Exception : "+e);
                                }
                }
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
            %>
    
        
    </body>
</html>