<%@include file='aheader.jsp' %>
<%
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");  
            
if(user2!=null)
{
    %>
    <html>
        <head>
            <title>student_approval list</title>
            <link rel="stylesheet" type="text/css" href="css/sheet.css">
        </head>
        <body>
    
        <center>
            <div>
                <h2><B>STUDENTS</B></h2></div>
            <div style="padding-top:30px"><form action="searchstudent.jsp" method="post">
                SEARCH STUDENT : <input   type="text" size="50" name="search" placeholder="Enter Student Name / Email Id" required>
                <input style="background-color:green;color:white;" type="submit" value="SEARCH"></form>
            </div>
            <div>
                
            </div>
            <div style="padding-top:30px">
            <table border="1">
                <tr>
                    <td colspan="4" align="center">LIST OF STUDENTS </td>
                </tr>
                
                <tr align="center">
                   
                   <td>EMAIL</td>
                   <td>DELETE</td>
                   <td>VIEW DETAILS</td>
                           </tr>
               <%
                   try
                   {
                       Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from LOGINDATA_TABLE";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        ResultSet rs = pst2.executeQuery();
                        while(rs.next())
                        {
                            
                            %>
               <tr align="center">
                  
                   <td><%=rs.getString("EMAIL")%></td>
                   <td><a href="deletestudent.jsp?student=<%=rs.getString("EMAIL")%>"><input type="button" value="DELETE"></a></td>
                   <td><a href="viewstudent.jsp?student=<%=rs.getString("EMAIL")%>"><input type="button" value="VIEW"></a></td>
                           </tr>
                       <%
                        }
                    }
                   catch(Exception e)
                   {
                       
                   }
               %>
            </table>
            </div>
        </center>
        
        
        
        
        </body></html>
    <%
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>