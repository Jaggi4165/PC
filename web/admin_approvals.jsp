<%@page import="java.sql.*"%>
<%@include file='aheader.jsp' %>
<%
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");

            
if(user2!=null)
{
    response.setIntHeader("Refresh",30);
    %>
    <html>
        <head>
            <title> admin approval page </title>
            <link rel="stylesheet" type="text/css" href="css/sheet.css">
        </head>
        <body>
    
        <center>
            
            <div>
                
            </div>
            <div style="padding-top:30px">
            <table border="1">
                <tr>
                    <td colspan="3" align="center" style="color:green;">REQUESTS FROM NEW STUDENTS</td>
                </tr>
                
                <tr align="center">
                   
                   <td>EMAIL</td>
                   <td>DELETE</td>
                   <td>APPROVE</td>
                           </tr>
               <%
                   try
                   {
                       Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from LOGINDATA_TABLE_dummy";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        ResultSet rs = pst2.executeQuery();
                        while(rs.next())
                        { 
               %>
               
               <tr align="center">
                   
                   <td><%=rs.getString("EMAIL")%></td>
                   <td><a href="studentapprovaldelete.jsp?student=<%=rs.getString("EMAIL")%>">DELETE</a> </td>
                   <td><a href="studentapprovalaccept.jsp?student=<%=rs.getString("EMAIL")%>">APPROVE</a> </td>
                   
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
            
            
            <div style="padding-top:30px">
            <table border="1">
                <tr>
                    <td colspan="4" align="center" style="color:green;">REQUESTS FROM NEW COMPANIES</td>
                </tr>
                
                <tr align="center">
                   <td>NAME OF THE STUDENT</td>
                   <td>EMAIL</td>
                   <td>DELETE</td>
                   <td>APPROVE</td>
                           </tr>
               <%
                   try
                   {
                       Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from recruiter_logindata_dummy";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        ResultSet rs = pst2.executeQuery();
                        while(rs.next())
                        { 
                         String a=rs.getString("COMPANY_MAIL");
               %>
               
               <tr align="center">
                   <td><%=rs.getString("COMPANY_NAME")%></td>
                   <td><%=rs.getString("COMPANY_MAIL")%></td>
                   <td><a href="companyapprovaldelete.jsp?id2=<%=a%>">DELETE</a> </td>
                   <td><a href="companyapprovalaccept.jsp?id2=<%=a%>">APPROVE</a> </td>
                   
                           </tr>
                       <%
                        }
}
                   catch(Exception e)
                   {
                       out.println(e);
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
    
    