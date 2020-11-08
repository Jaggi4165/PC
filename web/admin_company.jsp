<%@page import="java.sql.*"%>
<%@include file='aheader.jsp' %>
<%
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");  
            
if(user2!=null)
{
    %>
    <html>
        <head>
            <title>company_approval list</title>
            <link rel="stylesheet" type="text/css" href="css/sheet.css">
        </head>
        <body>
    
        <center>
            <div>
                <h2><B>COMPANIES</B></h2>
            </div>
            <div style="padding-top:30px"><form action="searchcompany.jsp" method="post">
                SEARCH COMPANY : <input   type="text" size="50" name="search" placeholder="Enter Company Name / Email Id" required>
                <input style="background-color:green;color:white;" type="submit" value="SEARCH"></form>
            </div>
            <div>
                
            </div>
            <div style="padding-top:30px">
            <table border="1">
                <tr>
                    <td colspan="4" align="center">LIST OF COMPANIES</td>
                </tr>
                
                <tr align="center">
                   <td>NAME OF THE COMPANY</td>
                   <td>EMAIL</td>
                   <td>VIEW DETAILS</td>
                           </tr>
               <%
                   try
                   {
                       Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from recruiter_logindata";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        ResultSet rs = pst2.executeQuery();
                        while(rs.next())
                        {
                            String a = rs.getString("COMPANY_MAIL");
               %>
               <tr align="center">
                   <td><%=rs.getString("COMPANY_MAIL")%></td>
                   <td><%=rs.getString("COMPANY_NAME")%></td>
                   
                   <td><a href="viewcompany.jsp?id=<%=a%>"><input type="button" value="VIEW"></a></td>
                   
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