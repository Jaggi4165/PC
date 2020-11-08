<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
    </head>
    <body>
        <%@include file='aheader.jsp' %>
        
            <%
                String student = request.getParameter("student");
                String user2 = (String) session.getAttribute("usernameadmin");
                String pas2 = (String) session.getAttribute("password");  
                if(user2!=null)
                {
                    
             try
             {
                 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
 String query1= "select * from STUDENT_DATA where EMAIL=?";
 PreparedStatement pst = con.prepareStatement(query1);
 pst.setString(1,student);
 ResultSet rs= pst.executeQuery();
 if(rs.next())
 {
     %>
     
     
     <div > <h4 align="center"><%=rs.getString(1) %><br>
             
        <table align="center" border="1" backgroundcolor="lightyellow">
                <tr align="center">
                    <td>NAME :</td>
                    <td><%=rs.getString(2) %></td>
                </tr>
                <tr align="center">
                    <td>GENDER :</td>
                    <td><%=rs.getString(3) %></td>
                </tr>
                <tr align="center">
                    <td>FATHER NAME :</td>
                    <td><%=rs.getString(4) %></td>
                </tr>
                <tr align="center">
                    <td>MOTHER NAME :</td>
                    <td><%=rs.getString(5) %></td>
                </tr>
                <tr align="center">
                    <td>DOB :</td>
                    <td><%=rs.getString(7) %></td>
                </tr>
                <tr align="center">
                    <td>MOBILE :</td>
                    <td><%=rs.getString(6) %></td>
                </tr>
                
                <tr align="center">
                    <td>ADDRESS :</td>
                    <td><%=rs.getString(8) %></td>
                </tr>
                <tr align="center">
                    <td>QUALIFICATION :</td>
                    <td><%=rs.getString(9) %></td>
                </tr>
                <tr align="center">
                    <td>SPECIALIZATION :</td>
                    <td><%=rs.getString(10) %></td>
                </tr>
                <tr align="center">
                    <td>YEAR OF PASSING :</td>
                    <td><%=rs.getString(12) %></td>
                </tr>
                <tr align="center">
                    <td>PERCENTAGE :</td>
                    <td><%=rs.getString(11) %></td>
                </tr>
                
 </div>
</table>
                <a href="admin_student.jsp"><input type="button" style="color:navy;" value="BACK"></a>
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